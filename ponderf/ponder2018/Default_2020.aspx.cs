using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;
using Oracle.ManagedDataAccess.Client; //needed for connecting to AXIOM (or any oracle server)

public partial class _Default_2020 : System.Web.UI.Page
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
            from PONDER.MARKET_MENU_V5
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
    public static string GetSearchAll(string name)
    {
        string sql = @"SELECT DISTINCT TO_CHAR(PONDER.PLAN_BASE.USID) AS USID, PONDER.PLAN_BASE.FA_CODE, PONDER.PLAN_BASE.SITE_NAME, PONDER.PLAN_BASE.JOB_NUMBER, PONDER.PLAN_BASE.STATUS AS IPLAN_STATUS, 
            PONDER.PLAN_BASE.PACE_NUMBER, PONDER.PACE_POE.STATUS AS PACE_STATUS, PONDER.PACE_POE.PACE_NAME,  
            PONDER.PLAN_BASE.PRODUCT_GROUP, PONDER.PLAN_BASE.SUB_GROUP, PONDER.PLAN_BASE.SPECTRUM, PONDER.PLAN_BASE.CIVIL_VENDOR, PONDER.PACE_POE.PM_ATTUID, PONDER.PACE_POE.PROJECT_MANAGER,
            PONDER.PLAN_BASE.LATITUDE as ""lat"", PONDER.PLAN_BASE.LONGITUDE as ""lng"",
            TO_CHAR(PONDER.PLAN_BASE.ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ORIGINAL_ISSUED_DATE,
            TO_CHAR(PONDER.PACE_POE.CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(PONDER.PACE_POE.JI022_ACTUAL, 'MM-DD-YYYY') AS JI022_ACTUAL,
            TO_CHAR(PONDER.PACE_POE.SS020_ACTUAL, 'MM-DD-YYYY') AS SS020_ACTUAL,
            TO_CHAR(PONDER.PACE_POE.RE020_FORECAST, 'MM-DD-YYYY') AS RE020_FORECAST,  
            TO_CHAR(PONDER.PACE_POE.RE020_ACTUAL, 'MM-DD-YYYY') AS RE020_ACTUAL,
            TO_CHAR(PONDER.PACE_POE.CI025_ACTUAL, 'MM-DD-YYYY') AS CI025_ACTUAL,
            TO_CHAR(PONDER.PACE_POE.CI020_ACTUAL, 'MM-DD-YYYY') AS CI020_ACTUAL,
            TO_CHAR(PONDER.PACE_POE.CI050_ACTUAL, 'MM-DD-YYYY') AS CI050_ACTUAL,
            TO_CHAR(PONDER.PACE_POE.ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,            
            TO_CHAR(PONDER.PLAN_BASE.IN_SERVICE_FORECASTED_DATE, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(PONDER.PLAN_BASE.ACTUAL_SERVICE_DATE, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            PONDER.PLAN_BASE.RFDS_OWNER, PONDER.PLAN_BASE.RF_ENGINEER, PONDER.PLAN_BASE.RFDS_ID, PONDER.PLAN_BASE.RFDS_STATE,
            PONDER.PLAN_BASE.REGION, PONDER.PLAN_BASE.IPLAN_RAN_MARKET AS MARKET, PONDER.PACE_POE.SUBMARKET, PONDER.PLAN_BASE.ADDRESS, PONDER.PLAN_BASE.CITY, PONDER.PLAN_BASE.ZIP
        FROM PONDER.PLAN_BASE
            LEFT JOIN PONDER.PACE_POE
            ON PONDER.PACE_POE.PACE_NUMBER = PONDER.PLAN_BASE.PACE_NUMBER
        WHERE (TO_CHAR(PONDER.PLAN_BASE.USID) = '" + name + @"' OR PONDER.PLAN_BASE.FA_CODE = '" + name + @"' OR PONDER.PLAN_BASE.SITE_NAME = UPPER('" + name + @"') 
                    OR PONDER.PLAN_BASE.PACE_NUMBER = UPPER('" + name + @"') OR PONDER.PLAN_BASE.JOB_NUMBER = UPPER('" + name + @"'))
            AND PONDER.PLAN_BASE.STATUS IN ('Issued', 'In Progress', 'Complete')  
            AND (PONDER.PLAN_BASE.ACTUAL_SERVICE_DATE IS NULL OR TO_CHAR(PONDER.PLAN_BASE.ACTUAL_SERVICE_DATE, 'YYYY') >= TO_CHAR(SYSDATE, 'YYYY')-2)
        ORDER BY
            CASE WHEN IPLAN_STATUS = 'Complete' then 1
            WHEN IPLAN_STATUS = 'In Progress' then 2
            WHEN IPLAN_STATUS = 'Issued' then 3
            ELSE 5 END, ONAIR_ACTUAL, ONAIR_FORECAST"; //store your sql query in this string variable "sql"

        DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

        JavaScriptSerializer serializer = new JavaScriptSerializer(); //define a new JavaScriptSerializer object "serializer"
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>(); //define a new List "rows"
        Dictionary<string, object> row; //define a new Dictionary "row"
        foreach (DataRow dr in dt.Rows) //setup a loop to iterate through the rows "dr" your DataTable "dt"
        {
            row = new Dictionary<string, object>(); //define a new object to store your data in
            foreach (DataColumn col in dt.Columns) //setup a loop to iterate through the columns of the current row "dr" in your DataTable "dt"
            {
                row.Add(col.ColumnName, dr[col]); //add the data to your "row" object
            }
            rows.Add(row); //add the "row" to your "rows" object
        }

        string objectdata = serializer.Serialize(rows); //use the JavaScriptSerializer "serializer" to convert to a JSON string
        return objectdata; //return your data to the front end
    }

    [WebMethod]
    public static string GetCUR_YR_ALLIN(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 1) or (r > 20 AND  r < 3000)
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
    public static string GetCUR_YR_ALLIN_2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 2) or (r >= 3000 AND  r < 6000)
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
    public static string GetCUR_YR_ALLIN_3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 3) or (r >= 6000 AND  r < 9000)
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
    public static string GetCUR_YR_ALLIN_4(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 4) or (r >= 9000 AND  r < 12000)
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
    public static string GetCUR_YR_ALLIN_5(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 5) or (r >= 12000 AND  r < 15000)
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
    public static string GetCUR_YR_ALLIN_6(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 6) or (r >= 15000 AND  r < 18000)
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
    public static string GetCUR_YR_ALLIN_7(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 7) or (r >= 18000 AND  r < 21000)
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
    public static string GetCUR_YR_ALLIN_8(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 8) or (r >= 21000 AND  r < 24000)
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
    public static string GetCUR_YR_ALLIN_9(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 9) or (r >= 24000 AND  r < 27000)
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
    public static string GetCUR_YR_ALLIN_10(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 10) or (r >= 27000 AND  r < 30000)
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
    public static string GetCUR_YR_ALLIN_11(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 11) or (r >= 30000 AND  r < 33000)
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
    public static string GetCUR_YR_ALLIN_12(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 12) or (r >= 33000 AND  r < 36000)
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
    public static string GetCUR_YR_ALLIN_13(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 13) or (r >= 36000 AND  r < 39000)
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
    public static string GetCUR_YR_ALLIN_14(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 14) or (r >= 39000 AND  r < 42000)
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
    public static string GetCUR_YR_ALLIN_15(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 15) or (r >= 42000 AND  r < 45000)
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
    public static string GetCUR_YR_ALLIN_16(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 16) or (r >= 45000 AND  r < 48000)
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
    public static string GetCUR_YR_ALLIN_17(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 17) or (r >= 48000 AND  r < 51000)
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
    public static string GetCUR_YR_ALLIN_18(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 18) or (r >= 51000 AND  r < 54000)
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
    public static string GetCUR_YR_ALLIN_19(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 19) or (r >= 54000 AND  r < 57000)
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
    public static string GetCUR_YR_ALLIN_20(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM (
SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR, SOURCE_JOB_NUMBER, RAN_REGION, MARKET, SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
CIVIL_VENDOR, ROWNUM r
FROM PONDER.PACE_POE_CONDENSED
WHERE STATUS IN ('Active', 'Complete')
      AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
      AND (RAN_REGION = '" + marketVariable + @"' OR MARKET = '" + marketVariable + @"')
ORDER BY FA_LOCATION_CODE)
WHERE (r = 20) or (r >= 57000 AND  r < 60000)
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
    public static string GetProject_AllIn(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * 
            FROM PONDER.MKT_DRILL_ALLIN_V5 
            WHERE CE_CUSTOM_ONE = 'ALL' 
            AND CE_CUSTOM_TWO = 'ALL' 
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
            AND RAN_SUBMARKET = 'ALL'  
            ORDER BY ALLIN DESC";

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
    public static string GetFORECAST_ATTAIN_ALLIN(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.MKT_FCST_ATTAIN_ALL_19 WHERE PROJECT = 'ALLIN' AND MARKET = '" + marketVariable + @"' AND MARKET = SUBMARKET ORDER BY MONTH_DATA";

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
    public static string GetFORECAST_ATTAIN_ALLIN_30CH(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.MKT_FCST_ATTAIN_ALL_19 WHERE PROJECT = 'ALLIN' AND MARKET = '" + marketVariable + @"' AND MARKET = SUBMARKET ORDER BY MONTH_DATA";

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
    public static string GetFORECAST_ATTAIN_ALLIN_90CH(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.MKT_FCST_ATTAIN_ALL_19 WHERE PROJECT = 'ALLIN' AND MARKET = '" + marketVariable + @"' AND MARKET = SUBMARKET ORDER BY MONTH_DATA";

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
    public static string GetProject_AllIn_FA(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * 
            FROM PONDER.MKT_DRILL_ALLIN_FA_V5 
            WHERE CE_CUSTOM_ONE = 'ALL' AND CE_CUSTOM_TWO = 'ALL' 
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
            AND RAN_SUBMARKET = 'ALL'  
            ORDER BY ALLINFA DESC";

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
    public static string GetPRODUCTION_CHART(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.MARKET_DRILL_CHART_V5 
            WHERE PROJECT = 'ALL_IN_JOBS'            
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
            ORDER BY FORECAST_MONTH";

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
    public static string GetPRODUCTION_CHART_ALL(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.MARKET_DRILL_CHART_V5 
            WHERE PROJECT = 'ALL_IN_JOBS' 
            AND RAN_REGION = '" + marketVariable + @"'
            ORDER BY FORECAST_MONTH";

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
    public static string GetDashboardMARKET(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"' 
                WHEN RAN_AVP NOT LIKE ('" + marketVariable + @"') THEN '%' END)
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN '%'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN 'ALL' END) 
            AND RAN_SUBMARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '%'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_ALL(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0
            AND RAN_AVP = 'ALL' 
            AND RAN_MARKET = 'ALL'
            AND RAN_SUBMARKET = 'ALL'
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET2_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"' 
                WHEN RAN_AVP NOT LIKE ('" + marketVariable + @"') THEN '%' END)
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN '%'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN 'ALL' END) 
            AND RAN_SUBMARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '%'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_2_ALL(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET2_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0
            AND RAN_AVP = 'ALL' 
            AND RAN_MARKET = 'ALL'
            AND RAN_SUBMARKET = 'ALL'
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"' 
                WHEN RAN_AVP NOT LIKE ('" + marketVariable + @"') THEN '%' END)
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN '%'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN 'ALL' END) 
            AND RAN_SUBMARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '%'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_prev_yr_ALL(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1
            AND RAN_AVP = 'ALL' 
            AND RAN_MARKET = 'ALL'
            AND RAN_SUBMARKET = 'ALL'
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_2_prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET2_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1
            AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
            AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"' 
                WHEN RAN_AVP NOT LIKE ('" + marketVariable + @"') THEN '%' END)
            AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                WHEN (RAN_AVP LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN '%'
                WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"')) THEN 'ALL' END) 
            AND RAN_SUBMARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '%'
                WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string GetDashboardMARKET_2_prev_yr_ALL(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT t1.* FROM            
            (SELECT i.*, CASE WHEN i.RAN_AVP = 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_REGION
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET = 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_AVP
              WHEN i.RAN_AVP != 'ALL' AND i.RAN_MARKET != 'ALL' AND i.RAN_SUBMARKET = 'ALL' THEN i.RAN_MARKET
              ELSE i.RAN_SUBMARKET END AS SUBMARKET2
            FROM PONDER.MKT_DASH_SUBMARKET2_V5 i
            WHERE i.PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1
            AND RAN_AVP = 'ALL' 
            AND RAN_MARKET = 'ALL'
            AND RAN_SUBMARKET = 'ALL'
            ORDER BY N_TO_S, RAN_SUBMARKET)t1";

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
    public static string Getdonut1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'MCA' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'CRAN ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut4(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'LTE' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut5(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'IB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut6(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'BWESW' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn1plus1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+1 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn2plus1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+1 
                AND CE_CUSTOM_ONE = 'MCA' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn3plus1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+1 
                AND CE_CUSTOM_ONE = 'CRAN ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn4plus1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+1 
                AND CE_CUSTOM_ONE = 'LTE' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn5plus1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+1 
                AND CE_CUSTOM_ONE = 'IB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn6plus1(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+1 
                AND CE_CUSTOM_ONE = 'BWESW' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn1plus2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+2 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn2plus2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+2 
                AND CE_CUSTOM_ONE = 'MCA' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn3plus2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+2 
                AND CE_CUSTOM_ONE = 'CRAN ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn4plus2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+2 
                AND CE_CUSTOM_ONE = 'LTE' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn5plus2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+2 
                AND CE_CUSTOM_ONE = 'IB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn6plus2(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+2 
                AND CE_CUSTOM_ONE = 'BWESW' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn1plus3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+3 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn2plus3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+3 
                AND CE_CUSTOM_ONE = 'MCA' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn3plus3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+3 
                AND CE_CUSTOM_ONE = 'CRAN ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn4plus3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+3 
                AND CE_CUSTOM_ONE = 'LTE' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn5plus3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+3 
                AND CE_CUSTOM_ONE = 'IB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetColumn6plus3(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+3 
                AND CE_CUSTOM_ONE = 'BWESW' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut1prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut2prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1 
                AND CE_CUSTOM_ONE = 'MCA' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut3prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1 
                AND CE_CUSTOM_ONE = 'CRAN ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut4prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1 
                AND CE_CUSTOM_ONE = 'LTE' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut5prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1 
                AND CE_CUSTOM_ONE = 'IB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string Getdonut6prev_yr(string marketVariable)
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASH_DONUT_V5 WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')-1 
                AND CE_CUSTOM_ONE = 'BWESW' AND CE_CUSTOM_TWO = 'ALL' 
                AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')
                AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                  WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                  WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END)
                AND RAN_SUBMARKET = 'ALL'
                ORDER BY RAN_REGION";

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
    public static string GetDATADATE()
    {
        //Construction Started
        string sql = @"SELECT TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS DATADATE,  
        TO_CHAR(DATE_INSERTED, 'MM-DD-YYYY') AS REPORTDATE 
        FROM PONDER.PACE_POE 
        WHERE ROWNUM=1";

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
    public static string GetCURRYEAR()
    {
        //Construction Started
        string sql = @"SELECT TO_CHAR(sysdate, 'YYYY')-1 AS PREV_YR,
            TO_CHAR(sysdate, 'YYYY')+0 AS CUR_YR, 
            TO_CHAR(sysdate, 'YYYY')+1 AS CUR_YR_PLUS1, 
            TO_CHAR(sysdate, 'YYYY')+2 AS CUR_YR_PLUS2, 
            TO_CHAR(sysdate, 'YYYY')+3 AS CUR_YR_PLUS3
            FROM PONDER.PACE_POE
            WHERE ROWNUM=1";

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

    public void ExportToExcel_prevyr(object sender, EventArgs e)
    {
        if (ddlMarket.SelectedItem.Value == "ALL")
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')-1 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_ACTUAL, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')-1                
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        else
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')-1 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_ACTUAL, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')-1
                AND (RAN_REGION = '" + ddlMarket.SelectedItem.Value + @"' OR RAN_AVP = '" + ddlMarket.SelectedItem.Value + @"' OR MARKET = '" + ddlMarket.SelectedItem.Value + @"')
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

    }

    public void ExportToExcel_curryr(object sender, EventArgs e)
    {
        if (ddlMarket.SelectedItem.Value == "ALL")
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE,  
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0                
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        else
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+0 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+0
                AND (RAN_REGION = '" + ddlMarket.SelectedItem.Value + @"' OR RAN_AVP = '" + ddlMarket.SelectedItem.Value + @"' OR MARKET = '" + ddlMarket.SelectedItem.Value + @"')
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

    }

    public void ExportToExcel_curryr_plus1(object sender, EventArgs e)
    {
        if (ddlMarket.SelectedItem.Value == "ALL")
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+1 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+1                
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        else
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+1 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+1
                AND (RAN_REGION = '" + ddlMarket.SelectedItem.Value + @"' OR RAN_AVP = '" + ddlMarket.SelectedItem.Value + @"' OR MARKET = '" + ddlMarket.SelectedItem.Value + @"')
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

    }

    public void ExportToExcel_curryr_plus2(object sender, EventArgs e)
    {
        if (ddlMarket.SelectedItem.Value == "ALL")
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+2 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+2                
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        else
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+2 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE,  
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+2
                AND (RAN_REGION = '" + ddlMarket.SelectedItem.Value + @"' OR RAN_AVP = '" + ddlMarket.SelectedItem.Value + @"' OR MARKET = '" + ddlMarket.SelectedItem.Value + @"')
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

    }

    public void ExportToExcel_curryr_plus3(object sender, EventArgs e)
    {
        if (ddlMarket.SelectedItem.Value == "ALL")
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+3 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+3                
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }
        else
        {
            string sql = @"SELECT * FROM (
            SELECT PACE_NUMBER, PACE_NAME, STATUS, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUB_PROGRAM, TO_CHAR(SYSDATE, 'YYYY')+3 AS FORECAST_YEAR,
            SOURCE_JOB_NUMBER, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, USID, FA_LOCATION_CODE, 
            TO_CHAR(IPLAN_ORIGINAL_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE,
            TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN,
            TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST,
            TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
            CIVIL_VENDOR,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_CONDENSED
            WHERE STATUS IN ('Active', 'Complete')
                AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = TO_CHAR(SYSDATE, 'YYYY')+3
                AND (RAN_REGION = '" + ddlMarket.SelectedItem.Value + @"' OR RAN_AVP = '" + ddlMarket.SelectedItem.Value + @"' OR MARKET = '" + ddlMarket.SelectedItem.Value + @"')
            ORDER BY FA_LOCATION_CODE)";

            DataTable dt = new DataTable(); //define a new DataTable object "dt"

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

            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = "application/csv";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=ALL_Exported_Data.csv;");
            HttpContext.Current.Response.AddHeader("Pragma", "public");

            StringBuilder sb = new StringBuilder();

            string[] columnNames = dt.Columns.Cast<DataColumn>().
                                              Select(column => column.ColumnName).
                                              ToArray();
            sb.AppendLine(string.Join(",", columnNames));

            foreach (DataRow row in dt.Rows)
            {
                string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                ToArray();
                sb.AppendLine(string.Join(",", fields));
            }

            HttpContext.Current.Response.Write(sb.ToString());

            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
        }

    }

}