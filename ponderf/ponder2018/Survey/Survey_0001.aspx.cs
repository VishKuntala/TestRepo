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

public partial class _Survey_0001 : System.Web.UI.Page
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

            ddlInitial_Filter(sender, e);
        }

    }
    // FILL SELECTORS
    public void InitSelectors()
    {

        //string sqlQuery = @"SELECT DISTINCT STATE_LONG, STATE
        //    FROM PONDER.SURVEY_QUESTIONS
        //    ORDER BY STATE";
        //DataTable dt = GetOracleData("AXIOM", sqlQuery);

        //ddlState.DataSource = dt; //load the cma dropdown list from query results
        //ddlState.DataTextField = "STATE_LONG"; //assign the item text from query results
        //ddlState.DataValueField = "STATE"; //assign the item value from query results
        //ddlState.DataBind(); //bind the list        

        //ddlMonth.Items.Add(new ListItem("January", "2020-01-01"));
        //ddlMonth.Items.Add(new ListItem("February", "2020-02-01"));
        //ddlMonth.Items.Add(new ListItem("March", "2020-03-01"));
        //ddlMonth.Items.Add(new ListItem("April", "2020-04-01"));


        //string sqlQuery = @"select MARKET_LONG, MARKET
        //    from PONDER.MARKET_MENU_V5
        //    ORDER BY RANK_ORDER";
        //DataTable dt = GetOracleData("AXIOM", sqlQuery);

        //ddlMarket.DataSource = dt; //load the cma dropdown list from query results
        //ddlMarket.DataTextField = "MARKET_LONG"; //assign the item text from query results
        //ddlMarket.DataValueField = "MARKET"; //assign the item value from query results
        //ddlMarket.DataBind(); //bind the list
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

    [WebMethod]
    public static string GetWebphoneData(string userIdVariable)
    {
        //Construction Started
        //string sql = @"SELECT ATTUID, SUPERVISOR_ATTUID FROM AXIOM.WEBPHONE WHERE ATTUID = '" + userIdVariable + @"'";
        string sql = @"SELECT ATTUID, SUPERVISOR_ATTUID FROM AXIOM.WEBPHONE WHERE ATTUID = 'wc5172'";

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

    protected void ddlInitial_Filter(object sender, EventArgs e)
    {
        ddlState.Items.Clear();
        ddlState.Items.Add(new ListItem("National", "ALL"));
        ddlCounty.Items.Clear();
        ddlCounty.Items.Add(new ListItem("ALL", "ALL"));
        ddlCity.Items.Clear();
        ddlCity.Items.Add(new ListItem("ALL", "ALL"));
        ddlState.AppendDataBoundItems = true;
        ddlCounty.AppendDataBoundItems = true;
        ddlCity.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery1 = "SELECT DISTINCT STATE_LONG, STATE FROM PONDER.SURVEY_QUESTIONS WHERE STATE_LONG NOT IN ('National') ORDER BY STATE";
        String strQuery2 = "SELECT DISTINCT COUNTY FROM PONDER.SURVEY_QUESTIONS WHERE COUNTY NOT IN ('ALL') ORDER BY COUNTY";
        String strQuery3 = "SELECT DISTINCT CITY FROM PONDER.SURVEY_QUESTIONS WHERE CITY NOT IN ('ALL') ORDER BY CITY";

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
                    ddlState.DataSource = cmd.ExecuteReader();
                    ddlState.DataTextField = "STATE_LONG";
                    ddlState.DataValueField = "STATE_LONG";
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
            using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            {
                ddlCounty.Enabled = false;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery2;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlCounty.DataSource = cmd.ExecuteReader();
                    ddlCounty.DataTextField = "COUNTY";
                    ddlCounty.DataValueField = "COUNTY";
                    ddlCounty.DataBind();
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
            using (OracleCommand cmd = new OracleCommand(strQuery3)) // Initiates your SQL Command
            {
                ddlCity.Enabled = false;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery3;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlCity.DataSource = cmd.ExecuteReader();
                    ddlCity.DataTextField = "CITY";
                    ddlCity.DataValueField = "CITY";
                    ddlCity.DataBind();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();                   
                }
            }

        }
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {        
            ddlCounty_Filter(sender, e);
            ddlCity_Filter(sender, e);        
    }

    protected void ddlCounty_SelectedIndexChanged(object sender, EventArgs e)
    {
            ddlState_Filter(sender, e);
            ddlCity_Filter(sender, e);        
    }

    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {        
            ddlState_Filter(sender, e);
            ddlCounty_Filter(sender, e);
    }

    protected void ddlState_Filter(object sender, EventArgs e)
    {

        var StateSelected = ddlState.SelectedItem.Value;
        ddlState.Items.Clear();
        ddlState.Items.Add(new ListItem("National", "ALL"));
        ddlState.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery2 = "SELECT DISTINCT STATE_LONG, STATE FROM PONDER.SURVEY_QUESTIONS WHERE COUNTY=:COUNTY AND CITY=:CITY AND STATE != 'ALL' ORDER BY STATE_LONG";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            {
                cmd.Parameters.Add(new OracleParameter(":COUNTY", ddlCounty.SelectedItem.Text));
                cmd.Parameters.Add(new OracleParameter(":CITY", ddlCity.SelectedItem.Text));
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery2;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlState.DataSource = cmd.ExecuteReader();
                    ddlState.DataTextField = "STATE_LONG";
                    ddlState.DataValueField = "STATE_LONG";
                    ddlState.DataBind();

                    ListItem iteminlist = new ListItem(StateSelected);

                    if (ddlState.Items.Contains(iteminlist))
                    {
                        ddlState.Items.FindByText(StateSelected).Selected = true;
                    }
                    else
                    {
                        ddlState.Items.FindByText("National").Selected = true;

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

    protected void ddlCounty_Filter(object sender, EventArgs e)
    {

        var CountySelected = ddlCounty.SelectedItem.Value;
        ddlCounty.Items.Clear();
        ddlCounty.Items.Add(new ListItem("ALL", "ALL"));
        ddlCounty.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery2 = "SELECT DISTINCT COUNTY FROM PONDER.SURVEY_QUESTIONS WHERE STATE_LONG=:STATE_LONG AND CITY=:CITY AND COUNTY != 'ALL' ORDER BY COUNTY";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            {
                cmd.Parameters.Add(new OracleParameter(":STATE_LONG", ddlState.SelectedItem.Text));
                cmd.Parameters.Add(new OracleParameter(":CITY", ddlCity.SelectedItem.Text));
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery2;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlCounty.DataSource = cmd.ExecuteReader();
                    ddlCounty.DataTextField = "COUNTY";
                    ddlCounty.DataValueField = "COUNTY";
                    ddlCounty.DataBind();

                    ListItem iteminlist = new ListItem(CountySelected);

                    if (ddlCounty.Items.Contains(iteminlist))
                    {
                        ddlCounty.Items.FindByText(CountySelected).Selected = true;
                    }
                    else
                    {
                        ddlCounty.Items.FindByText("ALL").Selected = true;

                    }

                    if (ddlCounty.Items.Count > 1)
                    {
                        ddlCounty.Enabled = true;
                    }
                    else
                    {
                        ddlCounty.Enabled = false;
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

    protected void ddlCity_Filter(object sender, EventArgs e)
    {

        var CitySelected = ddlCity.SelectedItem.Value;
        ddlCity.Items.Clear();
        ddlCity.Items.Add(new ListItem("ALL", "ALL"));
        ddlCity.AppendDataBoundItems = true;

        String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery2 = "SELECT DISTINCT CITY FROM PONDER.SURVEY_QUESTIONS WHERE STATE_LONG=:STATE_LONG AND COUNTY=:COUNTY AND CITY != 'ALL' ORDER BY CITY";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery2)) // Initiates your SQL Command
            {
                cmd.Parameters.Add(new OracleParameter(":STATE_LONG", ddlState.SelectedItem.Value));
                cmd.Parameters.Add(new OracleParameter(":COUNTY", ddlCounty.SelectedItem.Text));
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery2;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    ddlCity.DataSource = cmd.ExecuteReader();
                    ddlCity.DataTextField = "CITY";
                    ddlCity.DataValueField = "CITY";
                    ddlCity.DataBind();

                    ListItem iteminlist = new ListItem(CitySelected);

                    if (ddlCity.Items.Contains(iteminlist))
                    {
                        ddlCity.Items.FindByText(CitySelected).Selected = true;
                    }
                    else
                    {
                        ddlCity.Items.FindByText("ALL").Selected = true;

                    }

                    if (ddlCity.Items.Count > 1)
                    {
                        ddlCity.Enabled = true;
                    }
                    else
                    {
                        ddlCity.Enabled = false;
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

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlInitial_Filter(sender, e);
    }

    [WebMethod]
    public static string GetQuestions(string stateVariable, string countyVariable, string cityVariable)
    {
        //Construction Started        
        string sql = @"SELECT STATE_LONG, STATE, COUNTY, CITY, QUESTION1, QUESTION2, QUESTION3, QUESTION4, QUESTION5, QUESTION6, QUESTION7, QUESTION8, MESSAGE1, MESSAGE2, MESSAGE3
            FROM PONDER.SURVEY_QUESTIONS
            WHERE STATE_LONG = '" + stateVariable + @"'            
            AND COUNTY = '" + countyVariable + @"'
            AND CITY = '" + cityVariable + @"'";

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