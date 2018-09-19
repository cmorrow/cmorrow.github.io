using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using System.Text;

namespace TABS_UserControls.usercontrols {
    public partial class contactus : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) 
        {
            this.Page.Title = "Contact Us - The Association of Boarding Schools - TABS";
        }

        protected void btnSubmit_Click(object sender, EventArgs e) 
        {
            // Need to send email to Tabs
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Hello TABS Staff,");
            sb.AppendLine("TABS has been contacted by a site user. Please find their text comment below:");
            sb.AppendLine("Comment from user: " + txtComment.Text);
            sb.AppendLine("User name: " + txtFName.Text + " " + txtLName.Text);
            sb.AppendLine("User email: " + txtEmail.Text);
            sb.AppendLine("Institution: " + txtSchool.Text);
            sb.AppendLine("Job Title: " + txtJob.Text);

            InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(txtEmail.Text);
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "New 'Contact Us' message", sb.ToString(), false);


            // Add Form data to DB
            tabs_admin logic = new tabs_admin();
            logic.InsertForm(txtFName.Text, txtLName.Text, txtSchool.Text, txtJob.Text, txtEmail.Text, txtComment.Text, 1);
            Response.Redirect("/about-tabs/contact-us/thank-you.aspx");
        }
    }
}