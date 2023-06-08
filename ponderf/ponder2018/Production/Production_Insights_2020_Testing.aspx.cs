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

public partial class Production_Production_Insights_2020_Testing : System.Web.UI.Page
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

            if (ATTUID == "wc5172" | ATTUID == "na768n" | ATTUID == "kk5880" | ATTUID == "kw2125" | ATTUID == "hb4894" | ATTUID == "sb033v" | ATTUID == "rk8968")
            {
                InitSelectors();
            }
            else
            {
                LoginRedirect();
            }

        }
    }

    public void LoginRedirect()
    {
        Response.Redirect("/PONDER_TestingLink.aspx");
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

        labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Geo: &nbsp;&nbsp;";

        //ddlMonth.Items.Add(new ListItem("January", "2020-01-01"));

        //string currentMonth = DateTime.Now.Month.ToString();

        //if (currentMonth == "2")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 1;
        //}

        //if (currentMonth == "3")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 2;

        //}

        //if (currentMonth == "4")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 3;
        //}

        //if (currentMonth == "5")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 4;
        //}

        //if (currentMonth == "6")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 5;
        //}

        //if (currentMonth == "7")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 6;
        //}

        //if (currentMonth == "8")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 7;
        //}

        //if (currentMonth == "9")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 8;
        //}

        //if (currentMonth == "10")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 9;
        //}

        //if (currentMonth == "11")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
        //    ddlMonth.Items.Add(new ListItem("November", "2020-11-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 10;
        //}

        //if (currentMonth == "12")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
        //    ddlMonth.Items.Add(new ListItem("November", "2020-11-01"));
        //    ddlMonth.Items.Add(new ListItem("December", "2020-12-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 11;
        //}


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

        if (GeoSelected == "SALES") {
            ddlMarket.Items.Clear();
            ddlMarket.AppendDataBoundItems = true;

            labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;Sales Geo: &nbsp;&nbsp;";

            String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
            String strQuery = "select MARKET_LONG, MARKET from PONDER.SALES_MARKET_MENU ORDER BY RANK_ORDER";

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

            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(),
                "SubmitButtonClick", "SubmitButtonClick();", true);

        }
        else if (GeoSelected == "ACE") {
            ddlMarket.Items.Clear();
            ddlMarket.AppendDataBoundItems = true;

            labelMarket.Text = "&nbsp;&nbsp;&nbsp;&nbsp;ACE Geo: &nbsp;&nbsp;";

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

            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(),
                "SubmitButtonClick", "SubmitButtonClick();", true);
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
    public void GetddlMonth(object sender, EventArgs e)
    {
        
        //string hf_FCCategoryValue = hf_FCCategory.Value;

        //public static string works, with a return of the string back to the front, but wont let us add list item

        //if (hf_FCCategoryValue == "2")
        //{            
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 1;
        //}

        //if (hf_FCCategoryValue == "3")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 2;            

        //}

        //if (hf_FCCategoryValue == "4")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 3;
        //}

        //if (hf_FCCategoryValue == "5")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 4;
        //}

        //if (hf_FCCategoryValue == "6")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 5;
        //}

        //if (hf_FCCategoryValue == "7")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 6;
        //}

        //if (hf_FCCategoryValue == "8")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 7;
        //}

        //if (hf_FCCategoryValue == "9")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 8;
        //}

        //if (hf_FCCategoryValue == "10")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 9;
        //}

        //if (hf_FCCategoryValue == "11")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
        //    ddlMonth.Items.Add(new ListItem("November", "2020-11-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 10;
        //}

        //if (hf_FCCategoryValue == "12")
        //{
        //    ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //    ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //    ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));
        //    ddlMonth.Items.Add(new ListItem("May", "2020-05-01"));
        //    ddlMonth.Items.Add(new ListItem("June", "2020-06-01"));
        //    ddlMonth.Items.Add(new ListItem("July", "2020-07-01"));
        //    ddlMonth.Items.Add(new ListItem("August", "2020-08-01"));
        //    ddlMonth.Items.Add(new ListItem("September", "2020-09-01"));
        //    ddlMonth.Items.Add(new ListItem("October", "2020-10-01"));
        //    ddlMonth.Items.Add(new ListItem("November", "2020-11-01"));
        //    ddlMonth.Items.Add(new ListItem("December", "2020-12-01"));
        //    ddlMonth.DataBind();
        //    ddlMonth.SelectedIndex = 11;
        //}

    }

    [WebMethod]
    public static string GetProductionNumbers(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)

    {
        if (groupVariable == "ACE")
        {
            if (marketVariable == "ALL")
            {
                string sql = @"SELECT PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, 
                    CY_POE, CY_FCST, CY_PERCENT_FCST, CY_ACT, CY_PERCENT_ACT, CY_PUSH, CY_PULL, CY_BOTH,
                    CY_PERCENT_BOTH, CUM_POE, CUM_FCST, CUM_PERCENT_FCST, CUM_PERCENT_CY, CM_POE, CM_FCST, CM_PERCENT_FCST, CM_PERCENT_CY, CM_ACT,
                    YTD_PLAN, YTD_PERCENT_PVSA
                    FROM PONDER.PRODUCTION_INSIGHTS_CY  
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'ALL'          
                    AND RAN_AVP = 'ALL'                      
                    AND RAN_MARKET = 'ALL'
                    AND RAN_SUBMARKET = 'ALL'  
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'";

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
                string sql = @"SELECT PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, 
                    CY_POE, CY_FCST, CY_PERCENT_FCST, CY_ACT, CY_PERCENT_ACT, CY_PUSH, CY_PULL, CY_BOTH,
                    CY_PERCENT_BOTH, CUM_POE, CUM_FCST, CUM_PERCENT_FCST, CUM_PERCENT_CY, CM_POE, CM_FCST, CM_PERCENT_FCST, CM_PERCENT_CY, CM_ACT,
                    YTD_PLAN, YTD_PERCENT_PVSA
                    FROM PONDER.PRODUCTION_INSIGHTS_CY  
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                        AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                        AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                        AND RAN_SUBMARKET = 'ALL' 
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'";

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
        else
        {
            if (marketVariable == "%")
            {
                string sql = @"SELECT PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, 
                    CY_POE, CY_FCST, CY_PERCENT_FCST, CY_ACT, CY_PERCENT_ACT, CY_PUSH, CY_PULL, CY_BOTH,
                    CY_PERCENT_BOTH, CUM_POE, CUM_FCST, CUM_PERCENT_FCST, CUM_PERCENT_CY, CM_POE, CM_FCST, CM_PERCENT_FCST, CM_PERCENT_CY, CM_ACT,
                    YTD_PLAN, YTD_PERCENT_PVSA
                    FROM PONDER.PRODUCTION_INSIGHTS_CY  
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'  
                    AND SALES_REGION = 'ALL'
                    AND SALES_VPGM_MARKET = 'ALL'";

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
                string sql = @"SELECT PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_ONE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, 
                    CY_POE, CY_FCST, CY_PERCENT_FCST, CY_ACT, CY_PERCENT_ACT, CY_PUSH, CY_PULL, CY_BOTH,
                    CY_PERCENT_BOTH, CUM_POE, CUM_FCST, CUM_PERCENT_FCST, CUM_PERCENT_CY, CM_POE, CM_FCST, CM_PERCENT_FCST, CM_PERCENT_CY, CM_ACT,
                    YTD_PLAN, YTD_PERCENT_PVSA
                    FROM PONDER.PRODUCTION_INSIGHTS_CY 
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'
                    AND (SALES_REGION LIKE ('" + marketVariable + @"') OR SALES_VPGM_MARKET LIKE ('" + marketVariable + @"'))
                        AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)";

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

    [WebMethod]
    public static string Get_RYG_Modal(string groupVariable, string marketVariable, string monthVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string colSelected, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sqlPlan = @"SELECT * FROM (SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) = " + MonthNumber + @" + 0  THEN 'ACTUAL DURING PLAN " + RecentMSVariable + @"'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'ACTUAL BEFORE PLAN " + RecentMSVariable + @"'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) > " + MonthNumber + @" + 0 THEN 'ACTUAL AFTER PLAN " + RecentMSVariable + @"'
                    WHEN CY_PUSH = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) = " + MonthNumber + @" + 0 THEN 'FORECAST DURING PLAN " + RecentMSVariable + @"'
                    WHEN CY_PUSH = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) > " + MonthNumber + @" + 0 THEN 'FORECAST AFTER PLAN " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE, PACE_NAME AS PACE_NAME_LONG,
                    ROWNUM ROW_NUM 
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND CY_POE = 'Y'
                    AND TO_CHAR(" + RecentMSVariable + @"_PLAN, 'Mon') LIKE ('" + monthVariable + @"')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_PLAN) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 1) OR (ROW_NUM > 2 AND ROW_NUM < 2000)
                    "; //store your sql query in this string variable "sql" 

        string sqlFcst = @"SELECT * FROM (SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) = " + MonthNumber + @" + 0 THEN 'ACTUAL'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) = " + MonthNumber + @" + 0 THEN 'REMAINING FORECAST'
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE, PACE_NAME AS PACE_NAME_LONG,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 1) OR (ROW_NUM > 2 AND ROW_NUM < 2000)
                    ";

        string sqlAct = @"SELECT * FROM (SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) = " + MonthNumber + @" + 0 THEN 'ACTUAL'
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE, PACE_NAME AS PACE_NAME_LONG,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON)
                    AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 1) OR (ROW_NUM > 2 AND ROW_NUM < 2000)
                    ";

        string sql;

        if (colSelected == "PLAN")
        {
            sql = sqlPlan;
        }
        else if (colSelected == "FCST")
        { 
            sql = sqlFcst; 
        }
        else
        { 
            sql = sqlAct; 
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
    public static string Get_RYG_Modal_2(string groupVariable, string marketVariable, string monthVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string colSelected, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }        
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        } else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sqlPlan = @"SELECT * FROM (SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) = " + MonthNumber + @" + 0  THEN 'ACTUAL DURING PLAN " + RecentMSVariable + @"'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'ACTUAL BEFORE PLAN " + RecentMSVariable + @"'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) > " + MonthNumber + @" + 0 THEN 'ACTUAL AFTER PLAN " + RecentMSVariable + @"'
                    WHEN CY_PUSH = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) = " + MonthNumber + @" + 0 THEN 'FORECAST DURING PLAN " + RecentMSVariable + @"'
                    WHEN CY_PUSH = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) > " + MonthNumber + @" + 0 THEN 'FORECAST AFTER PLAN " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE, PACE_NAME AS PACE_NAME_LONG,
                    ROWNUM ROW_NUM 
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND CY_POE = 'Y'
                    AND TO_CHAR(" + RecentMSVariable + @"_PLAN, 'Mon') LIKE ('" + monthVariable + @"')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_PLAN) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND  ROW_NUM < 4000)
                    "; //store your sql query in this string variable "sql" 

        string sqlFcst = @"SELECT * FROM (SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) = " + MonthNumber + @" + 0 THEN 'ACTUAL'
                    WHEN " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) = " + MonthNumber + @" + 0 THEN 'REMAINING FORECAST'
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE, PACE_NAME AS PACE_NAME_LONG,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND  ROW_NUM < 4000)
                    ";

        string sqlAct = @"SELECT * FROM (SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) = " + MonthNumber + @" + 0 THEN 'ACTUAL'
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, LATITUDE, LONGITUDE, PACE_NAME AS PACE_NAME_LONG,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON)
                    AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND  ROW_NUM < 4000)
                    ";

        string sql;

        if (colSelected == "PLAN")
        {
            sql = sqlPlan;
        }
        else if (colSelected == "FCST")
        { 
            sql = sqlFcst; 
        }
        else
        { 
            sql = sqlAct; 
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
    public static string Get_RYG_Modal2_1(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }
        
                string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0  THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR CY_POE = 'Y' OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 1) or (ROW_NUM > 6 AND  ROW_NUM < 2000)
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
    public static string Get_RYG_Modal2_2(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }
       
                string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR CY_POE = 'Y' OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND  ROW_NUM < 4000)
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
    public static string Get_RYG_Modal2_3(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR CY_POE = 'Y' OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 3) or (ROW_NUM >= 4000 AND  ROW_NUM < 6000)
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
    public static string Get_RYG_Modal2_4(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR CY_POE = 'Y' OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 4) or (ROW_NUM >= 6000 AND  ROW_NUM < 8000)
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
    public static string Get_RYG_Modal2_5(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR CY_POE = 'Y' OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 5) or (ROW_NUM >= 8000 AND  ROW_NUM < 10000)
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
    public static string Get_RYG_Modal2_6(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR CY_POE = 'Y' OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 6) or (ROW_NUM >= 10000 AND  ROW_NUM < 12000)
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
    public static string Get_RYG_Modal2_ACT_1(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 1) OR (ROW_NUM > 6 AND ROW_NUM < 2000)
                    "; //store your sql query in this string variable "sql" 

        //Removed the below and clause, dont think we want it anymore

        //AND((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE('" + yearVariable + @"'))
        //                OR(" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE('" + yearVariable + @"')))            


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
    public static string Get_RYG_Modal2_ACT_2(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }
        
                string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND  ROW_NUM < 4000)
                    "; //store your sql query in this string variable "sql" 

                //Removed the below and clause, dont think we want it anymore

                //AND((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE('" + yearVariable + @"'))
                //                OR(" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE('" + yearVariable + @"')))            


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
    public static string Get_RYG_Modal2_ACT_3(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 3) or (ROW_NUM >= 4000 AND  ROW_NUM < 6000)
                    "; //store your sql query in this string variable "sql" 

        //Removed the below and clause, dont think we want it anymore

        //AND((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE('" + yearVariable + @"'))
        //                OR(" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE('" + yearVariable + @"')))            


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
    public static string Get_RYG_Modal2_ACT_4(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 4) or (ROW_NUM >= 6000 AND  ROW_NUM < 8000)
                    "; //store your sql query in this string variable "sql" 

        //Removed the below and clause, dont think we want it anymore

        //AND((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE('" + yearVariable + @"'))
        //                OR(" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE('" + yearVariable + @"')))            


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
    public static string Get_RYG_Modal2_ACT_5(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 5) or (ROW_NUM >= 8000 AND  ROW_NUM < 10000)
                    "; //store your sql query in this string variable "sql" 

        //Removed the below and clause, dont think we want it anymore

        //AND((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE('" + yearVariable + @"'))
        //                OR(" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE('" + yearVariable + @"')))            


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
    public static string Get_RYG_Modal2_ACT_6(string groupVariable, string marketVariable, string MonthNumber, string RecentMSVariable, string PlanFcstVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT * FROM (
                    SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0  THEN 'PULL RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PULL PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'PULL Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'PULL Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'PULL Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'PULL Q4F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) >= " + MonthNumber + @" + 0 THEN 'RECENT " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_ACTUAL) < " + MonthNumber + @" + 0 THEN 'PREVIOUS " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 3 THEN 'Q1F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 6 THEN 'Q2F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 9 THEN 'Q3F " + RecentMSVariable + @"'
                    WHEN CY_PULL = 0 AND " + RecentMSVariable + @"_ACTUAL IS NULL AND EXTRACT(MONTH FROM " + RecentMSVariable + @"_FORECAST) <= 12 THEN 'Q4F " + RecentMSVariable + @"'
                    ELSE 'UPCOMING " + RecentMSVariable + @"' 
                    END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON))
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    ORDER BY PACE_NUMBER
                    ) WHERE (ROW_NUM = 6) or (ROW_NUM >= 10000 AND  ROW_NUM < 12000)
                    "; //store your sql query in this string variable "sql" 

        //Removed the below and clause, dont think we want it anymore

        //AND((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'YYYY') LIKE('" + yearVariable + @"'))
        //                OR(" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_" + PlanFcstVariable + @", 'YYYY') LIKE('" + yearVariable + @"')))            


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
    public static string Get_RYG_Modal3(string groupVariable, string marketVariable, string yearVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {

        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CASE WHEN CY_PUSH = 1 THEN 'PUSH' 
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'PULL COMPLETE' 
                    WHEN CY_PULL = 1 AND " + RecentMSVariable + @"_ACTUAL IS NULL THEN 'PULL FORECAST' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE
                    FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
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
    public static string GetForecastBar(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)

    {
        if (groupVariable == "ACE")
        {
            if (marketVariable == "ALL")
            {
                string sql = @"SELECT * FROM PONDER.PRODUCTION_I_PREBREAKOUT WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                    AND PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'ALL'          
                    AND RAN_AVP = 'ALL'                      
                    AND RAN_MARKET = 'ALL'
                    AND RAN_SUBMARKET = 'ALL'  
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'";

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
                string sql = @"SELECT * FROM PONDER.PRODUCTION_I_PREBREAKOUT WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                    AND PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                        AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                        AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                        AND RAN_SUBMARKET = 'ALL' 
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'";

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
        else
        {
            if (marketVariable == "%")
            {
                string sql = @"SELECT * FROM PONDER.PRODUCTION_I_PREBREAKOUT WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                    AND PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'  
                    AND SALES_REGION = 'ALL'
                    AND SALES_VPGM_MARKET = 'ALL'";

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
                string sql = @"SELECT * FROM PONDER.PRODUCTION_I_PREBREAKOUT WHERE PLANYEAR = TO_CHAR(sysdate, 'YYYY')+0 
                    AND PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'
                    AND (SALES_REGION LIKE ('" + marketVariable + @"') OR SALES_VPGM_MARKET LIKE ('" + marketVariable + @"'))
                        AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)";

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

    [WebMethod]
    public static string GetTASK_PRODUCTION_CHART(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (groupVariable == "ACE")
        {
            if (marketVariable == "ALL")
            {
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_TP 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND RAN_REGION = 'ALL'          
                     AND RAN_AVP = 'ALL'                      
                     AND RAN_MARKET = 'ALL'
                     AND RAN_SUBMARKET = 'ALL'  
                     AND SALES_REGION = 'NA'
                     AND SALES_VPGM_MARKET = 'NA'
                     AND FORECAST_YEAR = '2020'";

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
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_TP 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                        AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                        AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                        AND RAN_SUBMARKET = 'ALL' 
                     AND SALES_REGION = 'NA'
                     AND SALES_VPGM_MARKET = 'NA'
                     AND FORECAST_YEAR = '2020'";

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
        else 
        {
            if (marketVariable == "%")
            {
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_TP 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND RAN_REGION = 'NA'          
                     AND RAN_AVP = 'NA'                      
                     AND RAN_MARKET = 'NA'
                     AND RAN_SUBMARKET = 'NA'  
                     AND SALES_REGION = 'ALL'
                     AND SALES_VPGM_MARKET = 'ALL'
                     AND FORECAST_YEAR = '2020'";

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
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_TP 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND RAN_REGION = 'NA'          
                     AND RAN_AVP = 'NA'                      
                     AND RAN_MARKET = 'NA'
                     AND RAN_SUBMARKET = 'NA'  
                     AND (SALES_REGION LIKE ('" + marketVariable + @"') OR SALES_VPGM_MARKET LIKE ('" + marketVariable + @"'))
                        AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                     AND FORECAST_YEAR = '2020'";

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

    public void ExportToExcel_TP2(object sender, EventArgs e)
    {
        //store your sql query in this string variable "sql"
        
        string hf_TPMilestoneValue = hf_TPMilestone.Value;
        string hf_TPSeriesValue = hf_TPSeries.Value;
        string hf_TPProgramValue = hf_TPProgram.Value;        
        string hf_pptpCustomOneValue = hf_pptpCustomOne.Value;
        string hf_pptpCustomTwoValue = hf_pptpCustomTwo.Value;
        string hf_pptpCustomThreeValue = hf_pptpCustomThree.Value;
        string hf_pptpCustomFourValue = hf_pptpCustomFour.Value;
        string hf_pptpCustomFiveValue = hf_pptpCustomFive.Value;

        if (hf_pptpCustomOneValue == "ALL")
        {
            hf_pptpCustomOneValue = "%";
        }
        if (hf_pptpCustomTwoValue == "ALL")
        {
            hf_pptpCustomTwoValue = "%";
        }
        if (hf_pptpCustomThreeValue == "ALL")
        {
            hf_pptpCustomThreeValue = "%";
        }
        if (hf_pptpCustomFourValue == "ALL")
        {
            hf_pptpCustomFourValue = "%";
        }
        if (hf_pptpCustomFiveValue == "ALL")
        {
            hf_pptpCustomFiveValue = "%";
        }

        if (ddlGeo.SelectedItem.Value == "ACE")
        {
            if (ddlMarket.SelectedItem.Value == "ALL")
            {
                string sql = @"SELECT PACE_NUMBER, PACE_NAME, STATUS AS PACE_STATUS, ORACLE_PTN, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, 
                PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM1, CIVIL_VENDOR, SITE_ACQUISITION_VENDOR, JOB_VENDOR, RAN_INITIATIVE, 
                FA_LOCATION_CODE, USID, TO_CHAR(ONAIR_FORECAST, 'YYYY') AS FORECAST_YEAR, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, MOD_CODE,
                IPLAN_SPECTRUM AS SPECTRUM,
                TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS CURRENT_IPLAN_ISSUED_DATE, 
                TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE, 
                " + hf_TPProgramValue + @"
                TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS EXECUTED_ON
                FROM PONDER.PACE_POE_2020_PPTP
                WHERE STATUS IN ('Active', 'Complete')
                    AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2020'
                    AND RAN_REGION LIKE '%'
                    AND RAN_AVP LIKE '%'
                    AND RAN_MARKET LIKE '%'
                    AND RAN_SUBMARKET LIKE '%'
                    AND PPTP_CUSTOM_ONE LIKE ('" + hf_pptpCustomOneValue + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + hf_pptpCustomTwoValue + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + hf_pptpCustomThreeValue + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + hf_pptpCustomFourValue + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + hf_pptpCustomFiveValue + @"')
                    AND " + hf_TPSeriesValue + @"";

                //string sql = @"SELECT PACE_NUMBER FROM PONDER.PACE_POE_2020_PPTP WHERE ROWNUM < 5";

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
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=Exported_Data.csv;");
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
                string sql = @"SELECT PACE_NUMBER, PACE_NAME, STATUS AS PACE_STATUS, ORACLE_PTN, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, 
                PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM1, CIVIL_VENDOR, SITE_ACQUISITION_VENDOR, JOB_VENDOR, RAN_INITIATIVE, 
                FA_LOCATION_CODE, USID, TO_CHAR(ONAIR_FORECAST, 'YYYY') AS FORECAST_YEAR, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, MOD_CODE,
                IPLAN_SPECTRUM AS SPECTRUM,
                TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS CURRENT_IPLAN_ISSUED_DATE, 
                TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE, 
                " + hf_TPProgramValue + @"
                TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS EXECUTED_ON
                FROM PONDER.PACE_POE_2020_PPTP
                WHERE STATUS IN ('Active', 'Complete')
                    AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2020'
                    AND (RAN_REGION LIKE ('" + ddlMarket.SelectedItem.Value + @"') OR RAN_AVP LIKE ('" + ddlMarket.SelectedItem.Value + @"') OR RAN_MARKET LIKE ('" + ddlMarket.SelectedItem.Value + @"'))
                    AND PPTP_CUSTOM_ONE LIKE ('" + hf_pptpCustomOneValue + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + hf_pptpCustomTwoValue + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + hf_pptpCustomThreeValue + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + hf_pptpCustomFourValue + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + hf_pptpCustomFiveValue + @"')
                    AND " + hf_TPSeriesValue + @"";

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
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=Exported_Data.csv;");
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
        else
        {
            if (ddlMarket.SelectedItem.Value == "%")
            {
                string sql = @"SELECT PACE_NUMBER, PACE_NAME, STATUS AS PACE_STATUS, ORACLE_PTN, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, 
                PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM1, CIVIL_VENDOR, SITE_ACQUISITION_VENDOR, JOB_VENDOR, RAN_INITIATIVE, 
                FA_LOCATION_CODE, USID, TO_CHAR(ONAIR_FORECAST, 'YYYY') AS FORECAST_YEAR, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, MOD_CODE,
                IPLAN_SPECTRUM AS SPECTRUM,
                TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS CURRENT_IPLAN_ISSUED_DATE, 
                TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE, 
                " + hf_TPProgramValue + @"
                TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS EXECUTED_ON
                FROM PONDER.PACE_POE_2020_PPTP
                WHERE STATUS IN ('Active', 'Complete')
                    AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2020'
                    AND SALES_REGION LIKE '%'
                    AND SALES_VPGM_MARKET LIKE '%'
                    AND PPTP_CUSTOM_ONE LIKE ('" + hf_pptpCustomOneValue + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + hf_pptpCustomTwoValue + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + hf_pptpCustomThreeValue + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + hf_pptpCustomFourValue + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + hf_pptpCustomFiveValue + @"')
                    AND " + hf_TPSeriesValue + @"";

                //string sql = @"SELECT PACE_NUMBER FROM PONDER.PACE_POE_2020_PPTP WHERE ROWNUM < 5";

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
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=Exported_Data.csv;");
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
                string sql = @"SELECT PACE_NUMBER, PACE_NAME, STATUS AS PACE_STATUS, ORACLE_PTN, RAN_REGION AS REGION, RAN_AVP AS AVP, RAN_MARKET AS MARKET, RAN_SUBMARKET AS SUBMARKET, 
                PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM1, CIVIL_VENDOR, SITE_ACQUISITION_VENDOR, JOB_VENDOR, RAN_INITIATIVE, 
                FA_LOCATION_CODE, USID, TO_CHAR(ONAIR_FORECAST, 'YYYY') AS FORECAST_YEAR, LATITUDE, LONGITUDE, PRODUCT_GROUP, PRODUCT_SUBGROUP, NATIONAL_PROGRAM, MOD_CODE,
                IPLAN_SPECTRUM AS SPECTRUM,
                TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS CURRENT_IPLAN_ISSUED_DATE, 
                TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-DD-YYYY') AS CURRENT_NEED_BY_DATE, 
                " + hf_TPProgramValue + @"
                TO_CHAR(ONAIR_PLAN, 'MM-DD-YYYY') AS ONAIR_PLAN, 
                TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') AS ONAIR_FORECAST, 
                TO_CHAR(ONAIR_ACTUAL, 'MM-DD-YYYY') AS ONAIR_ACTUAL,
                TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS EXECUTED_ON
                FROM PONDER.PACE_POE_2020_PPTP
                WHERE STATUS IN ('Active', 'Complete')
                    AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2020'
                    AND (SALES_REGION LIKE ('" + ddlMarket.SelectedItem.Value + @"') OR SALES_VPGM_MARKET LIKE ('" + ddlMarket.SelectedItem.Value + @"'))
                    AND PPTP_CUSTOM_ONE LIKE ('" + hf_pptpCustomOneValue + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + hf_pptpCustomTwoValue + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + hf_pptpCustomThreeValue + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + hf_pptpCustomFourValue + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + hf_pptpCustomFiveValue + @"')
                    AND " + hf_TPSeriesValue + @"";

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
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=Exported_Data.csv;");
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
   
    [WebMethod]
    public static string GetPRODUCTION_CHART( string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable )
    {
        if (groupVariable == "ACE")
        {
            if (marketVariable == "ALL") {
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND RAN_REGION = 'ALL'          
                     AND RAN_AVP = 'ALL'                      
                     AND RAN_MARKET = 'ALL'
                     AND RAN_SUBMARKET = 'ALL'  
                     AND SALES_REGION = 'NA'
                     AND SALES_VPGM_MARKET = 'NA'
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
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                        AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                        AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                        AND RAN_SUBMARKET = 'ALL'  
                     AND SALES_REGION = 'NA'
                     AND SALES_VPGM_MARKET = 'NA'
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
        else
        {
            if (marketVariable == "%")
            {
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
              WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                 AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                 AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                 AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                 AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                 AND RAN_REGION = 'NA'
                 AND RAN_AVP = 'NA'
                 AND RAN_MARKET = 'NA'
                 AND RAN_SUBMARKET = 'NA'
                 AND SALES_REGION = 'ALL'
                 AND SALES_VPGM_MARKET = 'ALL'
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
                string sql = @"SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                  WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                     AND RAN_REGION = 'NA'
                     AND RAN_AVP = 'NA'
                     AND RAN_MARKET = 'NA'
                     AND RAN_SUBMARKET = 'NA'
                     AND (SALES_REGION LIKE ('" + marketVariable + @"') OR SALES_VPGM_MARKET LIKE ('" + marketVariable + @"'))
                        AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
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
    }

    [WebMethod]
    public static string GetPRODUCTION_CHART_TABLE(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (groupVariable == "ACE")
        {
            if (marketVariable == "ALL")
            {
                string sql = @"SELECT 'MONTHLY PLAN' AS COLUMN_NAME, t5.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'ALL'          
                   AND RAN_AVP = 'ALL'                      
                   AND RAN_MARKET = 'ALL'
                   AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
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
                   SELECT PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'ALL'          
                   AND RAN_AVP = 'ALL'                      
                   AND RAN_MARKET = 'ALL'
                   AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t

                UNION ALL

                SELECT 'MONTHLY ACTUAL' AS COLUMN_NAME, t3.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'ALL'          
                   AND RAN_AVP = 'ALL'                      
                   AND RAN_MARKET = 'ALL'
                   AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t3

                UNION ALL

                SELECT 'PLAN CUMULATIVE' AS COLUMN_NAME, t6.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'ALL'          
                   AND RAN_AVP = 'ALL'                      
                   AND RAN_MARKET = 'ALL'
                   AND RAN_SUBMARKET = 'ALL'   
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t6

                UNION ALL

                SELECT 'FCST CUMULATIVE' AS COLUMN_NAME, t2.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'ALL'          
                   AND RAN_AVP = 'ALL'                      
                   AND RAN_MARKET = 'ALL'
                   AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t2

                UNION ALL

                SELECT 'ACTUAL CUMULATIVE' AS COLUMN_NAME, t4.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'ALL'          
                   AND RAN_AVP = 'ALL'                      
                   AND RAN_MARKET = 'ALL'
                   AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
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
                   SELECT PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                      AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                      AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                      AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
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
                   SELECT PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                      AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                      AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                      AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t

                UNION ALL

                SELECT 'MONTHLY ACTUAL' AS COLUMN_NAME, t3.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                      AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                      AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                      AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t3

                UNION ALL

                SELECT 'PLAN CUMULATIVE' AS COLUMN_NAME, t6.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                      AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                      AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                      AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t6

                UNION ALL

                SELECT 'FCST CUMULATIVE' AS COLUMN_NAME, t2.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                      AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                      AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                      AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t2

                UNION ALL

                SELECT 'ACTUAL CUMULATIVE' AS COLUMN_NAME, t4.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                      AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                          WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                      AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                          WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                      AND RAN_SUBMARKET = 'ALL'  
                   AND SALES_REGION = 'NA'
                   AND SALES_VPGM_MARKET = 'NA'
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
        else
        {
            if (marketVariable == "%")
            {
                string sql = @"SELECT 'MONTHLY PLAN' AS COLUMN_NAME, t5.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND SALES_REGION = 'ALL'
                   AND SALES_VPGM_MARKET = 'ALL'
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
                   SELECT PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND SALES_REGION = 'ALL'
                   AND SALES_VPGM_MARKET = 'ALL'
                )
                PIVOT 
                (
                   SUM(PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t

                UNION ALL

                SELECT 'MONTHLY ACTUAL' AS COLUMN_NAME, t3.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND SALES_REGION = 'ALL'
                   AND SALES_VPGM_MARKET = 'ALL'
                )
                PIVOT 
                (
                   SUM(PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t3

                UNION ALL

                SELECT 'PLAN CUMULATIVE' AS COLUMN_NAME, t6.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND SALES_REGION = 'ALL'
                   AND SALES_VPGM_MARKET = 'ALL'
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t6

                UNION ALL

                SELECT 'FCST CUMULATIVE' AS COLUMN_NAME, t2.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND SALES_REGION = 'ALL'
                   AND SALES_VPGM_MARKET = 'ALL'
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t2

                UNION ALL

                SELECT 'ACTUAL CUMULATIVE' AS COLUMN_NAME, t4.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND SALES_REGION = 'ALL'
                   AND SALES_VPGM_MARKET = 'ALL'
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
                   SELECT PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND (SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')
                      AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
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
                   SELECT PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND (SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')
                      AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                )
                PIVOT 
                (
                   SUM(PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t

                UNION ALL

                SELECT 'MONTHLY ACTUAL' AS COLUMN_NAME, t3.* from 
                ( SELECT * FROM (
                   SELECT PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND (SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')
                      AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                )
                PIVOT 
                (
                   SUM(PROJECTS_ONAIR_ACTUAL)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t3

                UNION ALL

                SELECT 'PLAN CUMULATIVE' AS COLUMN_NAME, t6.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_PLAN_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND (SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')
                      AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_PLAN_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t6

                UNION ALL

                SELECT 'FCST CUMULATIVE' AS COLUMN_NAME, t2.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_FCST_ONAIR, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND (SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')
                      AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                )
                PIVOT 
                (
                   SUM(CUMU_PROJECTS_FCST_ONAIR)
                   FOR FORECAST_MONTH IN ('2020-01' AS JAN, '2020-02' AS FEB, '2020-03' AS MAR, '2020-04' AS APR, '2020-05' AS MAY, '2020-06' AS JUN, '2020-07' AS JUL, '2020-08' AS AUG, '2020-09' AS SEP, '2020-10' AS OCT, '2020-11' AS NOV, '2020-12' AS DEC)
                ))t2

                UNION ALL

                SELECT 'ACTUAL CUMULATIVE' AS COLUMN_NAME, t4.* from 
                ( SELECT * FROM (
                   SELECT CUMU_PROJECTS_ONAIR_ACTUAL, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, FORECAST_MONTH
                   FROM PONDER.PRODUCTION_INSIGHTS_PC
                   WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                     AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                     AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                     AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                     AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                   AND RAN_REGION = 'NA'
                   AND RAN_AVP = 'NA'
                   AND RAN_MARKET = 'NA'
                   AND RAN_SUBMARKET = 'NA'
                   AND (SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')
                      AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
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


    [WebMethod]

    public static string GetQuad1(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)

    {
        if (groupVariable == "ACE")
        {
            if (marketVariable == "ALL")
            {
                string sql = @"SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                  RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, PROJECTS_PLAN_ONAIR AS TABLE_PLAN, PROJECTS_FCST_ONAIR AS TABLE_FORECAST, PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                    TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'Month') AS MONTHTEXT
                FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'ALL'          
                    AND RAN_AVP = 'ALL'                      
                    AND RAN_MARKET = 'ALL'
                    AND RAN_SUBMARKET = 'ALL'  
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'
                    AND SUBSTR(FORECAST_MONTH,0,4) = EXTRACT (YEAR FROM DATE_INSERTED) AND SUBSTR(FORECAST_MONTH, -2, 2) <= EXTRACT(MONTH FROM DATE_INSERTED)
                    ORDER BY FORECAST_MONTH
                    )
                UNION ALL
                    SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                      RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, CUMU_PROJECTS_PLAN_ONAIR AS TABLE_PLAN, CUMU_PROJECTS_FCST_ONAIR AS TABLE_FORECAST, CUMU_PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                      TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'YYYY') AS MONTHTEXT
                    FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'ALL'          
                    AND RAN_AVP = 'ALL'                      
                    AND RAN_MARKET = 'ALL'
                    AND RAN_SUBMARKET = 'ALL'  
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'
                    AND FORECAST_MONTH LIKE '%-12'
                    ORDER BY FORECAST_MONTH
                    ) ORDER BY FORECAST_MONTH DESC";

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
                string sql = @"SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                  RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, PROJECTS_PLAN_ONAIR AS TABLE_PLAN, PROJECTS_FCST_ONAIR AS TABLE_FORECAST, PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'Month') AS MONTHTEXT
                FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                        AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                        AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                        AND RAN_SUBMARKET = 'ALL' 
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'
                    AND SUBSTR(FORECAST_MONTH,0,4) = EXTRACT (YEAR FROM DATE_INSERTED) AND SUBSTR(FORECAST_MONTH, -2, 2) <= EXTRACT(MONTH FROM DATE_INSERTED)
                    ORDER BY FORECAST_MONTH
                    )
                UNION ALL
                    SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                      RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, CUMU_PROJECTS_PLAN_ONAIR AS TABLE_PLAN, CUMU_PROJECTS_FCST_ONAIR AS TABLE_FORECAST, CUMU_PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                    TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'YYYY') AS MONTHTEXT
                    FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND (RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')            
                        AND RAN_AVP LIKE (CASE WHEN RAN_AVP LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET NOT LIKE ('" + marketVariable + @"'))THEN 'ALL' 
                            WHEN (RAN_AVP NOT LIKE ('" + marketVariable + @"') AND RAN_MARKET LIKE ('" + marketVariable + @"'))THEN '%'END)                       
                        AND RAN_MARKET LIKE (CASE WHEN RAN_MARKET LIKE ('" + marketVariable + @"') THEN '" + marketVariable + @"'
                            WHEN RAN_MARKET NOT LIKE ('" + marketVariable + @"') THEN 'ALL' END) 
                        AND RAN_SUBMARKET = 'ALL'   
                    AND SALES_REGION = 'NA'
                    AND SALES_VPGM_MARKET = 'NA'
                    AND FORECAST_MONTH LIKE '%-12'
                    ORDER BY FORECAST_MONTH
                    ) ORDER BY FORECAST_MONTH DESC";

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
        else
        {
            if (marketVariable == "%")
            {
                string sql = @"SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                  RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, PROJECTS_PLAN_ONAIR AS TABLE_PLAN, PROJECTS_FCST_ONAIR AS TABLE_FORECAST, PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'Month') AS MONTHTEXT
                FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'  
                    AND SALES_REGION = 'ALL'
                    AND SALES_VPGM_MARKET = 'ALL'
                    AND SUBSTR(FORECAST_MONTH,0,4) = EXTRACT (YEAR FROM DATE_INSERTED) AND SUBSTR(FORECAST_MONTH, -2, 2) <= EXTRACT(MONTH FROM DATE_INSERTED)
                    ORDER BY FORECAST_MONTH
                    )
                UNION ALL
                    SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                      RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, CUMU_PROJECTS_PLAN_ONAIR AS TABLE_PLAN, CUMU_PROJECTS_FCST_ONAIR AS TABLE_FORECAST, CUMU_PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                    TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'YYYY') AS MONTHTEXT
                    FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'  
                    AND SALES_REGION = 'ALL'
                    AND SALES_VPGM_MARKET = 'ALL'
                    AND FORECAST_MONTH LIKE '%-12'
                    ORDER BY FORECAST_MONTH
                    ) ORDER BY FORECAST_MONTH DESC";

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
                string sql = @"SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                  RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, PROJECTS_PLAN_ONAIR AS TABLE_PLAN, PROJECTS_FCST_ONAIR AS TABLE_FORECAST, PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'Month') AS MONTHTEXT
                FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'
                    AND (SALES_REGION LIKE ('" + marketVariable + @"') OR SALES_VPGM_MARKET LIKE ('" + marketVariable + @"'))
                        AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                    AND SUBSTR(FORECAST_MONTH,0,4) = EXTRACT (YEAR FROM DATE_INSERTED) AND SUBSTR(FORECAST_MONTH, -2, 2) <= EXTRACT(MONTH FROM DATE_INSERTED)
                    ORDER BY FORECAST_MONTH
                    )
                UNION ALL
                    SELECT FORECAST_MONTH, GEO_TYPE, PPTP_CUSTOM_ONE, PPTP_CUSTOM_TWO, PPTP_CUSTOM_THREE, PPTP_CUSTOM_FOUR, PPTP_CUSTOM_FIVE,
                      RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, SALES_REGION, SALES_VPGM_MARKET, CUMU_PROJECTS_PLAN_ONAIR AS TABLE_PLAN, CUMU_PROJECTS_FCST_ONAIR AS TABLE_FORECAST, CUMU_PROJECTS_ONAIR_ACTUAL AS TABLE_ACTUAL,
                    TO_CHAR(TO_DATE(SUBSTR(FORECAST_MONTH,0,4)||'-'||SUBSTR(FORECAST_MONTH, -2, 2)||'-'||'01', 'YYYY-MM-DD'),'YYYY') AS MONTHTEXT
                    FROM (
                    SELECT * FROM PONDER.PRODUCTION_INSIGHTS_PC 
                    WHERE PPTP_CUSTOM_ONE = '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO = '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE = '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR = '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE = '" + pptpFiveVariable + @"'
                    AND RAN_REGION = 'NA'          
                    AND RAN_AVP = 'NA'                      
                    AND RAN_MARKET = 'NA'
                    AND RAN_SUBMARKET = 'NA'
                    AND (SALES_REGION LIKE ('" + marketVariable + @"') OR SALES_VPGM_MARKET LIKE ('" + marketVariable + @"'))
                        AND SALES_VPGM_MARKET LIKE (CASE WHEN SALES_REGION LIKE '" + marketVariable + @"' THEN 'ALL' ELSE '" + marketVariable + @"' END)
                    AND FORECAST_MONTH LIKE '%-12'
                    ORDER BY FORECAST_MONTH
                    ) ORDER BY FORECAST_MONTH DESC";

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

    [WebMethod]
    public static string GetPRODUCTION_CURVE_MODAL_1(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable, string RecentMSVariable)

    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

       
                string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
                    RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
                    FROM (
                    SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE,  
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP 
                    WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO LIKE '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE LIKE '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR LIKE '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE LIKE '" + pptpFiveVariable + @"'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))                    
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')))
                    ORDER BY PACE_NUMBER
                    )
                    WHERE (ROW_NUM = 1) or (ROW_NUM > 6 AND ROW_NUM < 2000)";                    

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
    public static string GetPRODUCTION_CURVE_MODAL_2(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable, string RecentMSVariable)

    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }


        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
                    RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
                    FROM (
                    SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE,  
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP 
                    WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO LIKE '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE LIKE '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR LIKE '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE LIKE '" + pptpFiveVariable + @"'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))                    
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"'))) 
                    ORDER BY PACE_NUMBER                   
                    )
                    WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND ROW_NUM < 4000)";

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
    public static string GetPRODUCTION_CURVE_MODAL_3(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable, string RecentMSVariable)

    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }


        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
                    RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
                    FROM (
                    SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE,  
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP 
                    WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO LIKE '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE LIKE '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR LIKE '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE LIKE '" + pptpFiveVariable + @"'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))                    
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')))
                    ORDER BY PACE_NUMBER                    
                    )
                    WHERE (ROW_NUM = 3) or (ROW_NUM >= 4000 AND ROW_NUM < 6000)";

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
    public static string GetPRODUCTION_CURVE_MODAL_4(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable, string RecentMSVariable)

    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }


        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
                    RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
                    FROM (
                    SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE,  
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP 
                    WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO LIKE '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE LIKE '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR LIKE '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE LIKE '" + pptpFiveVariable + @"'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))                    
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"'))) 
                    ORDER BY PACE_NUMBER                   
                    )
                    WHERE (ROW_NUM = 4) or (ROW_NUM >= 6000 AND ROW_NUM < 8000)";

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
    public static string GetPRODUCTION_CURVE_MODAL_5(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable, string RecentMSVariable)

    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }


        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
                    RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
                    FROM (
                    SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE,  
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP 
                    WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO LIKE '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE LIKE '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR LIKE '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE LIKE '" + pptpFiveVariable + @"'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))                    
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"')))    
                    ORDER BY PACE_NUMBER                
                    )
                    WHERE (ROW_NUM = 5) or (ROW_NUM >= 8000 AND ROW_NUM < 10000)";

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
    public static string GetPRODUCTION_CURVE_MODAL_6(string groupVariable, string marketVariable, string monthVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable, string RecentMSVariable)

    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }


        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
                    RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
                    FROM (
                    SELECT CASE WHEN " + RecentMSVariable + @"_ACTUAL IS NOT NULL THEN 'RECENT " + RecentMSVariable + @"' ELSE 'UPCOMING " + RecentMSVariable + @"' END AS CATEGORY,
                    PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
                    SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE,  
                    RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM,
                    TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
                    TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
                    TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
                    TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
                    USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
                    ROWNUM ROW_NUM
                    FROM PONDER.PACE_POE_2020_PPTP 
                    WHERE STATUS IN ('Complete', 'Active')
                    " + groupVariable + @"
                    AND PPTP_CUSTOM_ONE LIKE '" + pptpOneVariable + @"'
                    AND PPTP_CUSTOM_TWO LIKE '" + pptpTwoVariable + @"'
                    AND PPTP_CUSTOM_THREE LIKE '" + pptpThreeVariable + @"'
                    AND PPTP_CUSTOM_FOUR LIKE '" + pptpFourVariable + @"'
                    AND PPTP_CUSTOM_FIVE LIKE '" + pptpFiveVariable + @"'
                    AND (EXTRACT(YEAR FROM " + RecentMSVariable + @"_ACTUAL) = EXTRACT(YEAR FROM EXECUTED_ON) OR EXTRACT(YEAR FROM " + RecentMSVariable + @"_FORECAST) = EXTRACT(YEAR FROM EXECUTED_ON))                    
                    AND ((" + RecentMSVariable + @"_ACTUAL IS NOT NULL AND TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'Mon') LIKE ('" + monthVariable + @"')) 
                        OR (" + RecentMSVariable + @"_ACTUAL IS NULL AND TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'Mon') LIKE ('" + monthVariable + @"'))) 
                    ORDER BY PACE_NUMBER                   
                    )
                    WHERE (ROW_NUM = 6) or (ROW_NUM >= 10000 AND ROW_NUM < 12000)";

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
    public static string Get_Recent_Sales_Detail_1(string groupVariable, string marketVariable, string timeVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
            RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
            USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
            SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
            RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
            TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
            TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
            TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
            TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
            USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')            
            " + groupVariable + @"
            AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
            AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
            AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
            AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
            AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"'))
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')-1))
            ORDER BY PACE_NUMBER
            )
            WHERE (ROW_NUM = 1) or (ROW_NUM > 6 AND ROW_NUM < 2000)";

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
    public static string Get_Recent_Sales_Detail_2(string groupVariable, string marketVariable, string timeVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
            RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
            USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
            SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
            RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
            TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
            TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
            TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
            TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
            USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')            
            " + groupVariable + @"
            AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
            AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
            AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
            AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
            AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"'))
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')-1))
            ORDER BY PACE_NUMBER
            )
            WHERE (ROW_NUM = 2) or (ROW_NUM >= 2000 AND ROW_NUM < 4000)";

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
    public static string Get_Recent_Sales_Detail_3(string groupVariable, string marketVariable, string timeVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
            RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
            USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
            SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
            RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
            TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
            TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
            TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
            TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
            USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')            
            " + groupVariable + @"
            AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
            AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
            AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
            AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
            AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"'))
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')-1))
            ORDER BY PACE_NUMBER
            )
            WHERE (ROW_NUM = 3) or (ROW_NUM >= 4000 AND ROW_NUM < 6000)";

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
    public static string Get_Recent_Sales_Detail_4(string groupVariable, string marketVariable, string timeVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
            RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
            USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
            SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
            RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
            TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
            TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
            TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
            TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
            USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')            
            " + groupVariable + @"
            AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
            AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
            AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
            AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
            AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
            AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"'))
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')-1))
            ORDER BY PACE_NUMBER
            )
            WHERE (ROW_NUM = 4) or (ROW_NUM >= 6000 AND ROW_NUM < 8000)";

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
    public static string Get_Recent_Sales_Detail_5(string groupVariable, string marketVariable, string timeVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
            RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
            USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
            SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
            RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
            TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
            TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
            TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
            TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
            USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')            
            " + groupVariable + @"
            AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
            AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
            AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
            AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
            AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
           AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"'))
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')-1))
            ORDER BY PACE_NUMBER
            )
            WHERE (ROW_NUM = 5) or (ROW_NUM >= 8000 AND ROW_NUM < 10000)";

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
    public static string Get_Recent_Sales_Detail_6(string groupVariable, string marketVariable, string timeVariable, string RecentMSVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        if (pptpOneVariable == "ALL")
        {
            pptpOneVariable = "%";
        }
        if (pptpTwoVariable == "ALL")
        {
            pptpTwoVariable = "%";
        }
        if (pptpThreeVariable == "ALL")
        {
            pptpThreeVariable = "%";
        }
        if (pptpFourVariable == "ALL")
        {
            pptpFourVariable = "%";
        }
        if (pptpFiveVariable == "ALL")
        {
            pptpFiveVariable = "%";
        }

        if (marketVariable == "ALL" | marketVariable == "%")
        {
            groupVariable = "";
        }
        else if (groupVariable == "ACE")
        {
            groupVariable = "AND(RAN_REGION = '" + marketVariable + @"' OR RAN_AVP = '" + marketVariable + @"' OR RAN_MARKET = '" + marketVariable + @"')";
        }
        else
        {
            groupVariable = "AND(SALES_REGION LIKE '" + marketVariable + @"' OR SALES_VPGM_MARKET LIKE '" + marketVariable + @"')";
        }

        string sql = @"SELECT CATEGORY, PACE_NUMBER, PACE_NAME_SHORT, PROGRAM, SUBPROGRAM, SUBPROGRAM2, SUBPROGRAM3, SUBPROGRAM4, SUBGROUP, SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, 
            RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP_CODE, RAN_INITIATIVE, SPECTRUM, ISSUED_DATE, " + RecentMSVariable + @"_PLAN, " + RecentMSVariable + @"_FORECAST, " + RecentMSVariable + @"_ACTUAL,
            USID, FA_CODE, LATITUDE, LONGITUDE, PACE_NAME_LONG 
            FROM (
            SELECT CASE WHEN ONAIR_ACTUAL IS NULL THEN 'REMAINING FORECASTED'
            WHEN (EXTRACT (YEAR FROM ONAIR_ACTUAL) = EXTRACT (YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')) THEN 'ACTUAL'
            ELSE 'PREVIOUS ACTUAL' END AS CATEGORY,
            PACE_NUMBER, SUBSTR(PACE_NAME,0, 40) AS PACE_NAME_SHORT, PPTP_CUSTOM_ONE AS PROGRAM, PPTP_CUSTOM_TWO AS SUBPROGRAM, PPTP_CUSTOM_THREE AS SUBPROGRAM2, PPTP_CUSTOM_FOUR AS SUBPROGRAM3, PPTP_CUSTOM_FIVE AS SUBPROGRAM4, PRODUCT_SUBGROUP AS SUBGROUP, 
            SALES_REGION, SALES_VPGM_MARKET, RAN_REGION, RAN_AVP, RAN_MARKET, RAN_SUBMARKET, STATE, COUNTY, CITY, ZIP AS ZIP_CODE, 
            RAN_INITIATIVE, IPLAN_SPECTRUM AS SPECTRUM, 
            TO_CHAR(IPLAN_ISSUED_DATE, 'MM-DD-YYYY') AS ISSUED_DATE, 
            TO_CHAR(" + RecentMSVariable + @"_PLAN, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_PLAN, 
            TO_CHAR(" + RecentMSVariable + @"_FORECAST, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_FORECAST, 
            TO_CHAR(" + RecentMSVariable + @"_ACTUAL, 'MM-DD-YYYY') AS " + RecentMSVariable + @"_ACTUAL,
            USID, FA_LOCATION_CODE AS FA_CODE, PACE_NAME AS PACE_NAME_LONG, LATITUDE, LONGITUDE,
            ROWNUM ROW_NUM
            FROM PONDER.PACE_POE_2020_PPTP WHERE STATUS IN ('Complete', 'Active')            
            " + groupVariable + @"
            AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
            AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
            AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
            AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
            AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
           AND (ONAIR_ACTUAL IS NULL AND EXTRACT(YEAR FROM ONAIR_FORECAST) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_FORECAST) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"'))
            OR (ONAIR_ACTUAL IS NOT NULL AND EXTRACT(YEAR FROM ONAIR_ACTUAL) = EXTRACT(YEAR FROM DATE'" + timeVariable + @"') AND EXTRACT(MONTH FROM ONAIR_ACTUAL) = EXTRACT(MONTH FROM DATE'" + timeVariable + @"')-1))
            ORDER BY PACE_NUMBER
            )
            WHERE (ROW_NUM = 6) or (ROW_NUM >= 10000 AND ROW_NUM < 12000)";

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