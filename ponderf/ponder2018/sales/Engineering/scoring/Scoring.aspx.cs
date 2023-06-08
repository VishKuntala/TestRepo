using System;
using System.Web;
using System.Web.UI;
using System.Globalization;
using System.IO;
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
using System.Linq;
using ponder2018;



    public partial class sales_Engineering_scoring_Scoring : System.Web.UI.Page
    {

    private string GetAccessGroups(string attUid, string baseApiUrl, string authToken, ref string accessControlId)
    {
        try
        {
            WebRequest webRequest;
            webRequest = WebRequest.Create(baseApiUrl + "/users/ENG_SCORING");
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

    private static string GetAccessGroupsStatic(string attUid, string baseApiUrl, string authToken, ref string accessControlId)
    {
        try
        {
            WebRequest webRequest;
            webRequest = WebRequest.Create(baseApiUrl + "/users/ENG_SCORING");
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
            string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + $"/sales/Engineering/scoring/{scriptDirectory}");
            for (int i = 0; i < fileEntries.Length; i++)
            {

                if (Path.GetFileName(fileEntries[i]).IndexOf("main.") != -1 && Path.GetExtension(fileEntries[i]) == ".js")
                {
                    ltlModulesJsTag.Text = String.Format("<script type='text/javascript' src='/sales/Engineering/scoring/{0}/{1}'></script>", scriptDirectory, Path.GetFileName(fileEntries[i]));
                }
            }

            ltlHeaderLinks.Text = String.Format(@"<link rel='stylesheet' type='text/css' href='/sales/Engineering/scoring/{0}/leaflet.css'/>
                                                  <script src='/sales/Engineering/scoring/{1}/jquery-3.6.0.min.js'></script>
                                                   <script src='/sales/Engineering/scoring/{2}/leaflet.js'></script>
                                                    <script src='/sales/Engineering/scoring/{3}/ramda.min.js'></script>
                                                    <link rel='stylesheet' type='text/css' href='/sales/Engineering/scoring/{4}/semantic.min.css' />
                                                    <link rel='stylesheet' type='text/css' href='/sales/Engineering/scoring/{5}/style.css' />
                                                    <script src='/sales/Engineering/scoring/{6}/semantic.min.js'></script>
                                                    <link rel='stylesheet' type='text/css' href='/sales/Engineering/scoring/{7}/tabulator.min.css' />
                                                    <link rel='stylesheet' type='text/css' href='/sales/Engineering/scoring/{8}/tabulator_semantic-ui.min.css' />
                                                   ",
                                    scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory);


        }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Register the webpack generated js bundle script tag in the aspx page for the scripts under the module folder
        RegisterModulesScriptTag();
        hdnBaseSearchApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
            System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];
        string accessControlId = "";
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
        hdnViewerAttId.Value = ATTUID;
        string baseSearchApiUrl = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
        System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];
        //string hdnViewerGroupMembership = GetAccessGroups(ATTUID, baseSearchApiUrl, this.GetAuthToken(ATTUID, null), ref accessControlId);
        hdnViewerGroupMembership.Value = GetAccessGroups(ATTUID, baseSearchApiUrl, this.GetAuthToken(ATTUID, null), ref accessControlId);
        hdnToken.Value = this.GetAuthToken(ATTUID, null);
        // hdnViewerGroupMembership.Value = "ENGLITE";
        //if (hdnViewerGroupMembership != "Unlimited")
        //{
        //    LoginRedirect();
        //}
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
        }*/

    }

    public void LoginRedirect()
    {
        Response.Redirect("/PONDER_Not_auth.aspx");
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
            logEventParameters.eventType = "Engineering Wireless Scoring Tool";

            DatabaseHelper.LogAcknowledge(logEventParameters);

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

        [WebMethod]
        [ScriptMethod(UseHttpGet = true)]
        public static List<Dictionary<string, object>> AssignedUserRoles()
        {
            //string ATTUID = "ADMIN_TESTID";
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

            List<Dictionary<string, object>> response = new List<Dictionary<string, object>>();
            response.Add(new Dictionary<string, object>
            {
              {"access_group", "ENG_SCORING"}

            });
            return response;
                /* string sql = string.Format("SELECT * FROM PONDER.PONDER_ACCESS_CONTROL WHERE ATT_USERID='{0}'", ATTUID);        
            DataTable dataTable = DatabaseHelper.GetDataTable(sql);
                    return SerializeDataTable(dataTable);*/
        }
       

}

