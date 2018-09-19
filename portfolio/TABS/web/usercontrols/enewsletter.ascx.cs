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
    public partial class enewsletter : System.Web.UI.UserControl
    {
        NewsClass newslogic = new NewsClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Params["id"] == null)
            {
                GetCurrentNewsLetter();
            }
            else
            {
                ViewArchiveNewsLetter(Convert.ToInt32(Request.Params["id"].ToString()));
            }
        }

        public void ViewArchiveNewsLetter(int archiveId) {
            newsletterRep2.DataSource = newslogic.getNewsLetterById(archiveId);
            newsletterRep2.DataBind();
            newsletterView.ActiveViewIndex = 1;
        }

        public void GetCurrentNewsLetter() {
            newsletterRep.DataSource = newslogic.getCurrentNewsLetter();
            newsletterRep.DataBind();
            newsletterView.ActiveViewIndex = 0;
        }

        protected void viewCurrent_Click(object sender, EventArgs e) {
            Response.Redirect(Request.Url.AbsolutePath);
        }
    }
}