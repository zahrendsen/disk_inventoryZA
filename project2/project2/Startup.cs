using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(project2.Startup))]
namespace project2
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
