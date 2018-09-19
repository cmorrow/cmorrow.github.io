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
    public partial class tabs_calendar_detail : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.EventClass eventlogic = new TABS_UserControls.resources.code.BAL.EventClass();
        private int eventid;
        private string section;
        protected void Page_Init(object sender, EventArgs e)
        {
            try { eventid = Convert.ToInt16(Request.QueryString["eventid"]); }
            catch { eventid = 0; }
            section = Request.QueryString["section"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                repeatEvent.DataSource = eventlogic.getEventByEventID(eventid);
                repeatEvent.DataBind();
            }
            if (section == "schoolTabId")
            {
                lbBack.Text = "Back to Schools Calendar";
                  lbBack.PostBackUrl = "/for-schools.aspx#tabscalendar";
            } 
            else if (section == "school") 
            {
                lbBack.Text = "Back to Schools Calendar";
            } else if (section == "tabs") {
                lbBack.Text = "Back to Tabs Calendar";
            }
        }

        protected void lbBack_Click(object sender, EventArgs e)
        {
            if (section == "school") 
            {
                Response.Redirect("/for-schools/professional-development/tabs-calendar-for-schools.aspx");
            }
            if (section == "tabs") {
                Response.Redirect("/about-tabs/about-us/tabs-calendar.aspx");
            }
        }
    }
}