using System;
using System.Globalization;
using System.IO;
using System.Web;
// using CsvHelper;
// using System.Linq;
// using System.Web.UI;
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
using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using System.Threading;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using Newtonsoft.Json.Linq;
using ponder2018;



    public partial class sales_servicestatus_ServiceStatus : System.Web.UI.Page
    {

        private void RegisterModulesScriptTag()
        {
            string scriptDirectory = HttpContext.Current.Request.IsLocal ? "local" : "dist";
            string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + $"/sales/servicestatus/{scriptDirectory}");
            for (int i = 0; i < fileEntries.Length; i++)
            {

                if (Path.GetFileName(fileEntries[i]).IndexOf("main.") != -1 && Path.GetExtension(fileEntries[i]) == ".js") {
                    ltlModulesJsTag.Text = String.Format("<script type='text/javascript' src='/sales/servicestatus/{0}/{1}'></script>", scriptDirectory, Path.GetFileName(fileEntries[i]));

                }
            }

            ltlHeaderLinks.Text = String.Format(@"
                                                  <script src='/sales/servicestatus/{0}/jquery-3.6.0.min.js'></script>
                                                    <script src='/sales/servicestatus/{1}/ramda.min.js'></script>
                                                    <link rel='stylesheet' type='text/css' href='/sales/servicestatus/{2}/semantic.min.css' />
                                                    <script src='/sales/servicestatus/{3}/semantic.min.js'></script>
                                                   ",
                                                scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory);


        }

        private static string GetAuthToken(string attuid)
        {
            var payload = new Dictionary<string, object>
            {
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

        private string GetApiAuthToken(string attuid)
        {
            var payload = new Dictionary<string, object>
            {
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

        private string GetAccessGroups(string attUid, string baseApiUrl, string authToken)
        {
            try
            {
                WebRequest webRequest;
                webRequest = WebRequest.Create(baseApiUrl + "/users/DIRECT");
                webRequest.Headers.Add("authorization", authToken);
                WebResponse response = webRequest.GetResponse();
                using (Stream responseStream = response.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                    string accessGroupsResponse = reader.ReadToEnd();
                    dynamic dyn = JsonConvert.DeserializeObject(accessGroupsResponse);
                    return  dyn == null ? "" : dyn.access_level;
                }

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // Register the webpack generated js bundle script tag in the aspx page for the scripts under the module folder
           RegisterModulesScriptTag();
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
            hdnViewerAttId.Value = ATTUID;
            hdnToken.Value = this.GetApiAuthToken(ATTUID);
            hdnBaseSearchApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
                System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];
            hdnRootUrl.Value = HttpContext.Current.Request.IsLocal ?
        "http://localhost:8080/" :
        String.Format(@"{0}://{1}/", HttpContext.Current.Request.Url.Scheme, HttpContext.Current.Request.Url.Host);
        hdnViewerGroupMembership.Value = GetAccessGroups(ATTUID, hdnBaseSearchApiUrl.Value, hdnToken.Value);
        
        }

        private static JObject GetMatchQuality(string streetNumber, double lat, double lng, string baseApiUrl, string authToken)
        {
            try
            {
                WebRequest webRequest;
                webRequest = WebRequest.Create(baseApiUrl + "/servicestatus");
                webRequest.Headers.Add("authorization", authToken);
                webRequest.Method = "POST";
                webRequest.ContentType = "application/json";
                using (var streamWriter = new StreamWriter(webRequest.GetRequestStream()))
                {
                    string json = "{\"lat\":" + lat.ToString() + "," +
                                  "\"lon\":" + lng.ToString()  + "," +
                                  "\"streetNumber\":\"" + streetNumber + "\"" +
                                  "}";

                    streamWriter.Write(json);
                }
                WebResponse response = webRequest.GetResponse();
                using (Stream responseStream = response.GetResponseStream())
                {
                    StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                    string matchQualityResponse = reader.ReadToEnd();
                    dynamic dyn = JsonConvert.DeserializeObject(matchQualityResponse);
                    if (dyn.match_quality == "unacceptable")
                    {
                        dyn.service_status = "\"grey\"";
                        dyn.service_type = "\"NO MATCH FOUND\"";
                    } else if (dyn.ics_score == 1)
                    {
                        dyn.service_status = "\"red\"";
                        dyn.service_type = "\"Indoor Coverage RED\"";
                    }
                    else if ( dyn.ics_score == 2)
                    {
                        dyn.service_status = "\"yellow\"";
                        dyn.service_type = "\"Indoor Coverage YELLOW\"";
                    }
                    else
                    {
                        dyn.service_status = "\"green\"";
                        dyn.service_type = "\"Indoor Coverage GREEN\"";
                    }
                    dyn.match_quality = "\"\"";
                    dyn.street_number = "\"\"";
                    dyn.dist = "\"\"";
                    dyn.c_street_number = "\"\"";
                    dyn.ics_score = "\"\"";
                    dyn.dist_rank = "\"\"";
                    return dyn;
                }

            }
            catch (Exception ex)
            {
                return null;
            }

        }

        private static List<Dictionary<string, object>> SerializeDataTable (DataTable dataTable)
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




        private static bool RetryUntilSuccessOrTimeout(Func<bool> task, TimeSpan timeSpan)
        {
            bool success = false;
            int elapsed = 0;
            while ((!success) && (elapsed < timeSpan.TotalMilliseconds))
            {
                Thread.Sleep(1000);
                elapsed += 1000;
                success = task();
            }
            return success;
        }

        private static void InsertAddressServiceRecord(string id, string address, double lat, double lng, string serviceType)
        {
            string insertSql = @"INSERT INTO PONDER.ADDRESS_SERVICE_STATUS (ID, ADDRESS, LAT, LNG, SERVICE_TYPE )
                                        VALUES (:id, :address, :lat, :lng, :serviceType)";

                using (OracleConnection connection = new OracleConnection(ConfigurationManager.ConnectionStrings["AXIOM"].ConnectionString)) //open a connection to the AXIOM server
                {
                    connection.Open();
                    using (OracleCommand cmd = new OracleCommand(insertSql, connection))
                    {
                        cmd.Parameters.Clear();
                        cmd.Parameters.Add("id", id);
                        cmd.Parameters.Add("address", address);
                        cmd.Parameters.Add("lat", lat);
                        cmd.Parameters.Add("lng", lng);
                        cmd.Parameters.Add("serviceType", serviceType);
                        cmd.ExecuteNonQuery();
                    }

                }
        }

        private static bool GetAddressServiceRecord(string address, double lat, double lng, string serviceType, ref DataTable dataTable)
        {
            string getExistingRecordSql = string.Format(@"select * FROM PONDER.ADDRESS_SERVICE_STATUS WHERE ADDRESS = '{0}' AND LAT={1} AND LNG={2} AND SERVICE_TYPE='{3}'", address, lat, lng, serviceType);
            dataTable = DatabaseHelper.GetDataTable(getExistingRecordSql);
            return dataTable.Rows.Count > 0 && dataTable.Rows[0]["service_status"].ToString() != "";

        }

        [WebMethod]
        public static List<JObject> AddressServiceStatus(string id, string address, double lat, double lng, string serviceType)
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
                //ATTUID = "wc5172";
            }

            string token = GetAuthToken(ATTUID);
            string baseApiUrl = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
                    System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];
            DataTable dataTable = new DataTable();
            string streetNumber = Regex.Replace(address.Split()[0], @"[^0-9a-zA-Z\ ]+", "");
            List<JObject> response = new List<JObject>();
            response.Add( GetMatchQuality(streetNumber, lat, lng, baseApiUrl, token));
            return response;

        }
        [WebMethod] public static void LogAcknowledge()
            {
                string ATTUID = ""; try { _CSP.User userx = (_CSP.User)System.Web.HttpContext.Current.User; ATTUID = userx.attuid.ToString(); } catch { ATTUID = "no_user"; }

                LogEventParameters logEventParameters = new LogEventParameters(); logEventParameters.userID = ATTUID; logEventParameters.eventType = "Ponder Direct";

                DatabaseHelper.LogAcknowledge(logEventParameters);

            }

    }

