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

namespace TABS_UserControls.usercontrols {
    public partial class users_add : System.Web.UI.UserControl {
        UserClass userlogic = new UserClass();
        SchoolClass schoologic = new SchoolClass();
        ProfileClass profilelogic = new ProfileClass();

        int loggedinuserid, userid, stateid;
        bool isnewUser = true;

        protected void Page_Init(object sender, EventArgs e) {
            try { loggedinuserid = Convert.ToInt32(Session["userid"]); } catch { loggedinuserid = 1; }
            try { userid = Convert.ToInt32(Request.QueryString["user"]); } catch { userid = 1; }

            //userid = 1;
            //loggedinuserid = 1;
        }

        protected void Page_Load(object sender, EventArgs e) {

            if (!Page.IsPostBack) 
            {
                this.BindDropdowns();
                DataTable dt = userlogic.getSchoolUser(loggedinuserid);
                ListItem list = ddlSchools.Items.FindByValue(dt.Rows[0]["schoolid"].ToString()); if (list != null) ddlSchools.SelectedIndex = ddlSchools.Items.IndexOf(list);
                this.BindCheckboxes();
                ddlSchools.Enabled = false;
                DataTable dt2 = schoologic.getSchoolBySchoolID(Convert.ToInt32(ddlSchools.SelectedValue));
                stateid = Convert.ToInt32(dt2.Rows[0]["stateid"].ToString());
                if (userid > 0) { this.SetUser(userid); }

            }

            if (userid > 0) // Existing User
            {
                isnewUser = false;
            }
        }

        private void BindDropdowns() {
            ddlPrimaryDept.DataSource = userlogic.getDepartments();
            ddlPrimaryDept.DataBind();

            ddlPrimaryPosition.DataSource = userlogic.getPositions();
            ddlPrimaryPosition.DataBind();

            ddlSchools.DataSource = schoologic.getSchoolNames();
            ddlSchools.DataBind();

            ddlTitle.DataSource = userlogic.getPrefixes();
            ddlTitle.DataBind();

            ddlRole.DataSource = userlogic.getUserTypes();
            ddlRole.DataBind();
        }

        private void BindCheckboxes() {
            chxOtherDept.DataSource = userlogic.getDepartments();
            chxOtherDept.DataBind();

            chxOtherPosition.DataSource = userlogic.getPositions();
            chxOtherPosition.DataBind();
        }

        private void SetOtherPostions(int userid) {
            DataTable dt = userlogic.getUserToPositions(userid);
            List<int> depts = new List<int>();
            depts.Capacity = dt.Rows.Count;
            foreach (DataRow row in dt.Rows) {
                ListItem currentCheckBox = chxOtherPosition.Items.FindByValue(row["positionid"].ToString());
                if (currentCheckBox != null) {
                    currentCheckBox.Selected = true;
                }
            }
        }

        private void SetOtherDepts(int userid) {
            DataTable dt = userlogic.getUserToDepts(userid);
            List<int> depts = new List<int>();
            depts.Capacity = dt.Rows.Count;
            foreach (DataRow row in dt.Rows) {
                ListItem currentCheckBox = chxOtherDept.Items.FindByValue(row["departmentid"].ToString());
                if (currentCheckBox != null) {
                    currentCheckBox.Selected = true;
                }
            }
        }

        private void SetUser(int userid) {
            ListItem list = new ListItem();
            DataTable dt = userlogic.getSchoolUser(userid);

            // Prefix
            list = ddlTitle.Items.FindByValue(dt.Rows[0]["prefixid"].ToString()); if (list != null) ddlTitle.SelectedIndex = ddlTitle.Items.IndexOf(list);

            // User Info
            txtFName.Text = dt.Rows[0]["firstname"].ToString();
            txtMI.Text = dt.Rows[0]["middle"].ToString();
            txtLName.Text = dt.Rows[0]["lastname"].ToString();
            txtJobTitle.Text = dt.Rows[0]["title"].ToString();
            txtEmail.Text = dt.Rows[0]["username"].ToString();
            txtOPhone.Text = dt.Rows[0]["phone"].ToString();
            txtOExt.Text = dt.Rows[0]["ext"].ToString();
            txtFax.Text = dt.Rows[0]["fax"].ToString();
            txtAltPhone.Text = dt.Rows[0]["phone2"].ToString();
            txtPassword.Text = dt.Rows[0]["password"].ToString();
            txtConfirmPassword.Text = dt.Rows[0]["password"].ToString();

            // Primary Position
            list = new ListItem();
            list = ddlPrimaryPosition.Items.FindByValue(dt.Rows[0]["primarypostionid"].ToString()); if (list != null) ddlPrimaryPosition.SelectedIndex = ddlPrimaryPosition.Items.IndexOf(list);

            // Primary Dept
            list = new ListItem();
            list = ddlPrimaryDept.Items.FindByValue(dt.Rows[0]["departmentid"].ToString()); if (list != null) ddlPrimaryDept.SelectedIndex = ddlPrimaryDept.Items.IndexOf(list);

            // Role
            list = new ListItem();
            list = ddlRole.Items.FindByValue(dt.Rows[0]["usertypeid"].ToString()); if (list != null) ddlRole.SelectedIndex = ddlRole.Items.IndexOf(list);

            // School
            list = new ListItem();
            list = ddlSchools.Items.FindByValue(dt.Rows[0]["schoolid"].ToString()); if (list != null) ddlSchools.SelectedIndex = ddlSchools.Items.IndexOf(list);

            SetOtherDepts(userid);
            SetOtherPostions(userid);
        }

