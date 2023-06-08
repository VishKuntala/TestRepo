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

public partial class sales_scoring_MidMarket : System.Web.UI.Page
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

        private static string BuildSortColumns ()
        {
            string roamTextSql = " CASE WHEN ROAM_TEXT = 'Unknown' THEN 0" +
            " WHEN ROAM_TEXT = 'Heavy roaming' THEN 1" +
            " WHEN ROAM_TEXT = 'Medium roaming' THEN 2" +
            " WHEN ROAM_TEXT = 'No' THEN 3" +
            " END AS ROAM_TEXT_SORT_COLUMN ";

            string tputTextSql = " CASE WHEN TPUT_TEXT = 'Unknown' THEN 0" +
            " WHEN TPUT_TEXT = 'Low Speed/Very Low Avail Capacity' THEN 1" +
            " WHEN TPUT_TEXT = 'Medium Speed/Low Avail Capacity' THEN 2" +
            " WHEN TPUT_TEXT = 'Medium Speed/Medium Avail Capacity' THEN 3" +
            " WHEN TPUT_TEXT = 'Medium Speed/High Avail Capacity' THEN 4" +
            " WHEN TPUT_TEXT = 'High Speed/Very High Avail Capacity' THEN 5" +
            " END AS TPUT_TEXT_SORT_COLUMN ";

            string legacyDeviceSql = " CASE WHEN LEGACY_DEVICE_TEXT = 'Unknown' THEN 0" +
            " WHEN LEGACY_DEVICE_TEXT = 'High' THEN 1" +
            " WHEN LEGACY_DEVICE_TEXT = 'Medium' THEN 2" +
            " WHEN LEGACY_DEVICE_TEXT = 'Low' THEN 3" +
            " END AS LEGACY_DEVICE_TEXT_SORT_COLUMN ";

            string band14Sql = " CASE WHEN BAND_14 = 'Unknown' THEN 0" +
            " WHEN BAND_14 = 'No' THEN 1" +
            " WHEN BAND_14 = 'Partial' THEN 2" +
            " WHEN BAND_14 = 'Yes' THEN 3" +
            " END AS BAND_14_SORT_COLUMN ";

            string fivegSql = " CASE WHEN FIVEG = 'Unknown' THEN 0" +
            " WHEN FIVEG = 'No' THEN 1" +
            " WHEN FIVEG = 'Partial' THEN 2" +
            " WHEN FIVEG = 'Yes' THEN 3" +
            " END AS FIVEG_SORT_COLUMN ";

            string fivegPlusSql = " CASE WHEN FIVEG_PLUS = 'Unknown' THEN 0" +
            " WHEN FIVEG_PLUS = 'No' THEN 1" +
            " WHEN FIVEG_PLUS = 'Partial' THEN 2" +
            " WHEN FIVEG_PLUS = 'Yes' THEN 3" +
            " END AS FIVEG_PLUS_SORT_COLUMN ";

            string firstNetSql = " CASE WHEN FIRST_NET = 'Unknown' THEN 0" +
            " WHEN FIRST_NET = 'No' THEN 1" +
            " WHEN FIRST_NET = 'Partial' THEN 2" +
            " WHEN FIRST_NET = 'Yes' THEN 3" +
            " END AS FIRST_NET_SORT_COLUMN ";

            string fiberStatusSql = " CASE WHEN FIBER_STATUS = '99 - NONE' THEN 0" +
            " WHEN FIBER_STATUS = '7 - NEAR FIBER 1000ft (Not Lit)' THEN 1" +
            " WHEN FIBER_STATUS = '5 - FIBER THERE (Not Lit)' THEN 2" +
            " WHEN FIBER_STATUS = '3 - SINGLE CUSTOMER NTE/CELL/LEGACY' THEN 3" +
            " WHEN FIBER_STATUS = '2 - MULTI CUSTOMER NTE' THEN 4" +
            " WHEN FIBER_STATUS = '1 - EMT' THEN 5" +
            " END AS FIBER_STATUS_SORT_COLUMN ";

        return roamTextSql + "," + tputTextSql + "," + legacyDeviceSql + "," + band14Sql + "," + fivegSql + "," + fivegPlusSql + "," + firstNetSql + "," + fiberStatusSql;

        }

        private static string BuildWhereClause(string avpId, string smId, string salesRepId, string mobSellerId, string svIds,
            string zipcode, string statecode, string indoorCovScore, string fiveg, string band14, string tputText, string roamingDependency, string legacyPen, string fiberStatus)
        {
            string sql = "1=1";

            //if (!string.IsNullOrWhiteSpace(avpId) && !string.IsNullOrWhiteSpace(smId) && !string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND AVP_ATTUID = '" + avpId + "' AND SM_ATTUID IN (" + smId + ")" + " AND OWNING_ATTUID IN (" + salesRepId + ")";
            //}
            //if (string.IsNullOrWhiteSpace(avpId) && !string.IsNullOrWhiteSpace(smId) && !string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND SM_ATTUID IN (" + smId + ")" + " AND OWNING_ATTUID IN (" + salesRepId + ")";
            //}
            //if (!string.IsNullOrWhiteSpace(avpId) && string.IsNullOrWhiteSpace(smId) && !string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND AVP_ATTUID = '" + avpId + "' AND OWNING_ATTUID IN (" + salesRepId + ")";
            //}
            //if (!string.IsNullOrWhiteSpace(avpId) && !string.IsNullOrWhiteSpace(smId) && string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND AVP_ATTUID = '" + avpId + "' AND SM_ATTUID IN (" + smId + ")";
            //}
            //if (string.IsNullOrWhiteSpace(avpId) && string.IsNullOrWhiteSpace(smId) && !string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND OWNING_ATTUID IN (" + salesRepId + ")";
            //}
            //if (string.IsNullOrWhiteSpace(avpId) && !string.IsNullOrWhiteSpace(smId) && string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND SM_ATTUID IN (" + smId + ")";
            //}
            //if (!string.IsNullOrWhiteSpace(avpId) && string.IsNullOrWhiteSpace(smId) && string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND AVP_ATTUID = '" + avpId + "'";
            //}

            //if (!string.IsNullOrWhiteSpace(smId) && !string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND SM_ATTUID = '" + smId + "' AND OWNING_ATTUID IN (" + salesRepId + ")";
            //}
            //if (string.IsNullOrWhiteSpace(smId) && !string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND OWNING_ATTUID IN (" + salesRepId + ")";
            //}
            //if (!string.IsNullOrWhiteSpace(smId) && string.IsNullOrWhiteSpace(salesRepId))
            //{
            //    sql = sql + " AND SM_ATTUID = '" + smId + "'";
            //}

            if (!string.IsNullOrWhiteSpace(avpId))
            {
                sql = sql + " AND AVP_ATTUID = '" + avpId + "'";
            }
            if (!string.IsNullOrWhiteSpace(smId))
            {
                sql = sql + " AND SM_ATTUID IN (" + smId + ")";
            }
            if (!string.IsNullOrWhiteSpace(salesRepId))
            {
                sql = sql + " AND OWNING_ATTUID IN (" + salesRepId + ")";
            }
            if (!string.IsNullOrWhiteSpace(mobSellerId))
            {
                sql = sql + " AND MOB_SE_ATTUID IN (" + mobSellerId + ")";
            }
            if (!string.IsNullOrWhiteSpace(svIds) && svIds != "''")
            {
                sql = sql + " AND SVID IN (" + svIds + ")";
            }
            if (!string.IsNullOrWhiteSpace(zipcode))
            {
                sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
            }
            if (!string.IsNullOrWhiteSpace(statecode))
            {
                sql = sql + " AND STATE IN (" + statecode + ")";
            }
            if (!string.IsNullOrWhiteSpace(indoorCovScore))
            {
                sql = sql + " AND COVERAGE_SCORE IN (" + indoorCovScore + ")";
            }
            if (!string.IsNullOrWhiteSpace(fiveg))
            {
                sql = sql + " AND FIVEG IN (" + fiveg + ")";
            }
            if (!string.IsNullOrWhiteSpace(band14))
            {
                sql = sql + " AND BAND_14 IN (" + band14 + ")";
            }
            if (!string.IsNullOrWhiteSpace(tputText))
            {
                sql = sql + " AND TPUT_TEXT IN (" + tputText + ")";
            }
            if (!string.IsNullOrWhiteSpace(roamingDependency))
            {
                sql = sql + " AND ROAM_TEXT IN (" + roamingDependency + ")";
            }
            if (!string.IsNullOrWhiteSpace(legacyPen))
            {
                sql = sql + " AND LEGACY_DEVICE_TEXT IN (" + legacyPen + ")";
            }
            if (!string.IsNullOrWhiteSpace(fiberStatus))
            {
                sql = sql + " AND FIBER_STATUS IN (" + fiberStatus + ")";
            }

        return string.IsNullOrWhiteSpace(sql) ? " 1=1" : sql;

        }

        private static List<Dictionary<string, object>> FetchData(NameValueCollection queryStringCollection,
             string valueColumn, string nameColumn, string sortColumn, string sortDirection = "ASC")
        {
            string avpId = queryStringCollection["avpId"];
            string smId = queryStringCollection["smId"];
            string salesRepId = queryStringCollection["salesRepId"];
            string mobSellerId = queryStringCollection["mobSellerId"];
            string svIds = queryStringCollection["svIds"];
            string zipcode = queryStringCollection["zipcode"];
            string statecode = queryStringCollection["statecode"];
            string indoorCovScore = queryStringCollection["indoorCovScore"];
            string fiveg = queryStringCollection["fiveg"];
            string band14 = queryStringCollection["band14"];
            string tputText = queryStringCollection["tputText"];
            string roamingDependency = queryStringCollection["roamingDependency"];
            string legacyPen = queryStringCollection["legacyPen"];
            string fiberStatus = queryStringCollection["fiberStatus"];
            string searchString = queryStringCollection["q"].Replace("undefined", "");

            string sql;
            if (string.IsNullOrEmpty(searchString))
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_MIDMARKET_PROD WHERE 1=1 AND ", valueColumn, nameColumn);
                sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, svIds, zipcode, statecode, indoorCovScore, fiveg, band14, tputText, roamingDependency, legacyPen, fiberStatus);
            }
            else
            {
            sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_MIDMARKET_PROD WHERE LOWER({2}) LIKE '{3}%' AND ", valueColumn, nameColumn, nameColumn.ToLower(), searchString.ToLower());
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, svIds, zipcode, statecode, indoorCovScore, fiveg, band14, tputText, roamingDependency, legacyPen, fiberStatus);
            }
            sql = sql + " AND " + valueColumn + " IS NOT NULL ";
            sql = sql + string.Format(" ORDER BY {0}", sortColumn);
            sql = sql + " " + sortDirection;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> TableData(string avpId, string smId, string salesRepId, string mobSellerId, string svIds,
            string zipcode, string statecode, string indoorCovScore, string fiveg, string band14, string tputText, string roamingDependency,
            string sortCriteria, string limit, string legacyPen, string fiberStatus, string sortDirection, bool buildSortColumns)
        {
            string sql = "SELECT ROWNUM, A.* FROM (SELECT coverage_score_rank,svid, svid_name,coverage_score, latitude, longitude, " +
                "FIVEG, BAND_14, FIRST_NET, ROAM_TEXT, AVP_ATTUID, SM_ATTUID, OWNING_ATTUID,MOB_SE_ATTUID,FIVEG_PLUS,TPUT_TEXT,LEGACY_DEVICE_TEXT,FIBER_STATUS," +
                "ADDR,CITY,STATE,ZIPCODE ";
            if (buildSortColumns)
            {
                sql = sql + "," + BuildSortColumns();
            }
            sql = sql + " FROM PONDER.SALES_MIDMARKET_PROD WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, svIds, zipcode, statecode, indoorCovScore, fiveg, band14, tputText, roamingDependency, legacyPen, fiberStatus);
            sql = sql + " ORDER BY " + sortCriteria  + " " + sortDirection + ", COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> MapData(string avpId, string smId, string salesRepId, string mobSellerId, string svIds,
    string zipcode, string statecode, string indoorCovScore, string fiveg, string band14, string tputText, string roamingDependency,
    string sortCriteria, string limit, string legacyPen, string fiberStatus, string attribute)
        {
            string sql = "SELECT ROWNUM, A.* FROM (SELECT latitude, longitude, " + attribute + 
                " FROM PONDER.SALES_MIDMARKET_PROD WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, svIds, zipcode, statecode, indoorCovScore, fiveg, band14, tputText, roamingDependency, legacyPen, fiberStatus);
            sql = sql + " ORDER BY " + sortCriteria + " DESC, COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> ChartData(string avpId, string smId, string salesRepId, string mobSellerId, string svIds,
string zipcode, string statecode, string indoorCovScore, string fiveg, string band14, string tputText, string roamingDependency,
string sortCriteria, string limit, string legacyPen, string fiberStatus, string attribute)
        {
            string sql = "SELECT count(*) as count," + attribute +
                " FROM PONDER.SALES_MIDMARKET_PROD WHERE COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, svIds, zipcode, statecode, indoorCovScore, fiveg, band14, tputText, roamingDependency, legacyPen, fiberStatus);
            sql = sql + " GROUP BY " + attribute;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> LocationData(string latitude, string longitude)
        {
            string sql = @"SELECT coverage_score_rank,svid, svid_name,coverage_score, latitude, longitude, " +
                "FIVEG, BAND_14, FIRST_NET, ROAM_TEXT, AVP_ATTUID, SM_ATTUID, OWNING_ATTUID,MOB_SE_ATTUID,FIVEG_PLUS,TPUT_TEXT,LEGACY_DEVICE_TEXT,FIBER_STATUS," +
                "ADDR,CITY,STATE,ZIPCODE FROM PONDER.SALES_MIDMARKET_PROD WHERE LATITUDE = '" + latitude + "' AND LONGITUDE = '" + longitude + "'";
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> StoreData(string statecode, string zipcode)
        {
            string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME,
                            LATITUDE, LONGITUDE
                    FROM PONDER.SALES_ATT_STORE_LOCATIONS WHERE 1=1";
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
        public static List<Dictionary<string, object>> AVPs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "avp_attuid", "avp_attuid", "avp_attuid");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SalesManagers()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "sm_attuid", "sm_attuid", "sm_attuid");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> States()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "STATE", "STATE", "STATE");
        
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> LegacyPens()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "LEGACY_DEVICE_TEXT", "LEGACY_DEVICE_TEXT", "LEGACY_DEVICE_TEXT");
       
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> FiberStatuses()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIBER_STATUS", "FIBER_STATUS", "FIBER_STATUS");

        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CoverageScores()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "COVERAGE_SCORE", "COVERAGE_SCORE", "COVERAGE_SCORE","DESC");


        }



        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Zipcodes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ZIPCODE", "ZIPCODE", "ZIPCODE");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SalesRepresentatives()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "owning_attuid", "owning_attuid", "owning_attuid");
   
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> MobSellers()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "MOB_SE_ATTUID", "MOB_SE_ATTUID", "MOB_SE_ATTUID");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SVNames()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SVID", "SVID_NAME", "SVID_NAME");


        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> FiveGs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIVEG", "FIVEG", "FIVEG");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Band14s()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "BAND_14", "BAND_14", "BAND_14");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> TputTexts()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "TPUT_TEXT", "TPUT_TEXT", "TPUT_TEXT");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> RoamingDependencies()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ROAM_TEXT", "ROAM_TEXT", "ROAM_TEXT");
        }


    }

