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
using ponder2018;

public partial class sales_Sales_National_Wireless_Campaign_QA_TestingV2 : System.Web.UI.Page
{
    private void RegisterModulesScriptTag()
    {

        string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + @"\sales\modules\dist");
        ltlModulesJsTag.Text = String.Format("<script type='text/javascript' src='./modules/dist/{0}'></script>", Path.GetFileName(fileEntries[0]));
        // LiteralControl javascriptRef = new LiteralControl(String.Format("<script type='text/javascript' src='./modules/dist/{0}'></script>", Path.GetFileName(fileEntries[0])));
        // Page.Header.Controls.Add(javascriptRef);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Register the webpack generated js bundle script tag in the aspx page for the scripts under the module folder
        RegisterModulesScriptTag();

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

                                if (oraclestring1 == "ADMIN" || oraclestring1 == "ACE" || oraclestring1 == "SALES_OPP_SPECIAL_ACCESS" || oraclestring1 == "SAMBAR_DIRECTS_CHAINUP" || oraclestring1 == "SALES_MANAGEMENT" || oraclestring1 == "SALES_OPP_LIMITED" || oraclestring1 == "SALES_OPP_LIMITED_SA")
                                {
                                    InitSelectors();
                                    ddlInitial_Filter(sender, e);
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

        ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY"));
        ddlSortZipModal.Items.Add(new ListItem("Wireless Score", "WIRELESS_SCORE"));
        ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Availability", "FIBER_AVAILABLE"));
        ddlSortZipModal.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS"));


        string sqlQuery = @"select MARKET_LONG, MARKET from PONDER.SALES_OPP_MARKET_MENU ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);
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
    public static string Get_Store_Detail_National1(string StateVariable, string ZipVariable)
    {
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    WHERE STATE LIKE '" + StateVariable + @"'
                    AND ZIP_CODE LIKE '" + ZipVariable + @"'
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
    public static string Get_Store_Detail_National2(string StateVariable, string ZipVariable)
    {
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    WHERE STATE LIKE '" + StateVariable + @"'
                    AND ZIP_CODE LIKE '" + ZipVariable + @"'
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
    public static string Get_Store_Detail_National3(string StateVariable, string ZipVariable)
    {
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }

        string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                  FROM (SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME, MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY, LATITUDE, LONGITUDE, REGION, MARKET_GROUP, ROWNUM ROW_NUM
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS
                    WHERE STATE LIKE '" + StateVariable + @"'
                    AND ZIP_CODE LIKE '" + ZipVariable + @"'
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
    public static string Get_ZipModalTable_Data(string groupVariable, string zipVariable, string orderVariable)
    {

        string sql = @"SELECT ROWNUM, TBL1.*FROM(SELECT ZIP_CO_PSA, ZIP, CO, PSA,
              WIRELESS_SCORE, TO_CHAR(FIBER_AVAILABLE, '999,999,999,999') AS FIBER_AVAILABLE, TO_CHAR(FIBER_CUSTOMERS, '999,999,999,999') AS FIBER_CUSTOMERS,
              TO_CHAR(FIBER_OPPORTUNITY, '999,999,999,999') AS FIBER_OPPORTUNITY, WIRELESS_CATEGORY, LATITUDE, LONGITUDE,
                    CASE WHEN WIRELESS_SCORE = 5 THEN '5 (Best)'
                    WHEN WIRELESS_SCORE = 4 THEN '4 (Very Strong)'
                    WHEN WIRELESS_SCORE = 3 THEN '3 (Strong)'
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Uneven)'
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
                    WHEN WIRELESS_SCORE = 2 THEN '2 (Uneven)'
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

    public void ExportToExcel_All_Filtered(object sender, EventArgs e)
    {
        var CoverageScoreSelected = ddlCoverageScore.SelectedItem.Value;

        var CampaignVariable = ddlCampaign.SelectedItem.Value;
        var StateVariable = ddlState.SelectedItem.Value;
        var ZipVariable = ddlZip.SelectedItem.Value;
        var CoverageScoreVariable = ddlCoverageScore.SelectedItem.Value;
        var FiveGVariable = ddl5G.SelectedItem.Value;
        var TPUT_TEXTVariable = ddlTPUT_TEXT.SelectedItem.Value;
        //var CompetitorVariable = ddlCompetitor.SelectedItem.Value;
        var CompetitorVariable = "ALL";
        var ROAMVariable = ddlROAM.SelectedItem.Value;
        var B14Variable = ddlB14.SelectedItem.Value;
        var FiberCustVariable = ddlFiberCust.SelectedItem.Value;
        var SortVariable = ddlSort_1.SelectedItem.Value;

        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT ROWNUM, TBL1.RECORDID, TBL1.CAMPAIGN_ID, TBL1.COVERAGE_SCORE, TBL1.FIVEG AS ""5G"", TBL1.FIVEG_PLUS AS ""5G+"", TBL1.TPUT_TEXT AS ""SPEED AND LOAD"", TBL1.ROAM_TEXT AS ""ROAMING"", TBL1.FIRST_NET AS ""FNET"", TBL1.BAND_14, TBL1.FIBER_CUST, TBL1.CONTACT_COMPANY_NM, TBL1.CONTACT_FIRST_NM, TBL1.CONTACT_LAST_NM,
                TBL1.CONTACT_PHONE1, TBL1.CONTACT_EMAIL, TBL1.CITY_NM, TBL1.STATE_Y, TBL1.POSTL_CD, TBL1.LATITUDE, TBL1.LONGITUDE, TBL1.LOCATION_ID
                FROM (SELECT RECORDID, CAMPAIGN_ID, COVERAGE_SCORE, FIVEG , FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, FIRST_NET, BAND_14, FIBER_CUST, CONTACT_COMPANY_NM, CONTACT_FIRST_NM, CONTACT_LAST_NM,
                CONTACT_PHONE1, CONTACT_EMAIL, CITY_NM, STATE_Y, POSTL_CD, LATITUDE, LONGITUDE, LOCATION_ID, COVERAGE_SCORE_RANK
                FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL)
                ORDER BY " + SortVariable + @" DESC, COVERAGE_SCORE_RANK ASC)TBL1 WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0";


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
        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=NationalWirelessCampaign_Filtered_ALL.csv;");
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



    protected void ddlInitial_Filter(object sender, EventArgs e)
    {
        ddlCampaign.Items.Clear();
        ddlCampaign.Items.Add(new ListItem("ALL", "%"));
        ddlCoverageScore.Items.Clear();
        ddlCoverageScore.Items.Add(new ListItem("ALL", "%"));
        ddl5G.Items.Clear();
        ddl5G.Items.Add(new ListItem("ALL", "%"));
        ddlTPUT_TEXT.Items.Clear();
        ddlTPUT_TEXT.Items.Add(new ListItem("ALL", "%"));
        //ddlCompetitor.Items.Clear();
        //ddlCompetitor.Items.Add(new ListItem("ALL", "%"));
        ddlROAM.Items.Clear();
        ddlROAM.Items.Add(new ListItem("ALL", "%"));
        ddlB14.Items.Clear();
        ddlB14.Items.Add(new ListItem("ALL", "%"));
        ddlFiberCust.Items.Clear();
        ddlFiberCust.Items.Add(new ListItem("ALL", "%"));
        ddlState.Items.Clear();
        ddlState.Items.Add(new ListItem("ALL", "%"));
        ddlZip.Items.Clear();
        ddlZip.Items.Add(new ListItem("ALL", "%"));
        ddlSort_1.Items.Clear();
        ddlSort_1.Items.Add(new ListItem("Coverage Score", "COVERAGE_SCORE"));
        ddlSort_1.Items.Add(new ListItem("5G", "FIVEG"));
        ddlSort_1.Items.Add(new ListItem("Speed/Avail Capacity", "TPUT_TEXT"));
        ddlSort_1.Items.Add(new ListItem("Roaming", "ROAM_TEXT"));
        ddlSort_1.Items.Add(new ListItem("FNET Band 14", "BAND_14"));
        ddlSort_1.Items.Add(new ListItem("Legacy Device Penetration", "FIBER_CUST"));
        ddlSort_1.Items.Add(new ListItem("Primary Competitor", "PRIMARY_COMPETITOR_NAME"));
        ddlSort_1.Items.Add(new ListItem("5G+", "FIVEG_PLUS"));
        ddlSort_1.Items.Add(new ListItem("FirstNet", "FIRST_NET"));
        ddlSort_1.Items.Add(new ListItem("Employee Count", "NUMBER_OF_EMPLOYEES"));
        ddlCampaign.AppendDataBoundItems = true;
        ddlCoverageScore.AppendDataBoundItems = true;
        ddl5G.AppendDataBoundItems = true;
        ddlTPUT_TEXT.AppendDataBoundItems = true;
        //ddlCompetitor.AppendDataBoundItems = true;
        ddlROAM.AppendDataBoundItems = true;
        ddlB14.AppendDataBoundItems = true;
        ddlFiberCust.AppendDataBoundItems = true;
        ddlState.AppendDataBoundItems = true;
        ddlZip.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        //String strQuery1 = "select distinct CAMPAIGN_ID from PONDER.SALES_CAMP_WIRELESS_V5_CID ORDER BY CAMPAIGN_ID";
        //String strQuery2 = "select distinct COVERAGE_SCORE, CASE WHEN COVERAGE_SCORE = 5 THEN '5 - Best' WHEN COVERAGE_SCORE = 4 THEN '4 - Very Strong' WHEN COVERAGE_SCORE = 3 THEN '3 - Strong' WHEN COVERAGE_SCORE = 2 THEN" +
        //    " '2 - Weak' WHEN COVERAGE_SCORE = 1 THEN '1 - Very Weak' ELSE 'n/a' END AS COVERAGE_SCORE_TEXT FROM PONDER.SALES_CAMP_WIRELESS_V5_CS ORDER BY COVERAGE_SCORE DESC";
        //String strQuery3 = "select distinct FIVEG from PONDER.SALES_CAMP_WIRELESS_V5_5G ORDER BY FIVEG";
        //String strQuery4 = "select distinct TPUT_TEXT from PONDER.SALES_CAMP_WIRELESS_V5_TPUT ORDER BY CASE WHEN TPUT_TEXT = 'ALL' THEN 1 WHEN TPUT_TEXT = 'High Speed/Very High Avail Capacity' THEN 2 WHEN TPUT_TEXT = 'Medium Speed/High Avail Capacity' THEN 3" +
        //    " WHEN TPUT_TEXT = 'Medium Speed/Medium Avail Capacity' THEN 4 WHEN TPUT_TEXT = 'Medium Speed/Low Avail Capacity' THEN 5 WHEN TPUT_TEXT = 'Low Speed/Very Low Avail Capacity' THEN 6 ELSE 7 END";
        ////String strQuery5 = "select distinct PRIMARY_COMPETITOR_NAME from PONDER.SALES_CAMP_WIRELESS_FILTER_V5 WHERE PRIMARY_COMPETITOR_NAME != 'ALL' ORDER BY PRIMARY_COMPETITOR_NAME";
        //String strQuery6 = "select distinct ROAM_TEXT from PONDER.SALES_CAMP_WIRELESS_V5_ROAM ORDER BY CASE WHEN ROAM_TEXT = 'ALL' THEN 1 WHEN ROAM_TEXT = 'No' THEN 2 WHEN ROAM_TEXT = 'Medium roaming' THEN 3" +
        //    " WHEN ROAM_TEXT = 'Heavy roaming' THEN 4 WHEN ROAM_TEXT = 'No Data' THEN 5 ELSE 6 END";
        //String strQuery7 = "select distinct FIBER_CUST from PONDER.SALES_CAMP_WIRELESS_V5_FC WHERE FIBER_CUST != 'ALL' ORDER BY CASE WHEN FIBER_CUST = 'High' then 6  WHEN FIBER_CUST = 'Medium' then 5 WHEN FIBER_CUST = 'Low' then 4 ELSE 1 END";
        String strQuery8 = "select distinct STATE from PONDER.SALES_CAMP_WIRELESS_V5_ST ORDER BY STATE";
        //String strQuery9 = "select distinct ZIP from PONDER.SALES_CAMP_WIRELESS_V5_ZIP ORDER BY ZIP";
        //String strQuery10 = "select distinct BAND_14 from PONDER.SALES_CAMP_WIRELESS_V5_B14 ORDER BY BAND_14";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            //using (OracleCommand cmd = new OracleCommand(strQuery1)) // Initiates your SQL Command
            //{
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery1;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlCampaign.DataSource = cmd.ExecuteReader();
            //        ddlCampaign.DataTextField = "CAMPAIGN_ID";
            //        ddlCampaign.DataValueField = "CAMPAIGN_ID";
            //        ddlCampaign.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            //using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            //{
            //    ddlCoverageScore.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery2;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlCoverageScore.DataSource = cmd.ExecuteReader();
            //        ddlCoverageScore.DataTextField = "COVERAGE_SCORE_TEXT";
            //        //ddlAvp.DataValueField = "ID";
            //        ddlCoverageScore.DataValueField = "COVERAGE_SCORE";
            //        ddlCoverageScore.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            //using (OracleCommand cmd = new OracleCommand(strQuery3)) // Initiates your SQL Command
            //{
            //    ddl5G.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery3;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddl5G.DataSource = cmd.ExecuteReader();
            //        ddl5G.DataTextField = "FIVEG";
            //        //ddlMarket.DataValueField = "ID";
            //        ddl5G.DataValueField = "FIVEG";
            //        ddl5G.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            //using (OracleCommand cmd = new OracleCommand(strQuery4)) // Initiates your SQL Command
            //{
            //    ddlTPUT_TEXT.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery4;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlTPUT_TEXT.DataSource = cmd.ExecuteReader();
            //        ddlTPUT_TEXT.DataTextField = "TPUT_TEXT";
            //        //ddlSubmarket.DataValueField = "ID";
            //        ddlTPUT_TEXT.DataValueField = "TPUT_TEXT";
            //        ddlTPUT_TEXT.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            ////using (OracleCommand cmd = new OracleCommand(strQuery5)) // Initiates your SQL Command
            ////{
            ////    cmd.CommandType = CommandType.Text;
            ////    cmd.CommandText = strQuery5;
            ////    cmd.Connection = con;
            ////    try
            ////    {
            ////        con.Open();
            ////        ddlCompetitor.DataSource = cmd.ExecuteReader();
            ////        ddlCompetitor.DataTextField = "PRIMARY_COMPETITOR_NAME";
            ////        ddlCompetitor.DataValueField = "PRIMARY_COMPETITOR_NAME";
            ////        ddlCompetitor.DataBind();
            ////    }
            ////    catch (Exception ex)
            ////    {
            ////        throw ex;
            ////    }
            ////    finally
            ////    {
            ////        con.Close();
            ////        //con.Dispose();
            ////    }
            ////}
            //using (OracleCommand cmd = new OracleCommand(strQuery6)) // Initiates your SQL Command
            //{
            //    ddlROAM.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery6;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlROAM.DataSource = cmd.ExecuteReader();
            //        ddlROAM.DataTextField = "ROAM_TEXT";
            //        ddlROAM.DataValueField = "ROAM_TEXT";
            //        ddlROAM.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            //using (OracleCommand cmd = new OracleCommand(strQuery7)) // Initiates your SQL Command
            //{
            //    ddlFiberCust.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery7;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlFiberCust.DataSource = cmd.ExecuteReader();
            //        ddlFiberCust.DataTextField = "FIBER_CUST";
            //        ddlFiberCust.DataValueField = "FIBER_CUST";
            //        ddlFiberCust.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            using (OracleCommand cmd = new OracleCommand(strQuery8)) // Initiates your SQL Command
            {
                ddlState.Enabled = true;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery8;
                cmd.Connection = con;

                ddlZip.Enabled = false;
                ddlCampaign.Enabled = false;
                ddlB14.Enabled = false;
                ddlFiberCust.Enabled = false;
                ddlROAM.Enabled = false;
                ddlTPUT_TEXT.Enabled = false;
                ddl5G.Enabled = false;
                ddlCoverageScore.Enabled = false;

                try
                {
                    con.Open();
                    ddlState.DataSource = cmd.ExecuteReader();
                    ddlState.DataTextField = "STATE";
                    ddlState.DataValueField = "STATE";
                    ddlState.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    //con.Dispose();
                }
            }
            //using (OracleCommand cmd = new OracleCommand(strQuery9)) // Initiates your SQL Command
            //{
            //    ddlZip.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery9;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlZip.DataSource = cmd.ExecuteReader();
            //        ddlZip.DataTextField = "ZIP";
            //        ddlZip.DataValueField = "ZIP";
            //        ddlZip.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}
            //using (OracleCommand cmd = new OracleCommand(strQuery10)) // Initiates your SQL Command
            //{
            //    ddlB14.Enabled = true;
            //    cmd.CommandType = CommandType.Text;
            //    cmd.CommandText = strQuery10;
            //    cmd.Connection = con;
            //    try
            //    {
            //        con.Open();
            //        ddlB14.DataSource = cmd.ExecuteReader();
            //        ddlB14.DataTextField = "BAND_14";
            //        ddlB14.DataValueField = "BAND_14";
            //        ddlB14.DataBind();
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    finally
            //    {
            //        con.Close();
            //        //con.Dispose();
            //    }
            //}

        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlInitial_Filter(sender, e);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //InitSelectors();
        //ddlAging_Initial(sender, e); //clear out the aging drop downs

        //if (ddlBYOC.SelectedItem.Text == "ALL")
        //{
        //    ddlProgram_Get_Dropdown(sender, e);
        //    ddlProdCharts_GetDD(sender, e);
        //    //ddlProgramProdChart_v2_getDD(sender, e);
        //    //ddlMSProdChart_v2_InitialDD(sender, e);
        //    //ddlProductionView_v2_InitialDD(sender, e);
        //    ddlMSForecastChanges_GetDD(sender, e);
        //    ddlMSForecastChangesClear(sender, e);
        //    ddlMSForecastChoiceClear(sender, e);
        //    ddlAging_Program_Get_Dropdown(sender, e); //first Aging Audit ddl which triggers other Aging audit ddls
        //    ddlRecent_MS_Dropdown(sender, e); // ddl for MILESTONES for recent and upcoming tab
        //}
        //else
        //{
        //    ddlProgram_Get_DropdownBYOC(sender, e);
        //    ddlProdCharts_GetDDBYOC(sender, e);
        //    //ddlProgramProdChart_v2_getDDBYOC(sender, e);
        //    //ddlMSProdChart_v2_InitialDD(sender, e);
        //    //ddlProductionView_v2_InitialDD(sender, e);
        //    ddlMSForecastChanges_GetDD(sender, e);
        //    ddlMSForecastChangesClear(sender, e);
        //    ddlMSForecastChoiceClear(sender, e);
        //    ddlAging_Program_Get_DropdownBYOC(sender, e);
        //    ddlRecent_MS_Dropdown(sender, e); // ddl for MILESTONES for recent and upcoming tab
        //}

        //lblResults.Text = "Selection Of: " +
        //                  ddlYear.SelectedItem.Text + " -----> " +
        //                  ddlAvp.SelectedItem.Text + " -----> " +
        //                  ddlMarket.SelectedItem.Text + " -----> " +
        //                  ddlSubmarket.SelectedItem.Text + " -----> " +
        //                  ddlProgram.SelectedItem.Text + " -----> " +
        //                  ddlSubprogram.SelectedItem.Text + " -----> " +
        //                  ddlCivilVendor.SelectedItem.Text + " -----> " +
        //                  ddlSiteAcqVendor.SelectedItem.Text + " -----> " +
        //                  ddlRAN_Initiative.SelectedItem.Text + " -----> " +
        //                  ddlBYOC.SelectedItem.Text;
    }

    protected void ddlCampaign_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);

        //{
        //    if (ddlState.SelectedItem.Value == "ALL" || ddlCampaign.SelectedItem.Value == "ALL")
        //        SubmitButton.Enabled = false;
        //    else if (ddlState.SelectedItem.Value == "%" || ddlCampaign.SelectedItem.Value == "%")
        //        SubmitButton.Enabled = false;
        //    else
        //        SubmitButton.Enabled = true;
        //}

    }

    protected void ddlCoverageScore_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddl5G_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddlTPUT_TEXT_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddlCompetitor_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddlROAM_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        ddlB14_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddlB14_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddlFiberCust_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlState_Filter(sender, e);
        ddlZip_Filter(sender, e);
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (ddlState.SelectedItem.Value == "ALL")
        {
            ddlInitial_Filter(sender, e);
        }
        else if (ddlState.SelectedItem.Value == "%")
        {
            ddlInitial_Filter(sender, e);
        }
        else
        {
            ddlCoverageScore_Filter(sender, e);
            ddlCampaign_Filter(sender, e);
            ddl5G_Filter(sender, e);
            ddlTPUT_TEXT_Filter(sender, e);
            //ddlCompetitor_Filter(sender, e);
            ddlROAM_Filter(sender, e);
            ddlB14_Filter(sender, e);
            ddlFiberCust_Filter(sender, e);
            ddlZip_Filter(sender, e);
        }

        {
            if (ddlState.SelectedItem.Value == "ALL")
            {
                SubmitButton.Enabled = false;
                ddlZip.Enabled = false;
                ddlCampaign.Enabled = false;
                ddlCoverageScore.Enabled = false;
                ddl5G.Enabled = false;
                ddlTPUT_TEXT.Enabled = false;
                ddlROAM.Enabled = false;
                ddlB14.Enabled = false;
                ddlFiberCust.Enabled = false;

            }
            else if (ddlState.SelectedItem.Value == "%")
            {
                SubmitButton.Enabled = false;
                ddlZip.Enabled = false;
                ddlCampaign.Enabled = false;
                ddlCoverageScore.Enabled = false;
                ddl5G.Enabled = false;
                ddlTPUT_TEXT.Enabled = false;
                ddlROAM.Enabled = false;
                ddlB14.Enabled = false;
                ddlFiberCust.Enabled = false;
            }
            else
            {
                SubmitButton.Enabled = true;
                ddlZip.Enabled = true;
                ddlCampaign.Enabled = true;
                ddlCoverageScore.Enabled = true;
                ddl5G.Enabled = true;
                ddlTPUT_TEXT.Enabled = true;
                ddlROAM.Enabled = true;
                ddlB14.Enabled = true;
                ddlFiberCust.Enabled = true;
            }
        }

        //{
        //    if (ddlState.SelectedItem.Value == "ALL" || ddlCampaign.SelectedItem.Value == "ALL")
        //        SubmitButton.Enabled = false;
        //    else if (ddlState.SelectedItem.Value == "%" || ddlCampaign.SelectedItem.Value == "%")
        //        SubmitButton.Enabled = false;
        //    else
        //        SubmitButton.Enabled = true;
        //}
    }

        protected void ddlZip_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlCoverageScore_Filter(sender, e);
        ddlCampaign_Filter(sender, e);
        ddl5G_Filter(sender, e);
        ddlTPUT_TEXT_Filter(sender, e);
        //ddlCompetitor_Filter(sender, e);
        ddlROAM_Filter(sender, e);
        ddlB14_Filter(sender, e);
        ddlFiberCust_Filter(sender, e);
        ddlState_Filter(sender, e);
    }

