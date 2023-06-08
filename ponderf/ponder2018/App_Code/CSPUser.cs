using Microsoft.CSharp;
using System.Configuration;
using System.Web;
using System;
using System.Web.Security;
using System.Web.SessionState;
using System.Security.Principal;

//Namespace: CSP
//Object: CSPLogin
//Description: This object is to be used to implement the AT&T CSP Global Login for an ASP.Net 2.0 application. 
//This overrides the built-in Request.User object when using  forms authentication.
namespace _CSP
{

    /// <summary>
    /// This object is to be used to implement AT&amp;T CSP Login in an ASP.Net application.  
    /// This overrides the built-in Request.User object when using  forms authentication.
    /// </summary>
    /// <remarks>
    /// <list type="bullet">
    /// <listheader>Requirements:</listheader>
    /// <item>Must be hosted on an att.com, sbc.com, cingular.net or bellsouth.com domain. 
    /// It is possible to use on your local pc by using the following instead of localhost. http://[pcname].ugd.att.com</item>
    /// <item>WEb Server must be using ASP.Net 2.0 or later.</item>
    /// <item>The following code needs to be added to the global.asax
    /// <code>
    /// void FormsAuthentication_OnAuthenticate(object sender, FormsAuthenticationEventArgs args)
    /// {
    ///    if (FormsAuthentication.CookiesSupported) 
    ///    {
    ///        CSP.CSPLogin CSPLogin = new CSP.CSPLogin();
    ///        if (CSPLogin.IsAuthenticated() == false )
    ///        {
    ///            string [] roles = null;
    ///            args.User = new System.Security.Principal.GenericPrincipal(new System.Security.Principal.GenericIdentity(""), roles);
    ///            bool bURLAccessAuthorized = System.Web.Security.UrlAuthorizationModule.CheckUrlAccessForPrincipal(Context.Request.FilePath, args.User, "GET");
    ///            if (bURLAccessAuthorized == false)
    ///                CSPLogin.Login(); //Login
    ///        }
    ///        else
    ///        {
    ///            args.User = CSPLogin.User;
    ///            FormsAuthentication.SetAuthCookie(CSPLogin.User.attuid, true);
    ///            bool bURLAccessAuthorized = System.Web.Security.UrlAuthorizationModule.CheckUrlAccessForPrincipal(Context.Request.FilePath, args.User, "GET");
    ///            if (bURLAccessAuthorized == false)
    ///                CSPLogin.DenyAccess();
    ///            else					
    ///                Context.User = CSPLogin.User;	
    ///        }
    ///    }
    ///    else
    ///        throw new Exception("Cookieless Forms Authentication is not supported for this application.");
    /// }
    /// </code>
    /// </item>
    /// <item>The following appsetting variables need to be added to the web.config with appropriate values.
    /// <code>
    ///        &lt;appSettings&gt;
    ///           &lt;add key="CSPDecryptType" value=""/&gt;
    ///           &lt;add key="CSPLoginUrl" value=""/&gt;
    ///           &lt;add key="CSPSysName" value=""/&gt;
    ///           &lt;add key="CSPNotAuthorizedPage" value=""/&gt;
    ///           &lt;add key="CSPEncryptedCookieName" value=""/&gt;
    ///       &lt;/appSettings&gt;
    /// </code>
    /// </item>
    /// <item>The CSPUser.cs file must be placed in the "app_code" folder of the project.</item>
    /// </list> 
    /// <example>Since the Global.asax overrides the Context.User with CSPLogin.User, to retrieve cooke attributes
    ///	you can just use System.Web.HttpContext.Current.User.  This explicit retrieval of groups/privileges is not
    /// necessary, if all you want to do is have access to pages controlled by CSP privileges/groups.  It is only necessary
    /// if you want to change the behavior of a given page based on CSP groups/privileges.  Same for ATTUID.
    /// <code>
    /// // Show privileges/groups 
    /// CSP.User userx = (CSP.User)System.Web.HttpContext.Current.User;
    /// string sPrivs = null;
    /// 
    /// for (int i = 0; i < userx.Privs.Length; i++)  {
    ///	    sPrivs = sPrivs + ";" + userx.Privs[i];
    ///     Response.Write(sPrivs + "<br>");
    /// }
    /// // Show ATTUID       
    /// Response.Write(userx.attuid);
    /// </code>
    /// </example> 
    /// <para>
    /// **NOTE** You also need to make sure that your Not authorized page is NOT secured. 
    ///               If you are securing the entire site make sure to add a location element
    ///               in the web.config file to allow the not authorized page to be viewed.
    ///           &lt;location path="NotAuthorized.aspx"&gt;
    ///               &lt;system.web&gt;
    ///                   &lt;authorization&gt;
    ///                       &lt;allow users="*" /&gt;
    ///                   &lt;/authorization&gt;
    ///               &lt;/system.web&gt;
    ///           &lt;/location&gt;
    /// </para>
    /// </remarks>
    public class CSPLogin
    {
        HttpResponse Response = HttpContext.Current.Response;
        HttpRequest  Request  = HttpContext.Current.Request;
        HttpServerUtility Server = HttpContext.Current.Server;
        HttpSessionState Session = HttpContext.Current.Session;

