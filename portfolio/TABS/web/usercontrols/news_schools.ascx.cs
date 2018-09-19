using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace TABS_UserControls.usercontrols
{
    public partial class news_schools : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.NewsClass newslogic = new TABS_UserControls.resources.code.BAL.NewsClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            // server-side binding
            if (!Page.IsPostBack)
            {
                repeatNews.DataSource = newslogic.getTop3SchoolNews();
                repeatNews.DataBind();
            }
        }
    }
}