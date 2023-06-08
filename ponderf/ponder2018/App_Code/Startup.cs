using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ponder2018.Startup))]
namespace ponder2018
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
