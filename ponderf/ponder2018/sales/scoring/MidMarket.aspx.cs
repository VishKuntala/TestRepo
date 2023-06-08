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

        string speedExperienceSql = " CASE WHEN SPEED_EXPERIENCE = 'Unknown' THEN 0" +
        " WHEN SPEED_EXPERIENCE = 'Low Speed' THEN 1" +
        " WHEN SPEED_EXPERIENCE = 'Medium Speed' THEN 2" +
        " WHEN SPEED_EXPERIENCE = 'High Speed' THEN 3" +
        " END AS SPEED_EXP_SORT_COLUMN ";

        string availCapacitySql = " CASE WHEN AVAIL_CAPACITY = 'Unknown' THEN 0" +
        " WHEN AVAIL_CAPACITY = 'Very Low Avail Capacity' THEN 1" +
        " WHEN AVAIL_CAPACITY = 'Low Avail Capacity' THEN 2" +
        " WHEN AVAIL_CAPACITY = 'Medium Avail Capacity' THEN 3" +
        " WHEN AVAIL_CAPACITY = 'High Avail Capacity' THEN 4" +
        " WHEN AVAIL_CAPACITY = 'Very High Avail Capacity' THEN 5" +
        " END AS AVAIL_CAP_SORT_COLUMN ";

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

        string fivegPlusmmWaveSql = " CASE WHEN FIVEG_PLUS_MMWAVE = 'Unknown' THEN 0" +
        " WHEN FIVEG_PLUS_MMWAVE = 'No' THEN 1" +
        " WHEN FIVEG_PLUS_MMWAVE = 'Partial' THEN 2" +
        " WHEN FIVEG_PLUS_MMWAVE = 'Yes' THEN 3" +
        " END AS FIVEG_PLUS_MMWAVE_SORT_COLUMN ";

        string firstNetSql = " CASE WHEN FIRST_NET = 'Unknown' THEN 0" +
        " WHEN FIRST_NET = 'No' THEN 1" +
        " WHEN FIRST_NET = 'Partial' THEN 2" +
        " WHEN FIRST_NET = 'Yes' THEN 3" +
        " END AS FIRST_NET_SORT_COLUMN ";

        string fiberStatusSql = " CASE WHEN FIBER_STATUS = '99 - NONE' THEN 0" +
        " WHEN FIBER_STATUS = '7 - NEAR FIBER 1000ft (Not Lit)' THEN 1" +
        " WHEN FIBER_STATUS = '6 - GPON SERVING AREA (Not Lit)' THEN 2" +
        " WHEN FIBER_STATUS = '5 - FIBER THERE (Not Lit)' THEN 3" +
        " WHEN FIBER_STATUS = '4 - GPON LIT' THEN 4" +
        " WHEN FIBER_STATUS = '3 - SINGLE CUSTOMER NTE/CELL/LEGACY' THEN 5" +
        " WHEN FIBER_STATUS = '2 - MULTI CUSTOMER NTE' THEN 6" +
        " WHEN FIBER_STATUS = '1 - EMT' THEN 7" +
        " END AS FIBER_STATUS_SORT_COLUMN ";

        return roamTextSql + "," + speedExperienceSql + "," + availCapacitySql + "," + band14Sql + "," + fivegSql + "," + fivegPlusmmWaveSql + "," + firstNetSql + "," + fiberStatusSql;

    }

    private static string BuildWhereClause(string avpId, string smId, string salesRepId, string mobSellerId, string insideSalesId, string companyNames,
            string statecode, string zipcode, string indoorCovScore, string fiveg, string band14, string speedExperience, string availCapacity, string roamingDependency, string fiberStatus)
        {
            string sql = "1=1";

            if (!string.IsNullOrWhiteSpace(avpId))
            {
                sql = sql + " AND OWNING_BM_USER_ID = '" + avpId + "'";
            }
            if (!string.IsNullOrWhiteSpace(smId))
            {
                sql = sql + " AND OWNING_SM_USER_ID IN (" + smId + ")";
            }
            if (!string.IsNullOrWhiteSpace(salesRepId))
            {
                sql = sql + " AND OWNING_AE_USER_ID IN (" + salesRepId + ")";
            }
            if (!string.IsNullOrWhiteSpace(mobSellerId))
            {
                sql = sql + " AND MOBILITY_ACQ_AE_USER_ID IN (" + mobSellerId + ")";
            }            
            if (!string.IsNullOrWhiteSpace(insideSalesId))
            {
                sql = sql + " AND INSIDE_SALES_MOBLTY_AE_USER_ID IN (" + insideSalesId + ")";
            }            
            if (!string.IsNullOrWhiteSpace(companyNames))
            {
                sql = sql + " AND COMPANY_NAME IN (" + companyNames + ")";
            }            
            if (!string.IsNullOrWhiteSpace(statecode))
            {
                sql = sql + " AND STATE_Y IN (" + statecode + ")";
            }
            if (!string.IsNullOrWhiteSpace(zipcode))
            {
                sql = sql + " AND ZIPCODE IN (" + zipcode + ")";
            }
            if (!string.IsNullOrWhiteSpace(indoorCovScore))
            {
                sql = sql + " AND INDOOR_COVERAGE_SCORE IN (" + indoorCovScore + ")";
            }
            if (!string.IsNullOrWhiteSpace(fiveg))
            {
                sql = sql + " AND FIVEG IN (" + fiveg + ")";
            }
            if (!string.IsNullOrWhiteSpace(band14))
            {
                sql = sql + " AND BAND_14 IN (" + band14 + ")";
            }
            if (!string.IsNullOrWhiteSpace(speedExperience))
            {
                sql = sql + " AND SPEED_EXPERIENCE IN (" + speedExperience + ")";
            }
            if (!string.IsNullOrWhiteSpace(availCapacity))
            {
                sql = sql + " AND AVAIL_CAPACITY IN (" + availCapacity + ")";
            }
            if (!string.IsNullOrWhiteSpace(roamingDependency))
            {
                sql = sql + " AND ROAM_TEXT IN (" + roamingDependency + ")";
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
            string insideSalesId = queryStringCollection["insideSalesId"];
            string companyNames = queryStringCollection["companyNames"];
            string zipcode = queryStringCollection["zipcode"];
            string statecode = queryStringCollection["statecode"];
            string indoorCovScore = queryStringCollection["indoorCovScore"];
            string fiveg = queryStringCollection["fiveg"];
            string speedExperience = queryStringCollection["speedExperience"];
            string availCapacity = queryStringCollection["availCapacity"];
            string roamingDependency = queryStringCollection["roamingDependency"];
            string band14 = queryStringCollection["band14"];
            string fiberStatus = queryStringCollection["fiberStatus"];
            string searchString = queryStringCollection["q"].Replace("undefined", "");

            string sql;
            if (string.IsNullOrEmpty(searchString))
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_MIDMARKET_PROD_2022 WHERE 1=1 AND ", valueColumn, nameColumn);
                sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, insideSalesId, companyNames, statecode, zipcode, indoorCovScore, fiveg, band14, speedExperience, availCapacity, roamingDependency, fiberStatus);
            }
            else
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_MIDMARKET_PROD_2022 WHERE LOWER({2}) LIKE '{3}%' AND ", valueColumn, nameColumn, nameColumn.ToLower(), searchString.ToLower());
                sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, insideSalesId, companyNames, statecode, zipcode, indoorCovScore, fiveg, band14, speedExperience, availCapacity, roamingDependency, fiberStatus);
            }
            sql = sql + " AND " + valueColumn + " IS NOT NULL ";
            sql = sql + string.Format(" ORDER BY {0}", sortColumn);
            sql = sql + " " + sortDirection;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> TableData(string avpId, string smId, string salesRepId, string mobSellerId, string insideSalesId, string companyNames,
            string statecode, string zipcode, string fiveg, string band14, string speedExperience, string availCapacity, string roamingDependency, string indoorCovScore, string fiberStatus,
            string sortCriteria, string limit, string sortDirection, bool buildSortColumns)
        {
            string sql = "SELECT ROWNUM, A.* FROM (SELECT coverage_score_rank,svid, COMPANY_NAME,indoor_coverage_score, latitude, longitude, " +
                "OWNING_BM_USER_ID,OWNING_SM_USER_ID,OWNING_AE_USER_ID,MOBILITY_ACQ_AE_USER_ID,INSIDE_SALES_MOBLTY_AE_USER_ID, " +
                "FIVEG, FIVEG_PLUS_MMWAVE, BAND_14, FIRST_NET, ROAM_TEXT, SPEED_EXPERIENCE, AVAIL_CAPACITY, FIBER_STATUS, " +
                "ADDR,CITY,STATE_Y,ZIPCODE ";
            if (buildSortColumns)
            {
                sql = sql + "," + BuildSortColumns();
            }
            sql = sql + " FROM PONDER.SALES_MIDMARKET_PROD_2022 WHERE INDOOR_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, insideSalesId, companyNames, statecode, zipcode, indoorCovScore, fiveg, band14, speedExperience, availCapacity, roamingDependency, fiberStatus);
            sql = sql + " ORDER BY " + sortCriteria  + " " + sortDirection + ", COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> MapData(string avpId, string smId, string salesRepId, string mobSellerId, string insideSalesId, string companyNames,
            string statecode, string zipcode, string fiveg, string band14, string speedExperience, string availCapacity, string roamingDependency, string indoorCovScore, string fiberStatus,
            string sortCriteria, string limit, string attribute)
        {
            string sql = "SELECT ROWNUM, A.* FROM (SELECT latitude, longitude, " + attribute + 
                " FROM PONDER.SALES_MIDMARKET_PROD_2022 WHERE INDOOR_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, insideSalesId, companyNames, statecode, zipcode, indoorCovScore, fiveg, band14, speedExperience, availCapacity, roamingDependency, fiberStatus);
            sql = sql + " ORDER BY " + sortCriteria + " DESC, COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> ChartData(string avpId, string smId, string salesRepId, string mobSellerId, string insideSalesId, string companyNames,
            string statecode, string zipcode, string fiveg, string band14, string speedExperience, string availCapacity, string roamingDependency, string indoorCovScore, string fiberStatus,
            string sortCriteria, string limit, string attribute)
        {
            string sql = "SELECT count(*) as count," + attribute +
                " FROM PONDER.SALES_MIDMARKET_PROD_2022 WHERE INDOOR_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(avpId, smId, salesRepId, mobSellerId, insideSalesId, companyNames, statecode, zipcode, indoorCovScore, fiveg, band14, speedExperience, availCapacity, roamingDependency, fiberStatus);
            sql = sql + " GROUP BY " + attribute;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> LocationData(string latitude, string longitude)
        {
            string sql = @"SELECT coverage_score_rank,svid, company_name,indoor_coverage_score, latitude, longitude, " +
                "OWNING_BM_USER_ID,OWNING_SM_USER_ID,OWNING_AE_USER_ID,MOBILITY_ACQ_AE_USER_ID,INSIDE_SALES_MOBLTY_AE_USER_ID," +
                "FIVEG, BAND_14, FIRST_NET, ROAM_TEXT, FIVEG_PLUS_MMWAVE, SPEED_EXPERIENCE, AVAIL_CAPACITY, FIBER_STATUS, " +
                "ADDR,CITY,STATE_Y,ZIPCODE FROM PONDER.SALES_MIDMARKET_PROD_2022 WHERE LATITUDE = '" + latitude + "' AND LONGITUDE = '" + longitude + "'";
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
            return FetchData(HttpContext.Current.Request.QueryString, "OWNING_BM_USER_ID", "OWNING_BM_USER_ID", "OWNING_BM_USER_ID");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SalesManagers()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "OWNING_SM_USER_ID", "OWNING_SM_USER_ID", "OWNING_SM_USER_ID");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SalesRepresentatives()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "OWNING_AE_USER_ID", "OWNING_AE_USER_ID", "OWNING_AE_USER_ID");

        }
        
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> MobSellers()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "MOBILITY_ACQ_AE_USER_ID", "MOBILITY_ACQ_AE_USER_ID", "MOBILITY_ACQ_AE_USER_ID");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> InsideSalesSellers()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "INSIDE_SALES_MOBLTY_AE_USER_ID", "INSIDE_SALES_MOBLTY_AE_USER_ID", "INSIDE_SALES_MOBLTY_AE_USER_ID");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> States()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "STATE_Y", "STATE_Y", "STATE_Y");
        
        }
        
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Zipcodes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ZIPCODE", "ZIPCODE", "ZIPCODE");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CompanyNames()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "COMPANY_NAME", "COMPANY_NAME", "COMPANY_NAME");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> IndoorCovScores()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "INDOOR_COVERAGE_SCORE", "INDOOR_COVERAGE_SCORE", "INDOOR_COVERAGE_SCORE", "DESC");
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
        public static List<Dictionary<string, object>> SpeedExperiences()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SPEED_EXPERIENCE", "SPEED_EXPERIENCE", "(CASE WHEN SPEED_EXPERIENCE = 'Unknown' THEN 4" +
            " WHEN SPEED_EXPERIENCE = 'Low Speed' THEN 3" +
            " WHEN SPEED_EXPERIENCE = 'Medium Speed' THEN 2" +
            " WHEN SPEED_EXPERIENCE = 'High Speed' THEN 1" +
            " ELSE 5 END) ");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AvailCapacitys()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "AVAIL_CAPACITY", "AVAIL_CAPACITY", "(CASE WHEN AVAIL_CAPACITY = 'Unknown' THEN 6" +
            " WHEN AVAIL_CAPACITY = 'Very Low Avail Capacity' THEN 5" +
            " WHEN AVAIL_CAPACITY = 'Low Avail Capacity' THEN 4" +
            " WHEN AVAIL_CAPACITY = 'Medium Avail Capacity' THEN 3" +
            " WHEN AVAIL_CAPACITY = 'High Avail Capacity' THEN 2" +
            " WHEN AVAIL_CAPACITY = 'Very High Avail Capacity' THEN 1" +
            " ELSE 7 END) ");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> RoamingDependencies()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ROAM_TEXT", "ROAM_TEXT", "(CASE WHEN ROAM_TEXT = 'Unknown' THEN 4" +
            " WHEN ROAM_TEXT = 'Heavy roaming' THEN 3" +
            " WHEN ROAM_TEXT = 'Medium roaming' THEN 2" +
            " WHEN ROAM_TEXT = 'No' THEN 1" +
            " ELSE 5 END ) ");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> FiberStatuses()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIBER_STATUS", "FIBER_STATUS", "FIBER_STATUS");
        }


}

