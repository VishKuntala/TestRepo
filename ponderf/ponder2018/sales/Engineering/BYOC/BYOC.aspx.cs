using System;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.Services;
using System.Collections.Generic;
using System.Data;
using System.Transactions;
using System.Data.OleDb;
using System.Data.Common;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Configuration;
using Oracle.ManagedDataAccess.Client;
using Oracle.ManagedDataAccess.Types;
using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using System.Net;
using System.Text;
using ponder2018;

public partial class sales_Engineering_BYOC_BYOC : System.Web.UI.Page
{
    // private static string ATTUID = "";

    private string GetAccessGroups(string accessGroup, string attUid, string baseApiUrl, string authToken, ref string accessControlId)
    {
        try
        {
            WebRequest webRequest;
            webRequest = WebRequest.Create(baseApiUrl + "/users/" + accessGroup);
            webRequest.Headers.Add("authorization", authToken);
            WebResponse response = webRequest.GetResponse();
            using (Stream responseStream = response.GetResponseStream())
            {
                StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                string accessGroupsResponse = reader.ReadToEnd();
                dynamic dyn = JsonConvert.DeserializeObject(accessGroupsResponse);
                accessControlId = dyn.access_control_id;
                return dyn.access_level;
            }

        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }

    private string GetAuthToken(string attuid, string accessControlId)
    {
        var payload = new Dictionary<string, object>
        {
            { "accessControlId", accessControlId },
            { "attuid", attuid },
            { "exp", DateTimeOffset.UtcNow.AddHours(8).ToUnixTimeSeconds() }
        };
        const string secret = "!((zeqz*G=HQ-.EGX:C7rb[DE^<";

        IJwtAlgorithm algorithm = new HMACSHA256Algorithm(); // symmetric
        IJsonSerializer serializer = new JsonNetSerializer();
        IBase64UrlEncoder urlEncoder = new JwtBase64UrlEncoder();
        IJwtEncoder encoder = new JwtEncoder(algorithm, serializer, urlEncoder);

        var token = encoder.Encode(payload, secret);
        return token;
    }

    private void RegisterModulesScriptTag()
    {
        string scriptDirectory = HttpContext.Current.Request.IsLocal ? "local" : "dist";
        string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + $"/sales/Engineering/BYOC/{scriptDirectory}");
        for (int i = 0; i < fileEntries.Length; i++)
        {

            if (Path.GetFileName(fileEntries[i]).IndexOf("main.") != -1 && Path.GetExtension(fileEntries[i]) == ".js")
            {
                ltlModulesJsTag.Text = String.Format("<script type='text/javascript' src='/sales/Engineering/BYOC/{0}/{1}'></script>", scriptDirectory, Path.GetFileName(fileEntries[i]));

            }
        }

        ltlHeaderLinks.Text = String.Format(@"<link rel='stylesheet' type='text/css' href='/sales/Engineering/BYOC/{0}/leaflet.css'/>
                                        <script src='/sales/Engineering/BYOC/{1}/jquery-3.6.0.min.js'></script>
                                        <script src='/sales/Engineering/BYOC/{2}/leaflet.js'></script>
                                        <script src='/sales/Engineering/BYOC/{3}/ramda.min.js'></script>
                                        <link rel='stylesheet' type='text/css' href='/sales/Engineering/BYOC/{4}/semantic.min.css' />
                                        <link rel='stylesheet' type='text/css' href='/sales/Engineering/BYOC/{5}/style.css' />
                                        <script src='/sales/Engineering/BYOC/{6}/semantic.min.js'></script>
                                        ",
                                    scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory);


    }

    