        private void AddUser() 
        {
            userlogic.insertUser(txtEmail.Text, txtPassword.Text, Convert.ToInt32(ddlSchools.SelectedValue), Convert.ToInt32(ddlRole.SelectedValue), 0);
            DataTable dt = userlogic.getLastUserId(txtEmail.Text);
            int newuserid = Convert.ToInt32(dt.Rows[0]["userid"].ToString());

            userlogic.insertUserProfile(Convert.ToInt32(ddlTitle.SelectedValue), txtFName.Text, txtMI.Text, txtLName.Text, txtJobTitle.Text, Convert.ToInt32(ddlPrimaryDept.SelectedValue), Convert.ToInt32(ddlPrimaryPosition.SelectedValue), txtOPhone.Text, txtOExt.Text, txtFax.Text, txtAltPhone.Text, chxSubscribe.Checked, stateid, newuserid);
            
            for(int i=0; i<chxOtherDept.Items.Count; i++)
            {
                if(chxOtherDept.Items[i].Selected)
                {
                    int id = userlogic.insertUserToDepts(newuserid, Convert.ToInt32(chxOtherDept.Items[i].Value));
                }
            }
            for (int ii = 0; ii < chxOtherDept.Items.Count; ii++) {
                if (chxOtherPosition.Items[ii].Selected) {
                   int id = userlogic.insertUserToPositions(newuserid, Convert.ToInt32(chxOtherPosition.Items[ii].Value));
                }
            }
        }

        private void UpdateUser() 
        {
            userlogic.updateSchoolUser(txtEmail.Text, txtPassword.Text, true, Convert.ToInt32(ddlSchools.SelectedValue), Convert.ToInt32(ddlRole.SelectedValue), 0,userid);
            userlogic.updateUserProfile(Convert.ToInt32(ddlTitle.SelectedValue), txtFName.Text, txtMI.Text, txtLName.Text, txtJobTitle.Text, Convert.ToInt32(ddlPrimaryDept.SelectedValue), Convert.ToInt32(ddlPrimaryPosition.SelectedValue), txtOPhone.Text, txtOExt.Text, txtFax.Text, txtAltPhone.Text, chxSubscribe.Checked, Convert.ToInt32(stateid), userid);
            userlogic.deleteOtherConfigs(userid);
            for (int i = 0; i < chxOtherDept.Items.Count; i++) {
                if (chxOtherDept.Items[i].Selected) {
                    int id = userlogic.insertUserToDepts(userid, Convert.ToInt32(chxOtherDept.Items[i].Value));
                }
            }
            for (int ii = 0; ii < chxOtherDept.Items.Count; ii++) {
                if (chxOtherPosition.Items[ii].Selected) {
                    int id = userlogic.insertUserToPositions(userid, Convert.ToInt32(chxOtherPosition.Items[ii].Value));
                }
            }
        }

        protected void submitBtn_Click(object sender, EventArgs e) 
        {
            if (isnewUser == true) 
            {
                AddUser();
                //SendAddMail();
                Response.Redirect("/for-schools/users.aspx");
            } else 
            { 
                UpdateUser();
                //SendUpdateMail();
                Response.Redirect("/for-schools/users.aspx");
            }
        }

        private void SendAddMail() 
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Dear " + txtEmail.Text + ",");
            sb.AppendLine("Good news! You have been added as a user to your school’s TABS.org account. We’ve included your user name and password below. Login to see your account details.");
            sb.AppendLine("");
            sb.AppendLine("USERNAME: " + txtEmail.Text);
            sb.AppendLine("PASSWORD: " + txtPassword.Text);
            DataTable dt = profilelogic.getAdminBySchoolID(Convert.ToInt32(userlogic.getUserByUsername(txtEmail.Text)[0].schoolid));
            string admin = dt.Rows[0]["firstname"].ToString() + " " + dt.Rows[0]["lastname"].ToString();
            sb.AppendLine("");
            sb.AppendLine("Make sure to keep your profile up to date and contact " + admin +", your school administrator, to update any information that you are unable to change. ");
            sb.AppendLine("Welcome to our community! TABS is a non-profit organization representing nearly 300 college-prep boarding schools in the U.S., Canada, and overseas. TABS is the public voice for college-prep boarding schools and the essential resource for boarding school educators.");
            sb.AppendLine("We hope to see you soon at TABS.org, at our Annual Conference, or at one of our workshops.");
            sb.AppendLine("If you ever have questions or need help, just send us an email or give us a call (828-258-5354).");
            sb.AppendLine("Thanks and have a great week!");
            sb.AppendLine("The TABS Staff");

            InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(txtEmail.Text);
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "User Added To TABS Account", sb.ToString(), false);
        }

        private void SendUpdateMail() 
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Dear " + txtEmail.Text + ",");
            sb.AppendLine("Hi! We’re writing to let you know that your TABS user profile has changed! Please login at tabs.org to review your changes. ");
            sb.AppendLine("TABS is the public voice for college-prep boarding schools and the essential resource for boarding school educators.  We hope to see you soon online or at one of our professional events.");
            sb.AppendLine("Have a great week!");
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");

            InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(txtEmail.Text);
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "Your TABS Profile Has Changed!", sb.ToString(), false);
        }

    }
}