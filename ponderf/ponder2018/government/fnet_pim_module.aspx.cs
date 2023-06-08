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

public partial class government_fnet_pim_module : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetFNPIMMITIGATION()
    {
        //Construction Started
        string sql = @"SELECT region, 
                              market, 
                              nvl(sum(fnpoe2018), 0) fnpoe2018, 
                              nvl(sum(ci035), 0) ci035,
                              nvl(sum(ci032), 0) ci032,
                              nvl(sum(pendingtriage), 0) pendingtriage,
                              nvl(sum(event3e), 0) event3e,
                              nvl(sum(event6a), 0) event6a,
                              nvl(sum(event9a), 0) event9a,
                              nvl(sum(event2e), 0) event2e
                       FROM ponder.FN_PIM_MITIGATION
                       GROUP BY region, market
                       ORDER BY market";

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
    public static string GetFNPIMMITIGATION_SUBMARKET()
    {
        //Construction Started
        string sql = @"SELECT region,
                       market,
                       submarket,
                       NVL(fnpoe2018, 0) fnpoe2018,
                       NVL(ci035, 0) ci035,
                       NVL(ci032, 0) ci032,
                       NVL(pendingtriage, 0) pendingtriage,
                       NVL(event3e, 0) event3e,
                       NVL(event6a, 0) event6a,
                       NVL(event9a, 0) event9a,
                       NVL(event2e, 0) event2e
                       FROM ponder.FN_PIM_MITIGATION order by market, submarket";

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