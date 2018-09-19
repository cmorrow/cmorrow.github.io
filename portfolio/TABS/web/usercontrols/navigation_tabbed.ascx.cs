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

using umbraco.presentation.nodeFactory;
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols {
    public partial class navigation_tabbed : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            // check login state
            if (Convert.ToInt16(Session["userid"]) == 0) Response.Redirect("/for-schools.aspx");

            UserClass logic = new UserClass();
            DataTable dt = logic.getUserRoleByUserId(Convert.ToInt32(Session["userid"].ToString()));
            int roleId = Convert.ToInt32(dt.Rows[0]["usertypeid"].ToString());

            Node currentpage = Node.GetCurrent();

            string[] overview = { "", "Overview" };
            string[] forum = { "", "Forum", "Topics", "Posts" };
            string[] library = { "", "TAB Library" };
            string[] colleague = { "", "Find a Colleague" };
            string[] editschool = { "", "Edit School Profile" };
            string[] postjob = { "", "Post Edit Jobs" };
            string[] account = { "", "Account Info" };
            string[] users = { "", "Users" };
            string[] profile = { "", "My Profile" };

            if (Array.IndexOf(overview, currentpage.Name) > 0) liOverview.Attributes.Add("class", "active");
            if (Array.IndexOf(forum, currentpage.Name) > 0) liForum.Attributes.Add("class", "active");
            if (Array.IndexOf(library, currentpage.Name) > 0) liLibrary.Attributes.Add("class", "active");
            if (Array.IndexOf(colleague, currentpage.Name) > 0) liColleague.Attributes.Add("class", "active");
            if (Array.IndexOf(editschool, currentpage.Name) > 0) liEditSchool.Attributes.Add("class", "active");
            if (Array.IndexOf(postjob, currentpage.Name) > 0) liPostJob.Attributes.Add("class", "active");
            if (Array.IndexOf(account, currentpage.Name) > 0) liAccount.Attributes.Add("class", "active");
            if (Array.IndexOf(users, currentpage.Name) > 0) liUsers.Attributes.Add("class", "active");
            if (Array.IndexOf(profile, currentpage.Name) > 0) liProfile.Attributes.Add("class", "active");

            switch (roleId) {
                case 2: // Staff/User
                    liEditSchool.Style.Add("display", "none");
                    liPostJob.Style.Add("display", "none");
                    liAccount.Style.Add("display", "none");
                    liUsers.Style.Add("display", "none");
                    break;
                case 3: // Admin
                    liEditSchool.Style.Add("display", " ");
                    liPostJob.Style.Add("display", " ");
                    liAccount.Style.Add("display", " ");
                    liUsers.Style.Add("display", " ");
                    break;
                case 6: // Job Editor and Profile
                    liAccount.Style.Add("display", "none");
                    liUsers.Style.Add("display", "none");
                    break;
                case 5: // Job Editor Only
                    liEditSchool.Style.Add("display", "none");
                    liAccount.Style.Add("display", "none");
                    liUsers.Style.Add("display", "none");
                    break;
                default: // Staff/User
                    liEditSchool.Style.Add("display", "none");
                    liPostJob.Style.Add("display", "none");
                    liAccount.Style.Add("display", "none");
                    liUsers.Style.Add("display", "none");
                    break;
            }
        }
    }
}