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


public partial class toolsandauto_mPilot_Scheduler_Testing : System.Web.UI.Page
{    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            InitSelectors(); //setup the dropdown lists

            string ATTUID = "";
            try
            {
                _CSP.User userx = (_CSP.User)System.Web.HttpContext.Current.User;
                ATTUID = userx.attuid.ToString();
            }
            catch
            {
                ATTUID = "no_user";
            }
            //hf_UID.Value = ATTUID;
            hf_User.Value = ATTUID;            
        }
        
    }

    public void InitSelectors()
    {
        string sqlQuery = @"select MARKET_LONG, MARKET
            from PONDER.BYOC_MARKET_MENU
            ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarketMenu.DataSource = dt; //load the cma dropdown list from query results
        ddlMarketMenu.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarketMenu.DataValueField = "MARKET"; //assign the item value from query results
        ddlMarketMenu.DataBind(); //bind the list
    }
    

    //select * from ponder.market_menu

    protected void ExportToExcel(object sender, EventArgs e)
    {
        return;
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

    // SUBFUNCTION TO FILL THE GRIDVIEW
    public void FillGridView(GridView gv, DataTable dt)
    {
        gv.Visible = true; // makes your gridview visible
        gv.DataSource = dt; // sets the datasource of your gridview to your data table
        gv.DataBind(); // fills gridview with bound data
    }

    [System.Web.Services.WebMethod]

    public static bool IsLeapYear(int year)

    {

        return DateTime.IsLeapYear(year);

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
    public static string Get_SchedulerData(string adminVariable)
    {
        string sql = @"SELECT DISTINCT USERID, MARKET, SUBMARKET, FA, USID, SITE_ID, VENDOR, TO_CHAR(DATE_REQUESTED, 'MM-DD-YYYY') AS DATE_REQUESTED,
            CASE WHEN FULL_POWER = 1 THEN 'YES' ELSE 'NO' END AS FULL_POWER,
            TO_CHAR(DATE_COMPLETE, 'MM-DD-YYYY') AS DATE_COMPLETE
            FROM PONDER.MPILOT_SCHEDULER
            WHERE USERID = '" + adminVariable + @"'"; //store your sql query in this string variable "sql"

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
    public static string callAXIOMquery(string sql)
    {
        DataTable dt = new DataTable();

        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString))
        {
            using (OracleCommand cmd = new OracleCommand(sql, connection))
            {
                using (OracleDataAdapter da = new OracleDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }


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
    public static void callAXIOMinsert(string sql)
    {
        OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString);
        OracleCommand cmd = new OracleCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = con; // sets the connection value of  your SQL Command           
        cmd.CommandText = "BEGIN " + sql + " END;";
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch { }
        con.Close();
        con.Dispose();
    }    

    [WebMethod]
    public static void mpilot_scheduler_update()
    {
        //Construction Started
        string sql = @"begin MERGE INTO PONDER.MPILOT_SCHEDULER s
     USING (SELECT DISTINCT cl.ADMIN_USER, cl.ID, nrs.ED_MARKET_NAME as MARKET, nrs.MARKET_NAME as SUBMARKET, m.FA, nrs.USID_KEY as USID, nrs.NODE_ID as SITE_ID , nrs.VENDOR_ID AS VENDOR, nrs.CELL_ID as EUTRANCELL_ID, 
              CASE 
                 WHEN nrs.ARFCN_DL between 5280 and 5379 THEN 14
                 WHEN nrs.ARFCN_DL between 5730 and 5849 THEN 17
                 WHEN nrs.ARFCN_DL between 9660 and 9769 THEN 29
                 WHEN nrs.ARFCN_DL between 5010 and 5179 THEN 12
                 ELSE 999
              END AS LTE_BAND, 
              cl.LASTUSED_DATE as DATE_REQUESTED, NULL as DATE_COMPLETE, 
--              NVL(40000 * e.NOOFTXANTENNAS, NULL) FP_configuredmaxtxpower,
              CASE
                WHEN nrs.VENDOR_ID = 'NOKIA' THEN 46
                ELSE NULL
              END AS FP_PMAX,
              cl.FULL_POWER
              
          FROM COAR.LTE_MASTERS m
          INNER JOIN MPILOT_CLUSTER_DETAIL cd
          ON m.FA = cd.FA
          INNER JOIN MPILOT_CLUSTER_LIST cl
          ON cl.ID = cd.ID
          INNER JOIN web.nrs_cell_mv_all@NRS.DB.ATT.COM nrs
          ON TO_CHAR(nrs.USID_KEY) = TO_CHAR(m.USID)
          WHERE (nrs.ARFCN_DL between 5280 and 5379
          --OR nrs.ARFCN_DL between 5730 and 5849
          --OR nrs.ARFCN_DL between 9660 and 9769
          --OR nrs.ARFCN_DL between 5010 and 5179
          )
          AND SYSDATE > nrs.CELL_BEGIN_DATE
          AND nrs.CELL_END_DATE > SYSDATE
          AND m.FA IN (
          SELECT d.FA 
          FROM MPILOT_CLUSTER_DETAIL d 
          INNER JOIN MPILOT_CLUSTER_LIST l 
          ON d.ID = l.ID 
          WHERE LASTUSED_DATE >= SYSDATE - 100
          )) v
          
        ON (s.EUTRANCELL_ID = v.EUTRANCELL_ID AND trunc(s.DATE_REQUESTED) = trunc(v.DATE_REQUESTED))
        WHEN NOT MATCHED
            THEN
                INSERT (USERID, ID, MARKET, SUBMARKET, FA, USID, SITE_ID, VENDOR, EUTRANCELL_ID, LTE_BAND, DATE_REQUESTED, DATE_COMPLETE, FP_configuredmaxtxpower, FP_PMAX, FULL_POWER)
                VALUES (v.ADMIN_USER, v.ID, v.MARKET, v.SUBMARKET, v.FA, v.USID, v.SITE_ID, v.VENDOR, v.EUTRANCELL_ID, v.LTE_BAND, v.DATE_REQUESTED, v.DATE_COMPLETE, null, v.FP_PMAX, v.FULL_POWER);
        commit;

        MERGE INTO PONDER.MPILOT_SCHEDULER s
            USING (SELECT DISTINCT
          FIRST_VALUE(START_DATE) OVER (PARTITION BY CELL_ID ORDER BY START_DATE DESC) AS LAST_UPDATE,
          FIRST_VALUE(CELL_ID) OVER (PARTITION BY CELL_ID ORDER BY CELL_ID DESC) AS CELL_ID,
          NVL((FIRST_VALUE(40000*nooftxantennas) OVER (PARTITION BY CELL_ID ORDER BY 40000*nooftxantennas DESC)) , NULL) AS FP_CONFIGUREDMAXTXPOWER
          FROM PONDER.CONFIG_ERI_EUCELL) v
                ON (s.EUTRANCELL_ID = v.CELL_ID)
        WHEN MATCHED
            THEN
                UPDATE SET FP_CONFIGUREDMAXTXPOWER = v.FP_CONFIGUREDMAXTXPOWER;
        commit;
        end;";

        OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString);
        OracleCommand cmd = new OracleCommand();
        cmd.CommandType = System.Data.CommandType.Text;
        cmd.Connection = con; // sets the connection value of  your SQL Command           
        cmd.CommandText = sql;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch { }
        con.Close();
        con.Dispose();
    }

}