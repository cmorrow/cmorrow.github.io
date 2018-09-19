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
using System.Web.UI.MobileControls;
using System.Collections.Generic;
using System.Text;

namespace TABS_UserControls.usercontrols
{
    public partial class login : System.Web.UI.UserControl {
        private TABS_UserControls.resources.code.BAL.UserClass userlogic = new TABS_UserControls.resources.code.BAL.UserClass();
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new SchoolClass();
        private TABS_UserControls.resources.code.BAL.ProfileClass profilelogic = new ProfileClass();
        private string url;

        protected void Page_Init(object sender, EventArgs e) {
            // if logged in, show loggedin view
            try {
                if (Convert.ToInt16(Session["userid"]) > 0) {
                    showUser(Convert.ToInt16(Session["userid"]));
                    multiLogin.ActiveViewIndex = 1;
                }
            } catch { }
            try { url = Request.QueryString["url"].ToString(); } catch { url = "/for-schools/overview.aspx"; }
        }

        protected void Page_Load(object sender, EventArgs e) {
            // server-side binding
            buttonLogin.Click += new EventHandler(buttonLogin_Click);
            logoutBtn.Click += new EventHandler(logoutBtn_Click1);

            // bind schools
            if (!Page.IsPostBack) {
                ddlSchools.DataSource = schoollogic.getSchoolNames();
                ddlSchools.DataTextField = "schoolname";
                ddlSchools.DataValueField = "schoolid";
                ddlSchools.DataBind();
            }
        }

        void buttonLogin_Click(object sender, EventArgs e) {
            TABS_UserControls.resources.code.DAL.UserDataset._tabs_usersDataTable ds = userlogic.authenticateUser(textUser.Text.Trim(), textPass.Text.Trim());

            if (ds.Rows.Count > 0) {
                // authenticated
                multiLogin.ActiveViewIndex = 1;
                showUser(ds[0].userid);

                // add to session
                Session["userid"] = ds[0].userid;

                TABS_UserControls.resources.code.DAL.UserDataset._tabs_usertypesDataTable dst = userlogic.getUserRoleByUserId(ds[0].userid);
                Session["userrole"] = dst[0].usertype;

                if (!String.IsNullOrEmpty(ds[0].sponsorid.ToString())) {
                    Session["sponsorid"] = ds[0].sponsorid.ToString();
                }

                // reload
                if (url.Length > 0) Response.Redirect(url);
                Response.Redirect("/for-schools/overview.aspx");
            } else {
                errorLbl.Visible = true;
            }
        }

        void showUser(int userid) {
            literalUser.Text = userlogic.getUserByUserID(userid)[0].username;
        }

        protected void ddlSchools_SelectedIndexChanged(object sender, EventArgs e) {
            DataTable dt = profilelogic.getAdminBySchoolID(Convert.ToInt32(ddlSchools.SelectedValue));
            adminList.Style.Clear();

            if (dt.Rows.Count > 0) {

                foreach (DataRow row in dt.Rows) {
                    lblFName.Text = row["firstname"].ToString() + " ";
                    lblLName.Text = row["lastname"].ToString();
                }
            } else {
                lblFName.Text = "N/A";
                lblLName.Text = "N/A";
            }
        }

        protected void buttonSend_Click(object sender, EventArgs e) {
            try {
                
                StringBuilder sb = new StringBuilder();
                sb.AppendLine("Dear " + textEmail.Text + ",");
                sb .AppendLine("Don’t worry—everybody forgets a password sooner or later! Please find yours below.");
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
            } catch { }

        }

        protected void logoutBtn_Click1(object sender, EventArgs e)
        {
            Session.RemoveAll();
            //Response.End();
            Response.Redirect("/home.aspx");
        }

    }
}