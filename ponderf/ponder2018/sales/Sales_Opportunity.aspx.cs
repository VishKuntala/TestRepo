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
using System.Web.Script.Serialization;
using System.Web.Services;
using Oracle.ManagedDataAccess.Client; //needed for connecting to AXIOM (or any oracle server)
using Oracle.ManagedDataAccess.Types;
using ponder2018;
using ponder2018.SalesOpportunity;

public partial class sales_Sales_Opportunity : System.Web.UI.Page
{

    public static Dictionary<string, string> dictStates = new Dictionary<string, string>
        {
                 {"SELECT", "Select State"},
                 {"AL", "Alabama"},
                 {"AK", "Alaska"},
                 {"AZ", "Arizona"},
                 {"AR", "Arkansas"},
                 {"CA", "California"},
                 {"CO", "Colorado"},
                 {"CT", "Connecticut"},
                 {"DE", "Delaware"},
                 {"DC", "District Of Columbia"},
                {"FL", "Florida"},
                 {"GA", "Georgia"},
                 {"HI", "Hawaii"},
                 {"ID", "Idaho"},
                 {"IL", "Illinois"},
                 {"IN", "Indiana"},
                 {"IA", "Iowa"},
                 {"KS", "Kansas"},
                 {"KY", "Kentucky"},
                 {"LA", "Louisiana"},
                 {"ME", "Maine"},
                 {"MD", "Maryland"},
                 {"MA", "Massachusetts"},
                 {"MI", "Michigan"},
                 {"MN", "Minnesota"},
                 {"MS", "Mississippi"},
                 {"MO", "Missouri"},
                  {"MT", "Montana"},
                  {"NE", "Nebraska"},
                  {"NV", "Nevada"},
                  {"NH", "New Hampshire"},
                  {"NJ", "New Jersey"},
                  {"NM", "New Mexico"},
                  {"NY", "New York"},
                  {"NC", "North Carolina"},
                  {"ND", "North Dakota"},
                  {"OH", "Ohio"},
                  {"OK", "Oklahoma"},
                  {"OR", "Oregon"},
                  {"PA", "Pennsylvania"},
                  {"RI", "Rhode Island"},
                  {"SC", "South Carolina"},
                  {"SD", "South Dakota"},
                  {"TN", "Tennessee"},
                  {"TX", "Texas"},
                  {"UT", "Utah"},
                  {"VT", "Vermont"},
                  {"VA", "Virginia"},
                  {"WA", "Washington"},
                  {"WV", "West Virginia"},
                  {"WI", "Wisconsin"},
                  {"WY", "Wyoming"},
        };



    // Registers the webpack generated js bundle script tag in the aspx page for the scripts under the module folder
    private void RegisterModulesScriptTag ()
    {

        string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + @"\sales\modules\dist");
        for (int i = 0; i < fileEntries.Length; i++)
        {

            if (Path.GetFileName(fileEntries[i]).IndexOf("main.") != -1 && Path.GetExtension(fileEntries[i]) == ".js")
            {
                ltlModulesJsTag.Text = String.Format("<script type='text/javascript' src='./modules/dist/{0}'></script>", Path.GetFileName(fileEntries[i]));
            }
        }
        
