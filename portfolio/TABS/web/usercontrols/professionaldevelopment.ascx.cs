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

using TABS_UserControls.resources.code.DAL;

namespace TABS_UserControls.usercontrols
{
    public partial class professionaldevelopment : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private const int _NUMEVENTS = 6;

        private TABS_UserControls.resources.code.BAL.EventClass eventClass = new TABS_UserControls.resources.code.BAL.EventClass();

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Get EventTypes
                EventDataset._tabs_eventtypesDataTable eventTypes = GetEventTypes();
                EventDataset._tabs_eventtypesRow[] dr;
                
                // Bind Conferences
                dr = (EventDataset._tabs_eventtypesRow[])eventTypes.Select("eventtype='Conference'");

                if (dr.Length > 0)
                {
                    lblrtpConferences.Visible = false;
                    BindRepeater(ref rptConferences, dr[0].eventtypeid, ref lblrtpConferences);
                }
                else
                {
                    lblrtpConferences.Visible = true;
                    rptConferences.Visible = false;
                }

                // Bind Workshops
                dr = (EventDataset._tabs_eventtypesRow[])eventTypes.Select("eventtype='Education: Workshop'");

                if (dr.Length > 0)
                {
                    lblrptWorkshops.Visible = false; 
                    BindRepeater(ref rptWorkshops, dr[0].eventtypeid, ref lblrptWorkshops);
                }
                else
                {
                    lblrptWorkshops.Visible = true;
                    rptWorkshops.Visible = false;
                }
                
                // Bind Webinars
                dr = (EventDataset._tabs_eventtypesRow[])eventTypes.Select("eventtype='Education: Webinar'");

                if (dr.Length > 0)
                {
                    lblrptWebinars.Visible = false; 
                    BindRepeater(ref rptWebinars, dr[0].eventtypeid, ref lblrptWebinars);
                }
                else
                {
                    lblrptWebinars.Visible = true;
                    rptWebinars.Visible = false;
                }
            }
        }

        #endregion

        #region Methods

        private EventDataset._tabs_eventtypesDataTable GetEventTypes()
        {
            return eventClass.getEventTypes();
        }

        private void BindRepeater(ref Repeater repeater, int eventTypeId, ref Label label)
        {
            EventDataset._tabs_eventsDataTable dt = eventClass.GetTopXEventsByEventTypeID(_NUMEVENTS, eventTypeId);

            if (dt.Rows.Count > 0)
            {
                repeater.DataSource = dt;
                repeater.DataBind();
            }
            else
            {
                label.Visible = true;
                repeater.Visible = false;
            }
        }

        #endregion
    }
}