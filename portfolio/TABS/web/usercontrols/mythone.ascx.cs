using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TABS_UserControls.usercontrols {
    public partial class mythone : System.Web.UI.UserControl 
    {
        private TABS_UserControls.resources.code.BAL.NewsClass newslogic = new TABS_UserControls.resources.code.BAL.NewsClass();

        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                repeatFacts.DataSource = newslogic.getTop5Facts();
                repeatFacts.DataBind();
            }

        }
    }
}