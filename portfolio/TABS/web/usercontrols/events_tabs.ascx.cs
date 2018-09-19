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
      public partial class events_tabs : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.EventClass eventlogic = new TABS_UserControls.resources.code.BAL.EventClass();

            protected void Page_Load(object sender, EventArgs e)
            {
                  // server-side binding
                  if (!Page.IsPostBack)
                  {
                        LoadCalendar();
                        DataTable dt = eventlogic.getSchoolEvents();
                        if (dt.Rows.Count > 6)
                        {
                              LinkButton1.Visible = true;
                        }
                        else
                        {
                              LinkButton1.Visible = false;
                        }
                  }
            }

            protected void dropEventTypes_SelectedIndexChanged1(object sender, EventArgs e)
            {
                  if (dropEventTypes.SelectedIndex > 0)
                  {
                        repeatEvents.DataSource = eventlogic.getTop6EventsBySchoolAndEventTypeID(Convert.ToInt16(dropEventTypes.SelectedValue));
                        repeatEvents.DataBind();
                        LinkButton1.Visible = false;
                  }
                  else
                  {
                        reloadCalendar();

                  }
            }

            private void LoadCalendar()
            {
                  repeatEvents.DataSource = eventlogic.getTop6EventsBySchool();
                  repeatEvents.DataBind();

                  dropEventTypes.DataSource = eventlogic.getExistingEventTypesBySchool();
                  dropEventTypes.DataBind();
                  dropEventTypes.Items.Insert(0, new ListItem("Select All", "0"));
            }

            private void reloadCalendar()
            {
                  repeatEvents.DataSource = eventlogic.getSchoolEvents();
                  repeatEvents.DataBind();
            }

            protected void LinkButton1_Click(object sender, EventArgs e)
            {
                  repeatEvents.DataSource = eventlogic.getSchoolEvents();
                  repeatEvents.DataBind();
                  LinkButton1.Visible = false;
            }
      }
}