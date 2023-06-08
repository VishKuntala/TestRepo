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

public partial class sales_Sales_Opportunity_Testing : System.Web.UI.Page
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
        ddlGeo.Items.Add(new ListItem("ACE", "ACE"));
        ddlGeo.Items.Add(new ListItem("Sales VP/GM", "SALES"));

        string sqlQuery = @"select MARKET_LONG, MARKET
            from PONDER.MARKET_MENU_V5
            ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list

        labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Region/AVP/Market: &nbsp;&nbsp;";

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

    protected void ddlGeo_SelectedIndexChanged(object sender, EventArgs e)
    {

        var GeoSelected = ddlGeo.SelectedItem.Value;

        if (GeoSelected == "SALES")
        {
            ddlMarket.Items.Clear();
            ddlMarket.AppendDataBoundItems = true;

            labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;Sales Region/VPGM Market: &nbsp;&nbsp;";

            String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
            String strQuery = "select MARKET_LONG, MARKET from PONDER.SALES_MARKET_MENU_V2 ORDER BY RANK_ORDER";

            using (OracleConnection con = new OracleConnection(strConnString))
            {
                using (OracleCommand cmd = new OracleCommand(strQuery)) // Initiates your SQL Command
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        ddlMarket.DataSource = cmd.ExecuteReader();
                        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
                        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
                        ddlMarket.DataBind(); //bind the list                        
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        con.Close();
                        con.Dispose();
                    }
                }
            }

        }
        else if (GeoSelected == "ACE")
        {
            ddlMarket.Items.Clear();
            ddlMarket.AppendDataBoundItems = true;

            labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Region/AVP/Market: &nbsp;&nbsp;";

            String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
            String strQuery = "select MARKET_LONG, MARKET from PONDER.MARKET_MENU_V5 ORDER BY RANK_ORDER";

            using (OracleConnection con = new OracleConnection(strConnString))
            {
                using (OracleCommand cmd = new OracleCommand(strQuery)) // Initiates your SQL Command
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        ddlMarket.DataSource = cmd.ExecuteReader();
                        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
                        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
                        ddlMarket.DataBind(); //bind the list                        
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                    finally
                    {
                        con.Close();
                        con.Dispose();
                    }
                }
            }
        }


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
    public static string Get_Store_Detail_Market(string groupVariable, string marketVariable)
    {

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "WHERE (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"' OR MARKET_GROUP LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM < 900)
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
    public static string Get_Store_Detail(string groupVariable, string marketVariable)
    {

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "WHERE (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"' OR MARKET_GROUP LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM = 1) or (ROW_NUM > 3 AND ROW_NUM < 300)
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
    public static string Get_Store_Detail2(string groupVariable, string marketVariable)
    {

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "WHERE (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"' OR MARKET_GROUP LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM = 2) or (ROW_NUM >= 300 AND  ROW_NUM < 600)
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
    public static string Get_Store_Detail3(string groupVariable, string marketVariable)
    {

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "WHERE (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"' OR MARKET_GROUP LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM = 3) or (ROW_NUM >= 600 AND  ROW_NUM < 900)
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
    public static string Get_zip_theme_data(string groupVariable, string marketVariable)
    {
        string sql = @"SELECT ZIP_CODE, ZIP_POPS FROM PONDER.MAP_PLOT_THEME";

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
    public static string Get_Master_Data()
    {
        string sql = @"SELECT * FROM PONDER.SALES_OPP_MASTER";

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