        CSP.GateKeeper oGateKeeper = new CSP.GateKeeper(); //Instantiate a instance of the GateKeeper class from GateKeeper.dll

        //Read web.config appsettings
        //string LoginUrl =  System.Web.Configuration.WebConfigurationManager.AppSettings["CSPLoginUrl"];
        string LoginUrl = System.Web.Configuration.WebConfigurationManager.AppSettings["CSPLoginLeadUrl"] + HttpContext.Current.Request.Url.AbsolutePath + "&amp;sysname=24270";
        string Sysname =  System.Web.Configuration.WebConfigurationManager.AppSettings["CSPSysName"];
        string NotAuthPath =  System.Web.Configuration.WebConfigurationManager.AppSettings["CSPNotAuthorizedPage"];
        string DecryptType =  System.Web.Configuration.WebConfigurationManager.AppSettings["CSPDecryptType"];
        string EncryptedCookieName = null;
        string secureCookie;
        string attHr;
        string [] attSecValues;
        string [] attHrValues;

        //Properties
        string m_DecryptedCookie;
        string [] m_privs;
        string m_attuid;
        User oUser;

        //Accessor
        public User User
        {
            get { return oUser; }
        }
        
        ///<summary>
        ///Initiates CSPLogin
        ///</summary>
        ///<remarks></remarks>
	    public CSPLogin()
	    {
            if (System.Web.Configuration.WebConfigurationManager.AppSettings["CSPEncryptedCookieName"] != null)
            {
                EncryptedCookieName = System.Web.Configuration.WebConfigurationManager.AppSettings["CSPEncryptedCookieName"];
            }
            else
            {
                EncryptedCookieName = "attESSec";
            }

            if (IsAuthenticated())
            {
                oUser = new User(new System.Security.Principal.GenericIdentity(m_attuid), m_privs);
            }
        }

        ///<summary>
        ///This function validates that the user has logged in through CSP and initiates the user object.
        ///</summary>
        ///<returns><c>True</c> if the use has logged in <c>False</c> otherwise</returns>
        ///<remarks></remarks>
        public bool IsAuthenticated()
        {
            if (Request.Cookies[EncryptedCookieName] == null)
                return false;
            
            secureCookie = Request.Cookies[EncryptedCookieName].Value;
            attHr = Server.UrlDecode(Request.Cookies["attESHr"].Value);
            m_DecryptedCookie = oGateKeeper.decrypt(secureCookie, DecryptType);


            if (String.IsNullOrEmpty(secureCookie) || String.IsNullOrEmpty(attHr) || String.IsNullOrEmpty(m_DecryptedCookie))
            {
                return false;
            }
            else
            {
                attSecValues = m_DecryptedCookie.Split('|');
                attHrValues = attHr.Split('|');
                m_privs = attSecValues[4].Split(',');
                m_attuid = attSecValues[5];
                return true;
            }
        }