        // LiteralControl javascriptRef = new LiteralControl(String.Format("<script type='text/javascript' src='./modules/dist/{0}'></script>", Path.GetFileName(fileEntries[0])));
        // Page.Header.Controls.Add(javascriptRef);
    }


    private void SetAcknowledgeFlag(string flag)
        {
            ltlAcknowledgeConfidentialityFlag.Text = String.Format("<input type='hidden' id='txtAcknowledgeConfidentialityFlag' value='{0}' />", flag);
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
                //ATTUID = "artest";
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
                               
                                if (oraclestring1 == "ADMIN" || oraclestring1 == "ACE" )
                                {
                                    SetAcknowledgeFlag("1");
                                    AceAccess();
                                    UnlimitedAccess();
                                    InitSelectors();
                                    
                                } 
                                else if (oraclestring1 == "SALES_OPP_SPECIAL_ACCESS" || oraclestring1 == "SAMBAR_DIRECTS_CHAINUP" || oraclestring1 == "SALES_MANAGEMENT")
                                {
                                    SetAcknowledgeFlag("1");
                                    UnlimitedAccess();
                                    InitSelectors();
                                }
                                else if (oraclestring1 == "SALES_OPP_LIMITED" || oraclestring1 == "SALES_OPP_LIMITED_SA" )
                                {
                                    SetAcknowledgeFlag("1");
                                    LimitAccess();
                                    InitSelectors();
                                }
                                else if (oraclestring1 == "SALES_OPP_AR")
                                {
                                    SetAcknowledgeFlag("1");
                                    ArAccess();                                    
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
        } else {
            SetAcknowledgeFlag("1");
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

    public void ArAccess()
    {
        hf_ArAccess.Value = "AR";
    }

    public void AceAccess()
    {
        hf_AceAccess.Value = "ACE";
    }


    // FILL SELECTORS
    public void InitSelectors()
    {
        //Sort ddls for table
        ddlSortBy.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY DESC"));
        ddlSortBy.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS DESC"));
        ddlSortBy.Items.Add(new ListItem("Highest Fiber Penetration", "FIBER_PERCENTAGE DESC"));
        ddlSortBy.Items.Add(new ListItem("Lowest Fiber Penetration", "(CASE WHEN TO_NUMBER(FIBER_AVAILABLE, '999,999,999,999') > 0 THEN 1 ELSE 0 END) DESC, FIBER_PERCENTAGE ASC"));
        ddlSortBy.Items.Add(new ListItem("Highest Copper Upgrade", "COPPER_UPGRADE DESC"));
        ddlCMACopperUpgradeSortBy.Items.Add(new ListItem("Market Rank", "MARKET_RANK ASC"));
        ddlCMACopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY DESC"));
        ddlCMACopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS DESC"));
        ddlCMACopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Penetration", "FIBER_PERCENTAGE DESC"));
        ddlCMACopperUpgradeSortBy.Items.Add(new ListItem("Lowest Fiber Penetration", "(CASE WHEN TO_NUMBER(FIBER_AVAILABLE, '999,999,999,999') > 0 THEN 1 ELSE 0 END) DESC, FIBER_PERCENTAGE ASC"));
        ddlCMACopperUpgradeSortBy.Items.Add(new ListItem("Highest Copper Upgrade", "COPPER_UPGRADE DESC"));
        ddlCountyCopperUpgradeSortBy.Items.Add(new ListItem("Market Rank", "MARKET_RANK ASC"));
        ddlCountyCopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY DESC"));
        ddlCountyCopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS DESC"));
        ddlCountyCopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Penetration", "FIBER_PERCENTAGE DESC"));
        ddlCountyCopperUpgradeSortBy.Items.Add(new ListItem("Lowest Fiber Penetration", "(CASE WHEN TO_NUMBER(FIBER_AVAILABLE, '999,999,999,999') > 0 THEN 1 ELSE 0 END) DESC, FIBER_PERCENTAGE ASC"));
        ddlCountyCopperUpgradeSortBy.Items.Add(new ListItem("Highest Copper Upgrade", "COPPER_UPGRADE DESC"));
        ddlZipCopperUpgradeSortBy.Items.Add(new ListItem("Market Rank", "MARKET_RANK ASC"));
        ddlZipCopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Opportunity", "FIBER_OPPORTUNITY DESC"));
        ddlZipCopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Customers", "FIBER_CUSTOMERS DESC"));
        ddlZipCopperUpgradeSortBy.Items.Add(new ListItem("Highest Fiber Penetration", "FIBER_PERCENTAGE DESC"));
        ddlZipCopperUpgradeSortBy.Items.Add(new ListItem("Lowest Fiber Penetration", "(CASE WHEN TO_NUMBER(FIBER_AVAILABLE, '999,999,999,999') > 0 THEN 1 ELSE 0 END) DESC, FIBER_PERCENTAGE ASC"));
        ddlZipCopperUpgradeSortBy.Items.Add(new ListItem("Highest Copper Upgrade", "COPPER_UPGRADE DESC"));
        ddlRegionGroupBy.Items.Add(new ListItem("CMA", "CMA"));
        ddlRegionGroupBy.Items.Add(new ListItem("County", "COUNTY"));
        ddlMarketGroupBy.Items.Add(new ListItem("CMA", "CMA"));
        ddlMarketGroupBy.Items.Add(new ListItem("County", "COUNTY"));
        ddlMarketGroupBy.Items.Add(new ListItem("Zip", "ZIP"));
        ddlGroupBy.Items.Add(new ListItem("CMA", "CMA"));
        ddlGroupBy.Items.Add(new ListItem("County", "COUNTY"));
        ddlGroupBy.Items.Add(new ListItem("Zip", "ZIP"));
        string sqlQuery = @"select MARKET_LONG, SALES_MARKET from PONDER.SALES_OPP_MARKET_MENU_V4 WHERE FIBER = 'Y' ORDER BY RANK_ORDER";
        DataTable dt = GetOracleData("AXIOM", sqlQuery);
        ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        ddlMarket.DataValueField = "SALES_MARKET"; //assign the item value from query results
        ddlMarket.DataBind(); //bind the list
        foreach (ListItem listItem in ddlMarket.Items)
        {
            if (String.IsNullOrEmpty(listItem.Value))
            {
                listItem.Attributes.Add("style", "color:gray;");
                listItem.Attributes.Add("disabled", "true");
                listItem.Value = "-1";
            }
        }
        //labelMarket.Text = "Sales Market: &nbsp;&nbsp;";
        ddlHeatTheme.Items.Add(new ListItem("Fiber Penetration Rate", "fiberPenetration"));
        ddlHeatTheme.Items.Add(new ListItem("Wireless Coverage & Fiber Avail", "wirelessCoverageAndFiber"));
        //ddlHeatTheme.Items.Add(new ListItem("Elderly Percentage (Age 60+)", "elderlyPercentage"));
        //states for the search ddl
        ddlState.DataSource = dictStates;
        ddlState.DataValueField = "Key";
        ddlState.DataTextField = "Value";
        ddlState.DataBind();

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
        string sql = @"SELECT DATA_SOURCE, DATA_DATE FROM PONDER.SALES_OPP_DATA_INFO_TEST ORDER BY DATA_ORDER";

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
    public static string GetJsonData(GetJsonDataParameters myParamsObject)
    {
        string sql = Helper.GetDataQuery(myParamsObject);
        DataTable dataTable = DatabaseHelper.GetDataTable(sql);
       JavaScriptSerializer serializer = new JavaScriptSerializer(); //define a new JavaScriptSerializer object "serializer"
        serializer.MaxJsonLength = Int32.MaxValue;
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>(); //define a new List "rows"
        Dictionary<string, object> row; //define a new Dictionary "row"
        foreach (DataRow dr in dataTable.Rows) //setup a loop to iterate through the rows "dr" your DataTable "dt"
        {
            row = new Dictionary<string, object>(); //define a new object to store your data in
            foreach (DataColumn col in dataTable.Columns) //setup a loop to iterate through the columns of the current row "dr" in your DataTable "dt"
            {
                row.Add(col.ColumnName, dr[col]); //add the data to your "row" object
            }
            rows.Add(row); //add the "row" to your "rows" object
        }
        string objectdata = serializer.Serialize(rows); //use the JavaScriptSerializer "serializer" to convert to a JSON string - this can fail if too long
        return objectdata; //return your data to the front end
    }

    [WebMethod]
    public static void ExportToExcel(ExportToExcelParameters myParamsObject)
    {
        string sql = Helper.GetExportToExcelQuery(myParamsObject);
        DataTable dataTable = DatabaseHelper.GetDataTable(sql);
        StringBuilder sb = new StringBuilder();
        string[] columnNames = dataTable.Columns.Cast<DataColumn>().
                                          Select(column => column.ColumnName).
                                          ToArray();
        sb.AppendLine(string.Join(",", columnNames));

        foreach (DataRow row in dataTable.Rows)
        {
            string[] fields = row.ItemArray.Select(field => field.ToString()).
                                            ToArray();
            sb.AppendLine(string.Join(",", fields));
        }
        HttpContext.Current.Response.ClearContent();
        HttpContext.Current.Response.ClearHeaders();
        HttpContext.Current.Response.Clear();
        HttpContext.Current.Response.Write(sb.ToString());
        var cookie = new HttpCookie("DownloadCompleteChecker");
        cookie.Expires = DateTime.Now.AddDays(-1d);
        HttpContext.Current.Response.Cookies.Add(cookie);
        HttpContext.Current.Response.Flush();
        HttpContext.Current.Response.End();
    }

    [WebMethod]
    public static void LogUIEvent(LogEventParameters myParamsObject)
    {
        string insertQuery = string.Empty;
        OracleConnection con = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString);
        OracleCommand cmd = new OracleCommand(); // Initiates your OracleCommand Command
        cmd.CommandTimeout = 90; //Sets a longer timeout value
        insertQuery = @"INSERT INTO PONDER.SALES_OPP_LOG_EVENTS (USER_ID, EVENT_TYPE, CREATE_DATE, LOG_DATA, LOG_JSON_PAYLOAD) VALUES (:USER_ID, :EVENT_TYPE, :CREATE_DATE, :LOG_DATA, :LOG_JSON_PAYLOAD)";
        cmd.Parameters.Add("USER_ID", OracleDbType.Varchar2).Value = myParamsObject.userID;
        cmd.Parameters.Add("EVENT_TYPE", OracleDbType.Varchar2).Value = myParamsObject.eventType;
        cmd.Parameters.Add("CREATE_DATE", OracleDbType.TimeStamp).Value = DateTime.Now;
        cmd.Parameters.Add("LOG_DATA", OracleDbType.Varchar2).Value = myParamsObject.logData;
        cmd.Parameters.Add("LOG_JSON_PAYLOAD", OracleDbType.Varchar2).Value = String.IsNullOrEmpty(myParamsObject.logJsonPayload) ? null : myParamsObject.logJsonPayload;
        try
        {
            con.Open(); // Opens your connection
            cmd.CommandText = insertQuery; // Sets the text of your OracleCommand to the string passed to the method
            cmd.Connection = con; // sets the connection value of  your OracleCommand 
            cmd.ExecuteNonQuery();
            cmd.Dispose(); // deletes your OracleCommand
        }
        catch (Exception ex) // if an exception occurs in the "try", give exception result
        {
            throw ex; // produces exception result error
        }
        finally
        {
            con.Close(); // closes OracleConnection
            con.Dispose(); // deletes OracleConnection
        }
    }

    [WebMethod]
    public static void LogAcknowledge(LogEventParameters myParamsObject)
    {
        DatabaseHelper.LogAcknowledge(myParamsObject);
    }
}