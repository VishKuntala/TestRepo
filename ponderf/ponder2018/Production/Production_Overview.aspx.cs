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

public partial class Production_Production_Overview : System.Web.UI.Page
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

                                if (oraclestring1 == "ADMIN" || oraclestring1 == "ACE" || oraclestring1 == "SAMBAR_DIRECTS_CHAINUP")
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

        ddlMarketType.Items.Add(new ListItem("SALES - VPGM MARKETS", "SALES - VPGM MARKETS"));
        ddlMarketType.Items.Add(new ListItem("SALES - REGIONS", "SALES - REGIONS"));
        ddlMarketType.Items.Add(new ListItem("ACE - MARKETS", "ACE - MARKETS"));
        ddlMarketType.Items.Add(new ListItem("ACE - AVPS", "ACE - AVPS"));
        ddlMarketType.Items.Add(new ListItem("ACE - REGIONS", "ACE - REGIONS"));
        ddlMarketType.DataBind();
        ddlMarketType.SelectedIndex = 2;
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
        string sql = @"SELECT TO_CHAR(EXECUTED_ON, 'MM-DD-YYYY') AS DATADATE
        FROM PONDER.PACE_POE_2020_PPTP 
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
    public static string Get_Production_Numbers(string MarketTypeVariable, string pptpOneVariable, string pptpTwoVariable, string pptpThreeVariable, string pptpFourVariable, string pptpFiveVariable)
    {
        //First one is Sales VPGM Markets
        string sql = @"SELECT SALES_REGION AS LARGE_GEO, SALES_VPGM_MARKET AS SMALL_GEO, PLAN, FCST, ACT, YTDPLAN, PUSH, PULL, BOTH,
                    FCST - PLAN AS FCST_PLAN_DELTA,
                    FCST - ACT AS FCST_ACT_DELTA,
                    PLAN - ACT AS PLAN_ACT_DELTA,
                    ACT - YTDPLAN AS ACT_YTDPLAN_DELTA,
                    CASE WHEN YTDPLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / YTDPLAN * 100, 0), '999'),'%') END AS ACT_YTDPLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / PLAN * 100, 0), '999'),'%') END AS ACT_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(FCST / PLAN * 100, 0), '999'),'%') END AS FCST_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(BOTH / PLAN * 100, 0), '999'),'%') END AS BOTH_PLAN_PERCENT                    
                    FROM(
                    SELECT SALES_REGION, SALES_VPGM_MARKET,
                    SUM(CASE WHEN CY_POE = 'Y' THEN 1 ELSE 0 END) AS PLAN,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS FCST,
                    SUM(CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND ONAIR_ACTUAL <= EXECUTED_ON THEN 1 ELSE 0 END) AS ACT,
                    SUM(CASE WHEN CY_POE = 'Y' AND ONAIR_PLAN <= EXECUTED_ON THEN 1 ELSE 0 END) AS YTDPLAN,
                    SUM(CASE WHEN CY_PUSH = 1 THEN 1 ELSE 0 END) AS PUSH,
                    SUM(CASE WHEN CY_PULL = 1 THEN 1 ELSE 0 END) AS PULL,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND CY_POE = 'Y' THEN 1 ELSE 0 END) AS BOTH
                    FROM PONDER.PACE_POE_2020_PPTP
                    WHERE (CY_POE = 'Y' OR ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) OR ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    GROUP BY SALES_REGION, SALES_VPGM_MARKET
                    ) ORDER BY ACT DESC
                    ";

        if (MarketTypeVariable == "SALES - REGIONS")
        {

            sql = @"SELECT SALES_REGION AS LARGE_GEO, SALES_REGION AS SMALL_GEO, PLAN, FCST, ACT, YTDPLAN, PUSH, PULL, BOTH,
                    FCST - PLAN AS FCST_PLAN_DELTA,
                    FCST - ACT AS FCST_ACT_DELTA,
                    PLAN - ACT AS PLAN_ACT_DELTA,
                    ACT - YTDPLAN AS ACT_YTDPLAN_DELTA,
                    CASE WHEN YTDPLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / YTDPLAN * 100, 0), '999'),'%') END AS ACT_YTDPLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / PLAN * 100, 0), '999'),'%') END AS ACT_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(FCST / PLAN * 100, 0), '999'),'%') END AS FCST_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(BOTH / PLAN * 100, 0), '999'),'%') END AS BOTH_PLAN_PERCENT
                    FROM(
                    SELECT SALES_REGION, 
                    SUM(CASE WHEN CY_POE = 'Y' THEN 1 ELSE 0 END) AS PLAN,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS FCST,
                    SUM(CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND ONAIR_ACTUAL <= EXECUTED_ON THEN 1 ELSE 0 END) AS ACT,
                    SUM(CASE WHEN CY_POE = 'Y' AND ONAIR_PLAN <= EXECUTED_ON THEN 1 ELSE 0 END) AS YTDPLAN,
                    SUM(CASE WHEN CY_PUSH = 1 THEN 1 ELSE 0 END) AS PUSH,
                    SUM(CASE WHEN CY_PULL = 1 THEN 1 ELSE 0 END) AS PULL,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND CY_POE = 'Y' THEN 1 ELSE 0 END) AS BOTH
                    FROM PONDER.PACE_POE_2020_PPTP
                    WHERE (CY_POE = 'Y' OR ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) OR ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    GROUP BY SALES_REGION
                    ) ORDER BY ACT DESC
                    ";

        }


        else if (MarketTypeVariable == "ACE - MARKETS")
        {

            sql = @"SELECT RAN_REGION AS LARGE_GEO, RAN_MARKET AS SMALL_GEO, PLAN, FCST, ACT, YTDPLAN, PUSH, PULL, BOTH,
                    FCST - PLAN AS FCST_PLAN_DELTA,
                    FCST - ACT AS FCST_ACT_DELTA,
                    PLAN - ACT AS PLAN_ACT_DELTA,
                    ACT - YTDPLAN AS ACT_YTDPLAN_DELTA,
                    CASE WHEN YTDPLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / YTDPLAN * 100, 0), '999'),'%') END AS ACT_YTDPLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / PLAN * 100, 0), '999'),'%') END AS ACT_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(FCST / PLAN * 100, 0), '999'),'%') END AS FCST_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(BOTH / PLAN * 100, 0), '999'),'%') END AS BOTH_PLAN_PERCENT
                    FROM(
                    SELECT RAN_REGION, RAN_MARKET,
                    SUM(CASE WHEN CY_POE = 'Y' THEN 1 ELSE 0 END) AS PLAN,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS FCST,
                    SUM(CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND ONAIR_ACTUAL <= EXECUTED_ON THEN 1 ELSE 0 END) AS ACT,
                    SUM(CASE WHEN CY_POE = 'Y' AND ONAIR_PLAN <= EXECUTED_ON THEN 1 ELSE 0 END) AS YTDPLAN,
                    SUM(CASE WHEN CY_PUSH = 1 THEN 1 ELSE 0 END) AS PUSH,
                    SUM(CASE WHEN CY_PULL = 1 THEN 1 ELSE 0 END) AS PULL,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND CY_POE = 'Y' THEN 1 ELSE 0 END) AS BOTH
                    FROM PONDER.PACE_POE_2020_PPTP
                    WHERE (CY_POE = 'Y' OR ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) OR ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    GROUP BY RAN_REGION, RAN_MARKET
                    ) ORDER BY ACT DESC
                    ";

        }

        else if (MarketTypeVariable == "ACE - AVPS")
        {

            sql = @"SELECT RAN_REGION AS LARGE_GEO, RAN_AVP AS SMALL_GEO, PLAN, FCST, ACT, YTDPLAN, PUSH, PULL, BOTH,
                    FCST - PLAN AS FCST_PLAN_DELTA,
                    FCST - ACT AS FCST_ACT_DELTA,
                    PLAN - ACT AS PLAN_ACT_DELTA,
                    ACT - YTDPLAN AS ACT_YTDPLAN_DELTA,
                    CASE WHEN YTDPLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / YTDPLAN * 100, 0), '999'),'%') END AS ACT_YTDPLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / PLAN * 100, 0), '999'),'%') END AS ACT_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(FCST / PLAN * 100, 0), '999'),'%') END AS FCST_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(BOTH / PLAN * 100, 0), '999'),'%') END AS BOTH_PLAN_PERCENT
                    FROM(
                    SELECT RAN_REGION, RAN_AVP,
                    SUM(CASE WHEN CY_POE = 'Y' THEN 1 ELSE 0 END) AS PLAN,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS FCST,
                    SUM(CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND ONAIR_ACTUAL <= EXECUTED_ON THEN 1 ELSE 0 END) AS ACT,
                    SUM(CASE WHEN CY_POE = 'Y' AND ONAIR_PLAN <= EXECUTED_ON THEN 1 ELSE 0 END) AS YTDPLAN,
                    SUM(CASE WHEN CY_PUSH = 1 THEN 1 ELSE 0 END) AS PUSH,
                    SUM(CASE WHEN CY_PULL = 1 THEN 1 ELSE 0 END) AS PULL,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND CY_POE = 'Y' THEN 1 ELSE 0 END) AS BOTH
                    FROM PONDER.PACE_POE_2020_PPTP
                    WHERE (CY_POE = 'Y' OR ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) OR ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    GROUP BY RAN_REGION, RAN_AVP
                    ) ORDER BY ACT DESC
                    ";

        }

        else if (MarketTypeVariable == "ACE - REGIONS")
        {

            sql = @"SELECT RAN_REGION AS LARGE_GEO, RAN_REGION AS SMALL_GEO, PLAN, FCST, ACT, YTDPLAN, PUSH, PULL, BOTH,
                    FCST - PLAN AS FCST_PLAN_DELTA,
                    FCST - ACT AS FCST_ACT_DELTA,
                    PLAN - ACT AS PLAN_ACT_DELTA,
                    ACT - YTDPLAN AS ACT_YTDPLAN_DELTA,
                    CASE WHEN YTDPLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / YTDPLAN * 100, 0), '999'),'%') END AS ACT_YTDPLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(ACT / PLAN * 100, 0), '999'),'%') END AS ACT_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(FCST / PLAN * 100, 0), '999'),'%') END AS FCST_PLAN_PERCENT,
                    CASE WHEN PLAN = 0 THEN '-' ELSE CONCAT(TO_CHAR(ROUND(BOTH / PLAN * 100, 0), '999'),'%') END AS BOTH_PLAN_PERCENT
                    FROM(
                    SELECT RAN_REGION, 
                    SUM(CASE WHEN CY_POE = 'Y' THEN 1 ELSE 0 END) AS PLAN,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) THEN 1 ELSE 0 END) AS FCST,
                    SUM(CASE WHEN ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND ONAIR_ACTUAL <= EXECUTED_ON THEN 1 ELSE 0 END) AS ACT,
                    SUM(CASE WHEN CY_POE = 'Y' AND ONAIR_PLAN <= EXECUTED_ON THEN 1 ELSE 0 END) AS YTDPLAN,
                    SUM(CASE WHEN CY_PUSH = 1 THEN 1 ELSE 0 END) AS PUSH,
                    SUM(CASE WHEN CY_PULL = 1 THEN 1 ELSE 0 END) AS PULL,
                    SUM(CASE WHEN ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) AND CY_POE = 'Y' THEN 1 ELSE 0 END) AS BOTH
                    FROM PONDER.PACE_POE_2020_PPTP
                    WHERE (CY_POE = 'Y' OR ONAIR_FORECAST_YEAR = EXTRACT(YEAR FROM EXECUTED_ON) OR ONAIR_ACTUAL_YEAR = EXTRACT(YEAR FROM EXECUTED_ON))
                    AND PPTP_CUSTOM_ONE LIKE ('" + pptpOneVariable + @"')
                    AND PPTP_CUSTOM_TWO LIKE ('" + pptpTwoVariable + @"')
                    AND PPTP_CUSTOM_THREE LIKE ('" + pptpThreeVariable + @"')
                    AND PPTP_CUSTOM_FOUR LIKE ('" + pptpFourVariable + @"')
                    AND PPTP_CUSTOM_FIVE LIKE ('" + pptpFiveVariable + @"')
                    GROUP BY RAN_REGION
                    ) ORDER BY ACT DESC
                    ";

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


   



}