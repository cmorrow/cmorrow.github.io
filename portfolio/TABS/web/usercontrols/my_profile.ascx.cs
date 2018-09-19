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
    public partial class my_profile : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.ProfileClass profilelogic = new TABS_UserControls.resources.code.BAL.ProfileClass();
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        private TABS_UserControls.resources.code.BAL.UserClass userlogic = new TABS_UserControls.resources.code.BAL.UserClass();
        private TABS_UserControls.resources.code.BAL.ForumClass forumlogic = new TABS_UserControls.resources.code.BAL.ForumClass();

        private int userid;

        protected void Page_Init(object sender, EventArgs e)
        {
            try { userid = Convert.ToInt16(Session["userid"]);}
            catch { userid = 0;}
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // server-side binding
            buttonSave.Click += new EventHandler(buttonSave_Click);
            repeatSubscriptions.ItemDataBound += new RepeaterItemEventHandler(repeatSubscriptions_ItemDataBound);

            if (!Page.IsPostBack)
            {
                dropPrefix.DataSource = profilelogic.getPrefix();
                dropPrefix.DataBind();

                dropSchool.DataSource = schoollogic.getSchools();
                dropSchool.DataBind();

                dropSchool.SelectedValue = userlogic.getUserByUserID(Convert.ToInt16(Session["userid"]))[0].schoolid.ToString();

                dropDepartment.DataSource = profilelogic.getDepartments();
                dropDepartment.DataBind();

                dropRole.DataSource = userlogic.getUserTypes();
                dropRole.DataBind();

                repeatSubscriptions.DataSource = forumlogic.getTopicSubscriptionByUserID(userid);
                repeatSubscriptions.DataBind();

                // bind information - only if the rows exist for the profile
                TABS_UserControls.resources.code.DAL.ProfileDataset._tabs_userprofilesDataTable profileds = profilelogic.getProfileByUserID(userid);
                if (profileds.Rows.Count > 0)
                {
                    TABS_UserControls.resources.code.DAL.ProfileDataset._tabs_userprofilesRow profilerow = profileds[0];
                    TABS_UserControls.resources.code.DAL.UserDataset._tabs_usersRow userrow = userlogic.getUserByUserID(userid)[0];

                    dropPrefix.SelectedValue = profilerow.prefixid.ToString();
                    textFirstName.Text = profilerow.firstname;
                    textMiddleName.Text = profilerow.middle;
                    textLastName.Text = profilerow.lastname;
                    dropSchool.SelectedValue = userrow.schoolid.ToString();
                    textJobTitle.Text = profilerow.title;
                    dropDepartment.SelectedValue = profilerow.departmentid.ToString();
                    dropRole.SelectedValue = userrow.usertypeid.ToString();
                    textEmail.Text = userrow.username;
                    textPhone.Text = profilerow.phone;
                    textExtension.Text = profilerow.ext;
                    textFax.Text = profilerow.fax;
                    textAltPhone.Text = profilerow.phone2;
                    checkSubscribe.Checked = profilerow.subscribe;
                    textPassword.Text = userrow.password;
                    textPasswordConfirm.Text = userrow.password;
                }
            }
        }

        void repeatSubscriptions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Literal forumname = (Literal)e.Item.FindControl("literalForumName");
            forumname.Text = forumlogic.getForumByForumID(forumlogic.getTopicByTopicID(Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "topicid")))[0].forumid)[0].forum;

            Literal postname = (Literal)e.Item.FindControl("literalPost");
            postname.Text = forumlogic.getTopicByTopicID(Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "topicid")))[0].topic;

            LinkButton buttonremove = (LinkButton)e.Item.FindControl("buttonRemove");
            buttonremove.CommandArgument = DataBinder.Eval(e.Item.DataItem, "topicsubscriptionid").ToString();
        }

        protected void removeSubscription(object sender, CommandEventArgs e)
        {
            // remove
            forumlogic.removeSubscription(Convert.ToInt16(e.CommandArgument));

            // reload
            Response.Redirect(Request.Url.ToString());
        }

        void buttonSave_Click(object sender, EventArgs e)
        {
            userlogic.updateUser(textEmail.Text.Trim(), textPassword.Text.Trim(), Convert.ToInt16(dropRole.SelectedValue), userid);
            profilelogic.updateUserProfile(Convert.ToInt16(dropPrefix.SelectedValue), textFirstName.Text.Trim(), textMiddleName.Text.Trim(), textLastName.Text.Trim(), textJobTitle.Text.Trim(), Convert.ToInt16(dropDepartment.SelectedValue), textPhone.Text.Trim(), textExtension.Text.Trim(), textFax.Text.Trim(), textAltPhone.Text.Trim(), checkSubscribe.Checked, userid);
        }
    }
}