    //protected void ddlCampaign_Filter(object sender, EventArgs e)
    //{
    //    var CampaignSelected = ddlCampaign.SelectedItem.Value;
    //    ddlCampaign.Items.Clear();
    //    ddlCampaign.Items.Add(new ListItem("ALL", "ALL"));
    //    ddlCampaign.AppendDataBoundItems = true;

    //    String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
    //    String strQuery1 = "select distinct CAMPAIGN_ID from PONDER.SALES_CAMP_WIRELESS_FILTER_V5 WHERE CAMPAIGN_ID != 'ALL' AND COVERAGE_SCORE >=:COVERAGE_SCORE AND FIVEG=:FIVEG" +
    //        " AND TPUT_TEXT=:TPUT_TEXT AND ROAM_TEXT=:ROAM AND BAND_14=:B14" +
    //        " AND FIBER_CUST=:FIBER_CUST AND STATE=:STATE AND ZIP=:ZIP ORDER BY CAMPAIGN_ID";

    //    using (OracleConnection con = new OracleConnection(strConnString))
    //    {
    //        using (OracleCommand cmd = new OracleCommand(strQuery1)) // Initiates your SQL Command
    //        {
    //            cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
    //            cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
    //            cmd.CommandType = CommandType.Text;
    //            cmd.CommandText = strQuery1;
    //            cmd.Connection = con;
    //            try
    //            {
    //                con.Open();
    //                ddlCampaign.DataSource = cmd.ExecuteReader();
    //                ddlCampaign.DataTextField = "CAMPAIGN_ID";
    //                ddlCampaign.DataValueField = "CAMPAIGN_ID";
    //                ddlCampaign.DataBind();

