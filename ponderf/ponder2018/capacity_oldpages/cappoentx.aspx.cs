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

public partial class capacity_cappoentx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string Getdonut1_Drilldown()
    {
        string sql = @"SELECT MOD_CODE, PRODUCT_GROUP,
COUNT(ONAIR_FORECAST) AS POE_2018,
COUNT(ONAIR_ACTUAL) AS YTD_COMPLETE,
COUNT(ONAIR_FORECAST) - COUNT(ONAIR_ACTUAL) AS REMAINING,
ROUND((COUNT(ONAIR_ACTUAL) * 100 / COUNT(ONAIR_FORECAST)),2) AS PERCENT_COMPLETE,
SUM(CASE WHEN ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE THEN 1 ELSE 0 END) AS BEFORENBD,
SUM(CASE WHEN (ONAIR_ACTUAL > CURRENT_NEED_BY_DATE AND ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE + 90) THEN 1 ELSE 0 END) AS WITHIN90NBD,
SUM(CASE WHEN ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90 THEN 1 ELSE 0 END) AS AFTER90NBD, 
SUM(CASE WHEN (TO_CHAR(ONAIR_FORECAST, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM') AND ONAIR_ACTUAL IS NULL) THEN 1 ELSE 0 END) AS CURRENTMONTH,  
SUM(CASE WHEN (TO_CHAR(ONAIR_FORECAST, 'YYYY-MM') = TO_CHAR(ADD_MONTHS(SYSDATE, 1), 'YYYY-MM') AND ONAIR_ACTUAL IS NULL) THEN 1 ELSE 0 END) AS NEXTMONTH,
COUNT(ONAIR_FORECAST) - COUNT(ONAIR_ACTUAL) - SUM(CASE WHEN (TO_CHAR(ONAIR_FORECAST, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM') AND ONAIR_ACTUAL IS NULL) THEN 1 ELSE 0 END)
- SUM(CASE WHEN (TO_CHAR(ONAIR_FORECAST, 'YYYY-MM') = TO_CHAR(ADD_MONTHS(SYSDATE, 1), 'YYYY-MM') AND ONAIR_ACTUAL IS NULL) THEN 1 ELSE 0 END)AS REMAINFORECAST
FROM COAR.PACE_POE
WHERE (STATUS = 'Active' OR STATUS = 'Complete')
  AND NATIONAL_PROGRAM = 'NSB'
  AND PRODUCT_GROUP = 'New Site'
  AND (POE_NAME = '2018 + NSB' OR POE_NAME = '2019 + NSB')
  AND (MARKET = 'ILLINOIS/WISCONSIN'
      OR MARKET = 'ND/SD/NE/MN/IA' 
      OR MARKET = 'MISSOURI/KANSAS' 
      OR MARKET = 'ARKANSAS/OKLAHOMA' 
      OR MARKET = 'NORTH TEXAS'
      OR MARKET = 'SOUTH TEXAS')
  AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2018'
GROUP BY MOD_CODE, PRODUCT_GROUP
ORDER BY MOD_CODE
"; //store your sql query in this string variable "sql"
        http://localhost:53262/capacity/haccordion.css
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
    public static string GetTest1_Tab()
    {
        string sql = @"select * from ponder.donut1_view
"; //store your sql query in this string variable "sql"
        http://localhost:53262/capacity/haccordion.css
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