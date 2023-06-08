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
using System.Linq;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using ponder2018;

public partial class sales_AWB_scoring_BYOC : System.Web.UI.Page
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

            string fivegSql = " CASE WHEN FIVEG = 'Unknown' THEN 0" +
            " WHEN FIVEG = 'No' THEN 1" +
            " WHEN FIVEG = 'Partial' THEN 2" +
            " WHEN FIVEG = 'Yes' THEN 3" +
            " END AS FIVEG_SORT_COLUMN ";

            string fivegPlusSql = " CASE WHEN FIVEG_PLUS_MMWAVE = 'Unknown' THEN 0" +
            " WHEN FIVEG_PLUS_MMWAVE = 'No' THEN 1" +
            " WHEN FIVEG_PLUS_MMWAVE = 'Hotspot' THEN 2" +
            " END AS FIVEGPLUS_SORT_COLUMN ";

            string cbandSql = " CASE WHEN FIVEG_PLUS_CBAND = 'Unknown' THEN 0" +
            " WHEN FIVEG_PLUS_CBAND = 'No' THEN 1" +
            " WHEN FIVEG_PLUS_CBAND = 'Outdoor Only' THEN 2" +
            " WHEN FIVEG_PLUS_CBAND = 'Indoor' THEN 3" +
            " END AS CBAND_SORT_COLUMN ";

            string band14Sql = " CASE WHEN BAND_14 = 'Unknown' THEN 0" +
            " WHEN BAND_14 = 'No' THEN 1" +
            " WHEN BAND_14 = 'Partial' THEN 2" +
            " WHEN BAND_14 = 'Yes' THEN 3" +
            " END AS BAND_14_SORT_COLUMN ";

            string fnetSql = " CASE WHEN FIRST_NET = 'Unknown' THEN 0" +
            " WHEN FIRST_NET = 'No' THEN 1" +
            " WHEN FIRST_NET = 'Partial' THEN 2" +
            " WHEN FIRST_NET = 'Yes' THEN 3" +
            " END AS FNET_TEXT_SORT_COLUMN ";

            string suitabilitySql = " CASE WHEN SALES_HIGH_SPEED_SUITABILITY = 'No AWB - Check with RAN' THEN 0" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'No WBB - Check with RAN' THEN 0" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Low Speed Failover Only' THEN 1" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Feasible' THEN 2" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Good' THEN 3" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Very Good' THEN 4" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Excellent' THEN 5" +
            " END AS SUITABILITY_SORT_COLUMN ";

            string speedExperienceSql = " CASE WHEN SPEED_EXPERIENCE = 'Low Speed' THEN 0" +
            " WHEN SPEED_EXPERIENCE = 'Medium Speed' THEN 1" +
            " WHEN SPEED_EXPERIENCE = 'High Speed' THEN 2" +
            " END AS SPEEDEXPERIENCE_SORT_COLUMN ";

            return fivegSql + "," + fivegPlusSql + "," + cbandSql + "," + band14Sql + "," + fnetSql + "," + suitabilitySql + "," + speedExperienceSql;

        }

        private static string BuildAccessTypeWhereClause(string accessType)
        {
            string sql = "";
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

            if (accessType == "mine")
            {
                sql = " ADMIN_USER = '" + ATTUID + "'";
            }
            if (accessType == "shared")
            {
                sql = " VIEW_USER LIKE ('%" + ATTUID + "%')";
            }
            if (accessType == "public")
            {
                sql = " VIEW_PUBLIC = 1";
            }
            if (accessType == "all")
            {
                sql = "( ADMIN_USER = '" + ATTUID + "' OR VIEW_PUBLIC = 1 OR VIEW_USER LIKE ('%" + ATTUID + "%') )";
            }
            return sql;
        }

        private static string BuildWhereClause(string accessType, string clusterId, string zipcode, string statecode, 
            string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string speedExperience)
        {
            string sql = " IS_ACTIVE = 1 AND IS_PROCESSED = 1";

            if (!string.IsNullOrWhiteSpace(accessType) && !string.IsNullOrWhiteSpace(clusterId))
            {
                sql = sql + " AND " + BuildAccessTypeWhereClause(accessType) + " AND PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID IN (" + clusterId + ")";
            }
            if (string.IsNullOrWhiteSpace(accessType) && !string.IsNullOrWhiteSpace(clusterId))
            {
                sql = sql + " AND PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID IN (" + clusterId + ")";
            }
            if (!string.IsNullOrWhiteSpace(accessType) && string.IsNullOrWhiteSpace(clusterId))
            {
                sql = sql + " AND " + BuildAccessTypeWhereClause(accessType);
            }            
            if (!string.IsNullOrWhiteSpace(zipcode))
            {
                sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
            }
            if (!string.IsNullOrWhiteSpace(statecode))
            {
                sql = sql + " AND STATE IN (" + statecode + ")";
            }
            if (!string.IsNullOrWhiteSpace(covScore))
            {
                sql = sql + " AND SIMPLE_COVERAGE_SCORE IN (" + covScore + ")";
            }
            if (!string.IsNullOrWhiteSpace(fiveg))
            {
                sql = sql + " AND FIVEG IN (" + fiveg + ")";
            }
            if (!string.IsNullOrWhiteSpace(fivegplus))
            {
                sql = sql + " AND FIVEG_PLUS_MMWAVE IN (" + fivegplus + ")";
            }
            if (!string.IsNullOrWhiteSpace(cband))
            {
                sql = sql + " AND FIVEG_PLUS_CBAND IN (" + cband + ")";
            }
            if (!string.IsNullOrWhiteSpace(band14))
            {
                sql = sql + " AND BAND_14 IN (" + band14 + ")";
            }
            if (!string.IsNullOrWhiteSpace(fnet))
            {
                sql = sql + " AND FIRST_NET IN (" + fnet + ")";
            }
            if (!string.IsNullOrWhiteSpace(suitability))
            {
                sql = sql + " AND SALES_HIGH_SPEED_SUITABILITY IN (" + suitability + ")";
            }
            if (!string.IsNullOrWhiteSpace(speedExperience))
            {
                sql = sql + " AND SPEED_EXPERIENCE IN (" + speedExperience + ")";
            }

            return string.IsNullOrWhiteSpace(sql) ? " 1=1" : sql;

        }

        private static List<Dictionary<string, object>> FetchAccessTypesData(NameValueCollection queryStringCollection)
        {
            string accessType = queryStringCollection["accessType"];
            string clusterId = queryStringCollection["clusterId"];
            string zipcode = queryStringCollection["zipcode"];
            string statecode = queryStringCollection["statecode"];
            string covScore = queryStringCollection["covScore"];
            string fiveg = queryStringCollection["fiveg"];
            string fivegplus = queryStringCollection["fivegplus"];
            string cband = queryStringCollection["cband"];
            string fnet = queryStringCollection["fnet"];
            string band14 = queryStringCollection["band14"];            
            string suitability = queryStringCollection["suitability"];
            string speedExperience = queryStringCollection["speedExperience"];
            string searchString = queryStringCollection["q"].Replace("undefined", "");

            string sql;
            sql = string.Format("select ADMIN_USER, VIEW_PUBLIC, VIEW_USER from PONDER.SALES_AWB_BYOC_DETAIL INNER JOIN PONDER.SALES_AWB_BYOC_LIST ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID WHERE 1=1 AND ");
            sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, speedExperience);
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        private static List<Dictionary<string, object>> FetchData(NameValueCollection queryStringCollection,
             string valueColumn, string nameColumn, string sortColumn, string sortDirection = "ASC")
        {
        string accessType = queryStringCollection["accessType"];
        string clusterId = queryStringCollection["clusterId"];
        string zipcode = queryStringCollection["zipcode"];
        string statecode = queryStringCollection["statecode"];
        string covScore = queryStringCollection["covScore"];
        string fiveg = queryStringCollection["fiveg"];
        string fivegplus = queryStringCollection["fivegplus"];
        string cband = queryStringCollection["cband"];
        string fnet = queryStringCollection["fnet"];
        string band14 = queryStringCollection["band14"];
        string suitability = queryStringCollection["suitability"];
        string speedExperience = queryStringCollection["speedExperience"];
        string searchString = queryStringCollection["q"].Replace("undefined", "");

        string sql;
            if (string.IsNullOrEmpty(searchString))
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_AWB_BYOC_DETAIL INNER JOIN PONDER.SALES_AWB_BYOC_LIST ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID WHERE 1=1 AND ", valueColumn, nameColumn);
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, speedExperience);
            }
            else
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_AWB_BYOC_DETAIL INNER JOIN PONDER.SALES_AWB_BYOC_LIST ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID WHERE LOWER({2}) LIKE '{3}%' AND ", valueColumn, nameColumn, nameColumn.ToLower(), searchString.ToLower());
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, speedExperience);
            }
            sql = sql + " AND " + valueColumn + " IS NOT NULL ";
            sql = sql + string.Format(" ORDER BY {0}", sortColumn);
            sql = sql + " " + sortDirection;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> TableData(string accessType, string clusterId, string zipcode, string statecode,
            string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string speedExperience,
            string sortCriteria, string limit, string sortDirection, bool buildSortColumns)
        {
            string sql = "SELECT ROWNUM, A.* FROM (SELECT coverage_score_rank,location_id,company_name,address,city,state,zipcode,simple_coverage_score, latitude, longitude, " +
                "FIVEG,FIVEG_PLUS_MMWAVE,FIVEG_PLUS_CBAND,BAND_14,FIRST_NET,SALES_HIGH_SPEED_SUITABILITY,SPEED_EXPERIENCE as MOBILE_SPEED_EXPERIENCE,AZIMUTH,USID";
            if (buildSortColumns)
            {
                sql = sql + "," + BuildSortColumns();
            }
            sql = sql + @" FROM PONDER.SALES_AWB_BYOC_DETAIL 
                INNER JOIN PONDER.SALES_AWB_BYOC_LIST ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID
                WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, speedExperience);
            sql = sql + " ORDER BY " + sortCriteria  + " " + sortDirection + ", COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> MapData(string accessType, string clusterId, string zipcode, string statecode,
            string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string speedExperience,
            string sortCriteria, string limit, string attribute)
        {
            string sql = "SELECT ROWNUM, A.* FROM (SELECT latitude, longitude, PONDER.SALES_AWB_BYOC_DETAIL.byoc_cluster_id, " + attribute +
                @" FROM PONDER.SALES_AWB_BYOC_DETAIL 
                INNER JOIN PONDER.SALES_AWB_BYOC_LIST ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID 
                WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, speedExperience);
            sql = sql + " ORDER BY " + sortCriteria + " DESC, COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> ChartData(string accessType, string clusterId, string zipcode, string statecode,
            string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string speedExperience,
            string sortCriteria, string limit, string attribute)
        {
            string sql = "SELECT count(*) as count," + attribute +
                @" FROM PONDER.SALES_AWB_BYOC_DETAIL 
                INNER JOIN PONDER.SALES_AWB_BYOC_LIST ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID
                WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
        sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, speedExperience);
        sql = sql + " GROUP BY " + attribute;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> LocationData(string latitude, string longitude, int byocClusterId)
        {
            string sql = @"SELECT COVERAGE_SCORE_RANK,BYOC_CLUSTER_NAME,LOCATION_ID,COMPANY_NAME,SIMPLE_COVERAGE_SCORE,LATITUDE,LONGITUDE, " +
                "FIVEG,FIVEG_PLUS_MMWAVE,FIVEG_PLUS_CBAND,BAND_14,FIRST_NET,SALES_HIGH_SPEED_SUITABILITY,SPEED_EXPERIENCE,AZIMUTH,USID," +
                "ADDRESS,CITY,STATE,ZIPCODE FROM PONDER.SALES_AWB_BYOC_DETAIL INNER JOIN PONDER.SALES_AWB_BYOC_LIST " +
                "ON PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_AWB_BYOC_LIST.BYOC_CLUSTER_ID WHERE " +
                "SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID = " + byocClusterId + " AND LATITUDE = '" + latitude + "' AND LONGITUDE = '" + longitude + "'";
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
        public static List<Dictionary<string, object>> States()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "STATE", "STATE", "STATE");
        
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CoverageScores()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SIMPLE_COVERAGE_SCORE", "SIMPLE_COVERAGE_SCORE", "SIMPLE_COVERAGE_SCORE", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Zipcodes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ZIPCODE", "ZIPCODE", "ZIPCODE");

        }
        
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> ClusterNames()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "TO_CHAR(PONDER.SALES_AWB_BYOC_DETAIL.BYOC_CLUSTER_ID)", "BYOC_CLUSTER_NAME", "BYOC_CLUSTER_NAME");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> FiveGs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIVEG", "FIVEG", "CASE WHEN FIVEG = 'Unknown' THEN 0 " +
                "WHEN FIVEG = 'No' THEN 1 " +
                "WHEN FIVEG = 'Partial' THEN 2 " +
                "WHEN FIVEG = 'Yes' THEN 3 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> FiveGPluses()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIVEG_PLUS_MMWAVE", "FIVEG_PLUS_MMWAVE", "CASE WHEN FIVEG_PLUS_MMWAVE = 'Unknown' THEN 0 " +
                "WHEN FIVEG_PLUS_MMWAVE = 'No' THEN 1 " +
                "WHEN FIVEG_PLUS_MMWAVE = 'Hotspot' THEN 2 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CBands()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIVEG_PLUS_CBAND", "FIVEG_PLUS_CBAND", "CASE WHEN FIVEG_PLUS_CBAND = 'Unknown' THEN 0 " +
                "WHEN FIVEG_PLUS_CBAND = 'No' THEN 1 " +
                "WHEN FIVEG_PLUS_CBAND = 'Outdoor Only' THEN 2 " +
                "WHEN FIVEG_PLUS_CBAND = 'Indoor' THEN 3 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Band14s()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "BAND_14", "BAND_14", "CASE WHEN BAND_14 = 'Unknown' THEN 0 " +
                "WHEN BAND_14 = 'No' THEN 1 " +
                "WHEN BAND_14 = 'Partial' THEN 2 " +
                "WHEN BAND_14 = 'Yes' THEN 3 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Fnets()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIRST_NET", "FIRST_NET", "CASE WHEN FIRST_NET = 'Unknown' THEN 0 " +
                "WHEN FIRST_NET = 'No' THEN 1 " +
                "WHEN FIRST_NET = 'Partial' THEN 2 " +
                "WHEN FIRST_NET = 'Yes' THEN 3 END", "DESC");
        }        

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Suitabilities()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SALES_HIGH_SPEED_SUITABILITY", "SALES_HIGH_SPEED_SUITABILITY", "CASE WHEN SALES_HIGH_SPEED_SUITABILITY = 'No AWB - Check with RAN' THEN 0 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'No WBB - Check with RAN' THEN 0 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Low Speed Failover Only' THEN 1 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Feasible' THEN 2 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Good' THEN 3 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Very Good' THEN 4 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Excellent' THEN 5 END", "DESC");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SpeedExperiences()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SPEED_EXPERIENCE", "SPEED_EXPERIENCE", "CASE WHEN SPEED_EXPERIENCE = 'Low Speed' THEN 0 " +
                "WHEN SPEED_EXPERIENCE = 'Medium Speed' THEN 1 " +
                "WHEN SPEED_EXPERIENCE = 'High Speed' THEN 2 END", "DESC");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AccessTypes()
        {
            string sql = "";
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
            /* var accessFlags = FetchAccessTypesData(HttpContext.Current.Request.QueryString);
            var myCount = accessFlags.Select(key => key["admin_user"]).Where(val => val.ToString() == ATTUID).Count();
            var publicCount = accessFlags.Select(key => key["view_public"]).Where(val => val.ToString() == "1").Count();
            var sharedCount = accessFlags.Select(key => key["view_user"]).Where(val => val.ToString() == ATTUID).Count(); */

            var accessTypesList = new List<Dictionary<string, object>>();
            Dictionary<string, object> allAccessType = new Dictionary<string, object>();
            allAccessType.Add("value", "all");
            allAccessType.Add("name", "All");
            accessTypesList.Add(allAccessType);

            Dictionary<string, object> mineAccessType = new Dictionary<string, object>();
            mineAccessType.Add("value", "mine");
            mineAccessType.Add("name", "My Clusters");
            accessTypesList.Add(mineAccessType);

            Dictionary<string, object> sharedAccessType = new Dictionary<string, object>();
            sharedAccessType.Add("value", "shared");
            sharedAccessType.Add("name", "Shared With Me");
            accessTypesList.Add(sharedAccessType);

            Dictionary<string, object> publicAccessType = new Dictionary<string, object>();
            publicAccessType.Add("value", "public");
            publicAccessType.Add("name", "Public");
            accessTypesList.Add(publicAccessType);

            
            /* if (myCount > 0)
            {
                Dictionary<string, object> mineAccessType = new Dictionary<string, object>();
                mineAccessType.Add("value", "mine");
                mineAccessType.Add("name", "My Clusters");
                accessTypesList.Add(mineAccessType);
            }
            if (sharedCount > 0)
            {
                Dictionary<string, object> sharedAccessType = new Dictionary<string, object>();
                sharedAccessType.Add("value", "shared");
                sharedAccessType.Add("name", "Shared With Me");
                accessTypesList.Add(sharedAccessType);
            }
            if (publicCount > 0)
            {
                Dictionary<string, object> publicAccessType = new Dictionary<string, object>();
                publicAccessType.Add("value", "public");
                publicAccessType.Add("name", "Public");
                accessTypesList.Add(publicAccessType);
            } */

            return accessTypesList;
        }


    }
