using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols {
    public partial class news_profileeventsdetail : System.Web.UI.UserControl 
    {
        int eventid, schoolid, type;
        SchoolClass schoollogic = new SchoolClass();
        EventClass eventlogic = new EventClass();

        protected void Page_Init(object sender, EventArgs e) {
            try { schoolid = Convert.ToInt16(Request.QueryString["schoolid"]); } catch { schoolid = 0; }
            try { eventid = Convert.ToInt16(Request.QueryString["eventid"]); } catch { eventid = 0; }
            try { type = Convert.ToInt16(Request.QueryString["type"]); } catch { type = 0; }
        }

        protected void Page_Load(object sender, EventArgs e) 
        {
            if (!Page.IsPostBack) 
            {
                repeatSchool.DataSource = schoollogic.getSchoolBySchoolID(schoolid);
                repeatSchool.DataBind();

                repeatEvent.DataSource = eventlogic.getProfileEventByEventId(eventid);
                repeatEvent.DataBind();
                if (schoolid == 000000 && type == 1) 
                {
                    lbBack.Text = "Back To Fairs";
                }
                else if(schoolid == 000000 && type == 2)
                {
                    lbBack.Text = "Back To Summer Programs";
                }

            }
        }

        protected void lbBack_Click(object sender, EventArgs e) 
        {
            if (schoolid == 000000 && type == 1) 
            {
                Response.Redirect("/find-a-school/explore-your-options/school-fairs.aspx");
            } else if (schoolid == 000000 && type == 2) 
            {
                Response.Redirect("/find-a-school/explore-your-options/summer-programs.aspx");
            } 
            else 
            {
                Response.Redirect("/school-profile.aspx?schoolid=" + schoolid);
            }
        }
    }
}