    protected void Page_Load(object sender, EventArgs e)
    {
        // Register the webpack generated js bundle script tag in the aspx page for the scripts under the module folder
        RegisterModulesScriptTag();
        hdnBaseSearchApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
            System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];
        string ATTUID = "";
        string accessControlId = "";
        try
        {
            _CSP.User userx = (_CSP.User)System.Web.HttpContext.Current.User;
            ATTUID = userx.attuid.ToString();
        }
        catch
        {
            ATTUID = "no_user";
            // ATTUID = "wc5172";
        }
        hdnViewerAttId.Value = ATTUID;
        hdnToken.Value = this.GetAuthToken(ATTUID, null);
        // first check if the user has access to the BYOC tool itself
        string engByocGroupMembership = GetAccessGroups("ENG_BYOC", ATTUID, hdnBaseSearchApiUrl.Value, this.GetAuthToken(ATTUID, null), ref accessControlId);
        if (engByocGroupMembership != "Unlimited")
        {
            LoginRedirect();
        }
        // if the user has access to the BYOC tool, retrieve the user's access groups in the Scoring tool - this will determine what the user can do within the BYOC
        // tool (export limit etc)
        hdnViewerGroupMembership.Value = GetAccessGroups("ENG_SCORING", ATTUID, hdnBaseSearchApiUrl.Value, this.GetAuthToken(ATTUID, null), ref accessControlId);

