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

public partial class sales_Engineering_scoring_BYOC : System.Web.UI.Page
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

            string suitabilitySql = " CASE WHEN SALES_HIGH_SPEED_SUITABILITY = 'No WBB - Check with RAN' THEN 0" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'No AWB - Check with RAN' THEN 0" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Low Speed Failover Only' THEN 1" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Feasible' THEN 2" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Good' THEN 3" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Very Good' THEN 4" +
            " WHEN SALES_HIGH_SPEED_SUITABILITY = 'Excellent' THEN 5" +
            " END AS SUITABILITY_SORT_COLUMN ";

            string ranCauseSql = " CASE WHEN RAN_SUITABILITY_CAUSE = 'Low TPUT Failover Only' THEN 0" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Insufficient Coverage' THEN 1" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Insufficient Capacity' THEN 2" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Insuff Cap MCEP Only' THEN 3" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Feasible' THEN 4" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Feasible Low TPUT' THEN 5" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Feasible Low Spect Eff' THEN 6" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Feasible Med Spect Eff' THEN 7" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Good' THEN 8" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Very Good' THEN 9" +
            " WHEN RAN_SUITABILITY_CAUSE = 'Excellent' THEN 10" +
            " END AS RANCAUSE_SORT_COLUMN ";

            string speedExperienceSql = " CASE WHEN SPEED_EXPERIENCE = 'Low Speed' THEN 0" +
            " WHEN SPEED_EXPERIENCE = 'Medium Speed' THEN 1" +
            " WHEN SPEED_EXPERIENCE = 'High Speed' THEN 2" +
            " END AS SPEEDEXPERIENCE_SORT_COLUMN ";

            string weightedAvgTputGrpSql = " CASE WHEN WEIGHTED_AVG_TPUT_GRP = '0-8' THEN 0" +
            " WHEN WEIGHTED_AVG_TPUT_GRP = '8-11' THEN 1" +
            " WHEN WEIGHTED_AVG_TPUT_GRP = '11-14' THEN 2" +
            " WHEN WEIGHTED_AVG_TPUT_GRP = '14-18' THEN 3" +
            " WHEN WEIGHTED_AVG_TPUT_GRP = '18+' THEN 4" +
            " END AS WEIGHTEDAVGTPUTGRP_SORT_COLUMN ";

            string availCapacitySql = " CASE WHEN AVAIL_CAPACITY = 'Very Low Avail Capacity' THEN 0" +
                " WHEN AVAIL_CAPACITY = 'Low Avail Capacity' THEN 1" +
                " WHEN AVAIL_CAPACITY = 'Medium Avail Capacity' THEN 2" +
                " WHEN AVAIL_CAPACITY = 'High Avail Capacity' THEN 3" +
                " WHEN AVAIL_CAPACITY = 'Very High Avail Capacity' THEN 4" +
                " END AS AVAILCAPACITY_SORT_COLUMN ";
         
            string roamTextSql = " CASE WHEN ROAM_TEXT = 'Heavy roaming' THEN 0" +
                " WHEN ROAM_TEXT = 'Medium roaming' THEN 1" +
                " WHEN ROAM_TEXT = 'No' THEN 2" +
                " END AS ROAMTEXT_SORT_COLUMN ";

            string cqiGrpSql = " CASE WHEN CQI_GRP = '0-2' THEN 0" +
                    " WHEN CQI_GRP = '3-5' THEN 1" +
                    " WHEN CQI_GRP = '6-8' THEN 2" +
                    " WHEN CQI_GRP = '9-11' THEN 3" +
                    " WHEN CQI_GRP = '12-15' THEN 4" +
                    " END AS CQIGRP_SORT_COLUMN ";

            string spectrumEff12PlSql = " CASE WHEN SPECTRUM_EFFICIENCY_12_PL = 'Very Low User Limit' THEN 0" +
                    " WHEN SPECTRUM_EFFICIENCY_12_PL = 'Low User Limit' THEN 1" +
                    " WHEN SPECTRUM_EFFICIENCY_12_PL = 'Medium User Limit' THEN 1" +
                    " WHEN SPECTRUM_EFFICIENCY_12_PL = 'High User Limit' THEN 2" +
                    " WHEN SPECTRUM_EFFICIENCY_12_PL = 'Highest User Limit' THEN 3" +
                    " END AS SPECTRUMEFF12PL_SORT_COLUMN ";
        
            string cbandScsSql = " CASE WHEN CBAND_SCS = '1' THEN 0" +
                    " WHEN CBAND_SCS = '2' THEN 1" +
                    " WHEN CBAND_SCS = '3' THEN 2" +
                    " WHEN CBAND_SCS = '4' THEN 3" +
                    " WHEN CBAND_SCS = '5' THEN 4" +
                    " END AS CBANDSCS_SORT_COLUMN ";

            string weightedAvgMcepPrbUtlGrpSql = " CASE WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '0-20' THEN 0" +
                    " WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '20-40' THEN 1" +
                    " WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '40-60' THEN 2" +
                    " WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '60-80' THEN 3" +
                    " WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '80-100' THEN 4" +
                    " END AS AVGMCEPPRBUTLGRP_SORT_COLUMN ";
        
            return fivegSql + "," + fivegPlusSql + "," + cbandSql + "," + band14Sql + "," + fnetSql + "," + suitabilitySql + "," + ranCauseSql + "," + speedExperienceSql + "," + weightedAvgTputGrpSql + "," + availCapacitySql + "," + roamTextSql + "," + cqiGrpSql + "," + spectrumEff12PlSql + "," + cbandScsSql + "," + weightedAvgMcepPrbUtlGrpSql;

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
            string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string ranCause, string speedExperience, string weightedAvgTputGrp,
            string availCapacity, string roamText, string cqiGrp, string spectrumEff12Pl, string cbandScs, string weightedAvgMcepPrbUtlGrp)
        {
            string sql = " IS_ACTIVE = 1 AND IS_PROCESSED = 1";

            if (!string.IsNullOrWhiteSpace(accessType) && !string.IsNullOrWhiteSpace(clusterId))
            {
                sql = sql + " AND " + BuildAccessTypeWhereClause(accessType) + " AND PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID IN (" + clusterId + ")";
            }
            if (string.IsNullOrWhiteSpace(accessType) && !string.IsNullOrWhiteSpace(clusterId))
            {
                sql = sql + " AND PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID IN (" + clusterId + ")";
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
            if (!string.IsNullOrWhiteSpace(ranCause))
            {
                sql = sql + " AND RAN_SUITABILITY_CAUSE IN (" + ranCause + ")";
            }
            if (!string.IsNullOrWhiteSpace(speedExperience))
            {
                sql = sql + " AND SPEED_EXPERIENCE IN (" + speedExperience + ")";
            }
            if (!string.IsNullOrWhiteSpace(weightedAvgTputGrp))
            {
                sql = sql + " AND WEIGHTED_AVG_TPUT_GRP IN (" + weightedAvgTputGrp + ")";
            }        
            if (!string.IsNullOrWhiteSpace(availCapacity))
            {
                sql = sql + " AND AVAIL_CAPACITY IN (" + availCapacity + ")";
            }
            if (!string.IsNullOrWhiteSpace(roamText))
            {
                sql = sql + " AND ROAM_TEXT IN (" + roamText + ")";
            }
            if (!string.IsNullOrWhiteSpace(cqiGrp))
            {
                sql = sql + " AND CQI_GRP IN (" + cqiGrp + ")";
            }
            if (!string.IsNullOrWhiteSpace(spectrumEff12Pl))
            {
                sql = sql + " AND SPECTRUM_EFFICIENCY_12_PL IN (" + spectrumEff12Pl + ")";
            }
            if (!string.IsNullOrWhiteSpace(cbandScs))
            {
                sql = sql + " AND CBAND_SCS IN (" + cbandScs + ")";
            }
            if (!string.IsNullOrWhiteSpace(weightedAvgMcepPrbUtlGrp))
            {
                sql = sql + " AND WEIGHTED_AVG_MCEP_PRBUTL_GRP IN (" + weightedAvgMcepPrbUtlGrp + ")";
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
        string ranCause = queryStringCollection["ranCause"];
        string speedExperience = queryStringCollection["speedExperience"];
        string weightedAvgTputGrp = queryStringCollection["weightedAvgTputGrp"];
        string availCapacity = queryStringCollection["availCapacity"];
        string roamText = queryStringCollection["roamText"];
        string cqiGrp = queryStringCollection["cqiGrp"];
        string spectrumEff12Pl = queryStringCollection["spectrumEff12Pl"];
        string cbandScs = queryStringCollection["cbandScs"];
        string weightedAvgMcepPrbUtlGrp = queryStringCollection["weightedAvgMcepPrbUtlGrp"];
        string searchString = queryStringCollection["q"].Replace("undefined", "");

        string sql;
        sql = string.Format("select ADMIN_USER, VIEW_PUBLIC, VIEW_USER from PONDER.SALES_ENG_BYOC_DETAIL INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID WHERE 1=1 AND ");
        sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
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
            string ranCause = queryStringCollection["ranCause"];
            string speedExperience = queryStringCollection["speedExperience"];
            string weightedAvgTputGrp = queryStringCollection["weightedAvgTputGrp"];
            string availCapacity = queryStringCollection["availCapacity"];
            string roamText = queryStringCollection["roamText"];
            string cqiGrp = queryStringCollection["cqiGrp"];
            string spectrumEff12Pl = queryStringCollection["spectrumEff12Pl"];
            string cbandScs = queryStringCollection["cbandScs"];
            string weightedAvgMcepPrbUtlGrp = queryStringCollection["weightedAvgMcepPrbUtlGrp"];
            string searchString = queryStringCollection["q"].Replace("undefined", "");

            string sql;
            if (string.IsNullOrEmpty(searchString))
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_ENG_BYOC_DETAIL INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID WHERE 1=1 AND ", valueColumn, nameColumn);
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
            }
            else
            {
                sql = string.Format("select distinct {0} as value, {1} as name from PONDER.SALES_ENG_BYOC_DETAIL INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID WHERE LOWER({2}) LIKE '{3}%' AND ", valueColumn, nameColumn, nameColumn.ToLower(), searchString.ToLower());
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
            }
            sql = sql + " AND " + valueColumn + " IS NOT NULL ";
            sql = sql + string.Format(" ORDER BY {0}", sortColumn);
            sql = sql + " " + sortDirection;
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);
        }

        [WebMethod]
            public static List<Dictionary<string, object>> TableData(string accessType, string clusterId, string zipcode, string statecode,
                    string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string ranCause, string speedExperience, string weightedAvgTputGrp,
                    string availCapacity, string roamText, string cqiGrp, string spectrumEff12Pl, string cbandScs, string weightedAvgMcepPrbUtlGrp,
                    string sortCriteria, string limit, string sortDirection, bool buildSortColumns)
            {
                string sql = "SELECT ROWNUM, A.* FROM (SELECT coverage_score_rank,location_id,company_name,address,city,state,zipcode,simple_coverage_score, latitude, longitude, " +
                    "FIVEG,FIVEG_PLUS_MMWAVE,FIVEG_PLUS_SPEED,FIVEG_PLUS_CBAND,CBAND_SCS,CBAND_SPEED,BAND_14,FIRST_NET,SALES_HIGH_SPEED_SUITABILITY,RAN_SUITABILITY_CAUSE,SPEED_EXPERIENCE,WEIGHTED_AVG_TPUT," +
                    "TPUT_MIN,TPUT_MAX,AVAIL_CAPACITY,CQI,SPECTRUM_EFFICIENCY_12_PL,WEIGHTED_AVG_MCEP_PRBUTL," +
                    "ROAM_TEXT,ROAMING_RATE,COVERAGE_RADIUS,BEST_SERVERS,AZIMUTH,USID";
                    if (buildSortColumns)
                {
                    sql = sql + "," + BuildSortColumns();
                }
                sql = sql + @" FROM PONDER.SALES_ENG_BYOC_DETAIL 
                        INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID
                        WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
                sql = sql + " ORDER BY " + sortCriteria + " " + sortDirection + ", COVERAGE_SCORE_RANK ASC) A";
                if (!string.IsNullOrWhiteSpace(limit))
                {
                    sql = sql + " WHERE ROWNUM <= " + limit;
                }
                DataTable dataTable = DatabaseHelper.GetDataTable(sql);
                return SerializeDataTable(dataTable);
            }

            [WebMethod]
            public static List<Dictionary<string, object>> SalesTableData(string accessType, string clusterId, string zipcode, string statecode,
                        string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string ranCause, string speedExperience, string weightedAvgTputGrp,
                        string availCapacity, string roamText, string cqiGrp, string spectrumEff12Pl, string cbandScs, string weightedAvgMcepPrbUtlGrp,
                        string sortCriteria, string limit, string sortDirection, bool buildSortColumns)
            {
                string sql = "SELECT ROWNUM, A.* FROM (SELECT coverage_score_rank,location_id,company_name,address,city,state,zipcode,simple_coverage_score, latitude, longitude, " +
                "FIVEG,FIVEG_PLUS_MMWAVE,FIVEG_PLUS_CBAND,BAND_14,FIRST_NET,SALES_HIGH_SPEED_SUITABILITY,SPEED_EXPERIENCE";
                if (buildSortColumns)
                {
                    sql = sql + "," + BuildSortColumns();
                }
                sql = sql + @" FROM PONDER.SALES_ENG_BYOC_DETAIL 
                                INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID
                                WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
                sql = sql + " ORDER BY " + sortCriteria + " " + sortDirection + ", COVERAGE_SCORE_RANK ASC) A";
                if (!string.IsNullOrWhiteSpace(limit))
                {
                    sql = sql + " WHERE ROWNUM <= " + limit;
                }
                DataTable dataTable = DatabaseHelper.GetDataTable(sql);
                return SerializeDataTable(dataTable);
            }

            [WebMethod]
            public static List<Dictionary<string, object>> MapData(string accessType, string clusterId, string zipcode, string statecode,
                    string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string ranCause, string speedExperience, string weightedAvgTputGrp,
                    string availCapacity, string roamText, string cqiGrp, string spectrumEff12Pl, string cbandScs, string weightedAvgMcepPrbUtlGrp,
                    string sortCriteria, string limit, string attribute)
            {
                string sql = "SELECT ROWNUM, A.* FROM (SELECT latitude, longitude, PONDER.SALES_ENG_BYOC_DETAIL.byoc_cluster_id, " + attribute +
                    @" FROM PONDER.SALES_ENG_BYOC_DETAIL 
                        INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID 
                        WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
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
                    string covScore, string fiveg, string fivegplus, string cband, string band14, string fnet, string suitability, string ranCause, string speedExperience, string weightedAvgTputGrp,
                    string availCapacity, string roamText, string cqiGrp, string spectrumEff12Pl, string cbandScs, string weightedAvgMcepPrbUtlGrp,
                    string sortCriteria, string limit, string attribute)
            {
                string sql = "SELECT count(*) as count," + attribute +
                    @" FROM PONDER.SALES_ENG_BYOC_DETAIL 
                        INNER JOIN PONDER.SALES_ENG_BYOC_LIST ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID
                        WHERE SIMPLE_COVERAGE_SCORE IS NOT NULL AND COVERAGE_SCORE_RANK != 0 AND ";
                sql = sql + BuildWhereClause(accessType, clusterId, zipcode, statecode, covScore, fiveg, fivegplus, cband, band14, fnet, suitability, ranCause, speedExperience, weightedAvgTputGrp, availCapacity, roamText, cqiGrp, spectrumEff12Pl, cbandScs, weightedAvgMcepPrbUtlGrp);
                sql = sql + " GROUP BY " + attribute;
                DataTable dataTable = DatabaseHelper.GetDataTable(sql);
                return SerializeDataTable(dataTable);
            }

        [WebMethod]
            public static List<Dictionary<string, object>> LocationData(string latitude, string longitude, int byocClusterId)
            {
                string sql = @"SELECT COVERAGE_SCORE_RANK,BYOC_CLUSTER_NAME,LOCATION_ID,COMPANY_NAME,SIMPLE_COVERAGE_SCORE,LATITUDE,LONGITUDE, " +
                    "FIVEG,FIVEG_PLUS_MMWAVE,FIVEG_PLUS_CBAND,BAND_14,FIRST_NET,SALES_HIGH_SPEED_SUITABILITY,RAN_SUITABILITY_CAUSE,SPEED_EXPERIENCE,WEIGHTED_AVG_TPUT," +
                    "AVAIL_CAPACITY,ROAM_TEXT,CQI,SPECTRUM_EFFICIENCY_12_PL,CBAND_SCS,WEIGHTED_AVG_MCEP_PRBUTL," +
                    "COVERAGE_RADIUS,TPUT_MIN,TPUT_MAX,ROAMING_RATE,CBAND_SPEED,FIVEG_PLUS_SPEED,BEST_SERVERS,AZIMUTH,USID," +
                    "ADDRESS,CITY,STATE,ZIPCODE FROM PONDER.SALES_ENG_BYOC_DETAIL INNER JOIN PONDER.SALES_ENG_BYOC_LIST " +
                    "ON PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID WHERE " +
                    "SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID = " + byocClusterId + " AND LATITUDE = '" + latitude + "' AND LONGITUDE = '" + longitude + "'";
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
            return FetchData(HttpContext.Current.Request.QueryString, "TO_CHAR(PONDER.SALES_ENG_BYOC_DETAIL.BYOC_CLUSTER_ID)", "BYOC_CLUSTER_NAME", "BYOC_CLUSTER_NAME");
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
            return FetchData(HttpContext.Current.Request.QueryString, "SALES_HIGH_SPEED_SUITABILITY", "SALES_HIGH_SPEED_SUITABILITY", "CASE WHEN SALES_HIGH_SPEED_SUITABILITY = 'No WBB - Check with RAN' THEN 0 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'No AWB - Check with RAN' THEN 1 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Low Speed Failover Only' THEN 1 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Feasible' THEN 2 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Good' THEN 3 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Very Good' THEN 4 " +
                "WHEN SALES_HIGH_SPEED_SUITABILITY = 'Excellent' THEN 5 END", "DESC");

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> RanCauses()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "RAN_SUITABILITY_CAUSE", "RAN_SUITABILITY_CAUSE", "CASE WHEN RAN_SUITABILITY_CAUSE = 'Insufficient TPUT' THEN 0 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Insufficient Coverage' THEN 1 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Insufficient Capacity' THEN 2 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Insuff Cap MCEP Only' THEN 3 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Feasible' THEN 4 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Feasible Low TPUT' THEN 5 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Feasible Low Spect Eff' THEN 6 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Feasible Med Spect Eff' THEN 7 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Good' THEN 8 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Very Good' THEN 9 " +
                "WHEN RAN_SUITABILITY_CAUSE = 'Excellent' THEN 10 END", "DESC");

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
        public static List<Dictionary<string, object>> WeightedAvgTputGrps()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "WEIGHTED_AVG_TPUT_GRP", "WEIGHTED_AVG_TPUT_GRP", "CASE WHEN WEIGHTED_AVG_TPUT_GRP = '0-8' THEN 0 " +
                "WHEN WEIGHTED_AVG_TPUT_GRP = '8-11' THEN 1 " +
                "WHEN WEIGHTED_AVG_TPUT_GRP = '11-14' THEN 2 " +
                "WHEN WEIGHTED_AVG_TPUT_GRP = '14-18' THEN 3 " +
                "WHEN WEIGHTED_AVG_TPUT_GRP = '18+' THEN 4 END", "DESC");

        }
        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AvailCapacitys()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "AVAIL_CAPACITY", "AVAIL_CAPACITY", "CASE WHEN AVAIL_CAPACITY = 'Very Low Avail Capacity' THEN 0 " +
                "WHEN AVAIL_CAPACITY = 'Low Avail Capacity' THEN 1 " +
                "WHEN AVAIL_CAPACITY = 'Medium Avail Capacity' THEN 2 " +
                "WHEN AVAIL_CAPACITY = 'High Avail Capacity' THEN 3 " +
                "WHEN AVAIL_CAPACITY = 'Very High Avail Capacity' THEN 4 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> RoamTexts()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "ROAM_TEXT", "ROAM_TEXT", "CASE WHEN ROAM_TEXT = 'Heavy roaming' THEN 0 " +
                "WHEN ROAM_TEXT = 'Medium roaming' THEN 1 " +
                "WHEN ROAM_TEXT = 'No' THEN 2 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CqiGrps()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "CQI_GRP", "CQI_GRP", "CASE WHEN CQI_GRP = '0-2' THEN 0 " +
                "WHEN CQI_GRP = '3-5' THEN 1 " +
                "WHEN CQI_GRP = '6-8' THEN 2 " +
                "WHEN CQI_GRP = '9-11' THEN 3 " +
                "WHEN CQI_GRP = '12-15' THEN 4 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> SpectrumEff12Pls()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "SPECTRUM_EFFICIENCY_12_PL", "SPECTRUM_EFFICIENCY_12_PL", "CASE WHEN SPECTRUM_EFFICIENCY_12_PL = 'Very Low User Limit' THEN 0 " +
                "WHEN SPECTRUM_EFFICIENCY_12_PL = 'Low User Limit' THEN 1 " +
                "WHEN SPECTRUM_EFFICIENCY_12_PL = 'Medium User Limit' THEN 2 " +
                "WHEN SPECTRUM_EFFICIENCY_12_PL = 'High User Limit' THEN 3 " +
                "WHEN SPECTRUM_EFFICIENCY_12_PL = 'Highest User Limit' THEN 4 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> CbandScss()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "TO_CHAR(CBAND_SCS)", "CBAND_SCS", "CASE WHEN CBAND_SCS = '1' THEN 0 " +
                "WHEN CBAND_SCS = '2' THEN 1 " +
                "WHEN CBAND_SCS = '3' THEN 2 " +
                "WHEN CBAND_SCS = '4' THEN 3 " +
                "WHEN CBAND_SCS = '5' THEN 4 END", "DESC");
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> WeightedAvgMcepPrbUtlGrps()
        {
            return FetchData(HttpContext.Current.Request.QueryString, "WEIGHTED_AVG_MCEP_PRBUTL_GRP", "WEIGHTED_AVG_MCEP_PRBUTL_GRP", "CASE WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '0-20' THEN 0 " +
                "WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '20-40' THEN 1 " +
                "WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '40-60' THEN 2 " +
                "WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '60-80' THEN 3 " +
                "WHEN WEIGHTED_AVG_MCEP_PRBUTL_GRP = '80-100' THEN 4 END");
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