        public void Login()
        {
            if (IsAuthenticated() == false) //If not authenticated
            {
                Response.Redirect(string.Format("{0}?retURL={1}&sysName={2}", LoginUrl, HttpContext.Current.Server.UrlEncode(Request.Url.ToString()), Sysname) );
            }
        }

        public void DenyAccess()
        {
            if (!(NotAuthPath.Equals("")))
                Response.Redirect(NotAuthPath);
            else
            {
                Response.Write("You are not authorized to view this page.");
                Response.End();
            }
        }

    }//End class CSPLogin

    public class User : System.Security.Principal.GenericPrincipal
    {
        HttpResponse Response = HttpContext.Current.Response;
        HttpRequest  Request  = HttpContext.Current.Request;
        HttpServerUtility Server = HttpContext.Current.Server;
        HttpSessionState Session = HttpContext.Current.Session;
        CSP.GateKeeper oGateKeeper = new CSP.GateKeeper();

        string secureCookie;
        string attHr;
        string [] attSecValues;
        string [] attHrValues;

        #region class properties
        string m_DecryptedCookie = "";
        string m_hrid = "";             //Field 1 of attESSec
        string m_HRSig = "";            //Field 2 of attESSec
        string m_emplType = "";         //Field 3 of attESSec
        string m_AuthStrength = "";     //Field 4 of attESSec
        string [] m_privs;              //Field 5 of attESSec
        string m_attuid = "";           //Field 6 of attESSec
        string m_FirstName = "";        //Field 1 of attHr
        string m_LastName = "";         //Field 2 of attHr
        string m_email = "";            //Field 3 of attHr
        string m_workphone = "";        //Field 4 of attHr
        string m_middleName = "";       //Field 5 of attHr
        string m_ManagerAttUid = "";    //Field 6 of attHr
        string m_namesuffix = "";       //Field 7 of attHr
        string m_ManagerHrid = "";      //Field 8 of attHr
        string m_empPattern = "";       //Field 9 of attHr
        string m_clliCode = "";         //Field 10 of attHr
        string m_fmlOrg = "";           //Field 11 of attHr
        string m_salaryGrade = "";      //Field 12 of attHr
        #endregion 

        public User(System.Security.Principal.IIdentity identity, string [] roles) : base(identity, roles)
        {
            string EncryptedCookieName = null;
            if (System.Web.Configuration.WebConfigurationManager.AppSettings["CSPEncryptedCookieName"] != null)
            {
                EncryptedCookieName = System.Web.Configuration.WebConfigurationManager.AppSettings["CSPEncryptedCookieName"];
            }
            else
            {
                EncryptedCookieName = "attESSec";
            }
       
            secureCookie = Request.Cookies[EncryptedCookieName].Value;
            attHr = Server.UrlDecode(Request.Cookies["attESHr"].Value);
            string DecryptType = System.Web.Configuration.WebConfigurationManager.AppSettings["CSPDecryptType"];
            m_DecryptedCookie = oGateKeeper.decrypt(secureCookie, DecryptType);
            attSecValues = m_DecryptedCookie.Split('|');
            attHrValues = attHr.Split('|');
  
            try {
                m_hrid = attSecValues[0];
                m_HRSig = attSecValues[1];
                m_emplType = attSecValues[2];
                m_AuthStrength = attSecValues[3];
                m_privs = attSecValues[4].Split(','); 
                m_attuid = attSecValues[5];
                m_FirstName = attHrValues[0];
                m_LastName = attHrValues[1];
                m_email = attHrValues[2];
                m_workphone = attHrValues[3];
                m_middleName = attHrValues[4];
                m_ManagerAttUid = attHrValues[5];
                m_namesuffix = attHrValues[6];
                m_ManagerHrid = attHrValues[7];
                m_empPattern = attHrValues[8];
                m_clliCode = attHrValues[9];
                m_fmlOrg = attHrValues[10];

                if (attHrValues.Length > 11)
                    m_salaryGrade = attHrValues[11];
            }
            catch (Exception ex)
            {
                throw new Exception("CSPLogin Error: Error parsing cookies: " + ex.Message);
            }
        }

