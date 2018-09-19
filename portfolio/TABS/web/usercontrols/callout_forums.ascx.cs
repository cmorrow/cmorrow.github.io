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
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols
{
    public partial class callout_forums : System.Web.UI.UserControl
    {
        private int userid;

        protected void Page_Init(object sender, EventArgs e)
        {
            try { userid = Convert.ToInt16(Session["userid"]); }
            catch { userid = 0; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (userid > 0) 
            {
                multiLink.ActiveViewIndex = 1;
                ForumClass logic = new ForumClass();
                //loginBtn.Visible = false;
                recentForum.DataSource = logic.getTopTwoMostApprovedPosts();
                recentForum.DataBind();
            }
        }
    }
}