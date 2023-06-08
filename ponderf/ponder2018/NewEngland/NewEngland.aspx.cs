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

public partial class NewEngland_NewEngland : System.Web.UI.Page
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
            WHERE MARKET_LONG = 'New England'
            ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list

        //ddlTime.Items.Add(new ListItem("Last 6 months on air / +30 days forecasted", "0"));
        //ddlTime.Items.Add(new ListItem("Last 12 months on air / +60 days forecasted", "1"));
        //ddlTime.Items.Add(new ListItem("Recent/Upcoming +/- 30 Days", "2"));
        //ddlTime.Items.Add(new ListItem("Current Month", "3"));
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

    //Recent and Upcoming Tab

    [WebMethod]
    public static string Get_Recent_Sales_Detail( string geoVariable)
    {
        
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,            
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM                                        
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail2( string geoVariable)
    {
        
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,            
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM                    
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail3( string geoVariable)
    {
        
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,            
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM                    
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'NSB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_CRAN( string geoVariable)
    {
                string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'CRAN ALL'
                    AND CE_CUSTOM_TWO = 'CRAN Node'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_CRAN2( string geoVariable)
    {
       
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'CRAN ALL'
                    AND CE_CUSTOM_TWO = 'CRAN Node'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_CRAN3( string geoVariable)
    {
        
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'CRAN ALL'
                    AND CE_CUSTOM_TWO = 'CRAN Node'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
public static string Get_Recent_Sales_Detail_CRAN4( string geoVariable)
{
    
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'CRAN ALL'
                    AND CE_CUSTOM_TWO = 'CRAN Node'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_IB(string geoVariable)
    {
        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'IB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_IB2(string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'IB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_IB3(string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                    FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'IB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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
    public static string Get_Recent_Sales_Detail_IB4(string geoVariable)
    {

        string sql = @"SELECT LATITUDE, LONGITUDE, CATEGORY, SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP_CODE, ON_AIR_DATE, DATE1, DATE2, DATE3, DATE4
                FROM (SELECT CASE WHEN ONAIR_ACTUAL IS NOT NULL THEN 'RECENTLY COMPLETED' ELSE 'UPCOMING FORECASTED' END AS CATEGORY,
                    CE_CUSTOM_TWO AS SUBPROGRAM, SALES_REGION, SALES_VPGM_MARKET, STATE, COUNTY, CMA_NAME, CITY, ZIP AS ZIP_CODE,           
                    LATITUDE, LONGITUDE,
                    ON_AIR_DATE,
                    TO_CHAR((EXECUTED_ON - 90 + 1) , 'MM-DD-YYYY') AS DATE1,
                    TO_CHAR((EXECUTED_ON), 'MM-DD-YYYY') AS DATE2,
                    TO_CHAR((EXECUTED_ON + 1) , 'MM-DD-YYYY') AS DATE3,
                    TO_CHAR((EXECUTED_ON + 45) , 'MM-DD-YYYY') AS DATE4,
                    ROWNUM ROW_NUM
                    FROM PONDER.SALES_TABLE
                    WHERE (SALES_REGION LIKE '" + geoVariable + @"' OR SALES_VPGM_MARKET LIKE '" + geoVariable + @"')
                    AND CE_CUSTOM_ONE = 'IB ALL'
                    AND ((ONAIR_ACTUAL IS NOT NULL AND EXECUTED_ON - ONAIR_ACTUAL < 90 AND EXECUTED_ON >= ONAIR_ACTUAL) 
                        OR (ONAIR_ACTUAL IS NULL AND ONAIR_FORECAST - EXECUTED_ON <= 45 AND ONAIR_FORECAST >= EXECUTED_ON)))
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

    // B 14 Summary info for New England email

    [WebMethod]
    public static string Get_B14_Summary(string geoVariable)
    {

        string sql = @"SELECT ON_AIR_CATEGORY, COUNT(*) AS COUNT,
                    SUM(CASE WHEN B14_CATEGORY = 'B14 ON SEPARATE JOB AT FA LOCATION' THEN 1 ELSE 0 END) AS SEPARATE_B14_JOB,
                    SUM(CASE WHEN B14_CATEGORY = 'FIRST NET NSB' THEN 1 ELSE 0 END) AS FIRSTNET_NSB,
                    SUM(CASE WHEN B14_CATEGORY = 'NO B14 AT FA LOCATION' THEN 1 ELSE 0 END) AS NO_B14_AT_FA
                    FROM(
                    SELECT
                    CASE WHEN TBL1.ONAIR_ACTUAL IS NULL THEN 'UPCOMING' ELSE 'RECENTLY ON AIR' END AS ON_AIR_CATEGORY,
                    CASE WHEN TBL2.PACE_NUMBER IS NULL THEN 'NO B14 AT FA LOCATION' WHEN TBL1.CE_CUSTOM_TWO = 'NSB FN' THEN 'FIRST NET NSB' ELSE 'B14 ON SEPARATE JOB AT FA LOCATION' END AS B14_CATEGORY,
                    TBL1.STATE, TBL1.COUNTY, TBL1.CITY,
                    CASE WHEN TBL1.ONAIR_ACTUAL IS NULL THEN TBL1.ONAIR_FORECAST ELSE TBL1.ONAIR_ACTUAL END AS ON_AIR_DATE,
                    TBL1.PACE_NAME AS NSB_PACE_NAME, TBL1.CE_CUSTOM_TWO AS NSB_SUBPROGRAM,
                    TBL1.PACE_NUMBER AS NSB_PACE_NUMBER, TBL2.PACE_NUMBER AS B14_JOB_PACE_NUMBER FROM(
                    SELECT * FROM PONDER.PACE_POE_2020 WHERE CE_CUSTOM_ONE = 'NSB ALL' AND RAN_MARKET = 'NEW ENGLAND' AND(EXECUTED_ON - ONAIR_ACTUAL < 90 OR(ONAIR_ACTUAL IS NULL AND  ONAIR_FORECAST - EXECUTED_ON <= 45))
                    )TBL1
                    LEFT JOIN
                    (SELECT * FROM PONDER.PACE_POE_2020 WHERE RAN_MARKET = 'NEW ENGLAND' AND IPLAN_SPECTRUM LIKE '%Band 14%')TBL2
                    ON TBL1.FA_LOCATION_CODE = TBL2.FA_LOCATION_CODE
                    ORDER BY ON_AIR_CATEGORY, B14_CATEGORY
                    )
                    GROUP BY ON_AIR_CATEGORY
                    ORDER BY ON_AIR_CATEGORY
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
    public static string Get_B14_Detail(string geoVariable)
    {

        string sql = @"SELECT
                    ON_AIR_CATEGORY,
                    B14_CATEGORY,
                    TO_CHAR(ON_AIR_DATE, 'MM-DD-YYYY') AS ON_AIR_DATE,
                    STATE, COUNTY, CITY,
                    NSB_PACE_NAME,
                    NSB_SUBPROGRAM,
                    NSB_PACE_NUMBER,
                    B14_JOB_PACE_NUMBER
                    FROM(
                    SELECT
                    CASE WHEN TBL1.ONAIR_ACTUAL IS NULL THEN 'UPCOMING' ELSE 'RECENTLY ON AIR' END AS ON_AIR_CATEGORY,
                    CASE WHEN TBL2.PACE_NUMBER IS NULL THEN 'NO B14 AT FA LOCATION' WHEN TBL1.CE_CUSTOM_TWO = 'NSB FN' THEN 'FIRST NET NSB' ELSE 'B14 ON SEPARATE JOB AT FA LOCATION' END AS B14_CATEGORY,
                    CASE WHEN TBL1.ONAIR_ACTUAL IS NULL THEN TBL1.ONAIR_FORECAST ELSE TBL1.ONAIR_ACTUAL END AS ON_AIR_DATE,
                    TBL1.STATE, TBL1.COUNTY, TBL1.CITY,
                    TBL1.PACE_NAME AS NSB_PACE_NAME, TBL1.CE_CUSTOM_TWO AS NSB_SUBPROGRAM,
                    TBL1.PACE_NUMBER AS NSB_PACE_NUMBER, TBL2.PACE_NUMBER AS B14_JOB_PACE_NUMBER FROM(
                    SELECT * FROM PONDER.PACE_POE_2020 WHERE CE_CUSTOM_ONE = 'NSB ALL' AND RAN_MARKET = 'NEW ENGLAND' AND(EXECUTED_ON - ONAIR_ACTUAL < 90 OR(ONAIR_ACTUAL IS NULL AND  ONAIR_FORECAST - EXECUTED_ON <= 45))
                    )TBL1
                    LEFT JOIN
                    (SELECT * FROM PONDER.PACE_POE_2020 WHERE RAN_MARKET = 'NEW ENGLAND' AND IPLAN_SPECTRUM LIKE '%Band 14%')TBL2
                    ON TBL1.FA_LOCATION_CODE = TBL2.FA_LOCATION_CODE
                    ORDER BY ON_AIR_CATEGORY, B14_CATEGORY, ON_AIR_DATE
                    )
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

}