    //                ListItem iteminlist = new ListItem(CampaignSelected);

    //                if (ddlCampaign.Items.Contains(iteminlist))
    //                {
    //                    ddlCampaign.Items.FindByText(CampaignSelected).Selected = true;
    //                }
    //                else
    //                {
    //                    //ddlCampaign.Items.FindByText("ALL").Selected = true;
    //                    if (ddlCoverageScore.SelectedItem.Value == "ALL")
    //                    {
    //                        ddlCoverageScore_Filter(sender, e);
    //                    }
    //                    if (ddl5G.SelectedItem.Text == "ALL")
    //                    {
    //                        ddl5G_Filter(sender, e);
    //                    }
    //                    if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlTPUT_TEXT_Filter(sender, e);
    //                    }
    //                    //if (ddlCompetitor.SelectedItem.Text == "ALL")
    //                    //{
    //                    //    ddlCompetitor_Filter(sender, e);
    //                    //}
    //                    if (ddlROAM.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlROAM_Filter(sender, e);
    //                    }
    //                    if (ddlB14.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlB14_Filter(sender, e);
    //                    }
    //                    if (ddlFiberCust.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlFiberCust_Filter(sender, e);
    //                    }
    //                    if (ddlState.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlState_Filter(sender, e);
    //                    }
    //                    if (ddlZip.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlZip_Filter(sender, e);
    //                    }
    //                }

