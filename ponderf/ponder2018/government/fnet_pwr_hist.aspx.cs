using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.Services;
using Oracle.ManagedDataAccess.Client; //needed for connecting to AXIOM (or any oracle server)

public partial class government_fnet_pwr_hist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetPWRHIST()
    {
        //Construction Started
        string sql = @"
            SELECT sum(pmoss_data_missing) pmoss_data_missing,
            sum(locked) locked," +
            "sum(\">46\") \"pwr>46\"," +
            "sum(\"46\") \"pwr46\"," +
            "sum(\"45\") \"pwr45\"," +
            "sum(\"44\") \"pwr44\"," +
            "sum(\"43\") \"pwr43\"," +
            "sum(\"42\") \"pwr42\"," +
            "sum(\"41\") \"pwr41\"," +
            "sum(\"40\") \"pwr40\"," +
            "sum(\"39\") \"pwr39\"," +
            "sum(\"36to38\") \"pwr36to38\"," +
            "sum(\"33to35\") \"pwr33to35\"," +
            "sum(\"29to32\") \"pwr29to32\"," +
            "sum(\"<=28\") \"pwr<=28\"" +
            "FROM ponder.FN_PWR_HIST";

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
    public static string GetPWRHIST_MARKET()
    {
        //Construction Started
        string sql = @"SELECT market, sum(pmoss_data_missing) pmoss_data_missing,
            sum(locked) locked," +
            "sum(\">46\") \"pwr>46\"," +
            "sum(\"46\") \"pwr46\"," +
            "sum(\"45\") \"pwr45\"," +
            "sum(\"44\") \"pwr44\"," +
            "sum(\"43\") \"pwr43\"," +
            "sum(\"42\") \"pwr42\"," +
            "sum(\"41\") \"pwr41\"," +
            "sum(\"40\") \"pwr40\"," +
            "sum(\"39\") \"pwr39\"," +
            "sum(\"36to38\") \"pwr36to38\"," +
            "sum(\"33to35\") \"pwr33to35\"," +
            "sum(\"29to32\") \"pwr29to32\"," +
            "sum(\"<=28\") \"pwr<=28\"" +
            "FROM ponder.fn_pwr_hist GROUP BY market ORDER BY market";

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
    public static string GetPWRHIST_MARKETPIE()
    {
        //Construction Started
        string sql = @"SELECT market," +
"sum(\">46\"+\"46\") \"PWR>46\", sum(\"45\"+\"44\"+\"43\"+\"42\"+\"41\"+\"39\"+\"36to38\"+\"33to35\"+\"29to32\"+\"<=28\") \"PWR<46\"," +
"sum(locked) locked, sum(pmoss_data_missing) pmoss_data_missing FROM ponder.fn_pwr_hist group by market order by market";

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
    public static string GetPWRHIST_SUBMARKETPIE()
    {
        //Construction Started
        string sql = @"SELECT market, submarket," +
"sum(\">46\"+\"46\") \"PWR>46\", sum(\"45\"+\"44\"+\"43\"+\"42\"+\"41\"+\"39\"+\"36to38\"+\"33to35\"+\"29to32\"+\"<=28\") \"PWR<46\"," +
"sum(locked) locked, sum(pmoss_data_missing) pmoss_data_missing FROM ponder.fn_pwr_hist GROUP BY market, submarket ORDER  BY market, submarket";

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