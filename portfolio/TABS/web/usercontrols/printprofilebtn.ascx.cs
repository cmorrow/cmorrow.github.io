using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TABS_UserControls.usercontrols {
    public partial class printprofilebtn : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            printpage.HRef = "/print-profile.aspx?schoolid=" + Request.QueryString["schoolid"].ToString();
        }
    }
}