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

public partial class _Default : System.Web.UI.Page
    {
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string GetSunburst1()
    {
        //Construction Started
        string sql = @"SELECT * FROM SUNBURST_DEMO
";

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
    public static string GetProject_AllIn()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.PROJECT_ALLIN
";

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
    public static string GetFORECAST_ATTAIN_ALLIN()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.FORECAST_ATTAIN_ALLIN WHERE PROJECT = 'ALLIN'
";

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
    public static string GetFORECAST_ATTAIN_ALLIN_30CH()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.FORECAST_ATTAIN_ALLIN WHERE PROJECT = 'ALLIN' ORDER BY MONTH_DATA
";

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
    public static string GetFORECAST_ATTAIN_ALLIN_90CH()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.FORECAST_ATTAIN_ALLIN WHERE PROJECT = 'ALLIN' ORDER BY MONTH_DATA
";

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
    public static string GetProject_AllIn_FA()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.PROJECT_ALLIN_FA
";

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
    public static string GetCEN2018POEALLIN()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.PROJECT_ALLIN_CHART";

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
    public static string GetDashboardMARKET()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASHBOARD_MARKET ORDER BY N_TO_S";

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
    public static string GetDashboardMARKET_2()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASHBOARD_MARKET_2 ORDER BY N_TO_S";

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
    public static string Getdonut1()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASHBOARD_DONUT_1
";

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
    public static string Getdonut2()
    {
        //Construction Started
        string sql = @"SELECT * FROM PONDER.DASHBOARD_DONUT_2";

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
    public static string Getdonut3()
    {
        //Construction Started
        string sql = @"SELECT
FORECAST.NATIONAL_PROGRAM,
PLANJOBS.POE_2018,
FORECAST.FORECAST,
FORECAST.YTD_COMPLETE,
FORECAST.PERCENT_COMPLETE,
PLANJOBS.YTDPOE_2018,
ACTVSPLAN.PLANVSACT,
FORE1Q,
FORE2Q,
FORE3Q,
FORE4Q,
FORECAST.PREVMONTHSCOMP,
FORECAST.LASTMONTHCOMP,
FORECAST.CURRMONTHCOMP,
FORECAST.BEFORENBD,
FORECAST.BNBD_PERCCOMP,
FORECAST.WITHIN90NBD,
FORECAST.W90NBD_PERCCOMP,
FORECAST.AFTER90NBD,
FORECAST.A90NBD_PERCCOMP,
FORECAST.CURRENTMONTH,
FORECAST.NEXTMONTH

FROM (
SELECT NATIONAL_PROGRAM,
          COUNT (ONAIR_FORECAST) AS FORECAST,
          COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
          ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2)
             AS PERCENT_COMPLETE,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') <
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS PREVMONTHSCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS LASTMONTHCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (SYSDATE, 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRMONTHCOMP,
          SUM (
             CASE WHEN ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE THEN 1 ELSE 0 END)
             AS BEFORENBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS BNBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                      AND ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE + 90)
                THEN
                   1
                ELSE
                   0
             END)
             AS WITHIN90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                                  AND ONAIR_ACTUAL <=
                                         CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS W90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90 THEN 1
                ELSE 0
             END)
             AS AFTER90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS A90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (SYSDATE, 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRENTMONTH,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS NEXTMONTH,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '01-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '02-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '03-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE1Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '04-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '05-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '06-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE2Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '07-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '08-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '09-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE3Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '10-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '11-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '12-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE4Q
             
             
   FROM PONDER.PACE_POE
   WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'CRAN'
         AND (PRODUCT_GROUP = 'CRAN - Build' OR PRODUCT_GROUP = 'CRAN - Buy')
         AND (   PRODUCT_SUBGROUP = 'LTE1C - Micro Cell'
              OR PRODUCT_SUBGROUP = 'LTE1C - Micro Cell Anchor'
              OR PRODUCT_SUBGROUP = 'LTE1C - Pico Cell'
              OR PRODUCT_SUBGROUP = 'LTE1C - Pico Cell Anchor')
         AND (POE_NAME = '2018 + CRAN' OR POE_NAME = '2019 + CRAN')
         AND REGION = 'CENTRAL'
         AND TO_CHAR (ONAIR_FORECAST, 'YYYY') = '2018'
         GROUP BY NATIONAL_PROGRAM
   ) FORECAST
   
   LEFT JOIN (
      SELECT NATIONAL_PROGRAM,
      COUNT (ONAIR_PLAN) AS POE_2018,
      COUNT(CASE WHEN (ONAIR_PLAN) <= sysdate THEN PACE_NUMBER END) AS YTDPOE_2018
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'CRAN'
         AND (PRODUCT_GROUP = 'CRAN - Build' OR PRODUCT_GROUP = 'CRAN - Buy')
         AND (   PRODUCT_SUBGROUP = 'LTE1C - Micro Cell'
              OR PRODUCT_SUBGROUP = 'LTE1C - Micro Cell Anchor'
              OR PRODUCT_SUBGROUP = 'LTE1C - Pico Cell'
              OR PRODUCT_SUBGROUP = 'LTE1C - Pico Cell Anchor')
         AND (POE_NAME = '2018 + CRAN' OR POE_NAME = '2019 + CRAN')
         AND REGION = 'CENTRAL'
        AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018'
      GROUP BY NATIONAL_PROGRAM
      ) PLANJOBS ON FORECAST.NATIONAL_PROGRAM = PLANJOBS.NATIONAL_PROGRAM
      
    LEFT JOIN ( 
      SELECT NATIONAL_PROGRAM,
      COUNT(CASE WHEN (ONAIR_ACTUAL <= sysdate) AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2018' THEN PACE_NUMBER END) -
      COUNT(CASE WHEN (ONAIR_PLAN <= sysdate) AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018' THEN PACE_NUMBER END) AS PLANVSACT
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'CRAN'
         AND (PRODUCT_GROUP = 'CRAN - Build' OR PRODUCT_GROUP = 'CRAN - Buy')
         AND (   PRODUCT_SUBGROUP = 'LTE1C - Micro Cell'
              OR PRODUCT_SUBGROUP = 'LTE1C - Micro Cell Anchor'
              OR PRODUCT_SUBGROUP = 'LTE1C - Pico Cell'
              OR PRODUCT_SUBGROUP = 'LTE1C - Pico Cell Anchor')
         AND (POE_NAME = '2018 + CRAN' OR POE_NAME = '2019 + CRAN')
         AND REGION = 'CENTRAL'
      GROUP BY NATIONAL_PROGRAM
      ) ACTVSPLAN ON FORECAST.NATIONAL_PROGRAM = ACTVSPLAN.NATIONAL_PROGRAM";

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
    public static string Getdonut4()
    {
        //Construction Started
        string sql = @"SELECT
FORECAST.PRODUCT_GROUP,
PLANJOBS.POE_2018,
FORECAST.FORECAST,
FORECAST.YTD_COMPLETE,
FORECAST.PERCENT_COMPLETE,
PLANJOBS.YTDPOE_2018,
ACTVSPLAN.PLANVSACT,
FORE1Q,
FORE2Q,
FORE3Q,
FORE4Q,
FORECAST.PREVMONTHSCOMP,
FORECAST.LASTMONTHCOMP,
FORECAST.CURRMONTHCOMP,
FORECAST.BEFORENBD,
FORECAST.BNBD_PERCCOMP,
FORECAST.WITHIN90NBD,
FORECAST.W90NBD_PERCCOMP,
FORECAST.AFTER90NBD,
FORECAST.A90NBD_PERCCOMP,
FORECAST.CURRENTMONTH,
FORECAST.NEXTMONTH

FROM (
SELECT PRODUCT_GROUP,
          COUNT (ONAIR_FORECAST) AS FORECAST,
          COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
          ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2)
             AS PERCENT_COMPLETE,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') <
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS PREVMONTHSCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS LASTMONTHCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (SYSDATE, 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRMONTHCOMP,
          SUM (
             CASE WHEN ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE THEN 1 ELSE 0 END)
             AS BEFORENBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS BNBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                      AND ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE + 90)
                THEN
                   1
                ELSE
                   0
             END)
             AS WITHIN90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                                  AND ONAIR_ACTUAL <=
                                         CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS W90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90 THEN 1
                ELSE 0
             END)
             AS AFTER90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS A90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (SYSDATE, 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRENTMONTH,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS NEXTMONTH,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '01-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '02-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '03-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE1Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '04-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '05-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '06-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE2Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '07-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '08-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '09-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE3Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '10-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '11-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '12-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE4Q
             
             
   FROM PONDER.PACE_POE
   WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'LTE'
         AND (POE_NAME = '2018 + LTE' OR POE_NAME = '2019 + LTE')
         AND REGION = 'CENTRAL'
         AND TO_CHAR (ONAIR_FORECAST, 'YYYY') = '2018'
         GROUP BY PRODUCT_GROUP
   ) FORECAST
   
   LEFT JOIN (
      SELECT PRODUCT_GROUP,
      COUNT (ONAIR_PLAN) AS POE_2018,
      COUNT(CASE WHEN (ONAIR_PLAN) <= sysdate THEN PACE_NUMBER END) AS YTDPOE_2018
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'LTE'
         AND (POE_NAME = '2018 + LTE' OR POE_NAME = '2019 + LTE')
         AND REGION = 'CENTRAL'
         AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018'
      GROUP BY PRODUCT_GROUP
      ) PLANJOBS ON FORECAST.PRODUCT_GROUP = PLANJOBS.PRODUCT_GROUP
      
    LEFT JOIN ( 
      SELECT PRODUCT_GROUP,
      COUNT(CASE WHEN (ONAIR_ACTUAL <= sysdate) AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2018' THEN PACE_NUMBER END) -
      COUNT(CASE WHEN (ONAIR_PLAN <= sysdate) AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018' THEN PACE_NUMBER END) AS PLANVSACT
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'LTE'
         AND (POE_NAME = '2018 + LTE' OR POE_NAME = '2019 + LTE')
         AND REGION = 'CENTRAL'
      GROUP BY PRODUCT_GROUP
      ) ACTVSPLAN ON FORECAST.PRODUCT_GROUP = ACTVSPLAN.PRODUCT_GROUP";

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
    public static string Getdonut5()
    {
        //Construction Started
        string sql = @"SELECT
FORECAST.PRODUCT_GROUP,
PLANJOBS.POE_2018,
FORECAST.FORECAST,
FORECAST.YTD_COMPLETE,
FORECAST.PERCENT_COMPLETE,
PLANJOBS.YTDPOE_2018,
ACTVSPLAN.PLANVSACT,
FORE1Q,
FORE2Q,
FORE3Q,
FORE4Q,
FORECAST.PREVMONTHSCOMP,
FORECAST.LASTMONTHCOMP,
FORECAST.CURRMONTHCOMP,
FORECAST.BEFORENBD,
FORECAST.BNBD_PERCCOMP,
FORECAST.WITHIN90NBD,
FORECAST.W90NBD_PERCCOMP,
FORECAST.AFTER90NBD,
FORECAST.A90NBD_PERCCOMP,
FORECAST.CURRENTMONTH,
FORECAST.NEXTMONTH

FROM (
SELECT PRODUCT_GROUP,
          COUNT (ONAIR_FORECAST) AS FORECAST,
          COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
          ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2)
             AS PERCENT_COMPLETE,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') <
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS PREVMONTHSCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS LASTMONTHCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (SYSDATE, 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRMONTHCOMP,
          SUM (
             CASE WHEN ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE THEN 1 ELSE 0 END)
             AS BEFORENBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS BNBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                      AND ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE + 90)
                THEN
                   1
                ELSE
                   0
             END)
             AS WITHIN90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                                  AND ONAIR_ACTUAL <=
                                         CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS W90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90 THEN 1
                ELSE 0
             END)
             AS AFTER90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS A90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (SYSDATE, 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRENTMONTH,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS NEXTMONTH,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '01-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '02-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '03-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE1Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '04-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '05-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '06-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE2Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '07-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '08-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '09-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE3Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '10-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '11-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '12-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE4Q
             
             
   FROM PONDER.PACE_POE
   WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'Antenna Modifications'
         AND PRODUCT_GROUP = 'Antenna Modifications'
         AND PRODUCT_SUBGROUP = '4TXRX Antenna Retrofit'
         AND POE_NAME = 'CE + Antenna Modifications'
         AND REGION = 'CENTRAL'
         AND TO_CHAR (ONAIR_FORECAST, 'YYYY') = '2018'
         GROUP BY PRODUCT_GROUP
   ) FORECAST
   
   LEFT JOIN (
      SELECT PRODUCT_GROUP,
      COUNT (ONAIR_PLAN) AS POE_2018,
      COUNT(CASE WHEN (ONAIR_PLAN) <= sysdate THEN PACE_NUMBER END) AS YTDPOE_2018
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'Antenna Modifications'
         AND PRODUCT_GROUP = 'Antenna Modifications'
         AND PRODUCT_SUBGROUP = '4TXRX Antenna Retrofit'
         AND POE_NAME = 'CE + Antenna Modifications'
         AND REGION = 'CENTRAL'
        AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018'
      GROUP BY PRODUCT_GROUP
      ) PLANJOBS ON FORECAST.PRODUCT_GROUP = PLANJOBS.PRODUCT_GROUP
      
    LEFT JOIN ( 
      SELECT PRODUCT_GROUP,
      COUNT(CASE WHEN (ONAIR_ACTUAL <= sysdate) AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2018' THEN PACE_NUMBER END) -
      COUNT(CASE WHEN (ONAIR_PLAN <= sysdate) AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018' THEN PACE_NUMBER END) AS PLANVSACT
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND NATIONAL_PROGRAM = 'Antenna Modifications'
         AND PRODUCT_GROUP = 'Antenna Modifications'
         AND PRODUCT_SUBGROUP = '4TXRX Antenna Retrofit'
         AND POE_NAME = 'CE + Antenna Modifications'
         AND REGION = 'CENTRAL'
      GROUP BY PRODUCT_GROUP
      ) ACTVSPLAN ON FORECAST.PRODUCT_GROUP = ACTVSPLAN.PRODUCT_GROUP";

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
    public static string Getdonut6()
    {
        //Construction Started
        string sql = @"SELECT
FORECAST.RAN_REGION,
PLANJOBS.POE_2018,
FORECAST.FORECAST,
FORECAST.YTD_COMPLETE,
FORECAST.PERCENT_COMPLETE,
PLANJOBS.YTDPOE_2018,
ACTVSPLAN.PLANVSACT,
FORE1Q,
FORE2Q,
FORE3Q,
FORE4Q,
FORECAST.PREVMONTHSCOMP,
FORECAST.LASTMONTHCOMP,
FORECAST.CURRMONTHCOMP,
FORECAST.BEFORENBD,
FORECAST.BNBD_PERCCOMP,
FORECAST.WITHIN90NBD,
FORECAST.W90NBD_PERCCOMP,
FORECAST.AFTER90NBD,
FORECAST.A90NBD_PERCCOMP,
FORECAST.CURRENTMONTH,
FORECAST.NEXTMONTH

FROM (
SELECT RAN_REGION,
          COUNT (ONAIR_FORECAST) AS FORECAST,
          COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
          ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2)
             AS PERCENT_COMPLETE,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') <
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS PREVMONTHSCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (ADD_MONTHS (SYSDATE, -1), 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS LASTMONTHCOMP,
          SUM (
             CASE
                WHEN (TO_CHAR (ONAIR_ACTUAL, 'YYYY-MM') =
                         TO_CHAR (SYSDATE, 'YYYY-MM'))
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRMONTHCOMP,
          SUM (
             CASE WHEN ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE THEN 1 ELSE 0 END)
             AS BEFORENBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS BNBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                      AND ONAIR_ACTUAL <= CURRENT_NEED_BY_DATE + 90)
                THEN
                   1
                ELSE
                   0
             END)
             AS WITHIN90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (    ONAIR_ACTUAL > CURRENT_NEED_BY_DATE
                                  AND ONAIR_ACTUAL <=
                                         CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS W90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90 THEN 1
                ELSE 0
             END)
             AS AFTER90NBD,
          CASE
             WHEN COUNT (ONAIR_ACTUAL) = 0
             THEN
                0
             ELSE
                ROUND (
                   (  SUM (
                         CASE
                            WHEN (ONAIR_ACTUAL > CURRENT_NEED_BY_DATE + 90)
                            THEN
                               1
                            ELSE
                               0
                         END)
                    * 100
                    / COUNT (ONAIR_ACTUAL)),
                   2)
          END
             AS A90NBD_PERCCOMP,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (SYSDATE, 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS CURRENTMONTH,
          SUM (
             CASE
                WHEN (    TO_CHAR (ONAIR_FORECAST, 'YYYY-MM') =
                             TO_CHAR (ADD_MONTHS (SYSDATE, 1), 'YYYY-MM')
                      AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS NEXTMONTH,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '01-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '02-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '03-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE1Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '04-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '05-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '06-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE2Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '07-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '08-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '09-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE3Q,
          SUM (
             CASE
                WHEN (  (TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '10-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '11-2018' OR
                        TO_CHAR (ONAIR_FORECAST, 'MM-YYYY') = '12-2018')
                        AND ONAIR_ACTUAL IS NULL)
                THEN
                   1
                ELSE
                   0
             END)
             AS FORE4Q
             
             
   FROM PONDER.PACE_POE
   WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND (   NATIONAL_PROGRAM = 'LTE Additional Radio'
              OR NATIONAL_PROGRAM = 'LTE Extended Carrier'
              OR NATIONAL_PROGRAM = 'LTE Multi Carrier')
         AND (   PRODUCT_GROUP = 'LTE Additional Radio'
              OR PRODUCT_GROUP = 'LTE Extended Carrier'
              OR PRODUCT_GROUP = 'LTE Multi Carrier')
         AND PRODUCT_SUBGROUP <> 'Software Carrier'
         AND (   POE_NAME = '2018 + LTE Additional Radio'
              OR POE_NAME = '2018 + LTE Extended Carrier'
              OR POE_NAME = '2018 + LTE Multi Carrier'
              OR POE_NAME = '2019 + LTE Additional Radio'
              OR POE_NAME = '2019 + LTE Extended Carrier'
              OR POE_NAME = '2019 + LTE Multi Carrier')
         AND REGION = 'CENTRAL'
         AND TO_CHAR (ONAIR_FORECAST, 'YYYY') = '2018'
         GROUP BY RAN_REGION
   ) FORECAST
   
   LEFT JOIN (
      SELECT RAN_REGION,
      COUNT (ONAIR_PLAN) AS POE_2018,
      COUNT(CASE WHEN (ONAIR_PLAN) <= sysdate THEN PACE_NUMBER END) AS YTDPOE_2018
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND (   NATIONAL_PROGRAM = 'LTE Additional Radio'
              OR NATIONAL_PROGRAM = 'LTE Extended Carrier'
              OR NATIONAL_PROGRAM = 'LTE Multi Carrier')
         AND (   PRODUCT_GROUP = 'LTE Additional Radio'
              OR PRODUCT_GROUP = 'LTE Extended Carrier'
              OR PRODUCT_GROUP = 'LTE Multi Carrier')
         AND PRODUCT_SUBGROUP <> 'Software Carrier'
         AND (   POE_NAME = '2018 + LTE Additional Radio'
              OR POE_NAME = '2018 + LTE Extended Carrier'
              OR POE_NAME = '2018 + LTE Multi Carrier'
              OR POE_NAME = '2019 + LTE Additional Radio'
              OR POE_NAME = '2019 + LTE Extended Carrier'
              OR POE_NAME = '2019 + LTE Multi Carrier')
         AND REGION = 'CENTRAL'
        AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018'
      GROUP BY RAN_REGION
      ) PLANJOBS ON FORECAST.RAN_REGION = PLANJOBS.RAN_REGION
      
    LEFT JOIN ( 
      SELECT RAN_REGION,
      COUNT(CASE WHEN (ONAIR_ACTUAL <= sysdate) AND TO_CHAR(ONAIR_FORECAST, 'YYYY') = '2018' THEN PACE_NUMBER END) -
      COUNT(CASE WHEN (ONAIR_PLAN <= sysdate) AND TO_CHAR(ONAIR_PLAN, 'YYYY') = '2018' THEN PACE_NUMBER END) AS PLANVSACT
      FROM PONDER.PACE_POE
      WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
         AND (   NATIONAL_PROGRAM = 'LTE Additional Radio'
              OR NATIONAL_PROGRAM = 'LTE Extended Carrier'
              OR NATIONAL_PROGRAM = 'LTE Multi Carrier')
         AND (   PRODUCT_GROUP = 'LTE Additional Radio'
              OR PRODUCT_GROUP = 'LTE Extended Carrier'
              OR PRODUCT_GROUP = 'LTE Multi Carrier')
         AND PRODUCT_SUBGROUP <> 'Software Carrier'
         AND (   POE_NAME = '2018 + LTE Additional Radio'
              OR POE_NAME = '2018 + LTE Extended Carrier'
              OR POE_NAME = '2018 + LTE Multi Carrier'
              OR POE_NAME = '2019 + LTE Additional Radio'
              OR POE_NAME = '2019 + LTE Extended Carrier'
              OR POE_NAME = '2019 + LTE Multi Carrier')
         AND REGION = 'CENTRAL'
      GROUP BY RAN_REGION
      ) ACTVSPLAN ON FORECAST.RAN_REGION = ACTVSPLAN.RAN_REGION";

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
    //    [WebMethod]
    //    public static string GetDashboard1()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT 'NSB' as PROJECT,
    //      COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE STATUS IN ('Active', 'Complete')
    //          AND NATIONAL_PROGRAM = 'NSB'
    //          AND PRODUCT_GROUP = 'New Site'
    //          AND (POE_NAME = '2018 + NSB' OR POE_NAME = '2019 + NSB')
    //          AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //          AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //UNION ALL
    //SELECT 'LTE 1C' as PROJECT,
    //      COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //    WHERE STATUS IN ('Active', 'Complete')
    //          AND NATIONAL_PROGRAM = 'LTE' 
    //          AND POE_NAME IN ('2018 + LTE', '2019 + LTE')
    //          AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //          AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //UNION ALL
    //SELECT 'LTE AC' as PROJECT,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE STATUS IN ('Active', 'Complete')
    //          AND NATIONAL_PROGRAM IN ('LTE 2C', 'LTE 3C','LTE 4C', 'LTE 5C', 'LTE 6C', 'LTE 7C')    
    //          AND POE_NAME IN ('2018 + LTE 2C', '2019 + LTE 2C', '2017 + LTE 2C', '2018 + LTE 3C', '2019 + LTE 3C', '2017 + LTE 3C',
    //            '2018 + LTE 4C', '2019 + LTE 4C', '2017 + LTE 4C', '2018 + LTE 5C', '2019 + LTE 5C', '2017 + LTE 5C', 
    //            '2018 + LTE 6C', '2019 + LTE 6C', '2017 + LTE 6C', '2018 + LTE 7C', '2019 + LTE 7C', '2017 + LTE 7C')
    //          AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //          AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //UNION ALL
    //SELECT '4T4R' as PROJECT,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE  (STATUS = 'Active' OR STATUS = 'Complete')
    //         AND NATIONAL_PROGRAM = 'Antenna Modifications'
    //         AND PRODUCT_GROUP = 'Antenna Modifications'
    //         AND PRODUCT_SUBGROUP = '4TXRX Antenna Retrofit'
    //         AND POE_NAME = 'CE + Antenna Modifications'
    //         AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //         AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //UNION ALL
    //SELECT 'CRAN' as PROJECT,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //    WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
    //         AND NATIONAL_PROGRAM = 'CRAN'
    //         AND PRODUCT_GROUP IN ('CRAN - Build', 'CRAN - Buy')
    //         AND PRODUCT_SUBGROUP IN ('LTE1C - Micro Cell', 'LTE1C - Micro Cell Anchor', 'LTE1C - Pico Cell', 'LTE1C - Pico Cell Anchor')
    //         AND POE_NAME IN ('2018 + CRAN', '2019 + CRAN')
    //         AND MARKET in ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //         AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //UNION ALL
    //SELECT 'BWE HW' as PROJECT,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
    //         AND NATIONAL_PROGRAM IN ('LTE Additional Radio', 'LTE Extended Carrier', 'LTE Multi Carrier')
    //         AND PRODUCT_GROUP IN ('LTE Additional Radio', 'LTE Extended Carrier', 'LTE Multi Carrier')
    //         AND PRODUCT_SUBGROUP <> 'Software Carrier'
    //         AND POE_NAME IN ('2018 + LTE Additional Radio', '2018 + LTE Extended Carrier', '2018 + LTE Multi Carrier',
    //             '2019 + LTE Additional Radio', '2019 + LTE Extended Carrier', '2019 + LTE Multi Carrier')
    //         AND MARKET in ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS') 
    //         AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    //    [WebMethod]
    //    public static string GetDashboardMARKETNSB()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT 
    //      PONDER.CENTRAL_MARKET_LIST.N_TO_S,
    //      PONDER.PACE_POE.MARKET,
    //      COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   RIGHT OUTER JOIN PONDER.CENTRAL_MARKET_LIST
    //    ON PONDER.PACE_POE.MARKET = PONDER.CENTRAL_MARKET_LIST.MARKET
    //   WHERE STATUS IN ('Active', 'Complete')
    //          AND NATIONAL_PROGRAM = 'NSB'
    //          AND PRODUCT_GROUP = 'New Site'
    //          AND (POE_NAME = '2018 + NSB' OR POE_NAME = '2019 + NSB')
    //          AND PONDER.PACE_POE.MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //          AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //   GROUP BY PONDER.CENTRAL_MARKET_LIST.N_TO_S, PONDER.PACE_POE.MARKET
    //   ORDER BY PONDER.CENTRAL_MARKET_LIST.N_TO_S";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    //    [WebMethod]
    //    public static string GetDashboardMARKETLTE1C()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT MARKET,
    //      COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //    WHERE STATUS IN ('Active', 'Complete')
    //          AND NATIONAL_PROGRAM = 'LTE' 
    //          AND POE_NAME IN ('2018 + LTE', '2019 + LTE')
    //          AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //          AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //  GROUP BY MARKET
    //  ORDER BY MARKET";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    //    [WebMethod]
    //    public static string GetDashboardMARKETLTEAC()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT MARKET,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE STATUS IN ('Active', 'Complete')
    //          AND NATIONAL_PROGRAM IN ('LTE 2C', 'LTE 3C','LTE 4C', 'LTE 5C', 'LTE 6C', 'LTE 7C')    
    //          AND POE_NAME IN ('2018 + LTE 2C', '2019 + LTE 2C', '2017 + LTE 2C', '2018 + LTE 3C', '2019 + LTE 3C', '2017 + LTE 3C',
    //            '2018 + LTE 4C', '2019 + LTE 4C', '2017 + LTE 4C', '2018 + LTE 5C', '2019 + LTE 5C', '2017 + LTE 5C', 
    //            '2018 + LTE 6C', '2019 + LTE 6C', '2017 + LTE 6C', '2018 + LTE 7C', '2019 + LTE 7C', '2017 + LTE 7C')
    //          AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //          AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //          GROUP BY MARKET
    //          ORDER BY MARKET";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    //    [WebMethod]
    //    public static string GetDashboardMARKET4T4R()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT MARKET,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE  (STATUS = 'Active' OR STATUS = 'Complete')
    //         AND NATIONAL_PROGRAM = 'Antenna Modifications'
    //         AND PRODUCT_GROUP = 'Antenna Modifications'
    //         AND PRODUCT_SUBGROUP = '4TXRX Antenna Retrofit'
    //         AND POE_NAME = 'CE + Antenna Modifications'
    //         AND MARKET IN ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //         AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //         GROUP BY MARKET
    //         ORDER BY MARKET";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    //    [WebMethod]
    //    public static string GetDashboardMARKETCRAN()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT MARKET,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //    WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
    //         AND NATIONAL_PROGRAM = 'CRAN'
    //         AND PRODUCT_GROUP IN ('CRAN - Build', 'CRAN - Buy')
    //         AND PRODUCT_SUBGROUP IN ('LTE1C - Micro Cell', 'LTE1C - Micro Cell Anchor', 'LTE1C - Pico Cell', 'LTE1C - Pico Cell Anchor')
    //         AND POE_NAME IN ('2018 + CRAN', '2019 + CRAN')
    //         AND MARKET in ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS')
    //         AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //         GROUP BY MARKET
    //         ORDER BY MARKET";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    //    [WebMethod]
    //    public static string GetDashboardMARKETBWEHW()
    //    {
    //        //Construction Started
    //        string sql = @"SELECT MARKET,
    //COUNT (ONAIR_FORECAST) AS POE_2018,
    //      COUNT (ONAIR_ACTUAL) AS YTD_COMPLETE,
    //      CASE WHEN COUNT (ONAIR_FORECAST) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (ONAIR_FORECAST)), 2) END AS PERCENT_COMPLETE, 
    //      COUNT (CASE WHEN (ONAIR_ACTUAL > SYSDATE -30) THEN PACE_NUMBER END) AS LAST_30_DAYS,
    //      COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) AS PLAN_CUMU,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (ONAIR_ACTUAL) * 100 / COUNT (CASE WHEN (ONAIR_PLAN <= sysdate) THEN PACE_NUMBER END)),2) END AS PERCENT_OF_PLAN_COMPLETE,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_ON_TIME,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE >= ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_ON_TIME_PERC,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) AS NBD_LATE,
    //      CASE WHEN COUNT (ONAIR_ACTUAL) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NOT NULL) AND (CURRENT_NEED_BY_DATE < ONAIR_ACTUAL)) THEN PACE_NUMBER END) * 100 / COUNT (ONAIR_ACTUAL)),2) END AS NBD_LATE_PERC,
    //      COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) AS REMAIN_JOBS,      
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_PAST,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE <= SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_PAST_REM,
    //      COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) AS REM_JOBS_NBD_CUMU_FUTURE,
    //      CASE WHEN COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END) = 0 THEN 0 ELSE
    //      ROUND ( (COUNT (CASE WHEN ((ONAIR_ACTUAL IS NULL) AND (CURRENT_NEED_BY_DATE > SYSDATE)) THEN PACE_NUMBER END) * 100 / 
    //          COUNT (CASE WHEN (ONAIR_ACTUAL IS NULL) THEN PACE_NUMBER END)),2) END AS PERC_OF_PLAN_FUTURE_REM,
    //      COUNT(CASE WHEN (TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') < TO_CHAR(sysdate, 'YYYY') OR 
    //          (TO_CHAR(CURRENT_NEED_BY_DATE, 'MM') < TO_CHAR(sysdate, 'MM') AND TO_CHAR(CURRENT_NEED_BY_DATE, 'YYYY') = TO_CHAR(sysdate, 'YYYY'))) THEN PACE_NUMBER END) AS NBD_CUMU
    //   FROM PONDER.PACE_POE
    //   WHERE     (STATUS = 'Active' OR STATUS = 'Complete')
    //         AND NATIONAL_PROGRAM IN ('LTE Additional Radio', 'LTE Extended Carrier', 'LTE Multi Carrier')
    //         AND PRODUCT_GROUP IN ('LTE Additional Radio', 'LTE Extended Carrier', 'LTE Multi Carrier')
    //         AND PRODUCT_SUBGROUP <> 'Software Carrier'
    //         AND POE_NAME IN ('2018 + LTE Additional Radio', '2018 + LTE Extended Carrier', '2018 + LTE Multi Carrier',
    //             '2019 + LTE Additional Radio', '2019 + LTE Extended Carrier', '2019 + LTE Multi Carrier')
    //         AND MARKET in ('ILLINOIS/WISCONSIN', 'NORTHERN PLAINS' , 'GREATER MIDWEST' , 'ARKANSAS/OKLAHOMA', 'NORTH TEXAS', 'SOUTH TEXAS') 
    //         AND EXTRACT(YEAR from ONAIR_FORECAST) = 2018
    //         GROUP BY MARKET
    //         ORDER BY MARKET";

    //        DataTable dt = new DataTable();

    //        using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
    //        {
    //            using (OracleCommand cmd = new OracleCommand(sql, connection)) //define a new OracleCommand "cmd" with your connection and query
    //            {
    //                using (OracleDataAdapter da = new OracleDataAdapter(cmd)) //define a new OracleDataAdapter "da" with your OracleCommand
    //                {
    //                    da.Fill(dt); //fill your DataTable "dt" with the data from your OracleDataAdapter "da"
    //                }
    //            }
    //        } // end of getting data from server

    //        JavaScriptSerializer serializer = new JavaScriptSerializer();
    //        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
    //        Dictionary<string, object> row;
    //        foreach (DataRow dr in dt.Rows)
    //        {
    //            row = new Dictionary<string, object>();
    //            foreach (DataColumn col in dt.Columns)
    //            {
    //                row.Add(col.ColumnName, dr[col]);
    //            }
    //            rows.Add(row);
    //        }

    //        string objectdata = serializer.Serialize(rows);
    //        return objectdata;
    //    }
    [WebMethod]
    public static string GetDATADATE()
    {
        //Construction Started
        string sql = @"SELECT TO_CHAR(TRUNC(DATE_INSERTED -1), 'MM-DD-YYYY') AS DATADATE, 
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

}