    //                if (ddlCampaign.Items.Count > 1)
    //                {
    //                    ddlCampaign.Enabled = true;
    //                }
    //                else
    //                {
    //                    ddlCampaign.Enabled = false;
    //                }
    //            }
    //            catch (Exception ex)
    //            {
    //                throw ex;
    //            }
    //            finally
    //            {
    //                con.Close();
    //                con.Dispose();
    //            }
    //        }
    //    }
    //}

    protected void ddlCampaign_Filter(object sender, EventArgs e)
    {
        var CampaignSelected = ddlCampaign.SelectedItem.Text;
        var CampaignSelectedValue = ddlCampaign.SelectedItem.Value;

        ddlCampaign.Items.Clear();
        ddlCampaign.Items.Add(new ListItem("ALL", "ALL"));
        ddlCampaign.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery1 = "select distinct CAMPAIGN_ID," +
            " CASE WHEN CAMPAIGN_ID = '1-29918786310' THEN '3T20 Acquire Mobility White Space'" +
            " WHEN CAMPAIGN_ID = '1-29985573337' THEN '3T20 Acquire Mobility Port Outs'" +
            " WHEN CAMPAIGN_ID = '1-28585961300' THEN 'Acquire Mobility Whitespace'" +
            " WHEN CAMPAIGN_ID = '1-31465898167' THEN '1T21 Grow Mobility Top ARPU'" +
            " WHEN CAMPAIGN_ID = '1-31465898230' THEN '1T21 Grow Mobility Top TBR'" +
            " WHEN CAMPAIGN_ID = '1-31465898283' THEN '1T21 Grow Mobility Top Integrated subs'" +
            " WHEN CAMPAIGN_ID = '1-31465898296' THEN '1T21 Grow Mobility Top Data subs'" +
            " WHEN CAMPAIGN_ID = '1-31465898369' THEN '1T21 Grow Mobility Top Voice subs'" +
            " WHEN CAMPAIGN_ID = '1-31465898442' THEN '1T21 Grow Mobility Top Potential CRU'" +
            " WHEN CAMPAIGN_ID = '1-31609052529' THEN '1T21 Grow Mobility 3G Shutdown'" +
            " WHEN CAMPAIGN_ID = '1-31465898141' THEN '1T21 Acquire Mobility existing Wireline'" +
            " WHEN CAMPAIGN_ID = '1-31465898154' THEN '1T21 Acquire Mobility Port Outs'" +
            " WHEN CAMPAIGN_ID = '1-31465898068' THEN '1T21 Acquire Mobility New Logo'" +
            " WHEN CAMPAIGN_ID = '1-31465898088' THEN '1T21 Grow Mobility Post COVID' END AS CAMPAIGN_ID_TEXT" +
            " from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE CAMPAIGN_ID != 'ALL'" +
            " AND COVERAGE_SCORE >= :COVERAGE_SCORE" +
            " AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14" +
            " AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y LIKE :STATE AND ZIPCODE LIKE :ZIP ORDER BY CAMPAIGN_ID";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery1)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery1;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlCampaign.DataSource = cmd.ExecuteReader();
                    ddlCampaign.DataTextField = "CAMPAIGN_ID_TEXT";
                    ddlCampaign.DataValueField = "CAMPAIGN_ID";
                    ddlCampaign.DataBind();

                    ListItem iteminlist = new ListItem(CampaignSelected, CampaignSelectedValue);