        #region Accessor Methods
        public string hrid
        {
            get { return m_hrid; }
        }
        public string HRSig
        {
            get { return m_HRSig; }
        }
        public string EmployeeType
        {
            get { return m_emplType; }
        }
        public string AuthStrength
        {
            get { return m_AuthStrength; }
        }
        public string [] Privs
        {
            get { return m_privs; }
        }
        public string attuid
        {
            get { return m_attuid; }
        }
        public string FirstName
        {
            get { return m_FirstName; }
        }
        public string LastName
        {
            get { return m_LastName; }
        }
        public string email
        {
            get { return m_email; }
        }
        public string workphone
        {
            get { return m_workphone; }
        }
        public string middleName
        {
            get { return m_middleName; }
        }
        public string ManagerAttUid
        {
            get { return m_ManagerAttUid; }
        }
        public string namesuffix
        {
            get { return m_namesuffix; }
        }
         ///<summary>
         ///The Legacy T Manager HRID of the current user
         ///</summary>
         ///<value></value>
         ///<returns>The Legacy T Manager HRID of the current user</returns>
         ///<remarks></remarks>
        public string managerHrid
        {
            get { return m_ManagerHrid; }
        }
         ///<summary>
         ///The entire string of the Employee Pattern A in the attHr cookie
         ///</summary>
         ///<value></value>
         ///<returns>The entire string of the Employee Pattern A in the attHr cookie</returns>
         ///<remarks></remarks>
        public string employeePattern
        {
            get { return m_empPattern; }
        }
         ///<summary>
         ///The CLLI Code of the user
         ///</summary>
         ///<value></value>
         ///<returns>The CLLI CODE of the user</returns>
         ///<remarks></remarks>
        public string cllicode
        {
            get { return m_clliCode; }
        }
        /// <summary>
        /// The FML Organization Code
        /// </summary>
        /// <value></value>
        /// <returns>The FML_ORGANIZATION of the user</returns>
        /// <remarks></remarks>
        public string fmlOrg
        {
            get { return m_fmlOrg; }
        }
         ///<summary>
         ///AT&amp;T Salary grade of the user
         ///</summary>
         ///<value></value>
         ///<returns>Salary grade of the user</returns>
         ///<remarks></remarks>
        public string salaryGrade
        {
            get { return m_salaryGrade; }
        }
        #endregion

         ///<summary>
         ///Used to check values in the Employee Pattern A
         ///</summary>
         ///<param name="key">The <c>PatternKey</c> is passed to the Function to determine what to check for in the Employee Pattern A</param>
         ///<returns><c>True</c> if the character indicated is a Y <c>False</c> if it is an N</returns>
         ///<remarks></remarks>
        public bool PatternValue(PatternKeys key)
        {
            if (m_empPattern.Length == 0)
                return false;
            else
            {
                char[] cArr = m_empPattern.ToCharArray();
                int i = (int)key;
                if (cArr[i] == 'Y')
                    return true;
            }
            
            return false;
        }

    } //End of User Class
   
    ///<summary>
    ///This is a list of keys in order, for each character in the Employee PatternA of the attHr cookie.
    ///The last two keys are maintained by CSP.
    ///</summary>
    ///<remarks></remarks>
    public enum PatternKeys 
{
        International,
        InternationalAssignee,
        InternationalRegionalAssignee,
        Executive,
        Management,
        Occupational,
        Associate,
        Expatriate,
        Inpatriate,
        ATTCore,
        Wireless,
        BBIS,
        GRCI,
        TYCO,
        NPW,
        Retiree,
        AsiaPacificRegion,
        SBC,
        CaribbeanLatinAmericaRegion,
        EMEARegion,
        USTerritory,
        GSIOnCall,
        SBCSection222Restricted,
        SBCSection272Restricted,
}

} //End of Namespace