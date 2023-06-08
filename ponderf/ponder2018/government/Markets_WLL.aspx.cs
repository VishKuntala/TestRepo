using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;
using Oracle.ManagedDataAccess.Client; //needed for connecting to AXIOM (or any oracle server)

public partial class government_Markets_WLL : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack)) //stops page from reloading on selection or button click
        {
            InitSelectors(); //setup the dropdown lists
        }

    }
    // FILL SELECTORS
    public void InitSelectors()
    {
        string sqlQuery = @"select MARKET_LONG, MARKET
            from PONDER.MARKET_MENU
            where MARKET != 'CENTRAL' AND MARKET != 'NORTHEAST'
            ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list
    }

    //QUERY ORACLE DB
    public DataTable GetOracleData(string sqlConnection, string sqlCommand)
    {
        DataTable dt = new DataTable(); //Initiates a blank data table
        OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings[sqlConnection].ConnectionString);
        OracleCommand cmd = new OracleCommand(); // Initiates your SQL Command
        cmd.CommandTimeout = 90; //Sets a longer timeout value
        cmd.CommandText = sqlCommand; // Sets the text of your SQL Command to the string passed to the method
        cmd.Connection = con; // sets the connection value of  your SQL Command 
        try
        {
            con.Open(); // Opens your connection
            OracleDataAdapter dataAdapter = new OracleDataAdapter(cmd); // Initiate data adapter to handle SQL Results
            dataAdapter.Fill(dt);  // fills the empty data table with the data from your query results
            cmd.Dispose(); // deletes your sql command
            dataAdapter.Dispose(); // deletes the data adapter
        }
        catch (Exception ex) // if an exception occurs in the "try", give exception result
        {
            throw ex; // produces exception result error
        }
        finally
        {
            con.Close(); // closes sql connection
            con.Dispose(); // deletes sql connection
        }
        return dt; // returns your query results in the form of a data table
    }

    [WebMethod]
    public static string GetWLLCARRIERMARKET(string marketVariable)
    {
        //Construction Started
        string sql = @"select FORECAST_MONTH, PROJTYPE, PRODUCT_GROUP, RAN_MARKET, STATE, CONCAT(CONCAT(STATE,' '),PROJTYPE) AS LEGEND, PROJECTS_COUNT FROM (SELECT 
  t1.FORECAST_MONTH,
  'FORECAST' AS PROJTYPE,
  t2.PRODUCT_GROUP,
  t2.RAN_MARKET,
  t2.STATE,
  coalesce(PROJECTS_COUNT,0) PROJECTS_COUNT
from (
  select distinct 
    case 
      when TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM')
      else TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') --if its not this year, summarize by year
    end as FORECAST_MONTH
  from PONDER.PACE_POE
  where onair_forecast is not null
    and (TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') in (TO_CHAR(sysdate, 'YYYY')))
)
 t1 
cross join (
  select distinct PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.STATE
  from PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t2
left join (
  SELECT TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM') AS FORECAST_MONTH, 'FORECAST' AS PROJTYPE, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.STATE, COUNT(PONDER.PACE_POE.PACE_NUMBER) AS PROJECTS_COUNT
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
  GROUP BY TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM'), PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.STATE 
) ONAIR on t1.FORECAST_MONTH = ONAIR.FORECAST_MONTH and t2.RAN_MARKET = ONAIR.RAN_MARKET and t2.STATE = ONAIR.STATE
UNION ALL
SELECT 
  t3.FORECAST_MONTH,
  'ONAIR ACTUAL' AS PROJTYPE,
  t4.PRODUCT_GROUP,
  t4.RAN_MARKET,
  t4.STATE,
  coalesce(PROJECTS_COUNT,0) PROJECTS_COUNT
from (
  select distinct 
    case 
      when TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM')
      else TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') --if its not this year, summarize by year
    end as FORECAST_MONTH
  from PONDER.PACE_POE
  where onair_forecast is not null
    and (TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') in (TO_CHAR(sysdate, 'YYYY')))
)
 t3 
cross join (
  select distinct PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.STATE
  from PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t4
left join (
  SELECT TO_CHAR(PONDER.PACE_POE.ONAIR_ACTUAL, 'YYYY-MM') AS FORECAST_MONTH, 'ONAIR ACTUAL' AS PROJTYPE, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.STATE, COUNT(PONDER.PACE_POE.PACE_NUMBER) AS PROJECTS_COUNT
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
  GROUP BY TO_CHAR(PONDER.PACE_POE.ONAIR_ACTUAL, 'YYYY-MM'), PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.STATE 
) ONAIR on t3.FORECAST_MONTH = ONAIR.FORECAST_MONTH and t4.RAN_MARKET = ONAIR.RAN_MARKET and t4.STATE = ONAIR.STATE)
order by FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET, STATE, PROJTYPE
";

        DataTable dt = new DataTable();

        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
        {
            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
            {
                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
                {
                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
                }
            }
        } // end of getting data from server

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }

        string objectdata = serializer.Serialize(rows);
        return objectdata;
    }
    [WebMethod]
    public static string GetWLLFOREACTMARKET(string marketVariable)
    {
        //Construction Started
        string sql = @"select 
  t1.FORECAST_MONTH,
  t2.RAN_MARKET,
  coalesce(ONAIR.PROJECTS_FCST_ONAIR,0) PROJECTS_FCST_ONAIR,
  coalesce(SUM(ONAIR.PROJECTS_FCST_ONAIR) over (partition by t2.RAN_MARKET order by t1.FORECAST_MONTH asc),0) as CUMU_PROJECTS_FCST_ONAIR,

  coalesce(ONAIRACT.PROJECTS_ONAIR_ACTUAL,0) PROJECTS_ONAIR_ACTUAL,
  coalesce(SUM(ONAIRACT.PROJECTS_ONAIR_ACTUAL) over (partition by t2.RAN_MARKET order by t1.FORECAST_MONTH asc),0) as CUMU_PROJECTS_ONAIR_ACTUAL,

  coalesce(NBD.PROJECTS_CURRENT_NEED_BY_DATE,0) PROJECTS_CURRENT_NEED_BY_DATE, 
  coalesce(SUM(NBD.PROJECTS_CURRENT_NEED_BY_DATE) over (partition by t2.RAN_MARKET order by t1.FORECAST_MONTH asc),0) as CUMU_PROJECTS_CURRENT_NBD,
  
  coalesce(SAQ.PROJECTS_SAQ_COMPLETE,0) PROJECTS_SAQ_COMPLETE, 
  coalesce(SUM(SAQ.PROJECTS_SAQ_COMPLETE) over (partition by t2.RAN_MARKET order by t1.FORECAST_MONTH asc),0) as CUMU_PROJECTS_SAQ_COMPLETE,
  
  coalesce(CS.PROJECTS_CS_COMPLETE,0) PROJECTS_CS_COMPLETE, 
  coalesce(SUM(CS.PROJECTS_CS_COMPLETE) over (partition by t2.RAN_MARKET order by t1.FORECAST_MONTH asc),0) as CUMU_PROJECTS_CS_COMPLETE,
  
  coalesce(TTC.PROJECTS_TTC_COMPLETE,0) PROJECTS_TTC_COMPLETE, 
  coalesce(SUM(TTC.PROJECTS_TTC_COMPLETE) over (partition by t2.RAN_MARKET order by t1.FORECAST_MONTH asc),0) as CUMU_PROJECTS_TTC_COMPLETE

  --coalesce(ONAIRACT.CUM_PROJ_ONAIR_ACTUAL,0) CUM_PROJ_ONAIR_ACTUAL,
  --coalesce(NBD.CUM_PROJ_CURR_NEED_BY_DATE,0) CUM_PROJ_CURR_NEED_BY_DATE
from (
  -- build the table of dates you want to consider, this using a rolling window so it will turn over on Jan 1 of next year
  select distinct 
    case 
      when TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM') --if its this year, summary by month
      else TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') --if its not this year, summarize by year
    end as FORECAST_MONTH
  from PONDER.PACE_POE
  where onair_forecast is not null
    and (TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') in (TO_CHAR(sysdate, 'YYYY'),TO_CHAR(sysdate, 'YYYY')-1,TO_CHAR(sysdate, 'YYYY')+1)) --limit results to previous year, current year and next year
)
 t1 
cross join (
  -- build the table of all the markets you want to consider and cross join so each market is assigned to each 'YYYY-MM' in the table t1
  select distinct PONDER.PACE_POE.RAN_MARKET
  from PONDER.PACE_POE
  WHERE PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t2
left join (
  -- count by month up and join to t1 & t2
  -- for ONAIR
--  select a.*,
--    SUM(PROJECTS_FCST_ONAIR) over (partition by MARKET order by FORECAST_MONTH asc) as CUMULATIVE_PROJECTS_FCST_ONAIR 
--  from(
  SELECT TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM') AS FORECAST_MONTH, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, COUNT(PONDER.PACE_POE.PACE_NUMBER) AS PROJECTS_FCST_ONAIR
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
  GROUP BY TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY-MM'), PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) a
--  where a.RAN_MARKET = 'ARKANSAS/OKLAHOMA'
) ONAIR on t1.FORECAST_MONTH = ONAIR.FORECAST_MONTH and t2.RAN_MARKET = ONAIR.RAN_MARKET
left join (
  -- count by month up and join to t1 & t2
  -- for ONAIR ACTUAL
--  select b.*,
--    SUM(PROJECTS_ONAIR_ACTUAL) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_ONAIR_ACTUAL
--  from(
  SELECT TO_CHAR(PONDER.PACE_POE.ONAIR_ACTUAL, 'YYYY-MM') AS FORECAST_MONTH, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, COUNT(PONDER.PACE_POE.PACE_NUMBER) AS PROJECTS_ONAIR_ACTUAL
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_ACTUAL, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
  GROUP BY TO_CHAR(PONDER.PACE_POE.ONAIR_ACTUAL, 'YYYY-MM'), PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) b
) ONAIRACT on t1.FORECAST_MONTH = ONAIRACT.FORECAST_MONTH and t2.RAN_MARKET = ONAIRACT.RAN_MARKET
left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET, COUNT(PACE_NUMBER) AS PROJECTS_CURRENT_NEED_BY_DATE
  FROM(
   SELECT 
      case 
        when TO_CHAR(PONDER.PACE_POE.CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.CURRENT_NEED_BY_DATE, 'YYYY-MM') --if its this year, summary by month
        when TO_CHAR(PONDER.PACE_POE.CURRENT_NEED_BY_DATE, 'YYYY') > TO_CHAR(sysdate, 'YYYY') then TO_CHAR(add_months(sysdate,12), 'YYYY') --if its next year or beyond make it next year plus
        else TO_CHAR(add_months(sysdate, -12), 'YYYY')--if its last year or before make it last year minus
      end as FORECAST_MONTH, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.PACE_NUMBER
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t1
  GROUP BY FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) NBD on t1.FORECAST_MONTH = NBD.FORECAST_MONTH and t2.RAN_MARKET = NBD.RAN_MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET, COUNT(PACE_NUMBER) AS PROJECTS_SAQ_COMPLETE
  FROM(
   SELECT 
      case 
        when TO_CHAR(PONDER.PACE_POE.RE020_ACTUAL, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.RE020_ACTUAL, 'YYYY-MM') --if its this year, summary by month
        when TO_CHAR(PONDER.PACE_POE.RE020_ACTUAL, 'YYYY') > TO_CHAR(sysdate, 'YYYY') then TO_CHAR(add_months(sysdate,12), 'YYYY') --if its next year or beyond make it next year plus
        when TO_CHAR(PONDER.PACE_POE.RE020_ACTUAL, 'YYYY') < TO_CHAR(sysdate, 'YYYY') and PONDER.PACE_POE.RE020_ACTUAL IS NOT NULL then TO_CHAR(add_months(sysdate,-12), 'YYYY')
        --else TO_CHAR(add_months(sysdate, -12), 'YYYY')--if its last year or before make it last year minus
      end as FORECAST_MONTH, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.PACE_NUMBER
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t1
  GROUP BY FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) SAQ on t1.FORECAST_MONTH = SAQ.FORECAST_MONTH and t2.RAN_MARKET = SAQ.RAN_MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET, COUNT(PACE_NUMBER) AS PROJECTS_CS_COMPLETE
  FROM(
   SELECT 
      case 
        when TO_CHAR(PONDER.PACE_POE.CI025_ACTUAL, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.CI025_ACTUAL, 'YYYY-MM') --if its this year, summary by month
        when TO_CHAR(PONDER.PACE_POE.CI025_ACTUAL, 'YYYY') > TO_CHAR(sysdate, 'YYYY') then TO_CHAR(add_months(sysdate,12), 'YYYY') --if its next year or beyond make it next year plus
        when TO_CHAR(PONDER.PACE_POE.CI025_ACTUAL, 'YYYY') < TO_CHAR(sysdate, 'YYYY') and PONDER.PACE_POE.CI025_ACTUAL IS NOT NULL then TO_CHAR(add_months(sysdate,-12), 'YYYY')
        --else TO_CHAR(add_months(sysdate, -12), 'YYYY')--if its last year or before make it last year minus
      end as FORECAST_MONTH, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.PACE_NUMBER
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t1
  GROUP BY FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) CS on t1.FORECAST_MONTH = CS.FORECAST_MONTH and t2.RAN_MARKET = CS.RAN_MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET, COUNT(PACE_NUMBER) AS PROJECTS_TTC_COMPLETE
  FROM(
   SELECT 
      case 
        when TO_CHAR(PONDER.PACE_POE.CI020_ACTUAL, 'YYYY') = TO_CHAR(sysdate, 'YYYY') then TO_CHAR(PONDER.PACE_POE.CI020_ACTUAL, 'YYYY-MM') --if its this year, summary by month
        when TO_CHAR(PONDER.PACE_POE.CI020_ACTUAL, 'YYYY') > TO_CHAR(sysdate, 'YYYY') then TO_CHAR(add_months(sysdate,12), 'YYYY') --if its next year or beyond make it next year plus
        when TO_CHAR(PONDER.PACE_POE.CI020_ACTUAL, 'YYYY') < TO_CHAR(sysdate, 'YYYY') and PONDER.PACE_POE.CI020_ACTUAL IS NOT NULL then TO_CHAR(add_months(sysdate,-12), 'YYYY')
        --else TO_CHAR(add_months(sysdate, -12), 'YYYY')--if its last year or before make it last year minus
      end as FORECAST_MONTH, PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.RAN_MARKET, PONDER.PACE_POE.PACE_NUMBER
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.RAN_MARKET = '" + marketVariable + @"'
) t1
  GROUP BY FORECAST_MONTH, PRODUCT_GROUP, RAN_MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) TTC on t1.FORECAST_MONTH = TTC.FORECAST_MONTH and t2.RAN_MARKET = TTC.RAN_MARKET

order by t1.FORECAST_MONTH, t2.RAN_MARKET
";

        DataTable dt = new DataTable();

        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
        {
            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
            {
                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
                {
                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
                }
            }
        } // end of getting data from server

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }

        string objectdata = serializer.Serialize(rows);
        return objectdata;
    }
    [WebMethod]
    public static string GetWLLOUTLOOKMARKET(string marketVariable)
    {
        //Construction Started
        string sql = @"select   
  t2.MARKET,
  coalesce(ONAIR.PROJECTS_FCST_ONAIR,0) PROJECTS_FCST_ONAIR,
  --coalesce(SUM(ONAIR.PROJECTS_FCST_ONAIR) over (partition by t2.MARKET order by t2.MARKET asc),0) as CUMU_PROJECTS_FCST_ONAIR,

  --coalesce(NBD.PROJECTS_CURRENT_NEED_BY_DATE,0) PROJECTS_CURRENT_NEED_BY_DATE, 
  --coalesce(SUM(NBD.PROJECTS_CURRENT_NEED_BY_DATE) over (partition by t2.MARKET order by t2.MARKET asc),0) as CUMU_PROJECTS_CURRENT_NBD,
  
  coalesce(SAQ.PROJECTS_SAQ_COMPLETE,0) PROJECTS_SAQ_COMPLETE, 
  --coalesce(SUM(SAQ.PROJECTS_SAQ_COMPLETE) over (partition by t2.MARKET order by t2.MARKET asc),0) as CUMU_PROJECTS_SAQ_COMPLETE,
  
  coalesce(CS.PROJECTS_CS_COMPLETE,0) PROJECTS_CS_COMPLETE, 
  --coalesce(SUM(CS.PROJECTS_CS_COMPLETE) over (partition by t2.MARKET order by t2.MARKET asc),0) as CUMU_PROJECTS_CS_COMPLETE,
  
  coalesce(TTC.PROJECTS_TTC_COMPLETE,0) PROJECTS_TTC_COMPLETE,
  --coalesce(SUM(TTC.PROJECTS_TTC_COMPLETE) over (partition by t2.MARKET order by t2.MARKET asc),0) as CUMU_PROJECTS_TTC_COMPLETE
  
  coalesce(ONAIRACT.PROJECTS_ONAIR_ACTUAL,0) PROJECTS_ONAIR_ACTUAL
  --coalesce(SUM(ONAIRACT.PROJECTS_ONAIR_ACTUAL) over (partition by t2.MARKET order by t2.MARKET asc),0) as CUMU_PROJECTS_ONAIR_ACTUAL,

  --coalesce(ONAIRACT.CUM_PROJ_ONAIR_ACTUAL,0) CUM_PROJ_ONAIR_ACTUAL,
  --coalesce(NBD.CUM_PROJ_CURR_NEED_BY_DATE,0) CUM_PROJ_CURR_NEED_BY_DATE
from (
  -- build the table of all the markets you want to consider and cross join so each market is assigned to each 'YYYY-MM' in the table t1
  select distinct PONDER.PACE_POE.MARKET
  from PONDER.PACE_POE  
  WHERE PONDER.PACE_POE.MARKET = '" + marketVariable + @"'
) t2

left join (
  -- count by month up and join to t1 & t2
  -- for ONAIR ACTUAL
--  select b.*,
--    SUM(PROJECTS_ONAIR_ACTUAL) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_ONAIR_ACTUAL
--  from(
  SELECT PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET, COUNT(PONDER.PACE_POE.ONAIR_ACTUAL) AS PROJECTS_ONAIR_ACTUAL
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_ACTUAL, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.MARKET = '" + marketVariable + @"'
  GROUP BY PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) b
) ONAIRACT on t2.MARKET = ONAIRACT.MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT PRODUCT_GROUP, MARKET, COUNT(RE020_ACTUAL) AS PROJECTS_SAQ_COMPLETE
  FROM(
   SELECT 
      PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET, PONDER.PACE_POE.RE020_ACTUAL
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.MARKET = '" + marketVariable + @"'
) t1
  GROUP BY PRODUCT_GROUP, MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) SAQ on t2.MARKET = SAQ.MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT PRODUCT_GROUP, MARKET, COUNT(CI025_ACTUAL) AS PROJECTS_CS_COMPLETE
  FROM(
   SELECT PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET, PONDER.PACE_POE.CI025_ACTUAL
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.MARKET = '" + marketVariable + @"' 
) t1
  GROUP BY PRODUCT_GROUP, MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) CS on t2.MARKET = CS.MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for NEED BY DATE
--  select c.*,
--    SUM(PROJECTS_CURRENT_NEED_BY_DATE) over (partition by MARKET order by FORECAST_MONTH asc) as CUM_PROJ_CURR_NEED_BY_DATE 
--  from(
  SELECT PRODUCT_GROUP, MARKET, COUNT(CI020_ACTUAL) AS PROJECTS_TTC_COMPLETE
  FROM(
   SELECT 
      PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET, PONDER.PACE_POE.CI020_ACTUAL
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.MARKET = '" + marketVariable + @"'
) t1
  GROUP BY PRODUCT_GROUP, MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) c
) TTC on t2.MARKET = TTC.MARKET

left join (
  -- count by month up and join to t1 & t2
  -- for ONAIR
--  select a.*,
--    SUM(PROJECTS_FCST_ONAIR) over (partition by MARKET order by FORECAST_MONTH asc) as CUMULATIVE_PROJECTS_FCST_ONAIR 
--  from(
  SELECT PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET, COUNT(PONDER.PACE_POE.PACE_NUMBER) AS PROJECTS_FCST_ONAIR
  FROM PONDER.PACE_POE
  RIGHT OUTER JOIN PONDER.PLAN_BASE
  ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
  WHERE PONDER.PACE_POE.STATUS IN ('Active', 'Complete')
      -- AND PONDER.PACE_POE.NATIONAL_PROGRAM = 'WLL eNode B'
      -- AND PONDER.PACE_POE.PRODUCT_GROUP = 'WLL eNode B'
      -- PONDER.PACE_POE.PRODUCT_SUBGROUP = 'WLL 1C'
      AND PONDER.PACE_POE.POE_NAME IN ('2018 + WLL eNode B', '2019 + WLL eNode B', '2020 + WLL eNode B', '2021 + WLL eNode B')
  AND TO_CHAR(PONDER.PACE_POE.ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
  AND PONDER.PACE_POE.MARKET = '" + marketVariable + @"'
  GROUP BY PONDER.PACE_POE.PRODUCT_GROUP, PONDER.PACE_POE.MARKET
  --ORDER BY TO_DATE(FORECAST_MONTH, 'YYYY-MM')
--  ) a
--  where a.market = 'ARKANSAS/OKLAHOMA'
) ONAIR on t2.MARKET = ONAIR.MARKET

order by t2.MARKET
";

        DataTable dt = new DataTable();

        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
        {
            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
            {
                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
                {
                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
                }
            }
        } // end of getting data from server

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }

        string objectdata = serializer.Serialize(rows);
        return objectdata;
    }

}