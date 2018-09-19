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
using TABS_UserControls.resources.code.DAL;

namespace TABS_UserControls.usercontrols
{
    public partial class conference : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private ConferenceClass ConferenceBAL = new ConferenceClass();
        private SponsorshipClass SponsorshipBAL = new SponsorshipClass();

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Get conference info
                BindConference();
            }

            this.Page.Title = "Boarding School Conferences - The Association of Boarding Schools - TABS";
        }

        protected void rptSessions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;
                
                // Bind the nested repeater
                Repeater rptSessionContent = (Repeater)e.Item.FindControl("rptSessionContent");

                rptSessionContent.ItemDataBound += new RepeaterItemEventHandler(rptSessionContent_ItemDataBound); 
                
                rptSessionContent.DataSource = ConferenceBAL.GetConferenceConcurrentSessions(int.Parse(dr["ConferenceConcurrentSessionBlockId"].ToString()));
                rptSessionContent.DataBind();
            }
        }

        protected void rptSessionContent_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                // Bind the nested repeater
                Repeater rptSpeakers = (Repeater)e.Item.FindControl("rptSpeakers");

                rptSpeakers.DataSource = ConferenceBAL.GetConferenceConcurrentSessionSpeakers(int.Parse(dr["ConferenceConcurrentSessionId"].ToString()));
                rptSpeakers.DataBind();
            }
        }

        #endregion

        #region Methods

        private void BindConference()
        {
            // Get the current conference
            ConferencesDataset._tabs_ConferencesDataTable dt = ConferenceBAL.GetCurrentConference();

            if (dt.Rows.Count > 0)
            {
                // Bind Data for conference
                BindConferenceFields(dt);

                int conferenceId = dt[0].ConferenceId;

                // Get the standard tab data for this conference
                BindStandardTabData(conferenceId);

                // Get the specialized call for proposals tab data for this conference
                BindCallForProposalsData(conferenceId);

                // Get the specialized sponsorship opportunities tab data for this conference
                BindSponsorshipOpportunitiesData(conferenceId);
                
                // Get the specialized concurrent sessions tab data for this conference
                BindConcurrentSessionsData(conferenceId);

                // Get the specialized sponsors tab data for this conference
                BindSponsorsData(conferenceId);

                // Get the specialized exhibitors tab data for this conference
                BindExhibitorsData(conferenceId);

                // Get the specialized custom tab data for this conference
                BindCustomData(conferenceId);
            }
            else
            {
                // TODO: What to do if no conference is found?
            }
        }

        private void BindCallForProposalsData(int conferenceId)
        {
            // Only get data when the tab is visible
            if (liCallForProposals.Visible)
            {
                ConferencesDataset._tabs_ConferenceCallForProposalsTabsDataTable dt = ConferenceBAL.GetConferenceCallForProposalsTab(conferenceId);

                ConferencesDataset._tabs_ConferenceCallForProposalsTabsRow dr = dt[0];
                
                // Bind the Literals
                litProposalCategoriesContent.Text = dr.ProposalsCategoriesTab;
                litSuggestedTopicsContent.Text = dr.SuggestedTopicsTab;
                litSubmissionAndReviewContent.Text = dr.SubmissionAndReviewTab;
                litFinancialArrangementsContent.Text = dr.FinancialArrangementsTabs;
            }
        }

        private void BindSponsorshipOpportunitiesData(int conferenceId)
        {
            // Only get data when the tab is visible
            if (liSponsorshipOpportunities.Visible)
            {
                ConferencesDataset._tabs_ConferenceSponsorshipOpportunitiesTabsDataTable dt = ConferenceBAL.GetConferenceSponsorshipOpportunitiesTab(conferenceId);

                if (dt.Rows.Count > 0)
                {
                    ConferencesDataset._tabs_ConferenceSponsorshipOpportunitiesTabsRow dr = dt[0];

                    // Bind the Literals
                    litSponsorshipLevelsContent.Text = dr.SponsorshipLevelsTab;
                    litExhibitHallContent.Text = dr.ExhibitHallTab;
                }
            }
        }

        private void BindConcurrentSessionsData(int conferenceId)
        {
            // Only get data when the tab is visible
            if (liConcurrentSessions.Visible)
            {
                ConferencesDataset._tabs_ConferenceConcurrentSessionBlocksDataTable dt = ConferenceBAL.GetConferenceConcurrentSessionBlocks(conferenceId);

                // Bind the top level tabs
                rptConcurrentSessionBlocks.DataSource = dt;
                rptConcurrentSessionBlocks.DataBind();

                // Bind the actual session information
                rptSessions.DataSource = dt;
                rptSessions.DataBind();
                
            }
        }

        private void BindSponsorsData(int conferenceId)
        {
            // Only get data when the tab is visible
            if (liSponsors.Visible)
            {
                SponsorshipDataset.tabs_sponsorsDataTable dt = SponsorshipBAL.GetAllSponsorships();
                rptSponsors.DataSource = dt;
                rptSponsors.DataBind();
            }
        }

        private void BindExhibitorsData(int conferenceId)
        {
            // Only get data when the tab is visible
            if (liExhibitors.Visible)
            {
                ConferencesDataset._tabs_ConferenceExhibitorsDataTable dt = ConferenceBAL.GetExhibitors(conferenceId);

                rptExhibitors.DataSource = dt;
                rptExhibitors.DataBind();
            }
        }

        private void BindCustomData(int conferenceId)
        {
            // Only get data when the tab is visible
            if (liCustom.Visible)
            {
                ConferencesDataset._tabs_ConferenceCustomTabsDataTable dt = ConferenceBAL.GetConferenceCustomTab(conferenceId);

                if (dt.Rows.Count > 0)
                {
                    ConferencesDataset._tabs_ConferenceCustomTabsRow dr = dt[0];

                    // Change the titles
                    litCustomTabTitle.Text = dr.TabTitle;
                    litCustomContentTitle.Text = dr.TabTitle;
                }
            }
        }

        private void BindConferenceFields(ConferencesDataset._tabs_ConferencesDataTable dt)
        {
            ConferencesDataset._tabs_ConferencesRow dr = dt[0];
            
            // Set the title
            litConferenceTitle.Text = dr.ConferenceTitle;

            // Set the image
            if (!String.IsNullOrEmpty(dr.BannerImagePath))
            {
                imgConferenceLogo.ImageUrl = dr.BannerImagePath;
            }
            else
            {
                imgConferenceLogo.Visible = false;
            }

            imgConferenceLogo.AlternateText = dr.ConferenceTitle;
        }

        private void BindStandardTabData(int conferenceId)
        {
            ConferencesDataset._tabs_ConferenceTabContentDataTable dt = ConferenceBAL.GetConferenceTabContent(conferenceId, true);

            // Bind the standard info
            ConferencesDataset._tabs_ConferenceTabContentRow dr = null;
            string tabName = string.Empty;
            string tabNameShort = string.Empty;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dr = dt[i];

                // Set the visibility of the tab
                tabName = dr.ConferenceTabType;

                tabNameShort = tabName.Replace(" ", string.Empty).Replace("-", string.Empty);

                // Get the tab list item
                HtmlContainerControl li = (HtmlContainerControl)ulTabs.FindControl("li" + tabNameShort);

                if (li != null)
                {
                    li.Visible = dr.VisibleOnSite;

                    // Get the literal holding the title
                    Literal litTitle = (Literal)li.FindControl("lit" + tabNameShort + "TabTitle");

                    if (litTitle != null)
                    {
                        litTitle.Text = tabName;
                    }

                    // Set the title of the content area
                    Literal litContentTitle = (Literal)divMainContainer.FindControl("lit" + tabNameShort + "ContentTitle");

                    if (litContentTitle != null)
                    {
                        litContentTitle.Text = tabName;
                    }

                    // Set the content of the tab
                    Literal litContent = (Literal)divMainContainer.FindControl("lit" + tabNameShort + "Content");

                    if (litContent != null)
                    {
                        litContent.Text = dr.TabContent;
                    }
                }
            }
        }

        #endregion
        
    }
}