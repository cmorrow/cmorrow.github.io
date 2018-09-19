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
using System.Text;
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols
{
    public partial class send_idea : System.Web.UI.UserControl
    {            
        SchoolClass schoollogic = new SchoolClass();
        UserClass userlogic = new UserClass();
        int userId;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Convert.ToInt16(Session["userid"]) > 0
            if (Session["userid"] != null) 
            {
                userId = Convert.ToInt32(Session["userid"]);
            }

           DataTable dt = userlogic.getUserInfoByUserID(userId);
           lblEmail.Text = dt.Rows[0]["username"].ToString();
           lblFullName.Text = dt.Rows[0]["firstname"] + " " + dt.Rows[0]["middle"] + " " + dt.Rows[0]["lastname"];
           lblJob.Text = dt.Rows[0]["title"].ToString();
           lblSchoolName.Text = dt.Rows[0]["schoolname"].ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e) 
        {
            tabs_admin logic = new tabs_admin();
            string [] name = lblFullName.Text.Split(' ');
            logic.InsertForm(name[0].ToString(), name[1].ToString(), lblSchoolName.Text, lblJob.Text, lblEmail.Text, txtComment.Text, 2);

            // Build Body
            // Need to send email to Tabs
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Dear " + lblEmail.Text + ",");
            sb.AppendLine("A TABS member has submitted an idea. Please find their text submission below: ");
            sb.AppendLine(txtComment.Text);
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");

            InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(lblEmail.Text);
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "New 'Contact Us' message", sb.ToString(), false);

        }
    }
}