        /* String strConnString = ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString;
        String strQuery1 = "SELECT ACCESS_GROUP FROM PONDER.PONDER_ACCESS_CONTROL WHERE ATT_USERID = '" + ATTUID + @"'";

        using (OracleConnection con = new OracleConnection(strConnString))
        {
            using (OracleCommand cmd = new OracleCommand(strQuery1)) // Initiates your SQL Command
            {
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = strQuery1;
                cmd.Connection = con;
                try
                {
                    con.Open();
                    using (OracleDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read();
                            OracleString oraclestring1 = reader.GetOracleString(0);                           

                            if (oraclestring1 == "ADMIN" || oraclestring1 == "ACE")
                            {                                
                                
                            }                            
                            else
                            {
                                LoginRedirect();
                            }
                            reader.Close();
                        }
                        else
                        {
                            LoginRedirect();
                        }

                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    con.Close();
                    con.Dispose();
                }
            }
        } */

    }

    public void LoginRedirect()
    {
        Response.Redirect("/PONDER_Not_auth.aspx");
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

            private static void InsertCluster(string clusterName, string currentUserId, string sharedUids, int isPublicCluster, string batchId,
            List<Dictionary<string, object>> clusterDetails)
        {
            int clusterId = 0;
            string insertClusterSql = @"INSERT INTO PONDER.SALES_ENG_BYOC_LIST (BYOC_CLUSTER_NAME, ADMIN_USER, VIEW_USER,
                                        VIEW_PUBLIC, CREATE_DATE, IS_ACTIVE, IS_PROCESSED, BATCH_ID)
                                        VALUES (:clusterName, :currentUserId, :sharedUids, :isPublicCluster, SYSDATE, 1, 0, :batchId) returning BYOC_CLUSTER_ID into :clusterId";
            string insertClusterRecordSql = @"INSERT INTO PONDER.SALES_ENG_BYOC_DETAIL
                    (BYOC_CLUSTER_ID, UNIQUE_KEY, ADDRESS, CITY, STATE, ZIPCODE, LATITUDE, LONGITUDE, LOCATION_ID, COMPANY_NAME, NOTES)
                      VALUES ( :clusterId, :uniqueKey, :address, :city, :state, :zipcode, :latitude, :longitude, :locationId, :companyName, :notes
                      )";

            using (TransactionScope scope = new TransactionScope())
            {
                using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
                {
                    connection.Open();
                    using (OracleCommand cmd = new OracleCommand(insertClusterSql, connection)) 
                    {
                        cmd.Parameters.Clear();
                        OracleParameter clusterIdParam = new OracleParameter("clusterId", OracleDbType.Int32);
                        clusterIdParam.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("clusterName", clusterName);
                        cmd.Parameters.Add("currentUserId", currentUserId);
                        cmd.Parameters.Add("sharedUids", sharedUids);
                        cmd.Parameters.Add("isPublicCluster", isPublicCluster);
                        cmd.Parameters.Add("batchId", batchId);
                        cmd.Parameters.Add(clusterIdParam);
                        cmd.ExecuteNonQuery();
                        clusterId = int.Parse(clusterIdParam.Value.ToString());
                    }
                    string[] addresses = new string[clusterDetails.Count];
                    string[] cities = new string[clusterDetails.Count];
                    string[] states = new string[clusterDetails.Count];
                    string[] zipcodes = new string[clusterDetails.Count];
                    double[] latitudes = new double[clusterDetails.Count];
                    double[] longitudes = new double[clusterDetails.Count];
                    string[] locationIds = new string[clusterDetails.Count];
                    string[] companyNames = new string[clusterDetails.Count];
                    string[] notes = new string[clusterDetails.Count];
                    string[] uniqueKeys = new string[clusterDetails.Count];
                    int[] byocClusterIds = new int[clusterDetails.Count];                    

                    for (var i = 0; i < clusterDetails.Count; i++)
                    {
                        var record = clusterDetails[i];
                        addresses[i] = Convert.ToString(record["ADDRESS (Required)"]).Trim();
                        cities[i] = Convert.ToString(record["CITY (Required)"]).Trim();
                        states[i] = Convert.ToString(record["STATE ABBR (Required)"]).Trim();
                        zipcodes[i] = Convert.ToString(record["ZIPCODE (Required)"]).Trim();
                        latitudes[i] = record.ContainsKey("LATITUDE (Optional)") && !String.IsNullOrWhiteSpace(record["LATITUDE (Optional)"].ToString()) ? Convert.ToDouble(record["LATITUDE (Optional)"]) : 0;
                        longitudes[i] = record.ContainsKey("LONGITUDE (Optional)") && !String.IsNullOrWhiteSpace(record["LONGITUDE (Optional)"].ToString()) ? Convert.ToDouble(record["LONGITUDE (Optional)"]) : 0;
                        locationIds[i] = record.ContainsKey("LOCATION_ID (Optional)") ? Convert.ToString(record["LOCATION_ID (Optional)"]).Trim() : null;
                        companyNames[i] = record.ContainsKey("COMPANY_NAME (Optional)") ? Convert.ToString(record["COMPANY_NAME (Optional)"]).Trim() : null;
                        notes[i] = record.ContainsKey("NOTES (Optional)") ? Convert.ToString(record["NOTES (Optional)"]).Trim() : null;
                        uniqueKeys[i] = string.Format("{0}_{1}_{2}_{3}", currentUserId, clusterId.ToString(), DateTime.Now.ToString("MM/dd/yyyy-HH:mm:ss"), (i + 1).ToString());                        
                        byocClusterIds[i] = clusterId;
                    }

                    using (OracleCommand cmd = new OracleCommand(insertClusterRecordSql, connection))
                    {
                        cmd.ArrayBindCount = clusterDetails.Count;
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("clusterId", byocClusterIds);
                        cmd.Parameters.Add("uniqueKey", uniqueKeys);
                        cmd.Parameters.Add("address", addresses);
                        cmd.Parameters.Add("city", cities);
                        cmd.Parameters.Add("state", states);
                        cmd.Parameters.Add("zipcode", zipcodes);
                        cmd.Parameters.Add("latitude", latitudes);
                        cmd.Parameters.Add("longitude", longitudes);
                        cmd.Parameters.Add("locationId", locationIds);
                        cmd.Parameters.Add("companyName", companyNames);
                        cmd.Parameters.Add("notes", notes);                        
                        cmd.ExecuteNonQuery();
                    }
                }
                scope.Complete();
            }
            
        }


        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Clusters()
        {
            string ATTUID = "";
            try
            {
                _CSP.User userx = (_CSP.User)System.Web.HttpContext.Current.User;
                ATTUID = userx.attuid.ToString();
            }
            catch
            {
                ATTUID = "no_user";
                // ATTUID = "wc5172";
            }
            string sql = string.Format(@"select PONDER.SALES_ENG_BYOC_LIST.*, NUMBER_OF_LOCATIONS,
                                        TO_CHAR(PONDER.SALES_ENG_BYOC_LIST.CREATE_DATE, 'MON-DD-YYYY') AS CLUSTER_CREATE_DATE,
                                        TO_CHAR(PONDER.SALES_ENG_BYOC_LIST.LAST_RUN_DATE, 'MON-DD-YYYY') AS CLUSTER_LAST_RUN_DATE
                                        FROM PONDER.SALES_ENG_BYOC_LIST INNER JOIN
                                        (SELECT COUNT(*) AS NUMBER_OF_LOCATIONS, BYOC_CLUSTER_ID FROM PONDER.SALES_ENG_BYOC_DETAIL GROUP BY BYOC_CLUSTER_ID) A
                                        ON PONDER.SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID = A.BYOC_CLUSTER_ID 
                                        WHERE IS_ACTIVE=1 AND (ADMIN_USER='{0}' OR  VIEW_PUBLIC=1 OR (ADMIN_USER <> '{1}' AND INSTR(VIEW_USER, '{2}') <> 0))
                                        ORDER BY SALES_ENG_BYOC_LIST.BYOC_CLUSTER_ID DESC", ATTUID, ATTUID, ATTUID);
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
            return SerializeDataTable(dataTable);

        }

        [WebMethod]
        public static void SaveCluster(string clusterName, string csvData, string sharedUids, int isPublicCluster, string batchId)
        {
            string ATTUID = "";
            try
            {
                _CSP.User userx = (_CSP.User)System.Web.HttpContext.Current.User;
                ATTUID = userx.attuid.ToString();
            }
            catch
            {
                ATTUID = "no_user";
                // ATTUID = "wc5172";
            }
            var clusterDetails = JsonConvert.DeserializeObject<List<Dictionary<string, object>>>(LZString.LZString.decompressFromBase64(csvData));
            InsertCluster(clusterName, ATTUID, sharedUids, isPublicCluster, batchId, clusterDetails);
        }


        [WebMethod]
        public static List<Dictionary<string, object>> RerunCluster(int clusterId)
        {
            object newClusterId = 0;
            string selectOldClusterSql = string.Format(@"SELECT BYOC_CLUSTER_NAME, ADMIN_USER, VIEW_USER,VIEW_PUBLIC FROM PONDER.SALES_ENG_BYOC_LIST
                                        WHERE BYOC_CLUSTER_ID={0}", clusterId);
            string insertNewClusterSql = @"INSERT INTO PONDER.SALES_ENG_BYOC_LIST (BYOC_CLUSTER_NAME, ADMIN_USER, VIEW_USER,VIEW_PUBLIC, CREATE_DATE, IS_ACTIVE, IS_PROCESSED, BATCH_ID)
                                        VALUES ( :byocClusterName, :adminUser, :viewUser,:viewPublic,SYSDATE,1,0,:oldClusterId )
                                        returning BYOC_CLUSTER_ID into :newClusterId";
            string deleteClusterSql = "UPDATE PONDER.SALES_ENG_BYOC_LIST SET IS_ACTIVE=0 WHERE BYOC_CLUSTER_ID = :oldClusterId";
            string updateClusterDetailsSql = "UPDATE PONDER.SALES_ENG_BYOC_DETAIL SET BYOC_CLUSTER_ID=:newClusterId WHERE BYOC_CLUSTER_ID=:oldClusterId";
            DataTable dataTable = DatabaseHelper.GetDataTable(selectOldClusterSql);
            var oldCluster = SerializeDataTable(dataTable)[0];
            using (TransactionScope scope = new TransactionScope())
            {
                using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
                {
                    connection.Open();
                    using (OracleCommand cmd = new OracleCommand(insertNewClusterSql, connection))
                    {
                        cmd.Parameters.Clear();
                        OracleParameter clusterIdParam = new OracleParameter("newClusterId", OracleDbType.Int32);
                        clusterIdParam.Direction = ParameterDirection.Output;
                        cmd.Parameters.Add("byocClusterName", oldCluster["byoc_cluster_name"]);
                        cmd.Parameters.Add("adminUser", oldCluster["admin_user"]);
                        cmd.Parameters.Add("viewUser", oldCluster["view_user"]);
                        cmd.Parameters.Add("viewPublic", oldCluster["view_public"]);
                        cmd.Parameters.Add("oldClusterId", clusterId);
                        cmd.Parameters.Add(clusterIdParam);
                        cmd.ExecuteNonQuery();
                        newClusterId = clusterIdParam.Value;
                    }
                    using (OracleCommand cmd = new OracleCommand(deleteClusterSql, connection))
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("oldClusterId", clusterId);
                        cmd.ExecuteNonQuery();
                    }
                    using (OracleCommand cmd = new OracleCommand(updateClusterDetailsSql, connection))
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("newClusterId", newClusterId);
                        cmd.Parameters.Add("oldClusterId", clusterId);
                        cmd.ExecuteNonQuery();
                    }
                }
                scope.Complete();
            }
            return Clusters();
        }

        [WebMethod]
        public static List<Dictionary<string, object>> DeleteCluster(int clusterId)
        {
            string deleteClusterSql = "UPDATE PONDER.SALES_ENG_BYOC_LIST SET IS_ACTIVE=0 WHERE BYOC_CLUSTER_ID = :clusterId";

            using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
            {
                connection.Open();
                using (OracleCommand cmd = new OracleCommand(deleteClusterSql, connection))
                {
                    cmd.Parameters.Clear();
                    cmd.Parameters.Add("clusterId", clusterId);
                    cmd.ExecuteNonQuery();
                }
            }
            return Clusters();
        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> Cluster()
        {
            string clusterId = HttpContext.Current.Request.QueryString["clusterId"];
            string getClusterSql = string.Format(@"select PONDER.SALES_ENG_BYOC_LIST.* FROM PONDER.SALES_ENG_BYOC_LIST WHERE BYOC_CLUSTER_ID = {0}", clusterId );
            DataTable dataTable = DatabaseHelper.GetDataTable(getClusterSql);
            return SerializeDataTable(dataTable);

        }

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> ClusterDetails()
        {
            string clusterId = HttpContext.Current.Request.QueryString["clusterId"];
            string getClusterDetailSql = string.Format(@"select address, city, state, zipcode, latitude, longitude, location_id, company_name, notes,
                    simple_coverage_score,fiveg,fiveg_plus_mmwave,fiveg_plus_cband,band_14,first_net,sales_high_speed_suitability,
                    speed_experience,azimuth,usid FROM PONDER.SALES_ENG_BYOC_DETAIL WHERE BYOC_CLUSTER_ID = {0}", clusterId);
            //string getClusterDetailSql = string.Format(@"select address, city, state, zipcode, latitude, longitude, location_id, company_name, notes,
            //    simple_coverage_score,fiveg,fiveg_plus,cband_avail,band_14,first_net,sales_high_speed_suitability,speed_experience,weighted_avg_tput,
            //    avail_capacity,roam_text,cqi,spectrum_efficiency_12_pl,cband_scs,weighted_avg_mcep_prbutl,coverage_radius,tput_min,tput_max,
            //    roaming_rate,cband_speed,fiveg_plus_speed,best_servers FROM PONDER.SALES_ENG_BYOC_DETAIL WHERE BYOC_CLUSTER_ID = {0}", clusterId);
            DataTable dataTable = DatabaseHelper.GetDataTable(getClusterDetailSql);
            return SerializeDataTable(dataTable);

        }

        [WebMethod]
        public static void LogAcknowledge()
        {
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

            LogEventParameters logEventParameters = new LogEventParameters();
            logEventParameters.userID = ATTUID;
            logEventParameters.eventType = "BYOC";

            DatabaseHelper.LogAcknowledge(logEventParameters);

        }

}