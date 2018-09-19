using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols
{
    public partial class homepagecookie : System.Web.UI.UserControl
    {
        private const string _cookieName = "TABSSchool_HomePageVisited";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            InfrastructureClass infra = new InfrastructureClass();

            // Check if the user has a cookie for visiting the site already
            if (infra.ReadCookie(Request, _cookieName).Equals("Cookie not found."))
            {
                infra.WriteCookie(Response, _cookieName, "true");
            }
            else
            {
                // Redirect to a non-flash page
                Response.Redirect("home.aspx");
            }
        }
    }
}