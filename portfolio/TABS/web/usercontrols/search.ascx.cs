using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TABS_UserControls.usercontrols {
    public partial class search : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) 
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e) 
        {
            Response.Redirect("/search-result.aspx?val=" + searchstring.Value);
        }
    }
}