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

public partial class Sambar_Sambar_Dashboard : System.Web.UI.Page
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

        }

        if (hf_FCCategoryValue == "3")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));

        }

        if (hf_FCCategoryValue == "4")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        }

        if (hf_FCCategoryValue == "5")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        }

        if (hf_FCCategoryValue == "6")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        }

        if (hf_FCCategoryValue == "7")
        {
            ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
            ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
            ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
            ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
            ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
            ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
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

    //Recent and Upcoming Tab

    [WebMethod]
    public static string Get_Recent_Sales_Detail(string timeVariable, string geoVariable)
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
            WHERE CE_CUSTOM_ONE = 'NSB ALL'
            AND (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM EXECUTED_ON)
            OR (ONAIR_ACTUAL IS NOT NULL AND ONAIR_ACTUAL >= EXECUTED_ON - 95 AND (EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON) OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1
            OR EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 )) )
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
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM EXECUTED_ON) AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM EXECUTED_ON)) THEN 'CM ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 10, 12)+1 ) THEN 'CM-1 ACTUAL'
            WHEN (EXTRACT (MONTH FROM ONAIR_ACTUAL) = MOD(EXTRACT (MONTH FROM EXECUTED_ON) + 9, 12)+1 ) THEN 'CM-2 ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            CASE WHEN ONAIR_ACTUAL IS NULL THEN CONCAT(TO_CHAR(ONAIR_FORECAST,'MM-DD-YYYY'),' FORECAST') ELSE CONCAT(TO_CHAR(ONAIR_ACTUAL,'MM-DD-YYYY'),' ACTUAL') END AS ONAIR_DATE,
            CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,
            LATITUDE, LONGITUDE, PACE_NUMBER,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020
            WHERE CE_CUSTOM_ONE = 'NSB ALL'
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
    public static string Get_Recent_Sales_Detail3(string timeVariable, string geoVariable)
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
            WHERE CE_CUSTOM_ONE = 'NSB ALL'
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

}