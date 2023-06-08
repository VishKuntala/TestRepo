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



public partial class sales_scoring_GamePlan : System.Web.UI.Page
{

    private string GetAccessGroups(string attUid, string baseApiUrl, string authToken, ref string accessControlId)
    {
        try
        {
            WebRequest webRequest;
            webRequest = WebRequest.Create(baseApiUrl + "/users/GAMEPLAN");
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

    private string GetAuthToken(string attuid, string accessControlId, string groupMembership)
    {
        var payload = new Dictionary<string, object>
        {
            { "accessControlId", accessControlId },
            { "groupMembership", groupMembership },
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
        string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + $"/sales/wst/{scriptDirectory}");
        for (int i = 0; i < fileEntries.Length; i++)
        {

            if (Path.GetFileName(fileEntries[i]).IndexOf("main.") != -1 && Path.GetExtension(fileEntries[i]) == ".js")
            {
                ltlModulesJsTag.Text = String.Format("<script type='text/javascript' src='/sales/wst/{0}/{1}'></script>", scriptDirectory, Path.GetFileName(fileEntries[i]));
            }
        }

        ltlHeaderLinks.Text = String.Format(@"<script src='/sales/wst/{1}/jquery-3.6.0.min.js'></script>
                                                    <script src='/sales/wst/{3}/ramda.min.js'></script>
                                                    <link rel='stylesheet' type='text/css' href='/sales/wst/{4}/semantic.min.css' />
                                                    <link rel='stylesheet' type='text/css' href='/sales/wst/style.css' />
                                                    <script src='/sales/wst/{6}/semantic.min.js'></script>
                                                    <link rel='stylesheet' type='text/css' href='/sales/wst/{7}/tabulator.min.css' />
                                                    <link rel='stylesheet' type='text/css' href='/sales/wst/{8}/tabulator_semantic-ui.min.css' />
                                                    <link rel='stylesheet' type='text/css' href='/sales/wst/{9}/atlas.min.css' />
                                                   ",
                                scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory, scriptDirectory);


    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string accessControlId = "";
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

        }
        hdnAppName.Value = "gameplan";
        hdnViewerAttId.Value = ATTUID;
        hdnBaseApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api/wst" :
                System.Web.Configuration.WebConfigurationManager.AppSettings["WST_BASE_API_URL"];
        hdnRootUrl.Value = HttpContext.Current.Request.IsLocal ?
                "http://localhost:53262/" :
                String.Format(@"{0}://{1}/", HttpContext.Current.Request.Url.Scheme, HttpContext.Current.Request.Url.Host);
        hdnBaseSearchApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
                System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];
        hdnMapTilerKey.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["MAPTILER_KEY"];
        hdnMapBoxKey.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["MAPBOX_KEY"];
        hdnAzureMapKey.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["AZURE_MAP_SUBSCRIPTION_KEY"];
        hdnViewerGroupMembership.Value = GetAccessGroups(ATTUID, hdnBaseSearchApiUrl.Value, this.GetAuthToken(ATTUID, null, null), ref accessControlId);
        hdnToken.Value = this.GetAuthToken(ATTUID, accessControlId, hdnViewerGroupMembership.Value);
        hdnClusterLayer.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["CLUSTER_LAYER"];
        hdnSatelliteLayerStyleUrl.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["SATELLITE_LAYER_STYLE_URL"];

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
        logEventParameters.eventType = "Wireless Scoring Tool (GamePlan)";

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
            //ATTUID = "wc5172";
        }
        string sql = string.Format("SELECT * FROM PONDER.PONDER_ACCESS_CONTROL WHERE ATT_USERID='{0}'", ATTUID);
        DataTable dataTable = DatabaseHelper.GetDataTable(sql);
        return SerializeDataTable(dataTable);
    }


}

