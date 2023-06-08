<%@ Application Language="C#" %>
<%@ Import Namespace="ponder2018" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Web.Security" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="ponder2018" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        RouteConfig.RegisterRoutes(RouteTable.Routes);
        BundleConfig.RegisterBundles(BundleTable.Bundles);
    }

    /* void Session_Start(object sender, EventArgs e)
    {
        // Run webpack to bundle all js files into a single js file under the modules/dist folder
        // Note: This being a website project and not having an actual project file, 
        // we do not have an option to run a custom command during the build process to do this as a pre-build task
        // If this is not desired as part of the application start, "yarn build" can be run from the command line
        // to run webpack and bundle all the files. In that scenario the following code block (until p.WaitForExit())
        // can be removed.
    
        Process process = new Process();
        ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
        startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
        startInfo.FileName = "cmd.exe";
        startInfo.Arguments = "/C yarn build";
        startInfo.WorkingDirectory = AppDomain.CurrentDomain.BaseDirectory;
        process.StartInfo = startInfo;
        process.Start();
        //Wait for the window to finish loading.
        process.WaitForInputIdle();
        //Wait for the process to end.
        process.WaitForExit();

    } */

    void FormsAuthentication_OnAuthenticate(object sender, FormsAuthenticationEventArgs args)
    {
        if (FormsAuthentication.CookiesSupported)
        {
            _CSP.CSPLogin CSPLogin = new _CSP.CSPLogin();
            if (CSPLogin.IsAuthenticated() == false)
            {   
                string[] roles = null;
                args.User = new System.Security.Principal.GenericPrincipal(new System.Security.Principal.GenericIdentity(""), roles);
                bool bURLAccessAuthorized = System.Web.Security.UrlAuthorizationModule.CheckUrlAccessForPrincipal(Context.Request.FilePath, args.User, "GET");
                if (bURLAccessAuthorized == false)
                    CSPLogin.Login(); //Login
            }
            else
            {
                args.User = CSPLogin.User;
                FormsAuthentication.SetAuthCookie(CSPLogin.User.attuid, true);
                bool bURLAccessAuthorized = System.Web.Security.UrlAuthorizationModule.CheckUrlAccessForPrincipal(Context.Request.FilePath, args.User, "GET");
                if (bURLAccessAuthorized == false)
                {
                    CSPLogin.DenyAccess();
                }
                else
                {
                    //on successful login log event
                    Context.User = CSPLogin.User;
                    DatabaseHelper.LogRequest(CSPLogin.User.attuid, Context.Request.Url.AbsoluteUri);
                }
            }
        }
        else
            throw new Exception("Cookieless Forms Authentication is not supported for this application.");
    }

</script>
