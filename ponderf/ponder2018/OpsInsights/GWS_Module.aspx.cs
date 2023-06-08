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

public partial class OpsInsights_GWS_Module : System.Web.UI.Page
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
                //ATTUID = "no_user";
                ATTUID = "kk5880";
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
                                    UnlimitedAccess();
                                    InitSelectors();
                                }
                                else if (oraclestring1 == "SALES_OPP_LIMITED" || oraclestring1 == "SALES_OPP_LIMITED_SA")
                                {
                                    LimitAccess();
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

    public void LimitAccess()
    {
        hf_Access.Value = "Limited";
    }

    public void UnlimitedAccess()
    {
        hf_Access.Value = "Unlimited";
    }

    // FILL SELECTORS
    public void InitSelectors()
    {
        //ddlGeo.Items.Add(new ListItem("ACE", "ACE"));
        //ddlGeo.Items.Add(new ListItem("Sales VP/GM", "SALES"));

        //Sort ddls for table
        //ddlSortBy.Items.Add(new ListItem("OneScore", "ONESCORE"));
        //ddlSortBy.Items.Add(new ListItem("CLAIM", "WLT_MARKER"));
        //ddlSortBy.Items.Add(new ListItem("CMA RANK", "TOP_CMA"));
      //  ddlSortBy.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));
      //  ddlSortBy.Items.Add(new ListItem("Highest Total Stores", "ALL_STORE_COUNT"));
        //ddlSortCounty.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        //ddlSortCounty.Items.Add(new ListItem("Highest Total Pops", "TOTALPOPS"));
        //ddlSortCounty.Items.Add(new ListItem("Highest Pop Density", "POP_DENSITY"));
        //ddlSortCounty.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));
        //ddlSortCounty.Items.Add(new ListItem("Highest Total Stores", "ALL_STORE_COUNT"));
        //ddlSortCMA.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        //ddlSortCMA.Items.Add(new ListItem("Highest Total Pops", "TOTALPOPS"));
        //ddlSortCMA.Items.Add(new ListItem("Highest Pop Density", "POP_DENSITY"));
        //ddlSortCMA.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));
        //ddlSortCMA.Items.Add(new ListItem("Highest Total Stores", "ALL_STORE_COUNT"));
        //ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        //ddlSortZipModal.Items.Add(new ListItem("Wireless Score", "WIRELESS_SCORE"));
        //ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Availability", "FIBER_AVAILABLE"));
        //ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));
        //ddlSortZipModal.Items.Add(new ListItem("Lowest Fiber Pen Rate", "FIBER_PEN_SORT"));

        //ddlRegionGroupBy.Items.Add(new ListItem("CMA", "CMA"));
        //ddlRegionGroupBy.Items.Add(new ListItem("County", "COUNTY"));

        //ddlMarketGroupBy.Items.Add(new ListItem("CMA", "CMA"));
        //ddlMarketGroupBy.Items.Add(new ListItem("County", "COUNTY"));
        //ddlMarketGroupBy.Items.Add(new ListItem("Zip", "ZIP"));



        string sqlQuery = @"select MARKET_LONG, SALES_MARKET from PONDER.GWS_MARKET_MENU ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);

        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "SALES_MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list

        //labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Region/AVP/Market: &nbsp;&nbsp;";
        labelMarket.Text = "Sales Region/VPGM Market: &nbsp;&nbsp;";

        string sqlQuery2 = @"select DISTINCT CAMPAIGN FROM PONDER.GWS_ONESCORE ORDER BY CAMPAIGN DESC";
        DataTable cdt = GetOracleData("AXIOM", sqlQuery2);

        ddlCampaign.DataSource = cdt; //load the cma dropdown list from query results
        ddlCampaign.DataTextField = "CAMPAIGN"; //assign the item text from query results
        ddlCampaign.DataValueField = "CAMPAIGN"; //assign the item value from query results
        ddlCampaign.DataBind(); //bind the list

        //labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Region/AVP/Market: &nbsp;&nbsp;";
        labelCampaign.Text = "Campaign: &nbsp;&nbsp;";

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
    public static string Get_Store_Detail_Market(string marketVariable)
    {
        string groupVariable = "WHERE (MARKET_GROUP LIKE '" + marketVariable + @"')";

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
    public static string Get_Zip_Summary_Info(string marketVariable)
    {
        //kk_changing summary pull for Zips -- kkupdate for 3 buttons
        string sql = @"SELECT
              'ZIP_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN (WLT_MARKER = 'WIN') AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWNF_COUNT,              
              SUM(CASE WHEN (WLT_MARKER = 'TIE') AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWGF_COUNT,
              SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWNF_POPS        
            FROM PONDER.GWS_ONESCORE
            WHERE SALES_MARKET LIKE '" + marketVariable + @"'";
        //kk code for 5 buttons
        //string sql = @"SELECT
        //      'ZIP_SUMMARY' AS CATEGORY,
        //      SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWNF_COUNT,
        //      SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWNF_POPS,
        //      SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '20D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWGF_COUNT,
        //      SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '20D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWGF_POPS,
        //      SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '19D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWNF_COUNT,
        //      SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '19D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWNF_POPS,
        //      SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '19D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWGF_COUNT,
        //      SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '19D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWGF_POPS              
        //    FROM PONDER.GWS_ONESCORE
        //    WHERE SALES_MARKET LIKE '" + marketVariable + @"'";

        //string sql = @"SELECT
        //      'ZIP_SUMMARY' AS CATEGORY,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN 1 ELSE 0 END) AS PWNF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS PWNF_POPS,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN 1 ELSE 0 END) AS PWGF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS PWGF_POPS,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN 1 ELSE 0 END) AS GWNF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS GWNF_POPS,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN 1 ELSE 0 END) AS GWGF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS GWGF_POPS
        //    FROM PONDER.SALES_OPP_ZIP
        //    WHERE SALES_MARKET LIKE '" + marketVariable + @"'";

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
    public static string Get_ZipTable_Data(string marketVariable, string overallCatVariable, string orderVariable)
    {

        //string sql = @"SELECT * FROM (SELECT ZIP, ROUND(TOTALAREA, 1) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //                FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //                FROM PONDER.SALES_OPP_ZIP_062520 WHERE SALES_MARKET = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC) WHERE ROWNUM <= 50";

        //string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP, ROUND(TOTALAREA, 1) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
        //            FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //            FROM PONDER.SALES_OPP_ZIP_062520 WHERE SALES_MARKET = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' AND TOTALAREA > 0.2 ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP, ROUND(TOTALAREA,0) AS TOTALAREA, TO_CHAR(TOTALPOPS + 0, '999,999,999,999') AS TOTALPOPS, TO_CHAR(POP_DENSITY + 0, '999,999,999.9') AS POP_DENSITY, 
                    WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, TO_CHAR(FIBER_OPPORTUNITY, 
                    '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
                    FROM PONDER.SALES_OPP_ZIP WHERE SALES_MARKET = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' 
                    AND OVERALL_CAT != 'No Category' AND TOTALAREA > 0.2 ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

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
    public static string Get_Store_Detail_Region1(string marketVariable)
    {
        string groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"')";

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
    public static string Get_Store_Detail_Region2(string marketVariable)
    {

        string groupVariable = "WHERE (REGION LIKE '" + marketVariable + @"')";

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
    public static string Get_County_Summary_Info(string marketVariable, string marketTypeVariable)
    {
        string WhereColumnName = "SALES_REGION";
        if (marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }
        //kk_changing summary pull for Counties
        string sql = @"SELECT
              'COUNTY_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWNF_COUNT,
              SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '20D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWNF_POPS,
              SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '20D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWGF_COUNT,
              SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '20D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS PWGF_POPS,
              SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '19D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWNF_COUNT,
              SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '19D2' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWNF_POPS,
              SUM(CASE WHEN (WLT_MARKER = 'WIN' OR WLT_MARKER = 'TIE') AND CAMPAIGN = '19D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWGF_COUNT,
              SUM(CASE WHEN WLT_MARKER = 'LOSS' AND CAMPAIGN = '19D1' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS GWGF_POPS              
            FROM PONDER.GWS_ONESCORE
            WHERE (" + WhereColumnName + @" LIKE '" + marketVariable + @"')";

        //string sql = @"SELECT
        //      'COUNTY_SUMMARY' AS CATEGORY,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN 1 ELSE 0 END) AS PWNF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessNoFiber' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS PWNF_POPS,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN 1 ELSE 0 END) AS PWGF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'WeakWirelessFiberAvailable' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS PWGF_POPS,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN 1 ELSE 0 END) AS GWNF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessNoFiber' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS GWNF_POPS,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN 1 ELSE 0 END) AS GWGF_COUNT,
        //      SUM(CASE WHEN OVERALL_CAT = 'StrongWirelessFiberAvailable' THEN TO_NUMBER(TOTALPOPS) ELSE 0 END) AS GWGF_POPS
        //    FROM PONDER.SALES_OPP_COUNTY
        //     WHERE " + WhereColumnName + @" LIKE '" + marketVariable + @"' ";

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

    //IMPROVEMENT_NEEDED - CHANGE ROWNUM TOP 50 TO TOP 50 RANK
    [WebMethod]
    public static string Get_CountyTable_Data(string marketVariable, string marketTypeVariable, string overallCatVariable, string orderVariable)
    {

        string WhereColumnName = "SALES_REGION";
        if (marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }

        //string sql = @"SELECT * FROM (SELECT SMARTLABEL AS COUNTY, ROUND(TOTALAREA, 0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //            FIBER_PERCENTAGE, OVERALL_CAT, COUNTY_STATE, ROWNUM AS ROW_NUM, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
        //            FROM PONDER.SALES_OPP_COUNTY_062520 WHERE SALES_REGI = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)WHERE (ROW_NUM <= 50)";

        //string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT SMARTLABEL AS COUNTY, ROUND(TOTALAREA, 0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
        //            FIBER_PERCENTAGE, OVERALL_CAT, COUNTY_STATE, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //            FROM PONDER.SALES_OPP_COUNTY_062520 WHERE SALES_REGI = '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT SMARTLABEL AS COUNTY, ROUND(TOTALAREA,0) AS TOTALAREA, TO_CHAR(TOTALPOPS + 0, '999,999,999,999') AS TOTALPOPS, TO_CHAR(POP_DENSITY + 0, '999,999,999.9') AS POP_DENSITY, 
                    WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, COUNTY_STATE, 
                    TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
                    FROM PONDER.SALES_OPP_COUNTY 
                    WHERE " + WhereColumnName + @" LIKE '" + marketVariable + @"' AND OVERALL_CAT LIKE '" + overallCatVariable + @"' 
                    AND OVERALL_CAT != 'No Category' 
                    ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

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
    public static string Get_Store_Detail_National1()
    {


        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
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
    public static string Get_Store_Detail_National2()
    {


        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
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
    public static string Get_Store_Detail_National3()
    {

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
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
    public static string Get_CMA_Summary_Info(string marketVariable, string marketTypeVariable, string campaignVariable)
    {
        string sql = "";       
      
        if (marketTypeVariable == "NATIONAL")
        {
            sql = @"SELECT
              'CMA_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN (CHANGE = 'New Win') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NEW_WIN,
              SUM(CASE WHEN (CHANGE = 'Tie from Loss') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE_FROM_LOSS,
              SUM(CASE WHEN (CHANGE = 'No_Change') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NO_CHANGE,
              SUM(CASE WHEN (CHANGE = 'Tie from Win') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE_FROM_WIN,
              SUM(CASE WHEN (CHANGE = 'New Loss') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NEW_LOSS                  
              FROM PONDER.GWS_ONESCORE
              WHERE CAMPAIGN ='" + campaignVariable + @"'";

        }

        else if (marketTypeVariable == "REGION")
        {
            sql = @"SELECT
              'CMA_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN (CHANGE = 'New Win') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NEW_WIN,
              SUM(CASE WHEN (CHANGE = 'Tie from Loss') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE_FROM_LOSS,
              SUM(CASE WHEN (CHANGE = 'No_Change') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NO_CHANGE,
              SUM(CASE WHEN (CHANGE = 'Tie from Win') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE_FROM_WIN,
              SUM(CASE WHEN (CHANGE = 'New Loss') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NEW_LOSS                  
              FROM PONDER.GWS_ONESCORE
              WHERE SALES_REGION = '" + marketVariable + @"' AND CAMPAIGN ='" + campaignVariable + @"'";
        }

        else
        {
            sql = @"SELECT
              'CMA_SUMMARY' AS CATEGORY,
              SUM(CASE WHEN (CHANGE = 'New Win') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NEW_WIN,
              SUM(CASE WHEN (CHANGE = 'Tie from Loss') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE_FROM_LOSS,
              SUM(CASE WHEN (CHANGE = 'No_Change') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NO_CHANGE,
              SUM(CASE WHEN (CHANGE = 'Tie from Win') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE_FROM_WIN,
              SUM(CASE WHEN (CHANGE = 'New Loss') AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS NEW_LOSS                  
              FROM PONDER.GWS_ONESCORE
              WHERE SALES_MARKET = '" + marketVariable + @"' AND CAMPAIGN ='" + campaignVariable + @"'";
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
    public static string Get_CMATable_Data(string marketVariable, string marketTypeVariable, string campaignVariable, string overallCatVariable)
    {

        string WhereColumnName = "SALES_REGION";
        if (marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }

        string sql = @"SELECT CAMPAIGN, SALES_MARKET, GWS_MARKET, ONESCORE, WLT_MARKER, CMA_NAME, CMA_RANK, TOP_CMA        
        FROM PONDER.GWS_ONESCORE
        WHERE ((" + WhereColumnName + @" LIKE '" + marketVariable + @"' AND CAMPAIGN ='" + campaignVariable + @"') OR (" + WhereColumnName + @" LIKE '" + marketVariable + @"' AND CAMPAIGN ='" + campaignVariable + @"'))
        AND CARRIER LIKE '%AT&T%'
        ORDER BY TOP_CMA";


        //string sql = @"SELECT * FROM (SELECT CMA, CMA_NAME, ROUND(TOTALAREA,0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //            FIBER_PERCENTAGE, OVERALL_CAT, ROWNUM AS ROW_NUM, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
        //            FROM PONDER.SALES_OPP_CMA_062520 WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC) WHERE (ROW_NUM <= 50)";

        //string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT CMA, CMA_NAME, ROUND(TOTALAREA,0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
        //            FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //            FROM PONDER.SALES_OPP_CMA_062520 WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        //string sql = @"SELECT ROWNUM, TBL1.* FROM(SELECT CMA, CMA_NAME, ROUND(TOTALAREA,0) AS TOTALAREA, TO_CHAR(TOTALPOPS + 0, '999,999,999,999') AS TOTALPOPS, TO_CHAR(POP_DENSITY + 0, '999,999,999.9') AS POP_DENSITY, 
        //            WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, TO_CHAR(FIBER_OPPORTUNITY, 
        //            '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT FROM PONDER.SALES_OPP_CMA WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' 
        //            AND OVERALL_CAT != 'No Category' AND  (" + WhereColumnName + @"1 LIKE '" + marketVariable + @"' OR " + WhereColumnName + @"2 LIKE '" + marketVariable + @"')
        //            ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

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
    public static string Get_WLTTable_Data(string marketVariable, string marketTypeVariable, string overallCatVariable)
    {

        string WhereColumnName = "SALES_REGION";
        if (marketTypeVariable == "MARKET") { WhereColumnName = "SALES_MARKET"; }

        string sql = @"SELECT CAMPAIGN,
        SUM (CASE WHEN WLT_MARKER = 'WIN' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS WIN,
        SUM (CASE WHEN WLT_MARKER = 'TIE' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS TIE,
        SUM (CASE WHEN WLT_MARKER = 'LOSS' AND CARRIER LIKE '%AT&T%' THEN 1 ELSE 0 END) AS LOSS
        FROM PONDER.GWS_ONESCORE
        WHERE (" + WhereColumnName + @" LIKE '" + marketVariable + @"' OR " + WhereColumnName + @" LIKE '" + marketVariable + @"')
        GROUP BY (CAMPAIGN)
        ORDER BY CAMPAIGN DESC";

        //string sql = @"SELECT * FROM (SELECT CMA, CMA_NAME, ROUND(TOTALAREA,0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, 
        //            FIBER_PERCENTAGE, OVERALL_CAT, ROWNUM AS ROW_NUM, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT 
        //            FROM PONDER.SALES_OPP_CMA_062520 WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC) WHERE (ROW_NUM <= 50)";

        //string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT CMA, CMA_NAME, ROUND(TOTALAREA,0) AS TOTALAREA, TOTALPOPS + 0 AS TOTALPOPS, POP_DENSITY + 0 AS POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS,
        //            FIBER_PERCENTAGE, OVERALL_CAT, FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
        //            FROM PONDER.SALES_OPP_CMA_062520 WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' AND OVERALL_CAT != 'No Category' ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

        //string sql = @"SELECT ROWNUM, TBL1.* FROM(SELECT CMA, CMA_NAME, ROUND(TOTALAREA,0) AS TOTALAREA, TO_CHAR(TOTALPOPS + 0, '999,999,999,999') AS TOTALPOPS, TO_CHAR(POP_DENSITY + 0, '999,999,999.9') AS POP_DENSITY, 
        //            WIRELESS_SCORE, FIBER_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, TO_CHAR(FIBER_OPPORTUNITY, 
        //            '999,999,999,999') AS FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT FROM PONDER.SALES_OPP_CMA WHERE OVERALL_CAT LIKE '" + overallCatVariable + @"' 
        //            AND OVERALL_CAT != 'No Category' AND  (" + WhereColumnName + @"1 LIKE '" + marketVariable + @"' OR " + WhereColumnName + @"2 LIKE '" + marketVariable + @"')
        //            ORDER BY " + orderVariable + @" DESC)TBL1 WHERE(ROWNUM <= 50)";

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
        string orderWayVariable = "DESC";
        if (orderVariable == "FIBER_PEN_SORT") { orderWayVariable = "ASC"; }

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP_CO_PSA, ZIP, CO, PSA, 
              WIRELESS_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, 
              TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, CONCAT(TO_CHAR((FIBER_CUSTOMERS*100/FIBER_AVAILABLE),'FM99990.0'),'%') AS FIBER_PENETRATION_RATE, 
                    ROUND((FIBER_CUSTOMERS/FIBER_AVAILABLE),2) AS FIBER_PEN_SORT, WIRELESS_CATEGORY, LATITUDE, LONGITUDE,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
              FROM PONDER.SALES_OPP_PSA WHERE ZIP = '" + zipVariable + @"'  
              ORDER BY " + orderVariable + @" " + orderWayVariable + @", FIBER_OPPORTUNITY DESC)TBL1";

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
    public static string Get_CMAModalTable_Data(string CMAVariable)
    {
        //KK CHANGE FOR POPUP TABLE
        string sql = @"SELECT *
                    FROM ( SELECT CAMPAIGN, CARRIER, ONESCORE
                    FROM PONDER.GWS_ONESCORE
                    WHERE GWS_Market = '" + CMAVariable + @"')
                    d PIVOT(MAX(ROUND(ONESCORE,2)) FOR CARRIER IN ('AT' || chr(38) || 'T (VOLTE)' ATT,'VERIZON (VOLTE)' VERIZON,'T-MOBILE (VOLTE)' TMOBILE,'SPRINT (VOLTE)' SPRINT))
                    ORDER BY CAMPAIGN DESC";
        //string sql = @"SELECT ZIP_CO_PSA, ZIP, CO, PSA,
        //            TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS,
        //            TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, CONCAT(TO_CHAR((FIBER_CUSTOMERS*100/FIBER_AVAILABLE),'FM99990.0'),'%') AS FIBER_PENETRATION_RATE, WIRELESS_CATEGORY, LATITUDE, LONGITUDE,
        //            CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
        //            WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
        //            WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
        //            WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
        //            WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
        //            ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
        //            FROM PONDER.SALES_OPP_PSA
        //            WHERE CMA LIKE '" + CMAVariable + @"'
        //            AND CMA_RANK <= 25
        //            ORDER BY CMA_RANK";

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
    public static string Get_CountyModalTable_Data(string CountyVariable)
    {

        string sql = @"SELECT ZIP_CO_PSA, ZIP, CO, PSA,
                    TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS, 
                    TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, CONCAT(TO_CHAR((FIBER_CUSTOMERS*100/FIBER_AVAILABLE),'FM99990.0'),'%') AS FIBER_PENETRATION_RATE, WIRELESS_CATEGORY, LATITUDE, LONGITUDE,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                    FROM PONDER.SALES_OPP_PSA
                    WHERE COUNTY_FIPS LIKE '" + CountyVariable + @"'
                    AND COUNTY_RANK <= 25
                    ORDER BY COUNTY_RANK
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
    public static string Get_GWS_Trend(string CMAVariable)
    {
        string sql = "";

        if (CMAVariable == "NATIONAL")
        {

            sql = @"SELECT CAMPAIGN, DRIVE_STATUS, RAN_REGION, RAN_MARKET, SALES_MARKET, GWS_MARKET, CARRIER, ONESCORE, CARRIER_RANK, WLT_MARKER, LATEST_DRIVE, PREVIOUS_RESULT, CMAs, CMA_NAME, CMA_RANK
            FROM PONDER.GWS_ONESCORE
            WHERE CARRIER LIKE '%AT&T%' 
            AND CAMPAIGN = '20D2'";


            //sql = @"SELECT CMA, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT,
            //FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT, SALES_MARKET
            //FROM PONDER.SALES_OPP_CMA"; 
        }

        else if (CMAVariable == "REGION")
        {
            sql = @"SELECT CAMPAIGN, DRIVE_STATUS, RAN_REGION, RAN_MARKET, SALES_MARKET, GWS_MARKET, CARRIER, ONESCORE, CARRIER_RANK, WLT_MARKER, LATEST_DRIVE, PREVIOUS_RESULT, CMAs, CMA_NAME, CMA_RANK
            FROM PONDER.GWS_ONESCORE
            WHERE CARRIER LIKE '%AT&T%'";
            //sql = @"SELECT CMA, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT,
            //FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT, SALES_MARKET
            //FROM PONDER.SALES_OPP_CMA WHERE SALES_REGION1 = '" + marketVariable + @"' OR SALES_REGION2 = '" + marketVariable + @"' ";
        }

        else
        {
            sql = @"SELECT *
                    FROM ( SELECT CAMPAIGN, CARRIER, ONESCORE, GWS_MARKET
                    FROM PONDER.GWS_ONESCORE
                    WHERE GWS_Market = '" + CMAVariable + @"')
                    d PIVOT(MAX(ONESCORE) FOR CARRIER IN ('AT' || chr(38) || 'T (VOLTE)' ATT,'SPRINT (VOLTE)' SPRINT,'T-MOBILE (VOLTE)' TMOBILE,'VERIZON (VOLTE)' VERIZON))
                    ORDER BY CAMPAIGN";
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
    public static string Get_cma_theme_data(string marketVariable, string marketTypeVariable, string campaignVariable)
    {
        string sql = "";

        if (marketTypeVariable == "NATIONAL")
        {

            sql = @"SELECT CAMPAIGN, DRIVE_STATUS, RAN_REGION, RAN_MARKET, SALES_MARKET, GWS_MARKET, CARRIER, ONESCORE, CARRIER_RANK, WLT_MARKER, LATEST_DRIVE, PREVIOUS_RESULT, CMAs, CMA_NAME, CMA_RANK, CHANGE, LATEST_SCORE
            FROM PONDER.GWS_ONESCORE
            WHERE CARRIER LIKE '%AT&T%' 
            AND CAMPAIGN = '" + campaignVariable + @"'";


            //sql = @"SELECT CMA, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT,
            //FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT, SALES_MARKET
            //FROM PONDER.SALES_OPP_CMA"; 
        }

        else if (marketTypeVariable == "REGION")
        {
            sql = @"SELECT CAMPAIGN, DRIVE_STATUS, RAN_REGION, RAN_MARKET, SALES_MARKET, GWS_MARKET, CARRIER, ONESCORE, CARRIER_RANK, WLT_MARKER, LATEST_DRIVE, PREVIOUS_RESULT, CMAs, CMA_NAME, CMA_RANK, CHANGE, LATEST_SCORE
            FROM PONDER.GWS_ONESCORE
            WHERE CARRIER LIKE '%AT&T%' AND SALES_REGION = '" + marketVariable + @"' AND CAMPAIGN = '" + campaignVariable + @"'";
            //sql = @"SELECT CMA, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT,
            //FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT, SALES_MARKET
            //FROM PONDER.SALES_OPP_CMA WHERE SALES_REGION1 = '" + marketVariable + @"' OR SALES_REGION2 = '" + marketVariable + @"' ";
        }

        else
        {
            sql = @"SELECT CAMPAIGN, DRIVE_STATUS, RAN_REGION, RAN_MARKET, SALES_MARKET, GWS_MARKET, CARRIER, ONESCORE, CARRIER_RANK, WLT_MARKER, LATEST_DRIVE, PREVIOUS_RESULT, CMAs, CMA_NAME, CMA_RANK, CHANGE, LATEST_SCORE
            FROM PONDER.GWS_ONESCORE
            WHERE CARRIER LIKE '%AT&T%' AND SALES_MARKET = '" + marketVariable + @"' AND CAMPAIGN = '" + campaignVariable + @"'";
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


    //kk_cmamodal graph
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
    public static string Get_county_theme_data(string marketVariable, string marketTypeVariable)
    {
        string sql = "";

        if (marketTypeVariable == "REGION")
        {
            sql = @"SELECT CNTY_FIPS, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, STATE_ABBR, COUNTY_STATE,
            FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT, SALES_MARKET
            FROM PONDER.SALES_OPP_COUNTY WHERE SALES_REGION = '" + marketVariable + @"'";

        }

        else
        {
            sql = @"SELECT CNTY_FIPS, TOTALAREA, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, STATE_ABBR, COUNTY_STATE,
            FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT, SALES_MARKET
            FROM PONDER.SALES_OPP_COUNTY WHERE SALES_MARKET = '" + marketVariable + @"'";
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
    public static string Get_zip_theme_data(string marketVariable)
    {
        //string sql = @"SELECT ZIP_CODE, ZIP_POPS FROM PONDER.MAP_PLOT_THEME";

        string sql = @"SELECT ZIP, TOTALPOPS, POP_DENSITY, WIRELESS_SCORE, FIBER_SCORE, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_PERCENTAGE, OVERALL_CAT, STATE,
            FIBER_OPPORTUNITY, NUMBER_OF_PSAS, WIRELESS_CATEGORY, FIBER_AVAILABILITY, ATTR_STORE_COUNT, AR_STORE_COUNT, ALL_STORE_COUNT
            FROM PONDER.SALES_OPP_ZIP WHERE SALES_MARKET = '" + marketVariable + @"'";

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
    public static string Get_CMA_Store_Detail(string CMAVariable, string LatVariable, string LongVariable)
    {

        //groupVariable = "WHERE (ZIP_CODE LIKE '" + zipVariable + @"')";
        //var groupVariable = "WHERE (CMA LIKE '" + CMAVariable + @"')";

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    WHERE (CMA LIKE '" + CMAVariable + @"') 
                    OR (LATITUDE <= " + LatVariable + @"+1.6 AND LATITUDE >= " + LatVariable + @"-1.6
                    AND LONGITUDE <= " + LongVariable + @"+2 AND LONGITUDE >= " + LongVariable + @"-2)
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
    public static string Get_County_Store_Detail(string CountyVariable, string LatVariable, string LongVariable)
    {

        //groupVariable = "WHERE (ZIP_CODE LIKE '" + zipVariable + @"')";
        //var groupVariable = "WHERE (CMA LIKE '" + CMAVariable + @"')";

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    WHERE (COUNTY_FIP LIKE '" + CountyVariable + @"') 
                    OR (LATITUDE <= " + LatVariable + @"+1.6 AND LATITUDE >= " + LatVariable + @"-1.6
                    AND LONGITUDE <= " + LongVariable + @"+2 AND LONGITUDE >= " + LongVariable + @"-2)
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
    public static string Get_CMA_PSA_Detail_Market(string CMAVariable)

    {

        string sql = @"SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, CMA, SALES_MARKET, CO, PSA,
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
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, CMA, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
                    WHERE CMA LIKE '" + CMAVariable + @"'
                    AND FIBER_OPPORTUNITY > 10
                    ORDER BY CMA_RANK)
                    WHERE (ROWNUM <= 25)
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
    public static string Get_County_PSA_Detail_Market(string CountyVariable)
    {

        string sql = @"SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, COUNTY_FIPS, SALES_MARKET, CO, PSA,
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
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, COUNTY_FIPS, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
                    WHERE COUNTY_FIPS LIKE '" + CountyVariable + @"'
                    AND FIBER_OPPORTUNITY > 10
                    ORDER BY COUNTY_RANK)
                    WHERE (ROWNUM <= 25)
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

        string sql = @"SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, ZIP, SALES_MARKET, CO, PSA,
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
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, ZIP, SALES_MARKET, CO, PSA, ROWNUM ROW_NUM, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
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

    [WebMethod]
    public static string Get_ZIP_MDU(string ZipVariable)
    {

        string sql = @"SELECT HOUSE_NUMBER, STREET_NAME, CITY, STATE, WIRELESS_SCORE, FIBER_AVAILABLE, FIBER_OPPORTUNITY, CONCAT(TO_CHAR(FIBER_PENETRATION_RATE,'FM99990.0'),'%') AS FIBER_PENETRATION_RATE, LATITUDE, LONGITUDE,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT,
                    ZIP_RANK, MARKET_RANK
                    FROM PONDER.SALES_OPP_MDU_SUMMARY_V2
                    WHERE ZIP LIKE '" + ZipVariable + @"'
                    ORDER BY ZIP_RANK, FIBER_OPPORTUNITY DESC
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
    public static string Get_CMA_MDU(string CMAVariable)
    {
        string sql = @"SELECT HOUSE_NUMBER, STREET_NAME, CITY, STATE, WIRELESS_SCORE, FIBER_AVAILABLE, FIBER_OPPORTUNITY, CONCAT(TO_CHAR(FIBER_PENETRATION_RATE,'FM99990.0'),'%') AS FIBER_PENETRATION_RATE, LATITUDE, LONGITUDE,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT,
                    CMA_RANK, MARKET_RANK
                    FROM PONDER.SALES_OPP_MDU_SUMMARY_V2
                    WHERE CMA LIKE '" + CMAVariable + @"'
                    AND CMA_RANK <= 50
                    AND WIRELESS_SCORE > 2
                    ORDER BY CMA_RANK, WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC                    
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
    public static string Get_County_MDU(string CountyVariable)
    {

        string sql = @"SELECT HOUSE_NUMBER, STREET_NAME, CITY, STATE,   
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Weak)'
                    WHEN WIRELESS_SCORE = 1 THEN '1 (Very Weak)'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT,
                    FIBER_AVAILABLE, FIBER_OPPORTUNITY, CONCAT(TO_CHAR(FIBER_PENETRATION_RATE,'FM99990.0'),'%') AS FIBER_PENETRATION_RATE, MARKET_RANK, COUNTY_RANK, LATITUDE, LONGITUDE, WIRELESS_SCORE
                    FROM PONDER.SALES_OPP_MDU_SUMMARY_V2
                    WHERE COUNTY_FIPS LIKE '" + CountyVariable + @"' AND COUNTY_RANK <= 50
                    AND WIRELESS_SCORE > 2
                    ORDER BY COUNTY_RANK
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


    //public void ExportToExcel_PSALocations(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_PSALocationValue = hf_PSALocation.Value;

    //    string sql = @"SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
    //              FROM PONDER.SALES_OPP_FIBER_ADDR 
    //              WHERE ZIP_CO_PSA = '" + hf_PSALocationValue + @"'";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=FiberLocations_Exported_Data.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    public void ExportToExcel_PSALocations_CMA(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_PSALocationValue = hf_PSALocationCMA.Value;

        string sql = @"SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
                  FROM PONDER.SALES_OPP_FIBER_ADDR 
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

    //public void ExportToExcel_PSALocations_County(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_PSALocationValue = hf_PSALocationCounty.Value;

    //    string sql = @"SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
    //              FROM PONDER.SALES_OPP_FIBER_ADDR 
    //              WHERE ZIP_CO_PSA = '" + hf_PSALocationValue + @"'";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=FiberLocations_Exported_Data.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    //public void ExportToExcel_PSALocationsAllZip(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_ZipValue = hf_SelectedMDU_ZIP.Value;

    //    string sql = @"SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
    //              FROM PONDER.SALES_OPP_FIBER_ADDR 
    //              WHERE ZIP = '" + hf_SelectedMDU_ZipValue + @"'";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=FiberLocations_Exported_Data.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    public void ExportToExcel_PSALocationsAllCMA(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_SelectedMDU_CMAValue = hf_SelectedMDU_CMA.Value;


        string sql = @"SELECT TBL1.* FROM (SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE FROM PONDER.SALES_OPP_FIBER_ADDR)TBL1
                    INNER JOIN (SELECT ZIP_CO_PSA
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, WIRELESS_CATEGORY, ZIP, CMA, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
                    WHERE CMA = '" + hf_SelectedMDU_CMAValue + @"'
                    AND FIBER_OPPORTUNITY > 10
                    ORDER BY CMA_RANK)
                    WHERE (ROWNUM <= 25))TBL2
                    ON tbl1.zip_co_psa = tbl2.zip_co_psa
                    ORDER BY TBL1.ZIP_CO_PSA, STREET_NAME, HOUSE_NUMBER, BUILDING_NUMBER, UNIT_NUMBER";

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

    //public void ExportToExcel_PSALocationsAllCounty(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_CountyValue = hf_SelectedMDU_County.Value;


    //    string sql = @"SELECT TBL1.* FROM (SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE FROM PONDER.SALES_OPP_FIBER_ADDR)TBL1
    //                INNER JOIN (SELECT ZIP_CO_PSA
    //                FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, WIRELESS_CATEGORY, ZIP, CMA, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
    //                FROM PONDER.SALES_OPP_PSA
    //                WHERE COUNTY_FIPS = '" + hf_SelectedMDU_CountyValue + @"'
    //                AND FIBER_OPPORTUNITY > 10
    //                ORDER BY COUNTY_RANK)
    //                WHERE (ROWNUM <= 25))TBL2
    //                ON tbl1.zip_co_psa = tbl2.zip_co_psa
    //                ORDER BY TBL1.ZIP_CO_PSA, STREET_NAME, HOUSE_NUMBER, BUILDING_NUMBER, UNIT_NUMBER";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=FiberLocations_Exported_Data.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    public void ExportToExcel_TopMDUsCMA(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_SelectedMDU_CMAValue = hf_SelectedMDU_CMA.Value;


        string sql = @"SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, CMA_RANK, WIRELESS_SCORE, 
                    CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                    WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                    WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                    WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                    WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE, 
                    HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE, MARKET_RANK 
                    FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE CMA = '" + hf_SelectedMDU_CMAValue + @"'
                    AND CMA_RANK <= 50
                    ORDER BY CMA_RANK, WIRELESS_SCORE DESC
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

        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ClearHeaders();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ContentType = "application/csv";
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=High_Opportunity_MDUs.csv;");
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

    //public void ExportToExcel_TopMDUsCounty(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_CountyValue = hf_SelectedMDU_County.Value;


    //    string sql = @"SELECT SALES_MARKET AS VPGM_MARKET, COUNTY_RANK, COUNTY_FIPS, WIRELESS_SCORE, 
    //                 CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
    //                WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
    //                WHEN WIRELESS_SCORE = 3 THEN 'Strong'
    //                WHEN WIRELESS_SCORE = 2 THEN 'Weak'
    //                WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
    //                ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT,
    //                FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE, 
    //                HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE, MARKET_RANK  
    //                FROM PONDER.SALES_OPP_MDU_SUMMARY_V2
    //                WHERE COUNTY_FIPS = '" + hf_SelectedMDU_CountyValue + @"'
    //                AND COUNTY_RANK <= 50
    //                ORDER BY COUNTY_RANK, WIRELESS_SCORE DESC
    //                ";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=High_Opportunity_MDUs.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    //public void ExportToExcel_TopMDUsZIP(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_ZipValue = hf_SelectedMDU_ZIP.Value;


    //    string sql = @"SELECT SALES_MARKET AS VPGM_MARKET, ZIP_RANK, ZIP, WIRELESS_SCORE, 
    //                CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
    //                WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
    //                WHEN WIRELESS_SCORE = 3 THEN 'Strong'
    //                WHEN WIRELESS_SCORE = 2 THEN 'Weak'
    //                WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
    //                ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE, 
    //                HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE
    //                FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
    //                WHERE ZIP = '" + hf_SelectedMDU_ZipValue + @"'
    //                ORDER BY ZIP_RANK, WIRELESS_SCORE DESC
    //                ";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=High_Opportunity_MDUs.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}


    public void ExportToExcel_MDUAddressesCMA(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_SelectedMDU_CMAValue = hf_SelectedMDU_CMA.Value;

        string sql = @"SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_PSA_SCORE AS WIRELESS_SCORE, 
                  CASE WHEN WIRELESS_PSA_SCORE = 5 THEN 'Best'
                    WHEN WIRELESS_PSA_SCORE = 4 THEN 'Very Strong'
                    WHEN WIRELESS_PSA_SCORE = 3 THEN 'Strong'
                    WHEN WIRELESS_PSA_SCORE = 2 THEN 'Weak'
                    WHEN WIRELESS_PSA_SCORE = 1 THEN 'Very Weak'
                    ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT, 
                    HOUSE_NUMBER, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE, LATITUDE, LONGITUDE, MARKET_RANK, CMA_RANK
                  FROM PONDER.SALES_OPP_MDU_ADDRESSES
                  WHERE CMA = '" + hf_SelectedMDU_CMAValue + @"'
                    AND CMA_RANK <= 50";

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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=MDU_Addresses_UnitNumbers.csv;");
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

    //public void ExportToExcel_MDUAddressesCounty(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_CountyValue = hf_SelectedMDU_County.Value;
        
    //    string sql = @"SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_PSA_SCORE AS WIRELESS_SCORE, 
    //              CASE WHEN WIRELESS_PSA_SCORE = 5 THEN 'Best'
    //                WHEN WIRELESS_PSA_SCORE = 4 THEN 'Very Strong'
    //                WHEN WIRELESS_PSA_SCORE = 3 THEN 'Strong'
    //                WHEN WIRELESS_PSA_SCORE = 2 THEN 'Weak'
    //                WHEN WIRELESS_PSA_SCORE = 1 THEN 'Very Weak'
    //                ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT, 
    //                HOUSE_NUMBER, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE, LATITUDE, LONGITUDE, MARKET_RANK, CMA_RANK
    //              FROM PONDER.SALES_OPP_MDU_ADDRESSES
    //              WHERE COUNTY_FIPS = '" + hf_SelectedMDU_CountyValue + @"'
    //                AND COUNTY_RANK <= 50";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=MDU_Addresses_UnitNumbers.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    //public void ExportToExcel_MDUAddressesZIP(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_ZipValue = hf_SelectedMDU_ZIP.Value;

    //    string sql = @"SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_PSA_SCORE AS WIRELESS_SCORE, 
    //              CASE WHEN WIRELESS_PSA_SCORE = 5 THEN 'Best'
    //                WHEN WIRELESS_PSA_SCORE = 4 THEN 'Very Strong'
    //                WHEN WIRELESS_PSA_SCORE = 3 THEN 'Strong'
    //                WHEN WIRELESS_PSA_SCORE = 2 THEN 'Weak'
    //                WHEN WIRELESS_PSA_SCORE = 1 THEN 'Very Weak'
    //                ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT, 
    //                HOUSE_NUMBER, STREET_NAME, BUILDING_NUMBER, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE, LATITUDE, LONGITUDE, MARKET_RANK, CMA_RANK
    //              FROM PONDER.SALES_OPP_MDU_ADDRESSES
    //              WHERE ZIP = '" + hf_SelectedMDU_ZipValue + @"'
    //                AND ZIP_RANK <= 50";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=MDU_Addresses_UnitNumbers.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}


    public void ExportToExcel_SelectedMDUAddressesCMA(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"

        string hf_SelectedMDU_CMAValue = hf_SelectedMDU_CMA.Value;
        string hf_SelectedMDU_Street = hf_SelectedMDU_CMA_Street.Value;
        string hf_SelectedMDU_House = hf_SelectedMDU_CMA_House.Value;

        //FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
        //WHERE CMA = '" + hf_PSALocationCMAValue + @"'
        //ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.STREET_NAME, TBL1.BUILDING_NUMBER, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE CMA = '" + hf_SelectedMDU_CMAValue + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + hf_SelectedMDU_Street + @"' AND HOUSE_NUMBER = '" + hf_SelectedMDU_House + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, BUILDING_NUMBER, UNIT_NUMBER
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

        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ClearHeaders();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.ContentType = "application/csv";
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=SelectMDU_Addresses_UnitNumbers.csv;");
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

    //public void ExportToExcel_SelectedMDUAddressesCounty(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"
    //    string hf_SelectedMDU_CountyValue = hf_SelectedMDU_County.Value;
    //    //string hf_PSALocationCountyValue = hf_PSALocationCounty.Value;
    //    string hf_SelectedMDU_Street = hf_SelectedMDU_County_Street.Value;
    //    string hf_SelectedMDU_House = hf_SelectedMDU_County_House.Value;

    //    string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.STREET_NAME, TBL1.BUILDING_NUMBER, TBL1.UNIT_NUMBER, 
    //                TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
    //                FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
    //                INNER JOIN
    //                (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
    //               HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
    //               SELECT TBL1.*,
    //               CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
    //              WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
    //               WHEN WIRELESS_SCORE = 3 THEN 'Strong'
    //               WHEN WIRELESS_SCORE = 2 THEN 'Weak'
    //               WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
    //               ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
    //               FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1   
    //                WHERE COUNTY_FIPS = '" + hf_SelectedMDU_CountyValue + @"'
    //               ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
    //               ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + hf_SelectedMDU_Street + @"' AND HOUSE_NUMBER = '" + hf_SelectedMDU_House + @"' )TBL2
    //                ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
    //                ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, BUILDING_NUMBER, UNIT_NUMBER
    //                ";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=SelectMDU_Addresses_UnitNumbers.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    //public void ExportToExcel_SelectedMDUAddressesZIP(object sender, EventArgs e)
    //{
    //    //store your sql query in this string variable "sql"

    //    string hf_SelectedMDU_ZipValue = hf_SelectedMDU_ZIP.Value;
    //    //string hf_PSALocationZipValue = hf_PSALocationZip.Value;
    //    string hf_SelectedMDU_Street = hf_SelectedMDU_ZIP_Street.Value;
    //    string hf_SelectedMDU_House = hf_SelectedMDU_ZIP_House.Value;

    //    string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.STREET_NAME, TBL1.BUILDING_NUMBER, TBL1.UNIT_NUMBER, 
    //                TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
    //                FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
    //                INNER JOIN
    //                (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
    //               HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
    //               SELECT TBL1.*,
    //               CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
    //              WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
    //               WHEN WIRELESS_SCORE = 3 THEN 'Strong'
    //               WHEN WIRELESS_SCORE = 2 THEN 'Weak'
    //               WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
    //               ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
    //               FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
    //                WHERE ZIP = '" + hf_SelectedMDU_ZipValue + @"'
    //               ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
    //               ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + hf_SelectedMDU_Street + @"' AND HOUSE_NUMBER = '" + hf_SelectedMDU_House + @"' )TBL2
    //                ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
    //                ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, BUILDING_NUMBER, UNIT_NUMBER
    //                ";

    //    DataTable dt = new DataTable(); //define a new DataTable object "dt"

    //    using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //    {
    //        using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //        {
    //            using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //            {
    //                da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //            }
    //        }
    //    } // end of getting data from server

    //    HttpContext.Current.Response.ClearContent();
    //    HttpContext.Current.Response.ClearHeaders();
    //    HttpContext.Current.Response.Clear();
    //    HttpContext.Current.Response.ContentType = "application/csv";
    //    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=SelectMDU_Addresses_UnitNumbers.csv;");
    //    HttpContext.Current.Response.AddHeader("Pragma", "public");

    //    StringBuilder sb = new StringBuilder();

    //    string[] columnNames = dt.Columns.Cast<DataColumn>().
    //                                      Select(column => column.ColumnName).
    //                                      ToArray();
    //    sb.AppendLine(string.Join(",", columnNames));

    //    foreach (DataRow row in dt.Rows)
    //    {
    //        string[] fields = row.ItemArray.Select(field => field.ToString()).
    //                                        ToArray();
    //        sb.AppendLine(string.Join(",", fields));
    //    }

    //    HttpContext.Current.Response.Write(sb.ToString());

    //    HttpContext.Current.Response.Flush();
    //    HttpContext.Current.Response.End();

    //}

    public void ExportToExcel_AllCMAs(object sender, EventArgs e)
    {
        //string script = "window.onload = function() { UpdateTime(); };";
        //ClientScript.RegisterStartupScript(this.GetType(), "UpdateTime", script, true);

        //Page.ClientScript.RegisterStartupScript(
        //    GetType(),
        //    "MyKey",
        //    "UpdateTime();",
        //    true);

        //string Script = "<script language='javascript'>" + "UpdateTime();" + "</Script>";
        //Page.ClientScript.RegisterStartupScript(GetType(), "PopupScript", Script, true);

        //ScriptManager.RegisterStartupScript(GetType(), "Javascript", "javascript:UpdateTime(); ", true);

        ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:UpdateTime(); ", true);

        string sql = @"SELECT REPLACE(CMA_NAME, ',') AS CMA_NAME, CMA, WIRELESS_CATEGORY AS WIRELESS, FIBER_AVAILABILITY AS FIBER, TOTALPOPS + 0 AS TOTAL_POPS, 
                    ROUND(TOTALAREA,0) AS TOTAL_AREA, POP_DENSITY + 0 AS POP_DENSITY, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY,
                    FIBER_PERCENTAGE, ALL_STORE_COUNT AS TOTAL_STORES,  ATTR_STORE_COUNT AS ATTR_STORES, AR_STORE_COUNT AS AR_STORES  
                    FROM PONDER.SALES_OPP_CMA WHERE OVERALL_CAT != 'No Category'";


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


    //IMPROVEMENT_NEEDED - CAN NO LONGER ASSUME COUNTY EXPORTS ARE FOR A REGION, AND NOT A MARKET
    public void ExportToExcel_AllCounties(object sender, EventArgs e) //access ddls from server side only instead of passing as variables
    {
        string sql = @"SELECT REPLACE(COUNTY_STATE, ',') AS COUNTY, CNTY_FIPS, SALES_MARKET, SALES_REGION,
                    WIRELESS_CATEGORY, FIBER_AVAILABILITY, TOTALPOPS + 0 AS TOTALPOPS, ROUND(TOTALAREA, 0) AS TOTALAREA,
                    POP_DENSITY + 0 AS POP_DENSITY, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY, FIBER_PERCENTAGE, ALL_STORE_COUNT, ATTR_STORE_COUNT, AR_STORE_COUNT
                    FROM PONDER.SALES_OPP_COUNTY
                    WHERE SALES_REGION = '" + ddlMarket.SelectedItem.Value + @"' OR SALES_MARKET = '" + ddlMarket.SelectedItem.Value + @"'";


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

        string sql = @"SELECT ZIP, STATE, SALES_MARKET, SALES_REGION,  WIRELESS_CATEGORY, FIBER_AVAILABILITY,
                    TOTALPOPS, ROUND(TOTALAREA,1) AS TOTALAREA,  POP_DENSITY, 
                   FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY, FIBER_PERCENTAGE,  ALL_STORE_COUNT, ATTR_STORE_COUNT, AR_STORE_COUNT
                    FROM PONDER.SALES_OPP_ZIP WHERE SALES_MARKET = '" + ddlMarket.SelectedItem.Value + @"' AND TOTALAREA > 0.2
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


    [WebMethod]
    public static string showData_PSAAddressesCMA(string CMAVariable)
    {

        string sql = @"SELECT TBL1.*, TBL2.WIRELESS_SCORE FROM (SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE FROM PONDER.SALES_OPP_FIBER_ADDR)TBL1
                    INNER JOIN (SELECT ZIP_CO_PSA, WIRELESS_SCORE
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, WIRELESS_CATEGORY, ZIP, CMA, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
                    WHERE CMA = '" + CMAVariable + @"'
                    AND FIBER_OPPORTUNITY > 10
                    ORDER BY CMA_RANK)
                    WHERE (ROWNUM <= 25))TBL2
                    ON tbl1.zip_co_psa = tbl2.zip_co_psa
                    WHERE ROWNUM < 3001
                    ORDER BY TBL1.ZIP_CO_PSA, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER                    
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
    public static string showData_PSAAddressesCounty(string CountyVariable)
    {

        string sql = @"SELECT TBL1.*, TBL2.WIRELESS_SCORE FROM (SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE FROM PONDER.SALES_OPP_FIBER_ADDR)TBL1
                    INNER JOIN (SELECT ZIP_CO_PSA, WIRELESS_SCORE
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, WIRELESS_CATEGORY, ZIP, CMA, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
                    WHERE COUNTY_FIPS = '" + CountyVariable + @"'
                    AND FIBER_OPPORTUNITY > 10
                    ORDER BY COUNTY_RANK)
                    WHERE (ROWNUM <= 25))TBL2
                    ON tbl1.zip_co_psa = tbl2.zip_co_psa
                    WHERE ROWNUM < 3001
                    ORDER BY TBL1.ZIP_CO_PSA, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER                    
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
    public static string showData_PSAAddresses(string ZipVariable)
    {

        string sql = @"SELECT TBL1.*, TBL2.WIRELESS_SCORE FROM (SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE FROM PONDER.SALES_OPP_FIBER_ADDR)TBL1
                    INNER JOIN (SELECT ZIP_CO_PSA, WIRELESS_SCORE
                    FROM (SELECT ZIP_CO_PSA, LATITUDE, LONGITUDE, WIRELESS_SCORE, WIRELESS_CATEGORY, ZIP, CMA, SALES_MARKET, CO, PSA, FIBER_AVAILABLE, FIBER_CUSTOMERS, FIBER_OPPORTUNITY
                    FROM PONDER.SALES_OPP_PSA
                    WHERE ZIP = '" + ZipVariable + @"'
                    AND FIBER_OPPORTUNITY > 10
                    ORDER BY ZIP_RANK)
                    WHERE (ROWNUM <= 25))TBL2
                    ON tbl1.zip_co_psa = tbl2.zip_co_psa
                    WHERE ROWNUM < 3001
                    ORDER BY TBL1.ZIP_CO_PSA, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER                    
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
    public static string showData_PSAAddressesCMAFromMap(string PSAVariable)
    {

        string sql = @"SELECT TBL1.ZIP_CO_PSA, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL2.WIRELESS_SCORE FROM (
            SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
            FROM PONDER.SALES_OPP_FIBER_ADDR 
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL1
            LEFT JOIN
            (SELECT ZIP_CO_PSA, WIRELESS_SCORE
            FROM PONDER.SALES_OPP_PSA
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL2
            ON TBL1.ZIP_CO_PSA = TBL2.ZIP_CO_PSA
            ORDER BY TBL1.ZIP_CO_PSA, TBL1.STREET_NAME, TBL1.HOUSE_NUMBER, TBL1.UNIT_NUMBER
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
    public static string showData_PSAAddressesCountyFromMap(string PSAVariable)
    {

        string sql = @"SELECT TBL1.ZIP_CO_PSA, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL2.WIRELESS_SCORE FROM (
            SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
            FROM PONDER.SALES_OPP_FIBER_ADDR 
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL1
            LEFT JOIN
            (SELECT ZIP_CO_PSA, WIRELESS_SCORE
            FROM PONDER.SALES_OPP_PSA
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL2
            ON TBL1.ZIP_CO_PSA = TBL2.ZIP_CO_PSA
            ORDER BY TBL1.ZIP_CO_PSA, TBL1.STREET_NAME, TBL1.HOUSE_NUMBER, TBL1.UNIT_NUMBER
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
    public static string showData_PSAAddressesZipFromMap(string PSAVariable)
    {

        string sql = @"SELECT TBL1.ZIP_CO_PSA, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL2.WIRELESS_SCORE FROM (
            SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
            FROM PONDER.SALES_OPP_FIBER_ADDR 
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL1
            LEFT JOIN
            (SELECT ZIP_CO_PSA, WIRELESS_SCORE
            FROM PONDER.SALES_OPP_PSA
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL2
            ON TBL1.ZIP_CO_PSA = TBL2.ZIP_CO_PSA
            ORDER BY TBL1.ZIP_CO_PSA, TBL1.STREET_NAME, TBL1.HOUSE_NUMBER, TBL1.UNIT_NUMBER
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
    public static string showData_MDUAddressesCMA(string CMAVariable)
    {

        string sql = @"SELECT TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.STATE, TBL1.ZIP, TBL2.WIRELESS_SCORE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE CMA = '" + CMAVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50)TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    WHERE ROWNUM < 3001
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER
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
    public static string showData_MDUAddressesCMAFromMap(string CMAVariable, string houseVariable, string streetVariable)
    {

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE CMA = '" + CMAVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + streetVariable + @"' AND HOUSE_NUMBER = '" + houseVariable + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER
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
    public static string showData_MDUAddressesCMAFromTable(string CMAVariable, string houseVariable, string streetVariable)
    {

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                   WHERE CMA = '" + CMAVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + streetVariable + @"' AND HOUSE_NUMBER = '" + houseVariable + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY HOUSE_NUMBER, STREET_NAME, UNIT_NUMBER
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
    public static string showData_MDUAddressesCounty(string CountyVariable)
    {

        string sql = @"SELECT TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.STATE, TBL1.ZIP, TBL2.WIRELESS_SCORE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE COUNTY_FIPS = '" + CountyVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50)TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    WHERE ROWNUM < 3001
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER
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
    public static string showData_MDUAddressesZip(string ZipVariable)
    {

        string sql = @"SELECT TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.STATE, TBL1.ZIP, TBL2.WIRELESS_SCORE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE ZIP = '" + ZipVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50)TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    WHERE ROWNUM < 3001
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER
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
    public static string showData_MDUAddressesCountyFromMap(string CountyVariable, string houseVariable, string streetVariable)
    {

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE COUNTY_FIPS = '" + CountyVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + streetVariable + @"' AND HOUSE_NUMBER = '" + houseVariable + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER
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
    public static string showData_MDUAddressesZipFromMap(string ZipVariable, string houseVariable, string streetVariable)
    {

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                    WHERE ZIP = '" + ZipVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + streetVariable + @"' AND HOUSE_NUMBER = '" + houseVariable + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY WIRELESS_SCORE DESC, STREET_NAME, HOUSE_NUMBER, UNIT_NUMBER
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
    public static string showData_MDUAddressesCountyFromTable(string CountyVariable, string houseVariable, string streetVariable)
    {

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                   WHERE COUNTY_FIPS = '" + CountyVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + streetVariable + @"' AND HOUSE_NUMBER = '" + houseVariable + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY HOUSE_NUMBER, STREET_NAME, UNIT_NUMBER
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
    public static string showData_MDUAddressesZipFromTable(string ZipVariable, string houseVariable, string streetVariable)
    {

        string sql = @"SELECT TBL2.VPGM_MARKET, TBL2.CMA, TBL2.CMA_NAME, TBL2.WIRELESS_SCORE, TBL2.WIRELESS_SCORE_TEXT, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, 
                    TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL1.LATITUDE, TBL1.LONGITUDE
                    FROM(SELECT * FROM PONDER.SALES_OPP_FIBER_ADDR WHERE DWELLING_TYPE = 'M') TBL1
                    INNER JOIN
                    (SELECT SALES_MARKET AS VPGM_MARKET, CMA, CMA_NAME, WIRELESS_SCORE, WIRELESS_SCORE_TEXT, FIBER_AVAILABLE, FIBER_OPPORTUNITY, FIBER_PENETRATION_RATE,
                   HOUSE_NUMBER, STREET_NAME, CITY, STATE, ZIP, LATITUDE, LONGITUDE  FROM(
                   SELECT TBL1.*,
                   CASE WHEN WIRELESS_SCORE = 5 THEN 'Best'
                  WHEN WIRELESS_SCORE = 4 THEN 'Very Strong'
                   WHEN WIRELESS_SCORE = 3 THEN 'Strong'
                   WHEN WIRELESS_SCORE = 2 THEN 'Weak'
                   WHEN WIRELESS_SCORE = 1 THEN 'Very Weak'
                   ELSE 'Not enough Samples' END AS WIRELESS_SCORE_TEXT
                   FROM PONDER.SALES_OPP_MDU_SUMMARY_V2 TBL1
                   WHERE ZIP = '" + ZipVariable + @"'
                   ORDER BY WIRELESS_SCORE DESC, FIBER_OPPORTUNITY DESC
                   ) WHERE ROWNUM <= 50 AND STREET_NAME = '" + streetVariable + @"' AND HOUSE_NUMBER = '" + houseVariable + @"' )TBL2
                    ON TBL1.LATITUDE = TBL2.LATITUDE AND TBL1.LONGITUDE = TBL2.LONGITUDE AND TBL1.STREET_NAME = TBL2.STREET_NAME AND TBL1.HOUSE_NUMBER = TBL2.HOUSE_NUMBER
                    ORDER BY HOUSE_NUMBER, STREET_NAME, UNIT_NUMBER
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
    public static string showData_PSAAddressesCMAFromTable(string PSAVariable)
    {

        string sql = @"SELECT TBL1.ZIP_CO_PSA, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL2.WIRELESS_SCORE FROM (
            SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
            FROM PONDER.SALES_OPP_FIBER_ADDR 
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL1
            LEFT JOIN
            (SELECT ZIP_CO_PSA, WIRELESS_SCORE
            FROM PONDER.SALES_OPP_PSA
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL2
            ON TBL1.ZIP_CO_PSA = TBL2.ZIP_CO_PSA
            ORDER BY TBL1.ZIP_CO_PSA, TBL1.STREET_NAME, TBL1.HOUSE_NUMBER, TBL1.UNIT_NUMBER
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
    public static string showData_PSAAddressesCountyFromTable(string PSAVariable)
    {

        string sql = @"SELECT TBL1.ZIP_CO_PSA, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL2.WIRELESS_SCORE FROM (
            SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
            FROM PONDER.SALES_OPP_FIBER_ADDR 
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL1
            LEFT JOIN
            (SELECT ZIP_CO_PSA, WIRELESS_SCORE
            FROM PONDER.SALES_OPP_PSA
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL2
            ON TBL1.ZIP_CO_PSA = TBL2.ZIP_CO_PSA
            ORDER BY TBL1.ZIP_CO_PSA, TBL1.STREET_NAME, TBL1.HOUSE_NUMBER, TBL1.UNIT_NUMBER
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
    public static string showData_PSAAddressesFromTable(string PSAVariable)
    {

        string sql = @"SELECT TBL1.ZIP_CO_PSA, TBL1.HOUSE_NUMBER, TBL1.PREFIX, TBL1.STREET_NAME, TBL1.UNIT_NUMBER, TBL1.CITY, TBL1.ZIP, TBL1.STATE, TBL1.SERVICE_STATUS, TBL1.DWELLING_TYPE, TBL2.WIRELESS_SCORE FROM (
            SELECT ZIP_CO_PSA, HOUSE_NUMBER, PREFIX, STREET_NAME, UNIT_NUMBER, CITY, ZIP, STATE, SERVICE_STATUS, DWELLING_TYPE
            FROM PONDER.SALES_OPP_FIBER_ADDR 
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL1
            LEFT JOIN
            (SELECT ZIP_CO_PSA, WIRELESS_SCORE
            FROM PONDER.SALES_OPP_PSA
            WHERE ZIP_CO_PSA = '" + PSAVariable + @"')TBL2
            ON TBL1.ZIP_CO_PSA = TBL2.ZIP_CO_PSA
            ORDER BY TBL1.ZIP_CO_PSA, TBL1.STREET_NAME, TBL1.HOUSE_NUMBER, TBL1.UNIT_NUMBER
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