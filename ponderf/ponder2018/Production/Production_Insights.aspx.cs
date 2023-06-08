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

public partial class Production_Production_Insights : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) //stops page from reloading on selection or button click
        {
            InitSelectors(); //setup the dropdown lists            
        }

    }
    // FILL SELECTORS
    public void InitSelectors()
    {
        string sqlQuery = @"select MARKET_LONG, MARKET
            from PONDER.SALES_MARKET_MENU
            ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list

        ddlMonth.Items.Add(new ListItem("January", "2020-01-01"));
        //ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
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
    public static string GetDATADATE()
    {
        //Construction Started
        string sql = @"SELECT TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS DATADATE,  
        TO_CHAR(DATE_INSERTED, 'MM-DD-YYYY') AS REPORTDATE,
        TO_CHAR(EXECUTED_ON, 'YYYY-MM-DD') AS VARDATE
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
    public void GetddlMonth(object sender, EventArgs e)
    {
        string hf_FCCategoryValue = hf_FCCategory.Value;

        //public static string works, with a return of the string back to the front, but wont let us add list item

        if (hf_FCCategoryValue == "2")
        {            
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 1;
        }

        if (hf_FCCategoryValue == "3")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 2;            

        }

        if (hf_FCCategoryValue == "4")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 3;
        }

        if (hf_FCCategoryValue == "5")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 4;
        }

        if (hf_FCCategoryValue == "6")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 5;
        }

        if (hf_FCCategoryValue == "7")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 6;
        }

        if (hf_FCCategoryValue == "8")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
            ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 7;
        }

        if (hf_FCCategoryValue == "9")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
            ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
            ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 8;
        }

        if (hf_FCCategoryValue == "10")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
            ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
            ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
            ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 9;
        }

        if (hf_FCCategoryValue == "11")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
            ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
            ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
            ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
            ddlMonth.Items.Add(new ListItem("November", "2020-11-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 10;
        }

        if (hf_FCCategoryValue == "12")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
            ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
            ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
            ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
            ddlMonth.Items.Add(new ListItem("November", "2020-11-01"));
            ddlMonth.Items.Add(new ListItem("December", "2020-12-01"));
            ddlMonth.DataBind();
            ddlMonth.SelectedIndex = 11;
        }

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


    //Counts and GYR Section

    [WebMethod]
    public static string Get_NSB(string geoVariable, string monthVariable)
    {

        string sql = @"SELECT SALES_REGION, SALES_VPGM_MARKET, CY_POE_NSB, CY_FCST_NSB, CY_PERCENT_FCST_NSB, CY_ACT_NSB, CY_PERCENT_ACT_NSB, CY_PUSH_NSB, CY_PULL_NSB, CY_BOTH_NSB,
                    CY_PERCENT_BOTH_NSB, CUM_POE_NSB, CUM_FCST_NSB, CUM_PERCENT_FCST_NSB, CUM_PERCENT_CY_NSB, CM_POE_NSB, CM_FCST_NSB, CM_PERCENT_FCST_NSB, CM_PERCENT_CY_NSB, CM_ACT_NSB,
                    YTD_PLAN_NSB, YTD_PERCENT_PVSA_NSB
                    FROM PONDER.SAMBAR_TABLE
                   WHERE SALES_REGION != 'UNDEFINED'
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                    AND SALES_REGION LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' ANd SALES_VPGM_MARKET LIKE '" + geoVariable + @"' THEN 'NATIONAL' ELSE '%' END)
                    ";

        string sql2 = @"SELECT
                   SUM (CASE WHEN CY_POE = 'Y' THEN 1 ELSE 0 END) AS CY_POE_NSB,
                   SUM (CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CY_FCST_NSB,
                   SUM (CASE WHEN CY_PUSH = 1 THEN 1 ELSE 0 END) AS CY_PUSH_NSB,
                   SUM (CASE WHEN CY_PULL = 1 THEN 1 ELSE 0 END) AS CY_PULL_NSB,
                    SUM (CASE WHEN CY_POE = 'Y' AND ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CY_BOTH_NSB,
                    SUM (CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CY_ACT_NSB,
                    SUM (CASE WHEN CY_POE = 'Y' AND EXTRACT(MONTH FROM ONAIR_PLAN) <= EXTRACT(MONTH FROM DATE '" + monthVariable + @"') THEN 1 ELSE 0 END) AS CUM_POE_NSB,
                    SUM (CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) <= EXTRACT(MONTH FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CUM_FCST_NSB,
                    SUM (CASE WHEN CY_POE = 'Y' AND EXTRACT(MONTH FROM ONAIR_PLAN) = EXTRACT(MONTH FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CM_POE_NSB,
                    SUM (CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CM_FCST_NSB,
                    SUM (CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS CM_ACT_NSB,
                    FROM PONDER.PACE_POE_2020
                   WHERE SALES_REGION != 'UNDEFINED'
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    ";

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
    public static string Get_CRAN()
    {

        string sql = @"SELECT SALES_REGION, SALES_VPGM_MARKET,  CY_POE_CRAN, CY_FCST_CRAN, CY_PERCENT_FCST_CRAN, CY_ACT_CRAN, CY_PERCENT_ACT_CRAN, CY_PUSH_CRAN, CY_PULL_CRAN, CY_BOTH_CRAN, CY_PERCENT_BOTH_CRAN, CUM_POE_CRAN, CUM_FCST_CRAN, 
                    CUM_PERCENT_FCST_CRAN, CUM_PERCENT_CY_CRAN, CM_POE_CRAN, CM_FCST_CRAN, CM_PERCENT_FCST_CRAN, CM_PERCENT_CY_CRAN, CM_ACT_CRAN
                    FROM PONDER.SAMBAR_TABLE
                    WHERE SALES_REGION != 'UNDEFINED'
                    ";



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
    public static string Get_MMW()
    {

        string sql = @"SELECT SALES_REGION, SALES_VPGM_MARKET,  CY_POE_MMW, CY_FCST_MMW, CY_PERCENT_FCST_MMW, CY_ACT_MMW, CY_PERCENT_ACT_MMW, CY_PUSH_MMW, CY_PULL_MMW, CY_BOTH_MMW, CY_PERCENT_BOTH_MMW, CUM_POE_MMW, CUM_FCST_MMW, CUM_PERCENT_FCST_MMW,
                    CUM_PERCENT_CY_MMW, CM_POE_MMW, CM_FCST_MMW, CM_PERCENT_FCST_MMW, CM_PERCENT_CY_MMW, CM_ACT_MMW
                    FROM PONDER.SAMBAR_TABLE
                   WHERE SALES_REGION != 'UNDEFINED'
                    ";



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

    //Forecast History Section

    [WebMethod]
    public static string Get_HistCountSummary(string pulldownRegionVariable)
    {


        string sql = "";

        string sqlNATIONAL = @"SELECT * FROM PONDER.FCST_ACC_SUMMARY WHERE SALES_REGION = 'NATIONAL' AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL'
        ";

        string sqlREGIONAL = @"SELECT * FROM PONDER.FCST_ACC_SUMMARY WHERE SALES_REGION LIKE '" + pulldownRegionVariable + @"' AND SALES_VPGM_MARKET = 'ALL' AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL'";


        string sqlMARKET = @"SELECT * FROM PONDER.FCST_ACC_SUMMARY WHERE SALES_VPGM_MARKET LIKE '" + pulldownRegionVariable + @"' AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL'";

        if (pulldownRegionVariable == "%")
        {
            sql = sqlNATIONAL;
        }

        else if (pulldownRegionVariable == "EAST" || pulldownRegionVariable == "CENTRAL" || pulldownRegionVariable == "WEST")
        {
            sql = sqlREGIONAL;
        }

        else
        {
            sql = sqlMARKET;
        }

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
    public static string Get_HistCountData(string pulldownRegionVariable, string pulldownColumnName)
    {

        string sql = "";

        string sqlNATIONAL = @"SELECT TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY (DY)') AS EXECUTED_ON, " + pulldownColumnName + @" 
        FROM PONDER.DAILY_COUNT_SALES_2020_V2 
        WHERE (CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO IS NULL) AND EXECUTED_ON >= DATE '2020-01-17' 
        AND SALES_REGION IS NULL AND SALES_VPGM_MARKET IS NULL
        ORDER BY EXECUTED_ON";

        string sqlREGIONAL = @"SELECT TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY (DY)') AS EXECUTED_ON, " + pulldownColumnName + @"  
        FROM PONDER.DAILY_COUNT_SALES_2020_V2 
        WHERE (CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO IS NULL) AND EXECUTED_ON >= DATE '2020-01-17' 
        AND SALES_REGION LIKE '" + pulldownRegionVariable + @"' AND SALES_VPGM_MARKET IS NULL
        ORDER BY EXECUTED_ON";

        string sqlMARKET = @"SELECT TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY (DY)') AS EXECUTED_ON, " + pulldownColumnName + @"  
        FROM PONDER.DAILY_COUNT_SALES_2020_V2 
        WHERE (CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO IS NULL) AND EXECUTED_ON >= DATE '2020-01-17' 
        AND SALES_VPGM_MARKET LIKE '" + pulldownRegionVariable + @"'
        ORDER BY EXECUTED_ON"; //store your sql query in this string variable "sql"

        if (pulldownRegionVariable == "%")
        {
            sql = sqlNATIONAL;
        }

        else if (pulldownRegionVariable == "EAST" || pulldownRegionVariable == "CENTRAL" || pulldownRegionVariable == "WEST")
        {
            sql = sqlREGIONAL;
        }

        else
        {
            sql = sqlMARKET;
        }


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
    public static string Get_HistCountStock(string pulldownRegionVariable, string pulldownColumnName, string pulldownDateVariable)
    {


        string sql = "";

        string sqlNATIONAL = @"SELECT to_number(EXECUTED_ON - to_date('01-JAN-1970','DD-MON-YYYY')) * (24 * 60 * 60 * 1000) AS MILLISECONDS, 
        " + pulldownColumnName + @" FROM PONDER.DAILY_COUNT_SALES_2020_V2 WHERE (CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO IS NULL) 
        AND EXECUTED_ON >= DATE '2020-01-17' AND EXECUTED_ON <= LAST_day(DATE '" + pulldownDateVariable + @"')
        AND SALES_REGION IS NULL AND SALES_VPGM_MARKET IS NULL
        ORDER BY EXECUTED_ON";

        string sqlREGIONAL = @"SELECT to_number(EXECUTED_ON - to_date('01-JAN-1970','DD-MON-YYYY')) * (24 * 60 * 60 * 1000) AS MILLISECONDS, 
        " + pulldownColumnName + @" FROM PONDER.DAILY_COUNT_SALES_2020_V2 WHERE (CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO IS NULL) 
        AND EXECUTED_ON >= DATE '2020-01-17' AND EXECUTED_ON <= LAST_day(DATE '" + pulldownDateVariable + @"')
        AND SALES_REGION LIKE '" + pulldownRegionVariable + @"' AND SALES_VPGM_MARKET IS NULL
        ORDER BY EXECUTED_ON";

        string sqlMARKET = @"SELECT to_number(EXECUTED_ON - to_date('01-JAN-1970','DD-MON-YYYY')) * (24 * 60 * 60 * 1000) AS MILLISECONDS, 
        " + pulldownColumnName + @" FROM PONDER.DAILY_COUNT_SALES_2020_V2 WHERE (CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO IS NULL) 
        AND EXECUTED_ON >= DATE '2020-01-17' AND EXECUTED_ON <= LAST_day(DATE '" + pulldownDateVariable + @"') 
        AND SALES_VPGM_MARKET LIKE '" + pulldownRegionVariable + @"'
        ORDER BY EXECUTED_ON"; //store your sql query in this string variable "sql"

        if (pulldownRegionVariable == "%")
        {
            sql = sqlNATIONAL;
        }

        else if (pulldownRegionVariable == "EAST" || pulldownRegionVariable == "CENTRAL" || pulldownRegionVariable == "WEST")
        {
            sql = sqlREGIONAL;
        }

        else
        {
            sql = sqlMARKET;
        }

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
    public static string Get_HistActData(string pulldownRegionVariable, string pulldownDateVariable)
    {

        string sql = @"SELECT TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY') AS ONAIR_ACTUAL, MAX(ROWNUM) AS CUMULATIVE FROM(
                        SELECT ONAIR_ACTUAL, ROWNUM FROM(
                        SELECT ONAIR_ACTUAL
                        FROM PONDER.PACE_POE_2020
                        WHERE CE_CUSTOM_ONE = 'NSB ALL'
                        AND (SALES_REGION LIKE '" + pulldownRegionVariable + @"' OR SALES_VPGM_MARKET LIKE '" + pulldownRegionVariable + @"')
                        AND ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE '" + pulldownDateVariable + @"')
                       AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE '" + pulldownDateVariable + @"')
                        ORDER BY ONAIR_ACTUAL ASC
                        )
                        )GROUP BY ONAIR_ACTUAL
                        ";





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
    public static string Get_HistActStock(string pulldownRegionVariable, string pulldownDateVariable, string executedOnVariable)
    {


        string sql = @"SELECT to_number(DT - to_date('01-JAN-1970','DD-MON-YYYY')) * (24 * 60 * 60 * 1000) AS MILLISECONDS, SUM(ACTUAL)OVER(ORDER BY DT) AS CUMULATIVE FROM(
                        SELECT TBL1.DT, CASE WHEN TBL2.CUMULATIVE IS NULL THEN 0 ELSE TBL2.CUMULATIVE END AS ACTUAL
                        FROM
                        (
                        SELECT DT
                        FROM(
                        SELECT TRUNC (last_day(DATE '" + pulldownDateVariable + @"') +1  - ROWNUM) dt
                          FROM DUAL CONNECT BY ROWNUM < 32
                          )
                          where DT >= trunc(DATE '" + pulldownDateVariable + @"','mm') 
                        )TBL1
                        LEFT JOIN
                        (
                        SELECT ONAIR_ACTUAL,  COUNT(ONAIR_ACTUAL) AS CUMULATIVE FROM(
                                                SELECT ONAIR_ACTUAL
                                                FROM PONDER.PACE_POE_2020
                                                WHERE CE_CUSTOM_ONE = 'NSB ALL'
                                                AND (SALES_REGION LIKE '" + pulldownRegionVariable + @"' OR SALES_VPGM_MARKET LIKE '" + pulldownRegionVariable + @"')
                                                AND ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE '" + pulldownDateVariable + @"')
                                                AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE '" + pulldownDateVariable + @"')
                                                ORDER BY ONAIR_ACTUAL ASC
                                                )GROUP BY ONAIR_ACTUAL
                        )TBL2
                        ON TBL1.DT = TBL2.ONAIR_ACTUAL
                        ORDER BY DT
                        )
                        WHERE DT <= DATE '" + executedOnVariable + @"'
                     
                     ";

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
    public static string Get_HistCountAllMarkets(string pulldownMonth)
    {
        string sql = @"SELECT SALES_VPGM_MARKET, BEGINNING_" + pulldownMonth + @"_FCST, ACT_" + pulldownMonth + @"  FROM PONDER.FCST_ACC_SUMMARY 
            WHERE SALES_VPGM_MARKET != 'ALL' 
            AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL'
            ORDER BY ACT_" + pulldownMonth + @" DESC";

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


    //Recent and Upcoming Tab

    [WebMethod]
    public static string Get_Recent_Sales_Detail(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'NSB ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= DATE'" + timeVariable + @"' - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"') OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 9, 12)+1 )) )
            )
            WHERE (ROW_NUM = 1) or (ROW_NUM > 3 AND ROW_NUM < 3000) 
                    ";


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
    public static string Get_Recent_Sales_Detail2(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'NSB ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= DATE'" + timeVariable + @"' - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"') OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 9, 12)+1 )) )
            )
            WHERE (ROW_NUM = 2) or (ROW_NUM >= 3000 AND  ROW_NUM < 6000)
                    ";


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
    public static string Get_Recent_Sales_Detail3(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'NSB ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= DATE'" + timeVariable + @"' - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"') OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM DATE'" + timeVariable + @"') + 9, 12)+1 )) )
            )
            WHERE (ROW_NUM = 3) or (ROW_NUM >= 6000 AND  ROW_NUM < 9000)
                    ";


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
    public static string Get_Recent_Sales_Detail_CRAN(string timeVariable, string geoVariable)
    {
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'CRAN ALL'
            AND CE_CUSTOM_TWO = 'CRAN Node'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 1) or (ROW_NUM > 4 AND  ROW_NUM < 3000)
                    ";


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
    public static string Get_Recent_Sales_Detail_CRAN2(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'CRAN ALL'
            AND CE_CUSTOM_TWO = 'CRAN Node'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 2) or (ROW_NUM >= 3000 AND  ROW_NUM < 6000)
                    ";


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
    public static string Get_Recent_Sales_Detail_CRAN3(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'CRAN ALL'
            AND CE_CUSTOM_TWO = 'CRAN Node'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 3) or (ROW_NUM >= 6000 AND  ROW_NUM < 9000)
                    ";


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
    public static string Get_Recent_Sales_Detail_CRAN4(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'CRAN ALL'
            AND CE_CUSTOM_TWO = 'CRAN Node'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 4) or (ROW_NUM >= 9000 AND  ROW_NUM < 12000)
                    ";


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
    public static string Get_Recent_Sales_Detail_MMW(string timeVariable, string geoVariable)
    {
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = '5G mmWave ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 1) or (ROW_NUM > 4 AND  ROW_NUM < 3000)
            ";


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
    public static string Get_Recent_Sales_Detail_MMW2(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = '5G mmWave ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 2) or (ROW_NUM >= 3000 AND  ROW_NUM < 6000)
                    ";


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
    public static string Get_Recent_Sales_Detail_MMW3(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = '5G mmWave ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 3) or (ROW_NUM >= 6000 AND  ROW_NUM < 9000)
                    ";


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
    public static string Get_Recent_Sales_Detail_MMW4(string timeVariable, string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, PACE_NUMBER, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ONAIR_DATE
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'CM REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = '5G mmWave ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
            )                   
            WHERE (ROW_NUM = 4) or (ROW_NUM >= 9000 AND  ROW_NUM < 12000)
                    ";


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
    public static string GetNSB_QUAD1(string monthVariable, string geoVariable)
    {
        if (geoVariable == "%")
        {
            string sql = @"SELECT FORECAST_MONTH, PROJECT, SALES_REGION, PROJECTS_PLAN_ONAIR AS TABLE_PLAN, PROJECTS_FCST_ONAIR AS TABLE_FORECAST, PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL FROM (
                    SELECT * FROM PONDER.SAMBAR_PRODUCTION_CHART 
                    WHERE PROJECT = 'NSB ALL' 
                    AND SALES_REGION = 'ALL'
                    AND FORECAST_MONTH = '" + monthVariable + @"'
                    ORDER BY FORECAST_MONTH
                    )
                UNION ALL
                    SELECT FORECAST_MONTH, PROJECT, SALES_REGION, CUMU_PROJECTS_PLAN_ONAIR AS TABLE_PLAN, CUMU_PROJECTS_FCST_ONAIR AS TABLE_FORECAST, CUMU_PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL FROM (
                    SELECT * FROM PONDER.SAMBAR_PRODUCTION_CHART 
                    WHERE PROJECT = 'NSB ALL' 
                    AND SALES_REGION = 'ALL'
                    AND FORECAST_MONTH LIKE '%-12'
                    ORDER BY FORECAST_MONTH
                    )";

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
        else
        {
            string sql = @"SELECT FORECAST_MONTH, PROJECT, SALES_REGION, PROJECTS_PLAN_ONAIR AS TABLE_PLAN, PROJECTS_FCST_ONAIR AS TABLE_FORECAST, PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL FROM (
                    SELECT * FROM PONDER.SAMBAR_PRODUCTION_CHART 
                    WHERE PROJECT = 'NSB ALL' 
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                    AND FORECAST_MONTH = '" + monthVariable + @"'
                    ORDER BY FORECAST_MONTH
                    )
                UNION ALL
                    SELECT FORECAST_MONTH, PROJECT, SALES_REGION, CUMU_PROJECTS_PLAN_ONAIR AS TABLE_PLAN, CUMU_PROJECTS_FCST_ONAIR AS TABLE_FORECAST, CUMU_PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL FROM (
                    SELECT * FROM PONDER.SAMBAR_PRODUCTION_CHART 
                    WHERE PROJECT = 'NSB ALL' 
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                    AND FORECAST_MONTH LIKE '%-12'
                    ORDER BY FORECAST_MONTH
                    )";

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


    [WebMethod]
    public static string GetPRODUCTION_CHART_NSB(string timeVariable, string geoVariable)
    {
        if (geoVariable == "%")
        {
            string sql = @"SELECT * FROM PONDER.SAMBAR_PRODUCTION_CHART 
            WHERE PROJECT = 'NSB ALL' 
            AND SALES_REGION = 'ALL'
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
        else
        {
            string sql = @"SELECT * FROM PONDER.SAMBAR_PRODUCTION_CHART 
            WHERE PROJECT = 'NSB ALL' 
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
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
    }

    [WebMethod]
    public static string GetPRODUCTION_CHART_TABLE_NSB(string timeVariable, string geoVariable)
    {
        if (geoVariable == "%")
        {
            string sql = @"SELECT 'MONTHLY PLAN' AS COLUMN_NAME, t5.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_PLAN_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND SALES_REGION = 'ALL'
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t5

                UNION ALL

                SELECT 'MONTHLY FCST' AS COLUMN_NAME, t.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_FCST_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND SALES_REGION = 'ALL'
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t

                UNION ALL

                SELECT 'MONTHLY ACTUAL' AS COLUMN_NAME, t3.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_ONAIR_ACTUAL, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND SALES_REGION = 'ALL'
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t3

                UNION ALL

                SELECT 'PLAN CUMULATIVE' AS COLUMN_NAME, t6.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_PLAN_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND SALES_REGION = 'ALL'
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t6

                UNION ALL

                SELECT 'FCST CUMULATIVE' AS COLUMN_NAME, t2.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_FCST_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND SALES_REGION = 'ALL'
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t2

                UNION ALL

                SELECT 'ACTUAL CUMULATIVE' AS COLUMN_NAME, t4.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_ONAIR_ACTUAL, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND SALES_REGION = 'ALL'
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t4";

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
        else
        {
            string sql = @"SELECT 'MONTHLY PLAN' AS COLUMN_NAME, t5.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_PLAN_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                   AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t5

                UNION ALL
                
                SELECT 'MONTHLY FCST' AS COLUMN_NAME, t.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_FCST_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                   AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t

                UNION ALL

                SELECT 'MONTHLY ACTUAL' AS COLUMN_NAME, t3.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_ONAIR_ACTUAL, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                   AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t3

                UNION ALL

                SELECT 'PLAN CUMULATIVE' AS COLUMN_NAME, t6.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_PLAN_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                   AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t6

                UNION ALL

                SELECT 'FCST CUMULATIVE' AS COLUMN_NAME, t2.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_FCST_ONAIR, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                   AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t2 

                UNION ALL

                SELECT 'ACTUAL CUMULATIVE' AS COLUMN_NAME, t4.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_ONAIR_ACTUAL, PROJECT, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM SAMBAR_PRODUCTION_CHART
                   WHERE PROJECT = 'NSB ALL'
                   AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                   AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                   ORDER BY FORECAST_MONTH
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t4";

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

    [WebMethod]
    public static string Get_PC_Modal( string geoVariable, string monthVariable, string RecentMSVariable )
    {

        string sql = @"SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, PACE_NAME, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUBPROGRAM, PRODUCT_SUBGROUP AS SUBGROUP, RAN_AVP, MARKET, SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE,
                    TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                    TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                    TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE4
                    FROM PONDER.PACE_POE_2020 WHERE STATUS IN ('Complete', 'Active')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN '%' ELSE SALES_VPGM_MARKET END)
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')))                    
                    AND ROWNUM <= 3000
                    "; //store your sql query in this string variable "sql" 

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
    public static string Get_RYG_Modal(string geoVariable, string monthVariable, string RecentMSVariable, string PlanFcstVariable)
    {

        string sql = @"SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, PACE_NAME, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUBPROGRAM, PRODUCT_SUBGROUP AS SUBGROUP, RAN_AVP, MARKET, SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, CIVIL_VENDOR, SITE_ACQUISITION_VENDOR AS SA_VENDOR,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE,
                    TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                    TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                    TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE4
                    FROM PONDER.PACE_POE_2020 WHERE STATUS IN ('Complete', 'Active')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_" + PlanFcstVariable + @") = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN '%' ELSE SALES_VPGM_MARKET END)
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'Mon') LIKE ('" + monthVariable + @"')))                    
                    AND ROWNUM <= 3000
                    "; //store your sql query in this string variable "sql" 

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
    public static string Get_RYG_Modal2(string geoVariable, string yearVariable, string RecentMSVariable, string PlanFcstVariable)
    {

        string sql = @"SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, PACE_NAME, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUBPROGRAM, PRODUCT_SUBGROUP AS SUBGROUP, RAN_AVP, MARKET, SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE,
                    TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                    TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                    TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE4
                    FROM PONDER.PACE_POE_2020 WHERE STATUS IN ('Complete', 'Active')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_" + PlanFcstVariable + @") = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN '%' ELSE SALES_VPGM_MARKET END)
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE ('" + yearVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE ('" + yearVariable + @"')))                    
                    AND ROWNUM <= 3000
                    "; //store your sql query in this string variable "sql" 

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
    public static string Get_RYG_Modal3(string geoVariable, string yearVariable, string RecentMSVariable)
        
    {
        string sql = @"SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"' WHEN CY_PULL = 1 THEN 'PULL " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, PACE_NAME, CE_CUSTOM_ONE AS PROGRAM, CE_CUSTOM_TWO AS SUBPROGRAM, PRODUCT_SUBGROUP AS SUBGROUP, RAN_AVP, MARKET, SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, CIVIL_VENDOR, SITE_ACQUISITION_VENDOR AS SA_VENDOR,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE,
                    TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                    TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                    TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE4
                    FROM PONDER.PACE_POE_2020 WHERE STATUS IN ('Complete', 'Active')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN '%' ELSE SALES_VPGM_MARKET END)
                    AND (CY_PUSH = 1 OR CY_PULL = 1)                                      
                    AND ROWNUM <= 3000
                    "; //store your sql query in this string variable "sql" 

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
    public static string Getdonut1(string geoVariable, string monthVariable)
    {
        //Construction Started
        string sql = "";

        string sqlRegion = @"SELECT * FROM PONDER.SALES_DONUT WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND SALES_REGION != 'UNDEFINED'
                AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' THEN 'ALL' ELSE '" + geoVariable + @"' END)
                AND SALES_REGION LIKE (CASE WHEN SALES_REGION LIKE '" + geoVariable + @"' ANd SALES_VPGM_MARKET LIKE '" + geoVariable + @"' THEN 'NATIONAL' ELSE '%' END)";

        string sqlNational = @"SELECT * FROM PONDER.SALES_DONUT WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                AND CE_CUSTOM_ONE = 'NSB ALL' AND CE_CUSTOM_TWO = 'ALL' 
                AND SALES_REGION = 'ALL'";

        if (geoVariable == "%")
        {
            sql = sqlNational;
        }
        else
        {
            sql = sqlRegion;
        }

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