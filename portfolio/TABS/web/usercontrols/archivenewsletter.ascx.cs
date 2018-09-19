using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols {
    public partial class archivenewsletter : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) 
        {
            NewsClass newslogic = new NewsClass();
            if (!Page.IsPostBack) {
                gridArchive.DataSource = newslogic.getCurrentArchieveNewsLetters();
                gridArchive.DataBind();
            }
        }
    }
}