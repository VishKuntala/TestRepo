using System;
using System.Web;
using System.IO;
using System.Collections.Generic;
using System.Data;
using System.Web.Script.Serialization;
using ponder2018;
using ponder2018.SalesOpportunity;
using System.Web.Services;
using JWT;
using JWT.Algorithms;
using JWT.Serializers;
using System.Net;
using System.Text;
using Newtonsoft.Json;

public partial class sales_scoring_Opportunity : System.Web.UI.Page
{
    private string GetAccessGroups(string attUid, string baseApiUrl, string authToken, ref string accessControlId)
    {
        try
        {
            if (HttpContext.Current.Request.IsLocal)
                return "Unlimited;true";
            WebRequest webRequest;
            webRequest = WebRequest.Create(baseApiUrl + "/users/FOT");
            webRequest.Headers.Add("authorization", authToken);
            WebResponse response = webRequest.GetResponse();
            using (Stream responseStream = response.GetResponseStream())
            {
                StreamReader reader = new StreamReader(responseStream, Encoding.UTF8);
                string accessGroupsResponse = reader.ReadToEnd();
                dynamic dyn = JsonConvert.DeserializeObject(accessGroupsResponse);
                accessControlId = dyn.access_control_id;
                //return access_level i.e Unlimited/Limited and attribute_value of IsACCUser i.e true/false
                return dyn.access_level + ";" + dyn.attribute_value;  
            }

        }
        catch (Exception ex)
        {
            throw ex;
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
        string[] fileEntries = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory + $"/sales/opportunity/{scriptDirectory}");
        for (int i = 0; i < fileEntries.Length; i++)
        {
            if (Path.GetFileName(fileEntries[i]).IndexOf("main.") != -1 && Path.GetExtension(fileEntries[i]) == ".js")
            {
                ltlModulesJsTag.Text = string.Format("<script type='text/javascript' src='/sales/opportunity/{0}/{1}'></script>", scriptDirectory, Path.GetFileName(fileEntries[i]));
            }
        }

        ltlHeaderLinks.Text = string.Format(
            @"
                <script src='/sales/opportunity/{0}/jquery-3.6.0.min.js'></script>
                <script src='/sales/opportunity/{0}/ramda.min.js'></script>
                <script src='/sales/opportunity/{0}/semantic.min.js'></script>
                <link rel='stylesheet' type='text/css' href='/sales/opportunity/{0}/semantic.min.css' />
                <link rel='stylesheet' type='text/css' href='/sales/opportunity/{0}/tabulator.min.css' />
                <link rel='stylesheet' type='text/css' href='/sales/opportunity/{0}/tabulator_semantic-ui.min.css' />                
                <link rel='stylesheet' type='text/css' href='/sales/opportunity/{0}/atlas.min.css' />
            ", scriptDirectory
        );
    }

    public void LoginRedirect()
    {
        Response.Redirect("/PONDER_Not_auth.aspx");
    }

    private void SetAcknowledgeFlag(string flag)
    {
        ltlAcknowledgeConfidentialityFlag.Text = String.Format("<input type='hidden' id='txtAcknowledgeConfidentialityFlag' value='{0}' />", flag);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string accessControlId = "";
            // Register the webpack generated js bundle script tag in the aspx page for the scripts under the module folder
            RegisterModulesScriptTag();
            string ATTUID;
            try
            {
                _CSP.User userx = (_CSP.User)HttpContext.Current.User;
                ATTUID = userx.attuid.ToString();
            }
            catch
            {
                ATTUID = "vk577m";
            }
            hdnUser.Value = ATTUID;
            hdnMapTilerKey.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["MAPTILER_KEY"];
            hdnMapBoxKey.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["MAPBOX_KEY"];
            hdnAzureMapKey.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["AZURE_MAP_SUBSCRIPTION_KEY"];
            hdnBaseSearchApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" : System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_SEARCH_API_URL"];            
            hdnViewerGroupMembership.Value = GetAccessGroups(ATTUID, hdnBaseSearchApiUrl.Value, this.GetAuthToken(ATTUID, null), ref accessControlId);
            hdnToken.Value = this.GetAuthToken(ATTUID, accessControlId);
            hdnViewerAttId.Value = ATTUID;
            hdnBaseApiUrl.Value = HttpContext.Current.Request.IsLocal ? "http://localhost:7071/api" :
                    System.Web.Configuration.WebConfigurationManager.AppSettings["BASE_API_URL"];
            hdnRootUrl.Value = HttpContext.Current.Request.IsLocal ?
                    "http://localhost:53262/" :
                    String.Format(@"{0}://{1}/", HttpContext.Current.Request.Url.Scheme, HttpContext.Current.Request.Url.Host);
            hdnSatelliteLayerStyleUrl.Value = System.Web.Configuration.WebConfigurationManager.AppSettings["SATELLITE_LAYER_STYLE_URL"];
            SetAcknowledgeFlag("1");
            // set hdnAccess.Value - Unlimited/Limited and hdnIsACCUser.Value - true/false
            hdnAccess.Value = hdnViewerGroupMembership.Value.Split(';')[0];
            hdnIsACCUser.Value = hdnViewerGroupMembership.Value.Split(';')[1];
        }
        catch (Exception)
        {
            LoginRedirect();
        }
    }

    [WebMethod]
    public static string GetJsonData(GetJsonDataParameters myParamsObject)
    {   
        string sql = Helper.GetDataQuery(myParamsObject);
        DataTable dataTable = DatabaseHelper.GetDataTable(sql);
        JavaScriptSerializer serializer = new JavaScriptSerializer(); //define a new JavaScriptSerializer object "serializer"
        serializer.MaxJsonLength = int.MaxValue;
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>(); //define a new List "rows"
        Dictionary<string, object> row; //define a new Dictionary "row"
        foreach (DataRow dr in dataTable.Rows) //setup a loop to iterate through the rows "dr" your DataTable "dt"
        {
            row = new Dictionary<string, object>(); //define a new object to store your data in
            foreach (DataColumn col in dataTable.Columns) //setup a loop to iterate through the columns of the current row "dr" in your DataTable "dt"
            {
                row.Add(col.ColumnName, dr[col]); //add the data to your "row" object
            }
            rows.Add(row); //add the "row" to your "rows" object
        }
        string objectdata = serializer.Serialize(rows); //use the JavaScriptSerializer "serializer" to convert to a JSON string - this can fail if too long
        return objectdata; //return your data to the front end
    }
}
