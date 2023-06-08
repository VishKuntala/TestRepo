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


public partial class capacity_cappoeilwi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetMacroSummary()
    {
        string sql = @"SELECT PRODUCT_GROUP, POE_NAME,
    COUNT(CASE WHEN TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2017' THEN PACE_NUMBER END) AS F_2017,
    COUNT(CASE WHEN TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = '2017' THEN PACE_NUMBER END) AS NBD_2017,
    COUNT(CASE WHEN TO_CHAR(ONAIR_ACTUAL, 'YYYY') = '2017' THEN PACE_NUMBER END) AS A_2017,
    COUNT(CASE WHEN TO_CHAR(ONAIR_FORECAST, 'MM-YYYY') = '01-2018' THEN PACE_NUMBER END) AS F_JAN_18,
    COUNT(CASE WHEN TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-YYYY') = '01-2018' THEN PACE_NUMBER END) AS NBD_JAN_18,
    COUNT(CASE WHEN TO_CHAR(ONAIR_ACTUAL, 'MM-YYYY') = '01-2018' THEN PACE_NUMBER END) AS A_JAN_18,
    COUNT(CASE WHEN TO_CHAR(ONAIR_FORECAST, 'MM-YYYY') = '02-2018' THEN PACE_NUMBER END) AS F_FEB_18,
    COUNT(CASE WHEN TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-YYYY') = '02-2018' THEN PACE_NUMBER END) AS NBD_FEB_18,
    COUNT(CASE WHEN TO_CHAR(ONAIR_ACTUAL, 'MM-YYYY') = '02-2018' THEN PACE_NUMBER END) AS A_FEB_18,
    COUNT(CASE WHEN TO_CHAR(ONAIR_FORECAST, 'MM-YYYY') = '03-2018' THEN PACE_NUMBER END) AS F_MAR_18,
    COUNT(CASE WHEN TO_CHAR(CURRENT_NEED_BY_DATE, 'MM-YYYY') = '03-2018' THEN PACE_NUMBER END) AS NBD_MAR_18,
    COUNT(CASE WHEN TO_CHAR(ONAIR_ACTUAL, 'MM-YYYY') = '03-2018' THEN PACE_NUMBER END) AS A_MAR_18
FROM COAR.PACE_POE
WHERE STRATEGIC_DRIVER = '2018'
AND (POE_NAME = '2018 + CRAN'
      OR POE_NAME = '2018 + LTE'
      OR POE_NAME = '2018 + LTE 2C'
      OR POE_NAME = '2018 + LTE 3C'
      OR POE_NAME = '2018 + LTE 4C'
      OR POE_NAME = '2018 + LTE 5C'
      OR POE_NAME = '2018 + LTE 6C'
      OR POE_NAME = '2018 + LTE 7C'
      OR POE_NAME = '2018 + LTE Additional Carrier'
      OR POE_NAME = '2018 + LTE Extended Carrier'
      OR POE_NAME = '2018 + LTE Multi Carrier'
      OR POE_NAME = '2018 + LTE NSB'
      OR POE_NAME = '2018 + NSB'
      OR POE_NAME = '2018 + WLL eNode B')
AND (MARKET = 'ILLINOIS/WISCONSIN'
      OR MARKET = 'ND/SD/NE/MN/IA' 
      OR MARKET = 'MISSOURI/KANSAS' 
      OR MARKET = 'ARKANSAS/OKLAHOMA' 
      OR MARKET = 'NORTH TEXAS'
      OR MARKET = 'SOUTH TEXAS')
GROUP BY POE_NAME, PRODUCT_GROUP
ORDER BY POE_NAME "; //store your sql query in this string variable "sql"

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
    public static string Getdonut5()
    {
        //Construction Started
        string sql = @"select *  from (select count(ONAIR_FORECAST) as score,
             PACE_NUMBER as title,
             TO_CHAR(ONAIR_FORECAST, 'MM-DD-YYYY') as duedate
          from COAR.PACE_POE
         group by PACE_NUMBER, ONAIR_FORECAST
         order by count(ONAIR_FORECAST) desc
       )
 where rownum = 1 ";

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