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


public partial class sales_AWB_scoring_BCLS : System.Web.UI.Page
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
            string fivegSql = " CASE WHEN FIVEG = 'Unknown' THEN 0" +
                " WHEN FIVEG = 'No' THEN 1" +
                " WHEN FIVEG = 'Partial' THEN 2" +
                " WHEN FIVEG = 'Yes' THEN 3" +
                " END AS FIVEG_SORT_COLUMN ";

            string band14Sql = " CASE WHEN BAND_14 = 'Unknown' THEN 0" +
                " WHEN BAND_14 = 'No' THEN 1" +
                " WHEN BAND_14 = 'Partial' THEN 2" +
                " WHEN BAND_14 = 'Yes' THEN 3" +
                " END AS BAND_14_SORT_COLUMN ";

            string awbCapacitySql = " CASE WHEN AWB_CAPACITY_TEXT = 'Unknown' THEN 0" +
                " WHEN AWB_CAPACITY_TEXT = 'Very Low Avail Capacity' THEN 1" +
                " WHEN AWB_CAPACITY_TEXT = 'Low Avail Capacity' THEN 2" +
                " WHEN AWB_CAPACITY_TEXT = 'Medium Avail Capacity' THEN 3" +
                " WHEN AWB_CAPACITY_TEXT = 'High Avail Capacity' THEN 4" +
                " WHEN AWB_CAPACITY_TEXT = 'Very High Avail Capacity' THEN 5" +
                " END AS AWB_CAP_TEXT_SORT_COLUMN ";

            string awbSpectrumEfficiencySql = " CASE WHEN AWB_SPECTRUM_EFFICIENCY = 'Unknown' THEN 0" +
                " WHEN AWB_SPECTRUM_EFFICIENCY = 'Very Low User Limit' THEN 1" +
                " WHEN AWB_SPECTRUM_EFFICIENCY = 'Low User Limit' THEN 2" +
                " WHEN AWB_SPECTRUM_EFFICIENCY = 'Medium User Limit' THEN 3" +
                " WHEN AWB_SPECTRUM_EFFICIENCY = 'High User Limit' THEN 4" +
                " WHEN AWB_SPECTRUM_EFFICIENCY = 'Highest User Limit' THEN 5" +
                " END AS AWB_SPEC_EFF_SORT_COLUMN ";

            string gponStatusSql = " CASE WHEN GPON_STATUS = 'Unknown' THEN 0" +
                " WHEN GPON_STATUS = 'GPON_AVAILABLE' THEN 1" +
                " WHEN GPON_STATUS = 'GPON_CUSTOMER' THEN 2" +
                " END AS GPON_STATUS_SORT_COLUMN ";

            string hypergigSql = " CASE WHEN HYPERGIG = 'No fiber data' THEN 0" +
                    " WHEN HYPERGIG = 'No' THEN 1" +
                    " WHEN HYPERGIG = 'Yes' THEN 2" +
                    " END AS HYPERGIG_SORT_COLUMN ";


            return band14Sql + "," + fivegSql + "," + awbCapacitySql + "," + awbSpectrumEfficiencySql + "," + gponStatusSql + "," + hypergigSql;

        }

        private static string BuildWhereClause(string vpgm, string archetype, string dmaName, string zipcode, string mqoId, string covScore, string fiveg,
             string band14, string awbCapText, string awbSpecEff, string attRankGws, string gponStatus, string attOoklaQ, string tmoRatioOokla, string vznRatioOokla, 
             string popDensity, string medIncome, string zipHispanic, string hypergig)
        {
            string sql = "1=1";

            if (!string.IsNullOrWhiteSpace(vpgm))
            {
                sql = sql + " AND VPGM IN (" + vpgm + ")";
        }
            if (!string.IsNullOrWhiteSpace(archetype))
            {
                sql = sql + " AND ARCHETYPE IN (" + archetype + ")";
        }
            if (!string.IsNullOrWhiteSpace(dmaName))
            {
                sql = sql + " AND DMA_NM IN (" + dmaName + ")";
            }
            if (!string.IsNullOrWhiteSpace(zipcode))
            {
                sql = sql + " AND ZIP IN (" + zipcode + ")";
            }
            if (!string.IsNullOrWhiteSpace(mqoId))
            {
                sql = sql + " AND SALES_FORCE_MQO_CAMPAIGN_ID IN (" + mqoId + ")";
            }
            if (!string.IsNullOrWhiteSpace(covScore))
            {
                sql = sql + " AND SIMPLE_COVERAGE_SCORE IN (" + covScore + ")";
            }
            if (!string.IsNullOrWhiteSpace(fiveg))
            {
                sql = sql + " AND FIVEG IN (" + fiveg + ")";
            }
            if (!string.IsNullOrWhiteSpace(band14))
            {
                sql = sql + " AND BAND_14 IN (" + band14 + ")";
            }
            if (!string.IsNullOrWhiteSpace(awbCapText))
            {
                sql = sql + " AND AWB_CAPACITY_TEXT IN (" + awbCapText + ")";
            }
            if (!string.IsNullOrWhiteSpace(awbSpecEff))
            {
                sql = sql + " AND AWB_SPECTRUM_EFFICIENCY IN (" + awbSpecEff + ")";
            }
            if (!string.IsNullOrWhiteSpace(attRankGws))
            {
                sql = sql + " AND ATT_RANK_GWS IN (" + attRankGws + ")";
            }
            if (!string.IsNullOrWhiteSpace(gponStatus))
            {
                sql = sql + " AND GPON_STATUS IN (" + gponStatus + ")";
            }
            if (!string.IsNullOrWhiteSpace(attOoklaQ))
            {
                sql = sql + " AND ATT_OOKLA_QUANTILE IN (" + attOoklaQ + ")";
            }
            if (!string.IsNullOrWhiteSpace(tmoRatioOokla))
            {
                sql = sql + " AND TMO_RATIO_OOKLA_LTE IN (" + tmoRatioOokla + ")";
            }
            if (!string.IsNullOrWhiteSpace(vznRatioOokla))
            {
                sql = sql + " AND VERIZON_RATIO_OOKLA_LTE IN (" + vznRatioOokla + ")";
            }
            if (!string.IsNullOrWhiteSpace(popDensity))
            {
                sql = sql + " AND POP_DENSITY_TEXT IN (" + popDensity + ")";
            }
            if (!string.IsNullOrWhiteSpace(medIncome))
            {
                sql = sql + " AND HH_MEDIAN_INCOME_TEXT IN (" + medIncome + ")";
            }
            if (!string.IsNullOrWhiteSpace(zipHispanic))
            {
                sql = sql + " AND ZIP_PCT_HISPANIC_TEXT IN (" + zipHispanic + ")";
            }
            if (!string.IsNullOrWhiteSpace(hypergig))
            {
                sql = sql + " AND HYPERGIG IN (" + hypergig + ")";
            }

        return string.IsNullOrWhiteSpace(sql) ? " 1=1" : sql;

        }

        private static List<Dictionary<string, object>> FetchData(NameValueCollection queryStringCollection,
     string valueColumn, string nameColumn, string sortColumn, string sortDirection = "ASC")
        {
            string vpgm = queryStringCollection["vpgm"];
            string archetype = queryStringCollection["archetype"];
            string dmaName = queryStringCollection["dmaName"];
            string zipcode = queryStringCollection["zipcode"];
            string mqoId = queryStringCollection["mqoId"];
            string covScore = queryStringCollection["covScore"];
            string fiveg = queryStringCollection["fiveg"];
            string band14 = queryStringCollection["band14"];
            string awbCapText = queryStringCollection["awbCapText"];
            string awbSpecEff = queryStringCollection["awbSpecEff"];
            string attRankGws = queryStringCollection["attRankGws"];
            string gponStatus = queryStringCollection["gponStatus"];
            string attOoklaQ = queryStringCollection["attOoklaQ"];
            string tmoRatioOokla = queryStringCollection["tmoRatioOokla"];
            string vznRatioOokla = queryStringCollection["vznRatioOokla"];
            string popDensity = queryStringCollection["popDensity"];
            string medIncome = queryStringCollection["medIncome"];
            string zipHispanic = queryStringCollection["zipHispanic"];
            string hypergig = queryStringCollection["hypergig"];
            string searchString = queryStringCollection["q"].Replace("undefined","");

            string sql;
            if (string.IsNullOrEmpty(searchString))
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_BCLS_ENRICHED WHERE 1=1 AND ", valueColumn, nameColumn);
                sql = sql + BuildWhereClause(vpgm, archetype, dmaName, zipcode, mqoId, covScore, fiveg, band14, awbCapText, awbSpecEff, attRankGws, gponStatus, attOoklaQ, tmoRatioOokla, vznRatioOokla, popDensity, medIncome, zipHispanic, hypergig);
            }
            else
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_BCLS_ENRICHED WHERE LOWER({2}) LIKE '{3}%' AND ", valueColumn, nameColumn, nameColumn.ToLower(), searchString.ToLower());
                sql = sql + BuildWhereClause(vpgm, archetype, dmaName, zipcode, mqoId, covScore, fiveg, band14, awbCapText, awbSpecEff, attRankGws, gponStatus, attOoklaQ, tmoRatioOokla, vznRatioOokla, popDensity, medIncome, zipHispanic, hypergig);
            }
            sql = sql + " AND " + valueColumn + " IS NOT NULL ";
            sql = sql + string.Format(" ORDER BY {0}", sortColumn);
            sql = sql + " " + sortDirection;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> TableData(string vpgm, string archetype, string dmaName, string zipcode, string mqoId, string covScore, string fiveg,
            string band14, string awbCapText, string awbSpecEff, string attRankGws, string gponStatus, string attOoklaQ, string tmoRatioOokla, string vznRatioOokla,
            string popDensity, string medIncome, string zipHispanic, string hypergig,
            string sortCriteria, string limit, string sortDirection, bool buildSortColumns)
        {

            string sql = @"SELECT ROWNUM, A.* FROM(SELECT VPGM, ARCHETYPE, DMA_NM, MIKEY, SALES_FORCE_MQO_CAMPAIGN_ID, SIMPLE_COVERAGE_SCORE, FIVEG, BAND_14, AWB_CAPACITY_TEXT,
            AWB_SPECTRUM_EFFICIENCY, GPON_STATUS, GPON_CUSTOMERS, HYPERGIG, ATT_RANK_GWS, TMO_RANK_GWS, VZ_RANK_GWS, ATT_OOKLA_QUANTILE, TMO_RATIO_OOKLA_LTE, VERIZON_RATIO_OOKLA_LTE,
            POP_DENSITY_TEXT, HH_MEDIAN_INCOME_TEXT, ZIP_PCT_HISPANIC_TEXT, ADDR, CITY, ST, ZIP, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_PHONE1, LATITUDE, LONGITUDE ";
            if(buildSortColumns) {
                sql = sql + "," + BuildSortColumns();
            }
            sql = sql + " FROM PONDER.SALES_BCLS_ENRICHED WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(vpgm, archetype, dmaName, zipcode, mqoId, covScore, fiveg, band14, awbCapText, awbSpecEff, attRankGws,
                    gponStatus, attOoklaQ, tmoRatioOokla, vznRatioOokla, popDensity, medIncome, zipHispanic, hypergig);
            sql = sql + " ORDER BY " + sortCriteria + " " + sortDirection + ", COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> MapData(string vpgm, string archetype, string dmaName, string zipcode, string mqoId, string covScore, string fiveg,
            string band14, string awbCapText, string awbSpecEff, string attRankGws, string gponStatus, string attOoklaQ, string tmoRatioOokla, string vznRatioOokla,
            string popDensity, string medIncome, string zipHispanic, string hypergig,
            string sortCriteria, string limit, string attribute)
        {

            string sql = @"SELECT ROWNUM, A.* FROM(SELECT  LATITUDE, LONGITUDE, CAMPAIGN_ID, " + attribute +
                " FROM PONDER.SALES_BCLS_ENRICHED WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(vpgm, archetype, dmaName, zipcode, mqoId, covScore, fiveg, band14, awbCapText, awbSpecEff, attRankGws,
                    gponStatus, attOoklaQ, tmoRatioOokla, vznRatioOokla, popDensity, medIncome, zipHispanic, hypergig);
            sql = sql + " ORDER BY " + sortCriteria + " DESC, COVERAGE_SCORE_RANK ASC) A";
            if (!string.IsNullOrWhiteSpace(limit))
            {
                sql = sql + " WHERE ROWNUM <= " + limit;
            }
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> ChartData(string vpgm, string archetype, string dmaName, string zipcode, string mqoId, string covScore, string fiveg,
            string band14, string awbCapText, string awbSpecEff, string attRankGws, string gponStatus, string attOoklaQ, string tmoRatioOokla, string vznRatioOokla,
            string popDensity, string medIncome, string zipHispanic, string hypergig,
            string sortCriteria, string limit, string attribute)
        {

            string sql = @"SELECT  count(*) as count," + attribute +
                " FROM PONDER.SALES_BCLS_ENRICHED WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
            sql = sql + BuildWhereClause(vpgm, archetype, dmaName, zipcode, mqoId, covScore, fiveg, band14, awbCapText, awbSpecEff, attRankGws,
                    gponStatus, attOoklaQ, tmoRatioOokla, vznRatioOokla, popDensity, medIncome, zipHispanic, hypergig);
            sql = sql + " GROUP BY " + attribute;            
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
        public static List<Dictionary<string, object>> LocationData(string latitude, string longitude)
        {
            string sql = @"SELECT VPGM, ARCHETYPE, DMA_NM, MIKEY, SALES_FORCE_MQO_CAMPAIGN_ID, SIMPLE_COVERAGE_SCORE, FIVEG, BAND_14, AWB_CAPACITY_TEXT,
                AWB_SPECTRUM_EFFICIENCY, GPON_STATUS, GPON_CUSTOMERS, HYPERGIG, ATT_RANK_GWS, TMO_RANK_GWS, VZ_RANK_GWS, ATT_OOKLA_QUANTILE, TMO_RATIO_OOKLA_LTE, VERIZON_RATIO_OOKLA_LTE,
                POP_DENSITY_TEXT, HH_MEDIAN_INCOME_TEXT, ZIP_PCT_HISPANIC_TEXT, ADDR, CITY, ST, ZIP, CONTACT_FIRST_NM, CONTACT_LAST_NM, CONTACT_PHONE1, LATITUDE, LONGITUDE
                FROM PONDER.SALES_BCLS_ENRICHED WHERE LATITUDE = '" + latitude + "' AND LONGITUDE = '" + longitude + "'";
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }


        [WebMethod]
        public static List<Dictionary<string, object>> StoreData(string statecode, string zipcode)
        {
            string sql = @"SELECT STORE_CATEGORY, LOCATION_ID, LOCATION_NAME,
                            MASTER_DEALER, ADDRESS_1, ADDRESS_2, CITY, STATE, ZIP_CODE, COUNTY,
                            LATITUDE, LONGITUDE, REGION AS SALES_REGION, MARKET_GROUP AS SALES_VPGM_MARKET
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
        public static List<Dictionary<string, object>> Vpgms()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "VPGM", "VPGM", "VPGM");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> ArcheTypes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ARCHETYPE", "ARCHETYPE", "ARCHETYPE");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> DmaNames()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "DMA_NM", "DMA_NM", "DMA_NM");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Zipcodes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ZIP", "ZIP", "ZIP");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> MqoIds()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SALES_FORCE_MQO_CAMPAIGN_ID", "SALES_FORCE_MQO_CAMPAIGN_ID", "SALES_FORCE_MQO_CAMPAIGN_ID");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CoverageScores()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SIMPLE_COVERAGE_SCORE", "SIMPLE_COVERAGE_SCORE", "SIMPLE_COVERAGE_SCORE","DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> FiveGs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "FIVEG", "FIVEG", "(CASE WHEN FIVEG = 'No' THEN 3 WHEN FIVEG = 'Partial' THEN 2 WHEN FIVEG = 'Yes' THEN 1 ELSE 4 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Band14s()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "BAND_14", "BAND_14", "(CASE WHEN BAND_14 = 'No' THEN 3 WHEN BAND_14 = 'Partial' THEN 2 WHEN BAND_14 = 'Yes' THEN 1 ELSE 4 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AwbCapTexts()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "AWB_CAPACITY_TEXT", "AWB_CAPACITY_TEXT", "(CASE WHEN AWB_CAPACITY_TEXT = 'Very High Avail Capacity' THEN 1 WHEN AWB_CAPACITY_TEXT = 'High Avail Capacity' THEN 2 WHEN AWB_CAPACITY_TEXT = 'Medium Avail Capacity' THEN 3 WHEN AWB_CAPACITY_TEXT = 'Low Avail Capacity' THEN 4 WHEN AWB_CAPACITY_TEXT = 'Very Low Avail Capacity' THEN 5 ELSE 6 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AwbSpecEffs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "AWB_SPECTRUM_EFFICIENCY", "AWB_SPECTRUM_EFFICIENCY", "(CASE WHEN AWB_SPECTRUM_EFFICIENCY = 'Highest User Limit' THEN 1 WHEN AWB_SPECTRUM_EFFICIENCY = 'High User Limit' THEN 2 WHEN AWB_SPECTRUM_EFFICIENCY = 'Medium User Limit' THEN 3 WHEN AWB_SPECTRUM_EFFICIENCY = 'Low User Limit' THEN 4 WHEN AWB_SPECTRUM_EFFICIENCY = 'Very Low User Limit' THEN 5 ELSE 6 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AttRankGwss()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ATT_RANK_GWS", "ATT_RANK_GWS", "ATT_RANK_GWS");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> gponStatuss()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "GPON_STATUS", "GPON_STATUS", "GPON_STATUS");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AttOoklaQs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ATT_OOKLA_QUANTILE", "ATT_OOKLA_QUANTILE", "ATT_OOKLA_QUANTILE");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> TmoRatioOoklas()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "TMO_RATIO_OOKLA_LTE", "TMO_RATIO_OOKLA_LTE", "(CASE WHEN TMO_RATIO_OOKLA_LTE = 'Excellent (<0.5)' THEN 1 WHEN TMO_RATIO_OOKLA_LTE = 'Very Good (0.5 to 0.7)' THEN 2 WHEN TMO_RATIO_OOKLA_LTE = 'Good (0.7 to 0.9)' THEN 3 WHEN TMO_RATIO_OOKLA_LTE = 'Average (0.9 to 1.2)' THEN 4 WHEN TMO_RATIO_OOKLA_LTE = 'Poor (>1.2)' THEN 5 ELSE 6 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> VznRationOoklas()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "VERIZON_RATIO_OOKLA_LTE", "VERIZON_RATIO_OOKLA_LTE", "(CASE WHEN VERIZON_RATIO_OOKLA_LTE = 'Excellent (<0.5)' THEN 1 WHEN VERIZON_RATIO_OOKLA_LTE = 'Very Good (0.5 to 0.7)' THEN 2 WHEN VERIZON_RATIO_OOKLA_LTE = 'Good (0.7 to 0.9)' THEN 3 WHEN VERIZON_RATIO_OOKLA_LTE = 'Average (0.9 to 1.2)' THEN 4 WHEN VERIZON_RATIO_OOKLA_LTE = 'Poor (>1.2)' THEN 5 ELSE 6 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> PopDensitys()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "POP_DENSITY_TEXT", "POP_DENSITY_TEXT", "POP_DENSITY_TEXT");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> MedIncomes()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "HH_MEDIAN_INCOME_TEXT", "HH_MEDIAN_INCOME_TEXT", "(CASE WHEN HH_MEDIAN_INCOME_TEXT = '0% to 20% (max $24,000)' THEN 1 WHEN HH_MEDIAN_INCOME_TEXT = '20% to 40% (max $39,400)' THEN 2 WHEN HH_MEDIAN_INCOME_TEXT = '40% to 60% (max $48,600)' THEN 3 WHEN HH_MEDIAN_INCOME_TEXT = '60% to 80% (max $61,500)' THEN 4 WHEN HH_MEDIAN_INCOME_TEXT = '80% to 100% (max >= $250k)' THEN 5 ELSE 6 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> ZipPctHispanicTexts()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ZIP_PCT_HISPANIC_TEXT", "ZIP_PCT_HISPANIC_TEXT", "(CASE WHEN ZIP_PCT_HISPANIC_TEXT = 'Percent Hispanic (0%-25%)' THEN 1 WHEN ZIP_PCT_HISPANIC_TEXT = 'Percent Hispanic (25%-50%)' THEN 2 WHEN ZIP_PCT_HISPANIC_TEXT = 'Percent Hispanic (50%-75%)' THEN 3 WHEN ZIP_PCT_HISPANIC_TEXT = 'Percent Hispanic  (75%-100%)' THEN 4 ELSE 5 END)");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Hypergigs()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "HYPERGIG", "HYPERGIG", "(CASE WHEN HYPERGIG = 'No fiber data' THEN 3 WHEN HYPERGIG = 'No' THEN 2 WHEN HYPERGIG = 'Yes' THEN 1 ELSE 4 END)");
        }

}

