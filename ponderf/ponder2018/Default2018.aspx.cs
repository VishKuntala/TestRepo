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
        string sql = @"SELECT * FROM PONDER.DASHBOARD_DONUT_3";

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
        string sql = @"SELECT * FROM PONDER.DASHBOARD_DONUT_4";

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
        string sql = @"SELECT * FROM PONDER.DASHBOARD_DONUT_5";

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
        string sql = @"SELECT * FROM PONDER.DASHBOARD_DONUT_6";

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