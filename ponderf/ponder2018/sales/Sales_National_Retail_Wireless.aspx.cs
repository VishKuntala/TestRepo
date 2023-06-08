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
using System.Security;
using System.Security.Permissions;
using Oracle.ManagedDataAccess.Types;

public partial class sales_National_Retail_Wireless : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!(Page.IsPostBack)) //stops page from reloading on selection or button click
        {

            string ATTUID = "";
            try
            {
                _CSP.User userx = (_CSP.User)System.Web.HttpContext.Current.User;
                ATTUID = userx.attuid.ToString();
            }
            catch
            {
                ATTUID = "no_user";
                //ATTUID = "wc5172";
            }

            hf_User.Value = ATTUID;

            String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
            String strQuery1 = "SELECT ACCESS_GROUP FROM PONDER.PONDER_ACCESS_CONTROL WHERE ATT_USERID = '" + ATTUID + @"'";

            using (OracleConnection con = new OracleConnection(strConnString))
            {
                using (OracleCommand cmd = new OracleCommand(strQuery1)) // Initiates your SQL Command
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery1;
                    cmd.Connection = con;
                    try
                    {
                        con.Open();
                        using (OracleDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                reader.Read();
                                OracleString oraclestring1 = reader.GetOracleString(0);

                                if (oraclestring1 == "ADMIN" || oraclestring1 == "ACE" || oraclestring1 == "SALES_OPP_SPECIAL_ACCESS" || oraclestring1 == "SAMBAR_DIRECTS_CHAINUP" || oraclestring1 == "SALES_MANAGEMENT")
                                {
                                    InitSelectors();
                                }
                                else
                                {
                                    LoginRedirect();
                                }
                                reader.Close();
                            }
                            else
                            {
                                LoginRedirect();
                            }

                        }
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

    public void LoginRedirect()
    {
        Response.Redirect("/PONDER_Not_auth.aspx");
    }
    // FILL SELECTORS
    public void InitSelectors()
    {
        //ddlGeo.Items.Add(new ListItem("ACE", "ACE"));
        //ddlGeo.Items.Add(new ListItem("Sales VP/GM", "SALES"));

        //Sort ddls for table
        ddlSortZip.Items.Add(new ListItem("Highest Total Pops", "ZIPTOTALPOPS"));
        ddlSortZip.Items.Add(new ListItem("Highest Pop Density", "ZIPPOP_DENSITY"));
        ddlSortZip.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));
        ddlSortZip.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        ddlSortZip.Items.Add(new ListItem("Highest Total Stores", "ALL_STORE_COUNT"));
        ddlSortCounty.Items.Add(new ListItem("Highest Total Pops", "TOTALPOPS"));
        ddlSortCounty.Items.Add(new ListItem("Highest Pop Density", "POP_DENSITY"));
        ddlSortCounty.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));
        ddlSortCounty.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        ddlSortCounty.Items.Add(new ListItem("Highest Total Stores", "ALL_STORE_COUNT"));
        ddlSortNational.Items.Add(new ListItem("All Stores", "%"));
        ddlSortNational.Items.Add(new ListItem("Walmart", "WALMART"));
        ddlSortNational.Items.Add(new ListItem("Target", "TARGET MOBILE/DIRECT"));
        ddlSortNational.Items.Add(new ListItem("BestBuy", "BEST BUY MOBILE"));
        ddlSortNational.Items.Add(new ListItem("Sams Club", "SAM'S CLUB MOBILE"));
        ddlSortNational.Items.Add(new ListItem("Costco", "COSTCO/WIRELESS ADVOCATES"));
        ddlSortNational.Items.Add(new ListItem("Smart Circle", "SMART CIRCLE"));
        ddlSortNational.Items.Add(new ListItem("Microsoft", "MICROSOFT"));
        ddlSortNational.Items.Add(new ListItem("Others", "OTHERS"));
        ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        ddlSortZipModal.Items.Add(new ListItem("Wireless Score", "WIRELESS_SCORE"));
        ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Availability", "FIBER_AVAILABLE"));
        ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));


        string sqlQuery = @"select MARKET_LONG, MARKET from PONDER.SALES_OPP_MARKET_MENU ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list

        //labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Region/AVP/Market: &nbsp;&nbsp;";
        labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;Sales Region/VPGM Market: &nbsp;&nbsp;";
        labelSortNational.Text = "&nbsp;&nbsp;&nbsp;&nbsp;Store Filter: &nbsp;&nbsp;";

        //ddlMarket.Visible = false;
        //ddlMarket.Enabled = false;
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

    //protected void ddlGeo_SelectedIndexChanged(object sender, EventArgs e)
    //{

    //    var GeoSelected = ddlGeo.SelectedItem.Value;

    //    if (GeoSelected == "SALES")
    //    {
    //        ddlMarket.Items.Clear();
    //        ddlMarket.AppendDataBoundItems = true;

    //        labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;Sales Region/VPGM Market: &nbsp;&nbsp;";

    //        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
    //        String strQuery = "select MARKET_LONG, MARKET from PONDER.SALES_MARKET_MENU_V2 ORDER BY RANK_ORDER";

    //        using (OracleConnection con = new OracleConnection(strConnString))
    //        {
    //            using (OracleCommand cmd = new OracleCommand(strQuery)) // Initiates your SQL Command
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                cmd.CommandText = strQuery;
    //                cmd.Connection = con;
    //                try
    //                {
    //                    con.Open();
    //                    ddlMarket.DataSource = cmd.ExecuteReader();
    //                    ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
    //                    ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
    //                    ddlMarket.DataBind(); //bind the list                        
    //                }
    //                catch (Exception ex)
    //                {
    //                    throw ex;
    //                }
    //                finally
    //                {
    //                    con.Close();
    //                    con.Dispose();
    //                }
    //            }
    //        }

    //    }
    //    else if (GeoSelected == "ACE")
    //    {
    //        ddlMarket.Items.Clear();
    //        ddlMarket.AppendDataBoundItems = true;

    //        labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Region/AVP/Market: &nbsp;&nbsp;";

    //        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
    //        String strQuery = "select MARKET_LONG, MARKET from PONDER.MARKET_MENU_V5 ORDER BY RANK_ORDER";

    //        using (OracleConnection con = new OracleConnection(strConnString))
    //        {
    //            using (OracleCommand cmd = new OracleCommand(strQuery)) // Initiates your SQL Command
    //            {
    //                cmd.CommandType = CommandType.Text;
    //                cmd.CommandText = strQuery;
    //                cmd.Connection = con;
    //                try
    //                {
    //                    con.Open();
    //                    ddlMarket.DataSource = cmd.ExecuteReader();
    //                    ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
    //                    ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
    //                    ddlMarket.DataBind(); //bind the list                        
    //                }
    //                catch (Exception ex)
    //                {
    //                    throw ex;
    //                }
    //                finally
    //                {
    //                    con.Close();
    //                    con.Dispose();
    //                }
    //            }
    //        }
    //    }


    //}

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
        groupVariable = "WHERE (MARKET_GROUP LIKE '" + marketVariable + @"')";

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM < 3000)
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
    public static string Get_Zip_Summary_Info(string groupVariable, string marketVariable)
    {

        string sql = @"SELECT
              'ZIP_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN 1 ELSE 0 END) AS PWNF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN TO_NUMBER(ZIPTOTALPOPS) ELSE 0 END) AS PWNF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN 1 ELSE 0 END) AS PWGF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN TO_NUMBER(ZIPTOTALPOPS) ELSE 0 END) AS PWGF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN 1 ELSE 0 END) AS GWNF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN TO_NUMBER(ZIPTOTALPOPS) ELSE 0 END) AS GWNF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN 1 ELSE 0 END) AS GWGF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN TO_NUMBER(ZIPTOTALPOPS) ELSE 0 END) AS GWGF_POPS
            FROM PONDER.SALES_OPP_ZIP_071320
            WHERE SALES_MAR2 LIKE '" + marketVariable + @"'";

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
    public static string Get_ZipTable_Data(string groupVariable, string marketVariable, string overallCatVariable, string orderVariable)
    {

        //string sql = @"SELECT * FROM (SELECT ZIP, ROUND(ZIPTOTALAREA, 1) AS ZIPTOTALAREA, ZIPTOTALPOPS + 0 AS ZIPTOTALPOPS, ZIPPOP_DENSITY + 0 AS ZIPPOP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //                FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //                FROM PONDER.SALES_OPP_ZIP_071320 WHERE SALES_MAR2 = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC) WHERE ROWNUM <= 50";

        //string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP, ROUND(ZIPTOTALAREA, 1) AS ZIPTOTALAREA, ZIPTOTALPOPS + 0 AS ZIPTOTALPOPS, ZIPPOP_DENSITY + 0 AS ZIPPOP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
        //            FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //            FROM PONDER.SALES_OPP_ZIP_071320 WHERE SALES_MAR2 = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' AND ZIPTOTALAREA > 0.2 ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP, ROUND(ZIPTOTALAREA,0) AS ZIPTOTALAREA, TO_CHAR(ZIPTOTALPOPS + 0, '999,999,999,999') AS ZIPTOTALPOPS, TO_CHAR(ZIPPOP_DENSITY + 0, '999,999,999.9') AS ZIPPOP_DENSITY, 
                    WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, TO_CHAR(FIBER_OPPORTUNITY, 
                    '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
                    FROM PONDER.SALES_OPP_ZIP_071320 WHERE SALES_MAR2 = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' 
                    AND OVERALL_CAT != 'No Category' AND ZIPTOTALAREA > 0.2 ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

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
    public static string Get_Store_Detail_Region1(string groupVariable, string marketVariable)
    {
        groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"')";

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM = 1) or (ROW_NUM > 2 AND ROW_NUM < 3000)
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
    public static string Get_Store_Detail_Region2(string groupVariable, string marketVariable)
    {

        groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"')";

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM = 2) or (ROW_NUM >= 3000 AND ROW_NUM < 6000)
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
    public static string Get_County_Summary_Info(string groupVariable, string marketVariable)
    {
        string sql = @"SELECT
              'COUNTY_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN 1 ELSE 0 END) AS PWNF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS PWNF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN 1 ELSE 0 END) AS PWGF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS PWGF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN 1 ELSE 0 END) AS GWNF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS GWNF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN 1 ELSE 0 END) AS GWGF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS GWGF_POPS
            FROM PONDER.SALES_OPP_COUNTY_071320
            WHERE SALES_REGI = '" + marketVariable + @"'";

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
    public static string Get_CountyTable_Data(string groupVariable, string marketVariable, string overallCatVariable, string orderVariable)
    {
        //string sql = @"SELECT * FROM (SELECT SMARTLABEL AS COUNTY, ROUND(TOTALAREA, 0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //            FIBER_PERCENTAGE, OVERALL_CAT, COUNTY_STATE, ROWNUM AS ROW_NUM, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
        //            FROM PONDER.SALES_OPP_COUNTY_071320 WHERE SALES_REGI = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)WHERE (ROW_NUM <= 50)";

        //string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT SMARTLABEL AS COUNTY, ROUND(TOTALAREA, 0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
        //            FIBER_PERCENTAGE, OVERALL_CAT, COUNTY_STATE, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //            FROM PONDER.SALES_OPP_COUNTY_071320 WHERE SALES_REGI = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT SMARTLABEL AS COUNTY, ROUND(TOTALAREA,0) AS TOTALAREA, TO_CHAR(TOTALPOPS + 0, '999,999,999,999') AS TOTALPOPS, TO_CHAR(POP_DENSITY + 0, '999,999,999.9') AS POP_DENSITY, 
                    WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, COUNTY_STATE, 
                    TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
                    FROM PONDER.SALES_OPP_COUNTY_071320 
                    WHERE SALES_REGI = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' 
                    AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

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
    public static string Get_Store_Detail_National1(string groupVariable, string marketVariable)
    {
        groupVariable = "";

        string sql = @"SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET, 
                        STATUS, RSRP, NO_SERVICE_EVENT_RATE, ROAMING_RATE, TOTAL_DURATION, WIRELESS_SCORE, OVERALL_RANK, LATITUDE, LONGITUDE, CMA, COUNTY_FIPS
                    FROM (SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION, MARKET_GROUP, 
                        STATUS, RSRP, NO_SERVICE_EVENT_RATE, ROAMING_RATE, TOTAL_DURATION, WIRELESS_SCORE, OVERALL_RANK, LATITUDE, LONGITUDE, CMA, COUNTY_FIPS, ROWNUM ROW_NUM
                    FROM PONDER.SALES_NATIONAL_RETAIL_071420
                    " + groupVariable + @" 
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
    public static string Get_Store_Detail_National2(string groupVariable, string marketVariable)
    {
        groupVariable = "";

        string sql = @"SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET, 
                        STATUS, RSRP, NO_SERVICE_EVENT_RATE, ROAMING_RATE, TOTAL_DURATION, WIRELESS_SCORE, OVERALL_RANK, LATITUDE, LONGITUDE, CMA, COUNTY_FIPS
                    FROM (SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION, MARKET_GROUP, 
                        STATUS, RSRP, NO_SERVICE_EVENT_RATE, ROAMING_RATE, TOTAL_DURATION, WIRELESS_SCORE, OVERALL_RANK, LATITUDE, LONGITUDE, CMA, COUNTY_FIPS, ROWNUM ROW_NUM
                    FROM PONDER.SALES_NATIONAL_RETAIL_071420
                    " + groupVariable + @" 
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
    public static string Get_Store_Detail_National3(string groupVariable, string marketVariable)
    {
        groupVariable = "";

        string sql = @"SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET, 
                        STATUS, RSRP, NO_SERVICE_EVENT_RATE, ROAMING_RATE, TOTAL_DURATION, WIRELESS_SCORE, OVERALL_RANK, LATITUDE, LONGITUDE, CMA, COUNTY_FIPS
                    FROM (SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION, MARKET_GROUP, 
                        STATUS, RSRP, NO_SERVICE_EVENT_RATE, ROAMING_RATE, TOTAL_DURATION, WIRELESS_SCORE, OVERALL_RANK, LATITUDE, LONGITUDE, CMA, COUNTY_FIPS, ROWNUM ROW_NUM
                    FROM PONDER.SALES_NATIONAL_RETAIL_071420
                    " + groupVariable + @" 
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
    public static string Get_CMA_Summary_Info(string groupVariable, string marketVariable)
    {
        string sql = @"SELECT
              'CMA_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN 1 ELSE 0 END) AS PWNF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN TO_NUMBER(CMATOTALPOPS) ELSE 0 END) AS PWNF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN 1 ELSE 0 END) AS PWGF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN TO_NUMBER(CMATOTALPOPS) ELSE 0 END) AS PWGF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN 1 ELSE 0 END) AS GWNF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN TO_NUMBER(CMATOTALPOPS) ELSE 0 END) AS GWNF_POPS,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN 1 ELSE 0 END) AS GWGF_COUNT,
              SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN TO_NUMBER(CMATOTALPOPS) ELSE 0 END) AS GWGF_POPS
            FROM PONDER.SALES_OPP_CMA_071320";

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
    public static string Get_NationalTable_Data(string groupVariable, string marketVariable, string overallCatVariable, string storeVariable)
    {
        if (storeVariable == "OTHERS")
        {
            storeVariable = "'AAFES/WIRELESS ADVOCATES' OR MASTER_DEALER_NAME LIKE 'CYDCOR' OR MASTER_DEALER_NAME LIKE 'FRYS ELECTRONICS' OR MASTER_DEALER_NAME LIKE 'NAVY/WIRELESS ADVOCATES' OR MASTER_DEALER_NAME LIKE 'STEREN ELECTRONICS' OR MASTER_DEALER_NAME LIKE 'MARINES/WIRELESS ADVOCATES' OR MASTER_DEALER_NAME LIKE 'TROC/SAMSUNG' OR MASTER_DEALER_NAME LIKE 'NEBRASKA FURNITURE MART'";
        }
        else storeVariable = "'" + storeVariable + "'";
        


        //string sql = @"SELECT * FROM (SELECT CMA, CMA_NAME, ROUND(CMATOTALAREA,0) AS CMATOTALAREA, CMATOTALPOPS + 0 AS CMATOTALPOPS, CMAPOP_DENSITY + 0 AS CMAPOP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //            FIBER_PERCENTAGE, OVERALL_CAT, ROWNUM AS ROW_NUM, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
        //            FROM PONDER.SALES_OPP_CMA_071320 WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC) WHERE (ROW_NUM <= 50)";

            //string sql = @"SELECT ROWNUM, TBL1.* FROM(SELECT CMA, CMA_NAME, ROUND(CMATOTALAREA,0) AS CMATOTALAREA, CMATOTALPOPS + 0 AS CMATOTALPOPS, CMAPOP_DENSITY + 0 AS CMAPOP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
            //            FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
            //            FROM PONDER.SALES_OPP_CMA_071320 WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        string sql = @"SELECT ROWNUM, TBL1.* FROM (SELECT* FROM PONDER.SALES_NATIONAL_RETAIL_071420 WHERE MASTER_DEALER_NAME LIKE " + storeVariable + @" ORDER BY WIRELESS_SCORE DESC, OVERALL_RANK)TBL1 WHERE(ROWNUM <= 50)";

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
    public static string Get_ZipModalTable_Data(string groupVariable, string zipVariable, string orderVariable)
    {

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP_CO_PSA, ZIP, CO, PSA, 
              WIRELESS_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, 
              TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, WIRELESS_CATEGORY, LATITUDE, LONGITUDE,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
              FROM PONDER.SALES_OPP_PSA_071320 WHERE ZIP = '" + zipVariable + @"'  
              ORDER BY " + orderVariable + @" DESC, FIBER_OPPORTUNITY DESC)TBL1";

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
    public static string Get_cma_theme_data(string groupVariable, string marketVariable)
    {
        string sql = @"SELECT CMA, CMATOTALAREA, CMATOTALPOPS, CMAPOP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT,
            FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
            FROM PONDER.SALES_OPP_CMA_071320";

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
    public static string Get_county_theme_data(string groupVariable, string marketVariable)
    {
        string sql = @"SELECT CNTY_FIPS, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, STATE_ABBR, COUNTY_STATE,
            FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
            FROM PONDER.SALES_OPP_COUNTY_071320 WHERE SALES_REGI = '" + marketVariable + @"'";

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
        //string sql = @"SELECT ZIP_CODE, ZIP_POPS FROM PONDER.MAP_PLOT_THEME";

        string sql = @"SELECT ZIP, ZIPTOTALPOPS, ZIPPOP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, STATE,
            FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
            FROM PONDER.SALES_OPP_ZIP_071320 WHERE SALES_MAR2 = '" + marketVariable + @"'";

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
    public static string Get_Zip_Store_Detail_Market(string groupVariable, string marketVariable, string zipVariable)
    {

        //groupVariable = "WHERE (ZIP_CODE LIKE '" + zipVariable + @"')";
        groupVariable = "WHERE (MARKET_GROUP LIKE '" + marketVariable + @"')";

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    " + groupVariable + @" 
                    )
                    WHERE (ROW_NUM < 3000)
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
    public static string Get_Zip_PSA_Detail_Market(string groupVariable, string marketVariable, string zipVariable)
    {

        string sql = @"SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, ZIP, SALES_MAR2, CO, PSA,
                  CASE WHEN WIRELESS_SCORE = 5 THEN 'PSA5'
                    WHEN WIRELESS_SCORE = 4 THEN 'PSA4'
                    WHEN WIRELESS_SCORE = 3 THEN 'PSA3'
                    WHEN WIRELESS_SCORE = 2 THEN 'PSA2'
                    WHEN WIRELESS_SCORE = 1 THEN 'PSA1'
                    ELSE 'PSA0' END AS PSA_SCORE,
                    TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, 
                    TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, ZIP, SALES_MAR2, CO, PSA, ROWNUM ROW_NUM, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA_071320
                    WHERE ZIP LIKE '" + zipVariable + @"')
                    WHERE (ROW_NUM < 3000)
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

    public void ExportToExcel_PSALocations(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_PSALocationValue = hf_PSALocation.Value;

        string sql = @"SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
                  FROM PONDER.SALES_OPP_FIBER_ADD_071320 
                  WHERE ZIP_CO_PSA = '" + hf_PSALocationValue + @"'";

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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=FiberLocations_Exported_Data.csv;");
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

    public void ExportToExcel_PSALocationsAllZip(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_PSALocationZipValue = hf_PSALocationZip.Value;

        string sql = @"SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
                  FROM PONDER.SALES_OPP_FIBER_ADD_071320 
                  WHERE ZIP = '" + hf_PSALocationZipValue + @"'";

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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=FiberLocations_Exported_Data.csv;");
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

    public void ExportToExcel_AllNational(object sender, EventArgs e)
    {
        string sql = @"SELECT LOCATION_ID, MASTER_DEALER_NAME, RETAILER, STORE_NUMBER, DEALER_CODE, CONTRACT_ID, ADDRESS, CITY, STATE, ZIP_CODE, REGION, MARKET_GROUP, STATUS, WIRELESS_SCORE
            LATITUDE, LONGITUDE FROM PONDER.SALES_NATIONAL_RETAIL_071420 ORDER BY WIRELESS_SCORE DESC, OVERALL_RANK";


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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=National_CMAs.csv;");
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


    public void ExportToExcel_AllCounties(object sender, EventArgs e) //access ddls from server side only instead of passing as variables
    {
        string sql = @"SELECT REPLACE(COUNTY_STATE, ',') AS COUNTY, CNTY_FIPS, SALES_MARK AS SALES_MARKET, SALES_REGI AS SALES_REGION,
                    WIRELESS_CATEGORY, FIBER_AVAILABILITY, TOTALPOPS + 0 AS TOTALPOPS, ROUND(TOTALAREA, 0) AS TOTALAREA,
                    POP_DENSITY + 0 AS POP_DENSITY, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY, FIBER_PERCENTAGE, ALL_STORE_COUNT, ATTR_STORE_COUNT, AR_STORE_COUNT
                    FROM PONDER.SALES_OPP_COUNTY_071320
                    WHERE SALES_REGI = '" + ddlMarket.SelectedItem.Value + @"' ORDER BY " + ddlSortCounty.SelectedItem.Value + @" DESC";


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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + ddlMarket.SelectedItem.Value + "_Counties.csv;");
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


    public void ExportToExcel_AllZips(object sender, EventArgs e) //access ddls from server side only instead of passing as variables
    {

        string sql = @"SELECT ZIP, STATE, SALES_MAR2 AS SALES_MARKET, SALES_REGI AS SALES_REGION,  WIRELESS_CATEGORY, FIBER_AVAILABILITY,
                    ZIPTOTALPOPS, ROUND(ZIPTOTALAREA,1) AS ZIPTOTALAREA,  ZIPPOP_DENSITY, 
                   FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY, FIBER_PERCENTAGE,  ALL_STORE_COUNT, ATTR_STORE_COUNT, AR_STORE_COUNT
                    FROM PONDER.SALES_OPP_ZIP_071320 WHERE SALES_MAR2 = '" + ddlMarket.SelectedItem.Value + @"' AND ZIPTOTALAREA > 0.2
                    ORDER BY " + ddlSortZip.SelectedItem.Value + @" DESC";


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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + ddlMarket.SelectedItem.Value + "_Zips.csv;");
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