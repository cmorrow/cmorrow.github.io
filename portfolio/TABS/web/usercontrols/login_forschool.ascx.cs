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
using System.Collections.Generic;
using System.Text;

namespace TABS_UserControls.usercontrols
{
    public partial class login_forschool : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.UserClass userlogic = new TABS_UserControls.resources.code.BAL.UserClass();
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        private TABS_UserControls.resources.code.BAL.ProfileClass profilelogic = new TABS_UserControls.resources.code.BAL.ProfileClass();

        private string url;
        private int userid;

        protected void Page_Init(object sender, EventArgs e)
        {
            // if logged in, show loggedin view
            try { userid = Convert.ToInt16(Session["userid"]);}
            catch { userid = 0;}
            try { url = Request.QueryString["url"].ToString(); } catch { url = "/for-schools/overview.aspx"; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (userid > 0) multiLogin.ActiveViewIndex = 1;
            repeatAdmin.ItemDataBound += new RepeaterItemEventHandler(repeatAdmin_ItemDataBound);

            if (!Page.IsPostBack)
            {
                dropSchool.DataSource = schoollogic.getSchools();
                dropSchool.DataBind();
            }
        }

        void repeatAdmin_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string message = "N/A";
            Literal admin = (Literal)e.Item.FindControl("literalAdmin");

            TABS_UserControls.resources.code.DAL.ProfileDataset._tabs_userprofilesDataTable profile = profilelogic.getProfileByUserID(Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "userid")));

            if (profile.Rows.Count > 0)
            {
                message = profile[0].firstname + " " + profile[0].lastname;
            }

            admin.Text = message;
        }


        protected void dropSchool_SelectedIndexChanged(object sender, EventArgs e) {
            repeatAdmin.DataSource = userlogic.getAdminsBySchoolID(Convert.ToInt16(dropSchool.SelectedValue));
            repeatAdmin.DataBind();

        }


        protected void buttonLogin_Click(object sender, ImageClickEventArgs e) {
            if (textUser.Text.Length > 0 && textPass.Text.Length > 0) {
                TABS_UserControls.resources.code.DAL.UserDataset._tabs_usersDataTable ds = userlogic.authenticateUser(textUser.Text.Trim(), textPass.Text.Trim());
                InfrastructureClass infra = new InfrastructureClass();

                if (ds.Rows.Count > 0) {
                    // authenticated
                    multiLogin.ActiveViewIndex = 1;
                    literalUser2.Text = ds[0].username;

                    // add to session
                    Session["userid"] = ds[0].userid;

                    // create cookie
                    if (checkRemember.Checked) {
                        infra.WriteCookie("TABSSchool", ds[0].userid.ToString());
                    }


                    // reload
                    if (url.Length > 0) Response.Redirect(url);
                    Response.Redirect("/for-schools/overview.aspx");
                } else {
                    erroMsg.Visible = true;
                }
            } else { erroMsg.Visible = true; }

        }

        protected void buttonSend_Click(object sender, EventArgs e) {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Dear " + textEmail.Text + ",");
            sb.AppendLine("Don’t worry—everybody forgets a password sooner or later! Please find yours below.");
            sb.AppendLine("");
            sb.AppendLine("PASSWORD: " + userlogic.getUserByUsername(textEmail.Text)[0].password);
            DataTable dt = profilelogic.getAdminBySchoolID(Convert.ToInt32(userlogic.getUserByUsername(textEmail.Text)[0].schoolid));
            string admin = dt.Rows[0]["firstname"].ToString() + " " + dt.Rows[0]["lastname"].ToString();
            sb.AppendLine("");
            sb.AppendLine("Make sure to keep your profile up to date and contact " + admin + ", your school administrator, to update any information that you are unable to change. ");
            sb.AppendLine("If you ever have questions or need help, just send us an email or give us a call (828-258-5354).");
            sb.AppendLine("We hope to see you soon at TABS.org, or at one of our on-site events.");
            sb.AppendLine("Have a great week!");
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");
            InfrastructureClass infra = new InfrastructureClass();
            List<string> to = new List<string>();
            to.Add(textEmail.Text);
            List<string> cc = new List<string>();
            List<string> bc = new List<string>();
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "TABS Password", sb.ToString(), false);

        }

      
    }
}