                    if (ddlCampaign.Items.Contains(iteminlist))
                    {
                        ddlCampaign.Items.FindByText(CampaignSelected).Selected = true;
                    }
                    else
                    {
                        //ddlCampaign.Items.FindByText("ALL").Selected = true;
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlCampaign.Items.Count > 1)
                    {
                        ddlCampaign.Enabled = true;
                    }
                    else
                    {
                        ddlCampaign.Enabled = false;
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

    protected void ddlCoverageScore_Filter(object sender, EventArgs e)
    {
        var CoverageScoreSelected = ddlCoverageScore.SelectedItem.Text;
        var CoverageScoreSelectedValue = ddlCoverageScore.SelectedItem.Value;

        ddlCoverageScore.Items.Clear();
        ddlCoverageScore.Items.Add(new ListItem("ALL", "ALL"));
        ddlCoverageScore.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery2 = "select distinct COVERAGE_SCORE, CASE WHEN COVERAGE_SCORE = 5 THEN '5 - Best' WHEN COVERAGE_SCORE = 4 THEN '4 - Very Strong' WHEN COVERAGE_SCORE = 3 THEN '3 - Strong'" +
            " WHEN COVERAGE_SCORE = 2 THEN '2 - Uneven' WHEN COVERAGE_SCORE = 1 THEN '1 - Very Weak' ELSE 'n/a' END AS COVERAGE_SCORE_TEXT" +
            " from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE CAMPAIGN_ID LIKE :CAMPAIGN_ID AND COVERAGE_SCORE != 'ALL' AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14" +
            " AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y LIKE :STATE AND ZIPCODE LIKE :ZIP ORDER BY COVERAGE_SCORE DESC";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery2;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlCoverageScore.DataSource = cmd.ExecuteReader();
                    ddlCoverageScore.DataTextField = "COVERAGE_SCORE_TEXT";
                    ddlCoverageScore.DataValueField = "COVERAGE_SCORE";
                    ddlCoverageScore.DataBind();

                    ListItem iteminlist = new ListItem(CoverageScoreSelected, CoverageScoreSelectedValue);

                    if (ddlCoverageScore.Items.Contains(iteminlist))
                    {
                        ddlCoverageScore.Items.FindByText(CoverageScoreSelected).Selected = true;
                    }
                    else
                    {
                        ddlCoverageScore.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlCoverageScore.Items.Count > 1)
                    {
                        ddlCoverageScore.Enabled = true;
                    }
                    else
                    {
                        ddlCoverageScore.Enabled = false;
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

    protected void ddl5G_Filter(object sender, EventArgs e)
    {

        var FiveGSelected = ddl5G.SelectedItem.Value;
        ddl5G.Items.Clear();
        ddl5G.Items.Add(new ListItem("ALL", "ALL"));
        ddl5G.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery2 = "select distinct FIVEG from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE CAMPAIGN_ID LIKE :CAMPAIGN_ID AND COVERAGE_SCORE >= :COVERAGE_SCORE AND FIVEG != 'ALL'" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14" +
            " AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y LIKE :STATE AND ZIPCODE LIKE :ZIP ORDER BY FIVEG";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery2;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddl5G.DataSource = cmd.ExecuteReader();
                    ddl5G.DataTextField = "FIVEG";
                    ddl5G.DataValueField = "FIVEG";
                    ddl5G.DataBind();

                    ListItem iteminlist = new ListItem(FiveGSelected);

                    if (ddl5G.Items.Contains(iteminlist))
                    {
                        ddl5G.Items.FindByText(FiveGSelected).Selected = true;
                    }
                    else
                    {
                        ddl5G.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddl5G.Items.Count > 1)
                    {
                        ddl5G.Enabled = true;
                    }
                    else
                    {
                        ddl5G.Enabled = false;
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

    protected void ddlTPUT_TEXT_Filter(object sender, EventArgs e)
    {
        var TPUT_TEXTSelected = ddlTPUT_TEXT.SelectedItem.Value;
        ddlTPUT_TEXT.Items.Clear();
        ddlTPUT_TEXT.Items.Add(new ListItem("ALL", "ALL"));
        ddlTPUT_TEXT.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery3 = "select distinct TPUT_TEXT from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE CAMPAIGN_ID LIKE :CAMPAIGN_ID AND COVERAGE_SCORE >= :COVERAGE_SCORE AND FIVEG LIKE :FIVEG" +
            " AND TPUT_TEXT != 'ALL' " +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14" +
            " AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y LIKE :STATE AND ZIPCODE LIKE :ZIP ORDER BY CASE WHEN TPUT_TEXT = 'ALL' THEN 1 WHEN TPUT_TEXT = 'High Speed/Very High Avail Capacity' THEN 2 WHEN TPUT_TEXT = 'Medium Speed/High Avail Capacity' THEN 3" +
            " WHEN TPUT_TEXT = 'Medium Speed/Medium Avail Capacity' THEN 4 WHEN TPUT_TEXT = 'Medium Speed/Low Avail Capacity' THEN 5 WHEN TPUT_TEXT = 'Low Speed/Very Low Avail Capacity' THEN 6 ELSE 7 END";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery3)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery3;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlTPUT_TEXT.DataSource = cmd.ExecuteReader();
                    ddlTPUT_TEXT.DataTextField = "TPUT_TEXT";
                    ddlTPUT_TEXT.DataValueField = "TPUT_TEXT";
                    ddlTPUT_TEXT.DataBind();

                    ListItem iteminlist = new ListItem(TPUT_TEXTSelected);

                    if (ddlTPUT_TEXT.Items.Contains(iteminlist))
                    {
                        ddlTPUT_TEXT.Items.FindByText(TPUT_TEXTSelected).Selected = true;
                    }
                    else
                    {
                        ddlTPUT_TEXT.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlTPUT_TEXT.Items.Count > 1)
                    {
                        ddlTPUT_TEXT.Enabled = true;
                    }
                    else
                    {
                        ddlTPUT_TEXT.Enabled = false;
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

    //protected void ddlCompetitor_Filter(object sender, EventArgs e)
    //{
    //    var CompetitorSelected = ddlCompetitor.SelectedItem.Value;
    //    ddlCompetitor.Items.Clear();
    //    ddlCompetitor.Items.Add(new ListItem("ALL", "ALL"));
    //    ddlCompetitor.AppendDataBoundItems = true;

    //    String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
    //    String strQuery4 = "select distinct PRIMARY_COMPETITOR_NAME from PONDER.SALES_CAMP_WIRELESS_FILTER_V5 WHERE COVERAGE_SCORE=:COVERAGE_SCORE AND FIVEG=:FIVEG AND TPUT_TEXT=:TPUT_TEXT" +
    //        " AND PRIMARY_COMPETITOR_NAME != 'ALL' AND ROAM_TEXT=:ROAM AND BAND_14=:B14 AND CAMPAIGN_ID=:CAMPAIGN_ID AND FIBER_CUST=:FIBER_CUST AND STATE=:STATE" +
    //        " AND ZIP=:ZIP ORDER BY PRIMARY_COMPETITOR_NAME";

    //    using (OracleConnection con = new OracleConnection(strConnString))
    //    {
    //        using (OracleCommand cmd = new OracleCommand(strQuery4)) // Initiates your SQL Command
    //        {
    //            cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
    //            cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
    //            cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
    //            cmd.CommandType = CommandType.Text;
    //            cmd.CommandText = strQuery4;
    //            cmd.Connection = con;
    //            try
    //            {
    //                con.Open();
    //                ddlCompetitor.DataSource = cmd.ExecuteReader();
    //                ddlCompetitor.DataTextField = "PRIMARY_COMPETITOR_NAME";
    //                ddlCompetitor.DataValueField = "PRIMARY_COMPETITOR_NAME";
    //                ddlCompetitor.DataBind();

    //                ListItem iteminlist = new ListItem(CompetitorSelected);

    //                if (ddlCompetitor.Items.Contains(iteminlist))
    //                {
    //                    ddlCompetitor.Items.FindByText(CompetitorSelected).Selected = true;
    //                }
    //                else
    //                {
    //                    ddlCompetitor.Items.FindByText("ALL").Selected = true;
    //                    if (ddlCampaign.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlCampaign_Filter(sender, e);
    //                    }
    //                    if (ddlCoverageScore.SelectedItem.Value == "ALL")
    //                    {
    //                        ddlCoverageScore_Filter(sender, e);
    //                    }
    //                    if (ddl5G.SelectedItem.Text == "ALL")
    //                    {
    //                        ddl5G_Filter(sender, e);
    //                    }
    //                    if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlTPUT_TEXT_Filter(sender, e);
    //                    }
    //                    if (ddlROAM.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlROAM_Filter(sender, e);
    //                    }
    //                    if (ddlB14.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlB14_Filter(sender, e);
    //                    }
    //                    if (ddlFiberCust.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlFiberCust_Filter(sender, e);
    //                    }
    //                    if (ddlState.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlState_Filter(sender, e);
    //                    }
    //                    if (ddlZip.SelectedItem.Text == "ALL")
    //                    {
    //                        ddlZip_Filter(sender, e);
    //                    }
    //                }

    //                if (ddlCompetitor.Items.Count > 1)
    //                {
    //                    ddlCompetitor.Enabled = true;
    //                }
    //                else
    //                {
    //                    ddlCompetitor.Enabled = false;
    //                }
    //            }
    //            catch (Exception ex)
    //            {
    //                throw ex;
    //            }
    //            finally
    //            {
    //                con.Close();
    //                con.Dispose();
    //            }
    //        }
    //    }
    //}

    protected void ddlROAM_Filter(object sender, EventArgs e)
    {
        var ROAMSelected = ddlROAM.SelectedItem.Value;
        ddlROAM.Items.Clear();
        ddlROAM.Items.Add(new ListItem("ALL", "ALL"));
        ddlROAM.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery5 = "select distinct ROAM_TEXT from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE COVERAGE_SCORE >=:COVERAGE_SCORE AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT != 'ALL' AND BAND_14 LIKE :B14 AND CAMPAIGN_ID LIKE :CAMPAIGN_ID AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y LIKE :STATE" +
            " AND ZIPCODE LIKE :ZIP ORDER BY CASE WHEN ROAM_TEXT = 'ALL' THEN 1 WHEN ROAM_TEXT = 'No' THEN 2 WHEN ROAM_TEXT = 'Medium roaming' THEN 3" +
            " WHEN ROAM_TEXT = 'Heavy roaming' THEN 4 WHEN ROAM_TEXT = 'No Data' THEN 5 ELSE 6 END";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery5)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery5;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlROAM.DataSource = cmd.ExecuteReader();
                    ddlROAM.DataTextField = "ROAM_TEXT";
                    ddlROAM.DataValueField = "ROAM_TEXT";
                    ddlROAM.DataBind();

                    ListItem iteminlist = new ListItem(ROAMSelected);

                    if (ddlROAM.Items.Contains(iteminlist))
                    {
                        ddlROAM.Items.FindByText(ROAMSelected).Selected = true;
                    }
                    else
                    {
                        ddlROAM.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlROAM.Items.Count > 1)
                    {
                        ddlROAM.Enabled = true;
                    }
                    else
                    {
                        ddlROAM.Enabled = false;
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

    protected void ddlB14_Filter(object sender, EventArgs e)
    {
        var B14Selected = ddlB14.SelectedItem.Value;
        ddlB14.Items.Clear();
        ddlB14.Items.Add(new ListItem("ALL", "ALL"));
        ddlB14.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery5 = "select distinct BAND_14 from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE COVERAGE_SCORE >=:COVERAGE_SCORE AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND BAND_14 != 'ALL' AND ROAM_TEXT LIKE :ROAM AND CAMPAIGN_ID LIKE :CAMPAIGN_ID AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y LIKE :STATE" +
            " AND ZIPCODE LIKE :ZIP ORDER BY BAND_14";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery5)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery5;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlB14.DataSource = cmd.ExecuteReader();
                    ddlB14.DataTextField = "BAND_14";
                    ddlB14.DataValueField = "BAND_14";
                    ddlB14.DataBind();

                    ListItem iteminlist = new ListItem(B14Selected);

                    if (ddlB14.Items.Contains(iteminlist))
                    {
                        ddlB14.Items.FindByText(B14Selected).Selected = true;
                    }
                    else
                    {
                        ddlB14.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlB14.Items.Count > 1)
                    {
                        ddlB14.Enabled = true;
                    }
                    else
                    {
                        ddlB14.Enabled = false;
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

    protected void ddlFiberCust_Filter(object sender, EventArgs e)
    {
        var FiberCustSelected = ddlFiberCust.SelectedItem.Value;
        ddlFiberCust.Items.Clear();
        ddlFiberCust.Items.Add(new ListItem("ALL", "ALL"));
        ddlFiberCust.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery7 = "select distinct FIBER_CUST from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE COVERAGE_SCORE >=:COVERAGE_SCORE AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14 AND CAMPAIGN_ID LIKE :CAMPAIGN_ID AND FIBER_CUST != 'ALL' AND STATE_Y LIKE :STATE" +
            " AND ZIPCODE LIKE :ZIP ORDER BY CASE WHEN FIBER_CUST = 'High' then 6  WHEN FIBER_CUST = 'Medium' then 5 WHEN FIBER_CUST = 'Low' then 4 ELSE 1 END";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery7)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery7;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlFiberCust.DataSource = cmd.ExecuteReader();
                    ddlFiberCust.DataTextField = "FIBER_CUST";
                    ddlFiberCust.DataValueField = "FIBER_CUST";
                    ddlFiberCust.DataBind();

                    ListItem iteminlist = new ListItem(FiberCustSelected);

                    if (ddlFiberCust.Items.Contains(iteminlist))
                    {
                        ddlFiberCust.Items.FindByText(FiberCustSelected).Selected = true;
                    }
                    else
                    {
                        ddlFiberCust.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlFiberCust.Items.Count > 1)
                    {
                        ddlFiberCust.Enabled = true;
                    }
                    else
                    {
                        ddlFiberCust.Enabled = false;
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

    protected void ddlState_Filter(object sender, EventArgs e)
    {
        var StateSelected = ddlState.SelectedItem.Value;
        ddlState.Items.Clear();
        ddlState.Items.Add(new ListItem("ALL", "ALL"));
        ddlState.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery7 = "select distinct STATE_Y from PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE COVERAGE_SCORE >=:COVERAGE_SCORE AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14 AND CAMPAIGN_ID LIKE :CAMPAIGN_ID AND FIBER_CUST LIKE :FIBER_CUST AND STATE_Y != 'ALL'" +
            " AND ZIPCODE LIKE :ZIP ORDER BY STATE_Y";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery7)) // Initiates your SQL Command
            {
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                if (ddlZip.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ZIP", ddlZip.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery7;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlState.DataSource = cmd.ExecuteReader();
                    ddlState.DataTextField = "STATE_Y";
                    ddlState.DataValueField = "STATE_Y";
                    ddlState.DataBind();

                    ListItem iteminlist = new ListItem(StateSelected);

                    if (ddlState.Items.Contains(iteminlist))
                    {
                        ddlState.Items.FindByText(StateSelected).Selected = true;
                    }
                    else
                    {
                        ddlState.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlZip.SelectedItem.Text == "ALL")
                        //{
                        //    ddlZip_Filter(sender, e);
                        //}
                    }

                    if (ddlState.Items.Count > 1)
                    {
                        ddlState.Enabled = true;
                    }
                    else
                    {
                        ddlState.Enabled = false;
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

    protected void ddlZip_Filter(object sender, EventArgs e)
    {
        var ZipSelected = ddlZip.SelectedItem.Value;
        ddlZip.Items.Clear();
        ddlZip.Items.Add(new ListItem("ALL", "ALL"));
        ddlZip.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery8 = "SELECT DISTINCT ZIPCODE FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5 WHERE COVERAGE_SCORE >=:COVERAGE_SCORE AND FIVEG LIKE :FIVEG" +
            " AND (TPUT_TEXT LIKE :TPUT_TEXT OR TPUT_TEXT LIKE :TPUT_TEXT2 OR TPUT_TEXT LIKE :TPUT_TEXT3 OR TPUT_TEXT LIKE :TPUT_TEXT4 OR TPUT_TEXT LIKE :TPUT_TEXT5)" +
            " AND ROAM_TEXT LIKE :ROAM AND BAND_14 LIKE :B14 AND CAMPAIGN_ID LIKE :CAMPAIGN_ID AND FIBER_CUST LIKE :FIBER_CUST AND " +
            "STATE_Y LIKE :STATE AND ZIPCODE != 'ALL' ORDER BY ZIPCODE";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery8)) // Initiates your SQL Command
            {
                //if (ddl5G.SelectedItem.Text == "ALL") { cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "CENTRAL"));
                //} else {
                //    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "NORTHEAST"));
                //}
                //cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                if (ddlCoverageScore.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", "0"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":COVERAGE_SCORE", ddlCoverageScore.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                if (ddl5G.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIVEG", ddl5G.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", ddlTPUT_TEXT.SelectedItem.Text));
                if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "High Speed/Very High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/High Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Medium Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Medium Speed/Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "High Speed/Very High Avail Capacity"));
                }
                else if (ddlTPUT_TEXT.SelectedItem.Text == "Low Speed/Very Low Avail Capacity")
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "High Speed/Very High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "Medium Speed/High Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "Medium Speed/Medium Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "Medium Speed/Low Avail Capacity"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "Low Speed/Very Low Avail Capacity"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT2", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT3", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT4", "%"));
                    cmd.Parameters.Add(new OracleParameter(":TPUT_TEXT5", "%"));
                }
                //cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                if (ddlROAM.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":ROAM", ddlROAM.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                if (ddlB14.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":B14", ddlB14.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Text));
                if (ddlCampaign.SelectedItem.Value == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":CAMPAIGN_ID", ddlCampaign.SelectedItem.Value));
                }
                //cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                if (ddlFiberCust.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":FIBER_CUST", ddlFiberCust.SelectedItem.Text));
                }
                //cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                if (ddlState.SelectedItem.Text == "ALL")
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", "%"));
                }
                else
                {
                    cmd.Parameters.Add(new OracleParameter(":STATE", ddlState.SelectedItem.Text));
                }
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery8;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlZip.DataSource = cmd.ExecuteReader();
                    ddlZip.DataTextField = "ZIPCODE";
                    ddlZip.DataValueField = "ZIPCODE";
                    ddlZip.DataBind();

                    ListItem iteminlist = new ListItem(ZipSelected);

                    if (ddlZip.Items.Contains(iteminlist))
                    {
                        ddlZip.Items.FindByText(ZipSelected).Selected = true;
                    }
                    else
                    {
                        ddlZip.Items.FindByText("ALL").Selected = true;
                        //if (ddlCampaign.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCampaign_Filter(sender, e);
                        //}
                        //if (ddlCoverageScore.SelectedItem.Value == "ALL")
                        //{
                        //    ddlCoverageScore_Filter(sender, e);
                        //}
                        //if (ddl5G.SelectedItem.Text == "ALL")
                        //{
                        //    ddl5G_Filter(sender, e);
                        //}
                        //if (ddlTPUT_TEXT.SelectedItem.Text == "ALL")
                        //{
                        //    ddlTPUT_TEXT_Filter(sender, e);
                        //}
                        ////if (ddlCompetitor.SelectedItem.Text == "ALL")
                        ////{
                        ////    ddlCompetitor_Filter(sender, e);
                        ////}
                        //if (ddlROAM.SelectedItem.Text == "ALL")
                        //{
                        //    ddlROAM_Filter(sender, e);
                        //}
                        //if (ddlB14.SelectedItem.Text == "ALL")
                        //{
                        //    ddlB14_Filter(sender, e);
                        //}
                        //if (ddlFiberCust.SelectedItem.Text == "ALL")
                        //{
                        //    ddlFiberCust_Filter(sender, e);
                        //}
                        //if (ddlState.SelectedItem.Text == "ALL")
                        //{
                        //    ddlState_Filter(sender, e);
                        //}
                    }

                    if (ddlZip.Items.Count > 1)
                    {
                        ddlZip.Enabled = true;
                    }
                    else
                    {
                        ddlZip.Enabled = false;
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

    [WebMethod]
    public static string Get_Location_Detail_National1(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 1) or (ROW_NUM > 45 AND ROW_NUM < 3000)
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
    public static string Get_Location_Detail_National2(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {

        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
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
    public static string Get_Location_Detail_National3(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
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
    public static string Get_Location_Detail_National4(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
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
    public static string Get_Location_Detail_National5(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 5) or (ROW_NUM >= 12000 AND  ROW_NUM < 15000)
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
    public static string Get_Location_Detail_National6(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 6) or (ROW_NUM >= 15000 AND  ROW_NUM < 18000)
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
    public static string Get_Location_Detail_National7(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 7) or (ROW_NUM >= 18000 AND  ROW_NUM < 21000)
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
    public static string Get_Location_Detail_National8(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 8) or (ROW_NUM >= 21000 AND  ROW_NUM < 24000)
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
    public static string Get_Location_Detail_National9(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 9) or (ROW_NUM >= 24000 AND  ROW_NUM < 27000)
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
    public static string Get_Location_Detail_National10(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 10) or (ROW_NUM >= 27000 AND  ROW_NUM < 30000)
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
    public static string Get_Location_Detail_National11(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 11) or (ROW_NUM >= 30000 AND  ROW_NUM < 33000)
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
    public static string Get_Location_Detail_National12(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 12) or (ROW_NUM >= 33000 AND  ROW_NUM < 36000)
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
    public static string Get_Location_Detail_National13(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 13) or (ROW_NUM >= 36000 AND  ROW_NUM < 39000)
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
    public static string Get_Location_Detail_National14(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 14) or (ROW_NUM >= 39000 AND  ROW_NUM < 42000)
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
    public static string Get_Location_Detail_National15(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 15) or (ROW_NUM >= 42000 AND  ROW_NUM < 45000)
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
    public static string Get_Location_Detail_National16(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 16) or (ROW_NUM >= 45000 AND  ROW_NUM < 48000)
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
    public static string Get_Location_Detail_National17(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 17) or (ROW_NUM >= 48000 AND  ROW_NUM < 51000)
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
    public static string Get_Location_Detail_National18(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 18) or (ROW_NUM >= 51000 AND  ROW_NUM < 54000)
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
    public static string Get_Location_Detail_National19(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 19) or (ROW_NUM >= 54000 AND  ROW_NUM < 57000)
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
    public static string Get_Location_Detail_National20(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 20) or (ROW_NUM >= 57000 AND  ROW_NUM < 60000)
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
    public static string Get_Location_Detail_National21(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 21) or (ROW_NUM >= 60000 AND  ROW_NUM < 63000)
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
    public static string Get_Location_Detail_National22(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 22) or (ROW_NUM >= 63000 AND  ROW_NUM < 66000)
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
    public static string Get_Location_Detail_National23(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 23) or (ROW_NUM >= 66000 AND  ROW_NUM < 69000)
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
    public static string Get_Location_Detail_National24(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 24) or (ROW_NUM >= 69000 AND  ROW_NUM < 72000)
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
    public static string Get_Location_Detail_National25(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 25) or (ROW_NUM >= 72000 AND  ROW_NUM < 75000)
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
    public static string Get_Location_Detail_National26(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 26) or (ROW_NUM >= 75000 AND  ROW_NUM < 78000)
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
    public static string Get_Location_Detail_National27(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 27) or (ROW_NUM >= 78000 AND  ROW_NUM < 81000)
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
    public static string Get_Location_Detail_National28(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 28) or (ROW_NUM >= 81000 AND  ROW_NUM < 84000)
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
    public static string Get_Location_Detail_National29(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 29) or (ROW_NUM >= 84000 AND  ROW_NUM < 87000)
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
    public static string Get_Location_Detail_National30(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 30) or (ROW_NUM >= 87000 AND  ROW_NUM < 90000)
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
    public static string Get_Location_Detail_National31(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 31) or (ROW_NUM >= 90000 AND  ROW_NUM < 93000)
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
    public static string Get_Location_Detail_National32(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 32) or (ROW_NUM >= 93000 AND  ROW_NUM < 96000)
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
    public static string Get_Location_Detail_National33(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 33) or (ROW_NUM >= 96000 AND  ROW_NUM < 99000)
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
    public static string Get_Location_Detail_National34(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 34) or (ROW_NUM >= 99000 AND  ROW_NUM < 102000)
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
    public static string Get_Location_Detail_National35(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 35) or (ROW_NUM >= 102000 AND  ROW_NUM < 105000)
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
    public static string Get_Location_Detail_National36(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 36) or (ROW_NUM >= 105000 AND  ROW_NUM < 108000)
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
    public static string Get_Location_Detail_National37(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 37) or (ROW_NUM >= 108000 AND  ROW_NUM < 111000)
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
    public static string Get_Location_Detail_National38(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 38) or (ROW_NUM >= 111000 AND  ROW_NUM < 114000)
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
    public static string Get_Location_Detail_National39(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 39) or (ROW_NUM >= 114000 AND  ROW_NUM < 117000)
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
    public static string Get_Location_Detail_National40(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 40) or (ROW_NUM >= 117000 AND  ROW_NUM < 120000)
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
    public static string Get_Location_Detail_National41(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 41) or (ROW_NUM >= 120000 AND  ROW_NUM < 123000)
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
    public static string Get_Location_Detail_National42(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 42) or (ROW_NUM >= 123000 AND  ROW_NUM < 126000)
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
    public static string Get_Location_Detail_National43(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 43) or (ROW_NUM >= 126000 AND  ROW_NUM < 129000)
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
    public static string Get_Location_Detail_National44(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 44) or (ROW_NUM >= 129000 AND  ROW_NUM < 132000)
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
    public static string Get_Location_Detail_National45(string groupVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }

        string sql = @"SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM (SELECT CAMPAIGN_ID, CONTACT_COMPANY_NM, LOCATION_ID, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_EMAIL, CONTACT_PHONE1, ADDR_LINE1, CITY_NM, STATE_Y, POSTL_CD, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, LATITUDE, LONGITUDE, ROWNUM ROW_NUM, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES, COVERAGE_SCORE_RANK
                    FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL))
                    WHERE (ROW_NUM = 45) or (ROW_NUM >= 132000 AND  ROW_NUM < 135000)
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
    public static string Get_NationalTable_Data(string groupVariable, string overallCatVariable, string campaignVariable, string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {

        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        if (SortVariable == "TPUT_TEXT") { SortVariable = "CASE WHEN TPUT_TEXT = 'High Speed/Very High Avail Capacity' then 6  WHEN TPUT_TEXT = 'Medium Speed/High Avail Capacity' then 5 WHEN TPUT_TEXT = 'Medium Speed/Medium Avail Capacity' then 4 WHEN TPUT_TEXT = 'Medium Speed/Low Avail Capacity' then 3 WHEN TPUT_TEXT = 'Low Speed/Very Low Avail Capacity' then 2 ELSE 1 END"; }
        if (SortVariable == "FIBER_CUST") { SortVariable = "CASE WHEN FIBER_CUST = 'High' then 6  WHEN FIBER_CUST = 'Medium' then 5 WHEN FIBER_CUST = 'Low' then 4 ELSE 1 END"; }



        string sql = @"SELECT ROWNUM, TBL1.* FROM (SELECT CAMPAIGN_ID, 
                CASE WHEN CAMPAIGN_ID = '1-29918786310' THEN '3T20 Acquire Mobility White Space'
                WHEN CAMPAIGN_ID = '1-29985573337' THEN '3T20 Acquire Mobility Port Outs'
                WHEN CAMPAIGN_ID = '1-28585961300' THEN 'Acquire Mobility Whitespace'
                WHEN CAMPAIGN_ID = '1-31465898167' THEN '1T21 Grow Mobility Top ARPU'
                WHEN CAMPAIGN_ID = '1-31465898230' THEN '1T21 Grow Mobility Top TBR'
                WHEN CAMPAIGN_ID = '1-31465898283' THEN '1T21 Grow Mobility Top Integrated subs'
                WHEN CAMPAIGN_ID = '1-31465898296' THEN '1T21 Grow Mobility Top Data subs'
                WHEN CAMPAIGN_ID = '1-31465898369' THEN '1T21 Grow Mobility Top Voice subs'
                WHEN CAMPAIGN_ID = '1-31465898442' THEN '1T21 Grow Mobility Top Potential CRU'
                WHEN CAMPAIGN_ID = '1-31609052529' THEN '1T21 Grow Mobility 3G Shutdown'
                WHEN CAMPAIGN_ID = '1-31465898141' THEN '1T21 Acquire Mobility existing Wireline'
                WHEN CAMPAIGN_ID = '1-31465898154' THEN '1T21 Acquire Mobility Port Outs'
                WHEN CAMPAIGN_ID = '1-31465898068' THEN '1T21 Acquire Mobility New Logo'
                WHEN CAMPAIGN_ID = '1-31465898088' THEN '1T21 Grow Mobility Post COVID' END AS CAMPAIGN_NAME,
                COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, CONTACT_COMPANY_NM, CITY_NM, STATE_Y, POSTL_CD, LATITUDE, LONGITUDE,
                            LOCATION_ID, CONTACT_PHONE1, CONTACT_EMAIL, CONTACT_FIRST_NM, CONTACT_LAST_NM, COVERAGE_SCORE_RANK, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES
                FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL)
                ORDER BY " + SortVariable + @" DESC, COVERAGE_SCORE_RANK ASC)TBL1 WHERE(ROWNUM <= 50) AND COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0";

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
    public static string Get_showData_Top50(string CampaignVariable, string StateVariable, string ZipVariable, string CoverageScoreVariable, string FiveGVariable,
                            string TPUT_TEXTVariable, string CompetitorVariable, string ROAMVariable, string B14Variable, string FiberCustVariable, string SortVariable)
    {
        if (CampaignVariable == "ALL") { CampaignVariable = "%"; }
        if (StateVariable == "ALL") { StateVariable = "%"; }
        if (ZipVariable == "ALL") { ZipVariable = "%"; }
        if (CoverageScoreVariable == "ALL") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        else if (CoverageScoreVariable == "5") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5')"; }
        else if (CoverageScoreVariable == "4") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4')"; }
        else if (CoverageScoreVariable == "3") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3')"; }
        else if (CoverageScoreVariable == "2") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2')"; }
        else if (CoverageScoreVariable == "1") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '5' OR COVERAGE_SCORE LIKE '4' OR COVERAGE_SCORE LIKE '3' OR COVERAGE_SCORE LIKE '2' OR COVERAGE_SCORE LIKE '1')"; }
        else if (CoverageScoreVariable == "0") { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '0')"; }
        else { CoverageScoreVariable = "(COVERAGE_SCORE LIKE '%')"; }
        if (FiveGVariable == "ALL") { FiveGVariable = "%"; }
        //if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "%"; }
        if (TPUT_TEXTVariable == "ALL") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        else if (TPUT_TEXTVariable == "High Speed/Very High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/High Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Medium Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Medium Speed/Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity')"; }
        else if (TPUT_TEXTVariable == "Low Speed/Very Low Avail Capacity") { TPUT_TEXTVariable = "(TPUT_TEXT LIKE 'High Speed/Very High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/High Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Medium Avail Capacity' OR TPUT_TEXT LIKE 'Medium Speed/Low Avail Capacity' OR TPUT_TEXT LIKE 'Low Speed/Very Low Avail Capacity')"; }
        else { TPUT_TEXTVariable = "(TPUT_TEXT LIKE '%')"; }
        if (CompetitorVariable == "ALL") { CompetitorVariable = "%"; }
        if (ROAMVariable == "ALL") { ROAMVariable = "%"; }
        if (B14Variable == "ALL") { B14Variable = "%"; }
        if (FiberCustVariable == "ALL") { FiberCustVariable = "%"; }
        //if (FiberCustVariable == "ALL") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        //if (FiberCustVariable == "%") { FiberCustVariable = "FIBER_CUST IS NULL"; }
        if (SortVariable == "TPUT_TEXT") { SortVariable = "CASE WHEN TPUT_TEXT = 'High Speed/Very High Avail Capacity' then 6  WHEN TPUT_TEXT = 'Medium Speed/High Avail Capacity' then 5 WHEN TPUT_TEXT = 'Medium Speed/Medium Avail Capacity' then 4 WHEN TPUT_TEXT = 'Medium Speed/Low Avail Capacity' then 3 WHEN TPUT_TEXT = 'Low Speed/Very Low Avail Capacity' then 2 ELSE 1 END"; }
        if (SortVariable == "FIBER_CUST") { SortVariable = "CASE WHEN FIBER_CUST = 'High' then 6  WHEN FIBER_CUST = 'Medium' then 5 WHEN FIBER_CUST = 'Low' then 4 ELSE 1 END"; }

        string sql = @"SELECT ROWNUM, TBL1.* FROM (SELECT RECORDID, CAMPAIGN_ID, COVERAGE_SCORE, FIVEG, FIVEG_PLUS, TPUT_TEXT, ROAM_TEXT, PRIMARY_COMPETITOR_NAME, FIRST_NET, BAND_14, TPUT, FIBER_CUST, CONTACT_COMPANY_NM, CITY_NM, STATE_Y, POSTL_CD, LATITUDE, LONGITUDE,
                            LOCATION_ID, CONTACT_PHONE1, CONTACT_EMAIL, CONTACT_FIRST_NM, CONTACT_LAST_NM, COVERAGE_SCORE_RANK, TO_NUMBER(NUMBER_OF_EMPLOYEES) AS NUMBER_OF_EMPLOYEES
                FROM PONDER.SALES_CAMP_WIRELESS_SUM_V5
                    WHERE CAMPAIGN_ID LIKE '" + CampaignVariable + @"'
                    AND STATE_Y LIKE '" + StateVariable + @"'
                    AND POSTL_CD LIKE '" + ZipVariable + @"'
                    AND " + CoverageScoreVariable + @"
                    AND FIVEG LIKE '" + FiveGVariable + @"'
                    AND " + TPUT_TEXTVariable + @"
                    AND (PRIMARY_COMPETITOR_NAME LIKE '" + CompetitorVariable + @"' OR PRIMARY_COMPETITOR_NAME IS NULL)
                    AND ROAM_TEXT LIKE '" + ROAMVariable + @"'
                    AND BAND_14 LIKE '" + B14Variable + @"'
                    AND (FIBER_CUST LIKE '" + FiberCustVariable + @"' OR FIBER_CUST IS NULL)
                ORDER BY " + SortVariable + @" DESC, COVERAGE_SCORE_RANK ASC)TBL1 WHERE(ROWNUM <= 50) AND COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0";

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
