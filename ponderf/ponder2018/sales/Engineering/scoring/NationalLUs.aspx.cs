using System;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.IO;
using System.Web.Services;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Transactions;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using ponder2018;


public partial class sales_scoring_NationalLUs : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
        }

         private static List<Dictionary<string, object>> SerializeDataTable(DataTable dataTable)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer(); //define a new JavaScriptSerializer object "serializer"
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>(); //define a new List "rows"
            Dictionary<string, object> row; //define a new Dictionary "row"
            foreach (DataRow dr in dataTable.Rows) //setup a loop to iterate through the rows "dr" your DataTable "dt"
            {
                row = new Dictionary<string, object>(); //define a new object to store your data in
                foreach (DataColumn col in dataTable.Columns) //setup a loop to iterate through the columns of the current row "dr" in your DataTable "dt"
                {
                    row.Add(col.ColumnName.ToLower(), dr[col]); //add the data to your "row" object
                }
                rows.Add(row); //add the "row" to your "rows" object
            }
            return rows;
        }

        private static string BuildSortColumns()
        {
            string networkBuildTypeSql = " CASE WHEN NETWORK_BUILD_TYPE_CD = 'ATM CO' THEN 0" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'FTTN-BP' THEN 1" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'IP-CO - BP' THEN 2" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'NA' THEN 3" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'FTTN' THEN 4" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'FTTPIP' THEN 5" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'ATM RT' THEN 6" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'FTTB-F' THEN 7" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'FTTP-GPON' THEN 8" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'IP-RT-BP' THEN 9" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'IP-RT' THEN 10" +
            " WHEN NETWORK_BUILD_TYPE_CD = 'IP-CO' THEN 11" +
            " END AS NETWORK_BUILD_TYPE_SORT_COLUMN ";            

            return networkBuildTypeSql;

        }

        private static string BuildWhereClause(
            string zipcode, string statecode, string networkbuildtype)
        {
            string sql = "1=1";

            if (!string.IsNullOrWhiteSpace(statecode))
            {
                sql = sql + " AND STATE_CD = '" + statecode + "'";
            }
            if (!string.IsNullOrWhiteSpace(zipcode))
            {
                sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
            }
            if (!string.IsNullOrWhiteSpace(networkbuildtype))
            {
                sql = sql + " AND NETWORK_BUILD_TYPE_CD IN (" + networkbuildtype + ")";
            }

            return string.IsNullOrWhiteSpace(sql) ? " 1=1" : sql;

        }
        private static List<Dictionary<string, object>> FetchData(NameValueCollection queryStringCollection,
     string valueColumn, string nameColumn, string sortColumn, string sortDirection = "ASC")
        {            
            string zipcode = queryStringCollection["zipcode"];
            string statecode = queryStringCollection["statecode"];
            string networkbuildtype = queryStringCollection["networkbuildtype"];
            string searchString = queryStringCollection["q"].Replace("undefined","");

            string sql;
            if (string.IsNullOrEmpty(searchString))
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_USALU_LUS WHERE 1=1 AND ", valueColumn, nameColumn);
                sql = sql + BuildWhereClause(zipcode, statecode, networkbuildtype);
            }
            else
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_USALU_LUS WHERE LOWER({2}) LIKE '{3}%' AND ", valueColumn, nameColumn, nameColumn.ToLower(), searchString.ToLower());
                sql = sql + BuildWhereClause(zipcode, statecode, networkbuildtype);
            }
            sql = sql + " AND " + valueColumn + " IS NOT NULL ";
            sql = sql + string.Format(" ORDER BY {0}", sortColumn);
            sql = sql + " " + sortDirection;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> TableData(
            string zipcode, string statecode, string networkbuildtype,
            string sortCriteria, string limit, string sortDirection, bool buildSortColumns)
        {

            string sql = @"SELECT ROWNUM, A.* FROM(SELECT EXTERNAL_LIVING_UNIT_ID, ADDRESS, CITY, STATE_CD, ZIPCODE, ADDRESS_LINE_2, NETWORK_BUILD_TYPE_CD, latitude, longitude ";
            if(buildSortColumns) {
                sql = sql + "," + BuildSortColumns();
            }
            sql = sql + " FROM PONDER.SALES_USALU_LUS WHERE ";
            sql = sql + BuildWhereClause(zipcode, statecode, networkbuildtype);
            sql = sql + " ORDER BY " + sortCriteria + " " + sortDirection + ") A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> MapData(
            string zipcode, string statecode, string networkbuildtype,
            string sortCriteria, string limit, string attribute)
        {

            string sql = @"SELECT ROWNUM, A.* FROM(SELECT LATITUDE, LONGITUDE, NETWORK_BUILD_TYPE_CD " +
                " FROM PONDER.SALES_USALU_LUS WHERE ";
            sql = sql + BuildWhereClause(zipcode, statecode, networkbuildtype);
            sql = sql + " ORDER BY " + sortCriteria + " DESC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> ChartData(
            string zipcode, string statecode, string networkbuildtype,
            string sortCriteria, string limit, string attribute)
        {

            string sql = @"SELECT  count(*) as count," + attribute +
                " FROM PONDER.SALES_USALU_LUS WHERE ";
            sql = sql + BuildWhereClause(zipcode, statecode, networkbuildtype);
            sql = sql + " GROUP BY " + attribute;
            /* sql = sql + " ORDER BY " + sortCriteria + " DESC, COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            } */
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> LocationData(string latitude, string longitude)
        {
            string sql = @"SELECT external_living_unit_id, address, city, state_cd, zipcode, address_line_2, network_build_type_cd
                FROM PONDER.SALES_USALU_LUS WHERE LATITUDE = '" + latitude + "' AND LONGITUDE = '" + longitude + "'";
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }


        [WebMethod]
        public static List<Dictionary<string, object>> StoreData(string statecode, string zipcode)
        {
            string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME,
                            MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY,
                            LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
                    FROM PONDER.SALES_ATT_STORE_LOC_PROD WHERE 1=1";
            if (!string.IsNullOrWhiteSpace(zipcode))
            {
                sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
            }
            if (!string.IsNullOrWhiteSpace(statecode))
            {
                sql = sql + " AND STATE IN (" + statecode + ")";
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> States()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "STATE_CD", "STATE_CD", "STATE_CD");
        }       

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> NetworkBuildTypes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "NETWORK_BUILD_TYPE_CD", "NETWORK_BUILD_TYPE_CD", "NETWORK_BUILD_TYPE_CD");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Zipcodes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ZIPCODE", "ZIPCODE", "ZIPCODE");
        }       


    }

