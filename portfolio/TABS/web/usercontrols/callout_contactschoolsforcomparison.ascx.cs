using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TABS_UserControls.usercontrols {
    public partial class callout_contactschoolsforcomparison : System.Web.UI.UserControl {

        string url, newparams;
        protected void Page_Load(object sender, EventArgs e) 
        {
            // sc1=986&sc2=897&sc3=1147&sc4=914&sc5=1109&
            url = Request.Url.Query;
            newparams = url.Replace("sc1", "sc");
        }

        protected void contactBtn_Click(object sender, ImageClickEventArgs e) 
        {
            Response.Redirect("/find-a-school/explore-your-options/contact-schools.aspx" + newparams);
        }
    }
}