using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TABS_UserControls.resources.code.BAL;
using System.Text;

namespace TABS_UserControls.usercontrols
{
    public partial class bugForm : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                InfrastructureClass infrastructure = new InfrastructureClass();

                string from = System.Configuration.ConfigurationManager.AppSettings["fromEmailAddress"].ToString();

                List<string> to = new List<string>();
                to.Add("tabs@tabs.org");

                StringBuilder body = new StringBuilder();
                body.Append("Browser name: ").Append(tbBrowserName.Text).Append("\r\n");
                body.Append("Browser version: ").Append(tbBrowserVersion.Text).Append("\r\n");
                body.Append("Operating system: ").Append(tbOperatingSystem.Text).Append("\r\n");
                body.Append("Description: ").Append(tbDescription.Text).Append("\r\n");
                body.Append("Name: ").Append(tbName.Text).Append("\r\n");
                body.Append("Email Address: ").Append(tbEmailAddress.Text).Append("\r\n");
                body.Append("Expected Results: ").Append(tbExpectedResults.Text).Append("\r\n");
                body.Append("Page URL: ").Append(tbPageURL.Text).Append("\r\n");


                infrastructure.SendEmail(from, to, new List<string>(), new List<string>(), "TABS Bug Reported", body.ToString(), false);

                ltlErrorMsg.Text = "Thank you, your message has been sent.";
            }
            catch (System.Exception ex)
            {
                ltlErrorMsg.Text = ex.Message;
            }
        }
    }
}