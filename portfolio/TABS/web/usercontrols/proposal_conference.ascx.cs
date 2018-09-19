using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Text;
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
    /// <summary>
    /// 
    /// </summary>
    public partial class proposal_conference : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private ConferenceClass ConferenceBAL = new ConferenceClass();
        private tabs_admin TabsAdminBAL = new tabs_admin();
        private Encryption64 EncryptionBAL = new Encryption64();

        #endregion

        #region Event Handlers

        /// <summary>
        /// Handles the Load event of the Page control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Get current conference
                ConferencesDataset._tabs_ConferencesDataTable dt = ConferenceBAL.GetCurrentConference();

                if (dt.Rows.Count > 0)
                {
                    int conferenceId = dt[0].ConferenceId;
                    litConferenceProposalId.Text = conferenceId.ToString();

                    // Build presentationTypes
                    BuildProposalTypes(conferenceId);

                    // Build topic areas
                    BuildTopicAreas(conferenceId);

                    // Build the countries
                    BuildCountries();

                    if (Request.QueryString["mode"] == "e")
                    {
                        // Edit an existing proposal

                        // Get the ConferenceProposalId
                        if (!String.IsNullOrEmpty(Request.QueryString["cid"]))
                        {
                            string encrypted = Request.QueryString["cid"];
                            
                            // The plus signs were stripped out, add them back
                            encrypted = encrypted.Replace(" ", "+");
                            int conferenceProposalId = 0;
                            int.TryParse(EncryptionBAL.Decrypt(encrypted, "secretTABS"), out conferenceProposalId);

                            if (conferenceProposalId > 0)
                            {
                                // Bind the Data
                                BindData(conferenceProposalId);
                            }
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Handles the SelectedIndexChanged event of the rblHavePresentedBefore control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void rblHavePresentedBefore_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;

            if (rbl.SelectedValue.Equals("1"))
            {
                tbSpeaker1OtherConferences.Enabled = true;
            }
            else
            {
                tbSpeaker1OtherConferences.Enabled = false;
                tbSpeaker1OtherConferences.Text = string.Empty;
            }
            Page.SetFocus(tbSpeaker1OtherConferences);
        }

        /// <summary>
        /// Handles the SelectedIndexChanged event of the rblSpeaker2HasPresented control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void rblSpeaker2HasPresented_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;

            if (rbl.SelectedValue.Equals("1"))
            {
                tbSpeaker2OtherConferences.Enabled = true;
            }
            else
            {
                tbSpeaker2OtherConferences.Enabled = false;
                tbSpeaker2OtherConferences.Text = string.Empty;
            }

            Page.SetFocus(tbSpeaker2OtherConferences);
        }

        /// <summary>
        /// Handles the SelectedIndexChanged event of the rblSpeaker3HasPresented control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void rblSpeaker3HasPresented_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;

            if (rbl.SelectedValue.Equals("1"))
            {
                tbSpeaker3OtherConferences.Enabled = true;
            }
            else
            {
                tbSpeaker3OtherConferences.Enabled = false;
                tbSpeaker3OtherConferences.Text = string.Empty;
            }
            Page.SetFocus(tbSpeaker3OtherConferences);
        }

        /// <summary>
        /// Handles the Click event of the btnSubmit control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate the page
            Page.Validate(); 
            
            if (Page.IsValid)
            {
                // Submit the data to the database
                SubmitData();

                // Send Email Confirmation
                SendEmail();

                // Redirect to the thank you page
                Response.Redirect("/for-schools/professional-development/conferences/proposal-thankyou.aspx", true);
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Determine which country dropdown is calling
            DropDownList ddl = (DropDownList)sender;

            if (ddl.ID.Equals("ddlSpeaker1Country"))
            {
                if (ddlSpeaker1Country.SelectedValue.Equals("0"))
                {
                    ddlSpeaker1State.Items.Clear();
                    ddlSpeaker1State.Enabled = false;
                }
                else
                {
                    // Populate the state/province based on the country selection
                    SchoolManagerClass smlogic = new SchoolManagerClass();
                    SchoolManageDataset._tabs_statesDataTable dt = smlogic.getStatesByCountryId(int.Parse(ddlSpeaker1Country.SelectedValue));
                    ddlSpeaker1State.DataSource = dt;

                    ddlSpeaker1State.DataBind();
                    ddlSpeaker1State.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                    ddlSpeaker1State.Enabled = true;
                    Page.SetFocus(ddlSpeaker1State);
                }
            }
            else
            {
                if (ddl.ID.Equals("ddlSpeaker2Country"))
                {
                    if (ddlSpeaker2Country.SelectedValue.Equals("0"))
                    {
                        ddlSpeaker2State.Items.Clear();
                        ddlSpeaker2State.Enabled = false;
                    }
                    else
                    {
                        // Populate the state/province based on the country selection
                        SchoolManagerClass smlogic = new SchoolManagerClass();
                        SchoolManageDataset._tabs_statesDataTable dt = smlogic.getStatesByCountryId(int.Parse(ddlSpeaker2Country.SelectedValue));
                        ddlSpeaker2State.DataSource = dt;

                        ddlSpeaker2State.DataBind();
                        ddlSpeaker2State.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                        ddlSpeaker2State.Enabled = true;
                        Page.SetFocus(ddlSpeaker2State);
                    }
                }
                else
                {
                    if (ddl.ID.Equals("ddlSpeaker3Country"))
                    {
                        if (ddlSpeaker3Country.SelectedValue.Equals("0"))
                        {
                            ddlSpeaker3State.Items.Clear();
                            ddlSpeaker3State.Enabled = false;
                        }
                        else
                        {
                            // Populate the state/province based on the country selection
                            SchoolManagerClass smlogic = new SchoolManagerClass();
                            SchoolManageDataset._tabs_statesDataTable dt = smlogic.getStatesByCountryId(int.Parse(ddlSpeaker3Country.SelectedValue));
                            ddlSpeaker3State.DataSource = dt;

                            ddlSpeaker3State.DataBind();
                            ddlSpeaker3State.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                            ddlSpeaker3State.Enabled = true;
                            Page.SetFocus(ddlSpeaker3State);
                        }
                    }
                }
            }
        }

        public void cvAgreement1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (cbAgreement1.Checked == true);
        }

        public void cvAgreement2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = (cbAgreement2.Checked == true);
        }

        #endregion

        #region Methods

        /// <summary>
        /// Builds the proposal types radio buttons.
        /// </summary>
        /// <param name="conferenceId">The conference id.</param>
        private void BuildProposalTypes(int conferenceId)
        {
            ConferencesDataset._tabs_ConferenceProposalTypesDataTable dt = ConferenceBAL.GetProposalTypes(conferenceId);

            if (dt.Rows.Count > 0)
            {
                DataTable dtCopy = dt.Copy();

                rptProposalTypesLeft.DataSource = GetHalfofData(dt, true);
                rptProposalTypesLeft.DataBind();

                rptProposalTypesRight.DataSource = GetHalfofData(dtCopy, false);
                rptProposalTypesRight.DataBind();
            }
        }

        /// <summary>
        /// Builds the topic areas radio buttons.
        /// </summary>
        /// <param name="conferenceId">The conference id.</param>
        private void BuildTopicAreas(int conferenceId)
        {
            ConferencesDataset._tabs_ConferenceTopicAreasDataTable dt = ConferenceBAL.GetTopicAreas(conferenceId);

            if (dt.Rows.Count > 0)
            {
                DataTable dtCopy = dt.Copy();

                rptTopicAreaLeft.DataSource = GetHalfofData(dt, true);
                rptTopicAreaLeft.DataBind();

                DataTable dtRight = GetHalfofData(dtCopy, false);

                // Always add the "other" option last
                DataRow dr = dtRight.NewRow();
                dr["ConferenceTopicAreaId"] = "0";
                dr["ConferenceId"] = conferenceId;
                dr["TopicArea"] = "Multidisciplinary/Other (please specify below)";

                dtRight.Rows.Add(dr);

                rptTopicAreaRight.DataSource = dtRight;
                rptTopicAreaRight.DataBind();
            }
        }

        private void BuildCountries()
        {
            // Countries
            tabs_admin_dataset._tabs_countryDataTable dt = TabsAdminBAL.getCountry();
            ddlSpeaker1Country.DataSource = dt;
            ddlSpeaker1Country.DataBind();
            ddlSpeaker1Country.Items.Insert(0, new ListItem("-- Please Select --", "0"));

            // Just bind while we already have the data
            ddlSpeaker2Country.DataSource = dt;
            ddlSpeaker2Country.DataBind();
            ddlSpeaker2Country.Items.Insert(0, new ListItem("-- Please Select --", "0"));

            // Just bind while we already have the data
            ddlSpeaker3Country.DataSource = dt;
            ddlSpeaker3Country.DataBind();
            ddlSpeaker3Country.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        /// <summary>
        /// Gets half of a secified data table.
        /// </summary>
        /// <param name="dt">The DataTable.</param>
        /// <param name="firstHalf">if set to <c>true</c> [first half].</param>
        /// <returns></returns>
        private DataTable GetHalfofData(DataTable dt, bool firstHalf)
        {
            if (dt.Rows.Count > 0)
            {
                int half = dt.Rows.Count / 2;
                int count = dt.Rows.Count;

                if (firstHalf)
                {
                    // Remove the last half of the rows 
                    for (int i = 0; i < half; i++)
                    {
                        dt.Rows.RemoveAt(0 + half);
                    }

                    return dt;
                }
                else
                {
                    // Remove the first half of the rows
                    for (int i = 0; i < half; i++)
                    {
                        dt.Rows.RemoveAt(0);
                    }

                    return dt;
                }
            }

            return null;
        }

        private void SubmitData()
        {
            int conferenceId = int.Parse(litConferenceProposalId.Text);
            int proposalType = int.Parse(Request.Form["radioproposalType"]);
            int topicAreaId = int.Parse(Request.Form["radioTopicArea"]);

            string otherTopicArea = string.Empty;
            if (topicAreaId.Equals(0))
            {
                otherTopicArea = Utility.GetCleanString(tbOtherTopicArea.Text);
            }
            else
            {
                otherTopicArea = null;
            }
            
            string presentedOtherConferences1 = Utility.GetCleanString(tbConference1.Text);
            string presentedOtherConferences2 = Utility.GetCleanString(tbConference2.Text);
            string audioVisualOther = Utility.GetCleanString(tbAudioVisualOther.Text);

            bool existingConferenceProposal = false;

            if (litConferenceProposalId.Text.Length > 0)
            {
                existingConferenceProposal = true;
            }
            
            int conferenceProposalId = 0;
            int result = 0;

            if (!existingConferenceProposal)
            {
                // Insert the proposal
                conferenceProposalId = ConferenceBAL.InsertConferenceProposal(conferenceId, proposalType, topicAreaId, otherTopicArea, tbTitle.Text, tbDescription.Text,
                    presentedOtherConferences1, presentedOtherConferences2, cbFlipChart.Checked, audioVisualOther);

                // Insert the Submitter info
                result = ConferenceBAL.InsertConferenceProposalSubmitter(conferenceProposalId, tbSpeaker1EmailAddress.Text, tbPassword1.Text);
            }
            else
            {
                // Update the proposal
                conferenceProposalId = int.Parse(litConferenceProposalId.Text);
                conferenceProposalId = ConferenceBAL.UpdateConferenceProposal(conferenceProposalId, proposalType, 
                    topicAreaId, otherTopicArea, tbTitle.Text, tbDescription.Text, presentedOtherConferences1, 
                    presentedOtherConferences2, cbFlipChart.Checked, audioVisualOther);

                // Update the Submitter info
                int conferenceProposalSubmitterId = int.Parse(litConferenceProposalSubmitterId.Text);
                result = ConferenceBAL.UpdateConferenceProposalSubmitter(conferenceProposalSubmitterId, tbSpeaker1EmailAddress.Text, tbPassword1.Text);
            }

            // Insert the Speakers
            // 1st speaker always required
            string speakerMiddleInitial = Utility.GetCleanString(tbSpeaker1MiddleInitial.Text);
            string speakerAddress2 = Utility.GetCleanString(tbSpeaker1Address2.Text);
            string speakerZip = Utility.GetCleanString(tbSpeaker1Zip.Text);
            string speakerFax = Utility.GetCleanString(tbSpeaker1Fax.Text);
            string speakerOtherConferences = Utility.GetCleanString(tbSpeaker1OtherConferences.Text);

            int conferenceProposalSpeakerId = 0;
            if (!existingConferenceProposal)
            {
                conferenceProposalSpeakerId = ConferenceBAL.InsertConferenceProposalSpeaker(1, tbSpeaker1FirstName.Text, speakerMiddleInitial,
                    tbSpeaker1LastName.Text, tbSpeaker1Title.Text, tbSpeaker1Organization.Text, tbSpeaker1EmailAddress.Text, tbSpeaker1Address1.Text,
                    speakerAddress2, tbSpeaker1City.Text, int.Parse(ddlSpeaker1State.SelectedValue), int.Parse(ddlSpeaker1Country.SelectedValue), speakerZip,
                    tbSpeaker1Phone.Text, speakerFax, speakerOtherConferences, true, Convert.ToBoolean(int.Parse(rblSpeaker1ResponsibleForFees.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker1MustBePaidRegistrant.SelectedValue)));
            }
            else
            {
                conferenceProposalSpeakerId = int.Parse(litConferenceProposalSpeaker1Id.Text);
                conferenceProposalSpeakerId = ConferenceBAL.UpdateConferenceProposalSpeaker(conferenceProposalSpeakerId, tbSpeaker1FirstName.Text, speakerMiddleInitial,
                    tbSpeaker1LastName.Text, tbSpeaker1Title.Text, tbSpeaker1Organization.Text, tbSpeaker1EmailAddress.Text, tbSpeaker1Address1.Text,
                    speakerAddress2, tbSpeaker1City.Text, int.Parse(ddlSpeaker1State.SelectedValue), int.Parse(ddlSpeaker1Country.SelectedValue), speakerZip,
                    tbSpeaker1Phone.Text, speakerFax, speakerOtherConferences, true, Convert.ToBoolean(int.Parse(rblSpeaker1ResponsibleForFees.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker1MustBePaidRegistrant.SelectedValue)));
            }

            // Now insert into the ConferenceProposalsToConferenceProposalSpeakers table
            // Note: no need to update the link.
            if (!existingConferenceProposal)
            {
                result = ConferenceBAL.InsertConferenceProposalToConferenceProposalSpeakers(conferenceProposalId, conferenceProposalSpeakerId);
            }

            // Check the other speakers
            if (!String.IsNullOrEmpty(tbSpeaker2FirstName.Text) && !String.IsNullOrEmpty(tbSpeaker2LastName.Text))
            {
                // Insert #2 speaker
                speakerMiddleInitial = Utility.GetCleanString(tbSpeaker2MiddleInitial.Text);
                speakerAddress2 = Utility.GetCleanString(tbSpeaker2Address2.Text);
                speakerZip = Utility.GetCleanString(tbSpeaker2Zip.Text);
                speakerFax = Utility.GetCleanString(tbSpeaker2Fax.Text);
                speakerOtherConferences = Utility.GetCleanString(tbSpeaker2OtherConferences.Text);
                int? stateId = null;
                if (ddlSpeaker2State.SelectedIndex > 0)
                {
                    stateId = int.Parse(ddlSpeaker2State.SelectedValue);
                }

                int? countryId = null;
                if (ddlSpeaker2Country.SelectedIndex > 0)
                {
                    countryId = int.Parse(ddlSpeaker2Country.SelectedValue);
                }

                // Now insert into the ConferenceProposalsToConferenceProposalSpeakers table
                // Note: no need to update the link.
                if (!existingConferenceProposal)
                {
                    conferenceProposalSpeakerId = ConferenceBAL.InsertConferenceProposalSpeaker(2, tbSpeaker2FirstName.Text, speakerMiddleInitial,
                    tbSpeaker2LastName.Text, tbSpeaker2Title.Text, tbSpeaker2Organization.Text, tbSpeaker2EmailAddress.Text, tbSpeaker2Address1.Text,
                    speakerAddress2, tbSpeaker2City.Text, stateId, countryId, speakerZip, tbSpeaker2Phone.Text, speakerFax,
                    speakerOtherConferences, Convert.ToBoolean(int.Parse(rblSpeaker2SpeakerIsAware.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker2ResponsibleForFees.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker2MustBePaidRegistrant.SelectedValue)));

                    result = ConferenceBAL.InsertConferenceProposalToConferenceProposalSpeakers(conferenceProposalId, conferenceProposalSpeakerId);
                }
                else
                {
                    conferenceProposalSpeakerId = int.Parse(litConferenceProposalSpeaker2Id.Text);

                    conferenceProposalSpeakerId = ConferenceBAL.UpdateConferenceProposalSpeaker(conferenceProposalSpeakerId, tbSpeaker2FirstName.Text, speakerMiddleInitial,
                    tbSpeaker2LastName.Text, tbSpeaker2Title.Text, tbSpeaker2Organization.Text, tbSpeaker2EmailAddress.Text, tbSpeaker2Address1.Text,
                    speakerAddress2, tbSpeaker2City.Text, stateId, countryId, speakerZip, tbSpeaker2Phone.Text, speakerFax,
                    speakerOtherConferences, Convert.ToBoolean(int.Parse(rblSpeaker2SpeakerIsAware.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker2ResponsibleForFees.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker2MustBePaidRegistrant.SelectedValue)));
                }
            }
            if (!String.IsNullOrEmpty(tbSpeaker3FirstName.Text) && !String.IsNullOrEmpty(tbSpeaker3LastName.Text))
            {
                // Insert #3 speaker
                speakerMiddleInitial = Utility.GetCleanString(tbSpeaker3MiddleInitial.Text);
                speakerAddress2 = Utility.GetCleanString(tbSpeaker3Address2.Text);
                speakerZip = Utility.GetCleanString(tbSpeaker3Zip.Text);
                speakerFax = Utility.GetCleanString(tbSpeaker3Fax.Text);
                speakerOtherConferences = Utility.GetCleanString(tbSpeaker3OtherConferences.Text);
                int? stateId = null;
                if (ddlSpeaker3State.SelectedIndex > 0)
                {
                    stateId = int.Parse(ddlSpeaker3State.SelectedValue);
                }

                int? countryId = null;
                if (ddlSpeaker3Country.SelectedIndex > 0)
                {
                    countryId = int.Parse(ddlSpeaker3Country.SelectedValue);
                }

                // Now insert into the ConferenceProposalsToConferenceProposalSpeakers table
                // Note: no need to update the link.
                if (!existingConferenceProposal)
                {
                    conferenceProposalSpeakerId = ConferenceBAL.InsertConferenceProposalSpeaker(3, tbSpeaker3FirstName.Text, speakerMiddleInitial,
                    tbSpeaker3LastName.Text, tbSpeaker3Title.Text, tbSpeaker3Organization.Text, tbSpeaker3EmailAddress.Text, tbSpeaker3Address1.Text,
                    speakerAddress2, tbSpeaker3City.Text, stateId, countryId, speakerZip, tbSpeaker3Phone.Text, speakerFax,
                    speakerOtherConferences, Convert.ToBoolean(int.Parse(rblSpeaker3SpeakerIsAware.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker3ResponsibleForFees.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker3MustBePaidRegistrant.SelectedValue)));

                    result = ConferenceBAL.InsertConferenceProposalToConferenceProposalSpeakers(conferenceProposalId, conferenceProposalSpeakerId);
                }
                else
                {
                    conferenceProposalSpeakerId = int.Parse(litConferenceProposalSpeaker3Id.Text);

                    conferenceProposalSpeakerId = ConferenceBAL.InsertConferenceProposalSpeaker(conferenceProposalSpeakerId, tbSpeaker3FirstName.Text, speakerMiddleInitial,
                    tbSpeaker3LastName.Text, tbSpeaker3Title.Text, tbSpeaker3Organization.Text, tbSpeaker3EmailAddress.Text, tbSpeaker3Address1.Text,
                    speakerAddress2, tbSpeaker3City.Text, stateId, countryId, speakerZip, tbSpeaker3Phone.Text, speakerFax,
                    speakerOtherConferences, Convert.ToBoolean(int.Parse(rblSpeaker3SpeakerIsAware.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker3ResponsibleForFees.SelectedValue)),
                    Convert.ToBoolean(int.Parse(rblSpeaker3MustBePaidRegistrant.SelectedValue)));
                }
            }
        }

        private void BindData(int conferenceProposalId)
        {
            // Hold on to the existing conferenceId
            litConferenceProposalId.Text = conferenceProposalId.ToString();

            // Set the conference proposal items
            ConferencesDataset._tabs_ConferenceProposalsDataTable dtProposal = ConferenceBAL.GetConferenceProposal(conferenceProposalId);
            ConferencesDataset._tabs_ConferenceProposalsRow drProposal = dtProposal[0];

            // Set the proposal Type
            //TODO: CRAIG; Get script from Morrow for this
            //int proposalType = int.Parse(Request.Form["radioproposalType"]);

            // Set the topic area
            //TODO: Craig; Get script from Morrow for this
            //int topicAreaId = int.Parse(Request.Form["radioTopicArea"]);

            tbTitle.Text = drProposal.Title;
            tbDescription.Text = drProposal.Description;
            tbOtherTopicArea.Text = drProposal.TopicAreaOther;
            tbConference1.Text = drProposal.PresentedOtherConferences1;
            tbConference2.Text = drProposal.PresentedOtherConferences2;
            tbAudioVisualOther.Text = drProposal.AudioVisualOther;
            
            // Set the Submitter info
            ConferencesDataset._tabs_ConferenceProposalSubmittersDataTable dtSubmitter = ConferenceBAL.GetConferenceProposalSubmitterByConferenceProposalId(conferenceProposalId);
            ConferencesDataset._tabs_ConferenceProposalSubmittersRow drSubmitter = dtSubmitter[0];
            litConferenceProposalSubmitterId.Text = drSubmitter.ConferenceProposalSubmitterId.ToString(); 
            tbSpeaker1EmailAddress.Text = drSubmitter.EmailAddress;
            tbPassword1.Text = drSubmitter.Password;
            tbPassword2.Text = drSubmitter.Password;

            // Set the speakers
            ConferencesDataset._tabs_ConferenceProposalsToConferenceProposalSpeakersDataTable dtProposalsToSpeakers = ConferenceBAL.GetConferenceProposalsToConferenceProposalSpeakers(conferenceProposalId);
            ConferencesDataset._tabs_ConferenceProposalSpeakersDataTable dtProposalSpeaker = null;
            ConferencesDataset._tabs_ConferenceProposalSpeakersRow drProposalSpeaker = null;

            for(int i = 0; i < dtProposalsToSpeakers.Rows.Count; i++)
            {
                dtProposalSpeaker = ConferenceBAL.GetConferenceProposalSpeaker(int.Parse(dtProposalsToSpeakers[i]["conferenceProposalSpeakerId"].ToString()));
                drProposalSpeaker = dtProposalSpeaker[0];

                SchoolManagerClass smlogic = new SchoolManagerClass();
                SchoolManageDataset._tabs_statesDataTable dtStates = new SchoolManageDataset._tabs_statesDataTable();
                
                switch (drProposalSpeaker.SpeakerNumber)
                {
                    case 1:
                        litConferenceProposalSpeaker1Id.Text = drProposalSpeaker.ConferenceProposalSpeakerId.ToString();
                        tbSpeaker1FirstName.Text = drProposalSpeaker.FirstName;
                        tbSpeaker1MiddleInitial.Text = drProposalSpeaker.MiddileInitial;
                        tbSpeaker1LastName.Text = drProposalSpeaker.LastName;
                        tbSpeaker1Title.Text = drProposalSpeaker.Title;
                        tbSpeaker1Organization.Text = drProposalSpeaker.Organization;
                        tbSpeaker1EmailAddress.Text = drProposalSpeaker.EmailAddress;
                        tbSpeaker1Address1.Text = drProposalSpeaker.Address1;
                        tbSpeaker1Address2.Text = drProposalSpeaker.Address2;
                        tbSpeaker1City.Text = drProposalSpeaker.City;
                        ddlSpeaker1Country.ClearSelection();
                        ddlSpeaker1Country.SelectedIndex = (ddlSpeaker1Country.Items.IndexOf((ListItem)ddlSpeaker1Country.Items.FindByValue(drProposalSpeaker.CountryId.ToString())));

                        // Bind the states
                        // Populate the state/province based on the country selection
                        dtStates = smlogic.getStatesByCountryId(int.Parse(ddlSpeaker1Country.SelectedValue));
                        ddlSpeaker1State.DataSource = dtStates;

                        ddlSpeaker1State.DataBind();
                        ddlSpeaker1State.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                        ddlSpeaker1State.Enabled = true;

                        ddlSpeaker1State.ClearSelection();
                        ddlSpeaker1State.SelectedIndex = (ddlSpeaker1State.Items.IndexOf((ListItem)ddlSpeaker1State.Items.FindByValue(drProposalSpeaker.StateId.ToString())));
                        tbSpeaker1Zip.Text = drProposalSpeaker.Zipcode;
                        tbSpeaker1Phone.Text = drProposalSpeaker.Phone;
                        tbSpeaker1Fax.Text = drProposalSpeaker.Fax;
                        tbSpeaker1OtherConferences.Text = drProposalSpeaker.SpeakerOtherConferences;
                        rblSpeaker1ResponsibleForFees.SelectedIndex = rblSpeaker1ResponsibleForFees.Items.IndexOf((ListItem)rblSpeaker1ResponsibleForFees.Items.FindByValue((Convert.ToInt32(drProposalSpeaker.ObtainedFinancialSupport)).ToString()));
                        rblSpeaker1MustBePaidRegistrant.SelectedIndex = rblSpeaker1MustBePaidRegistrant.Items.IndexOf((ListItem)rblSpeaker1MustBePaidRegistrant.Items.FindByValue((Convert.ToInt32(drProposalSpeaker.AwareMustBePaidRegistrant)).ToString()));

                        break;

                    case 2:
                        litConferenceProposalSpeaker2Id.Text = drProposalSpeaker.ConferenceProposalSpeakerId.ToString(); 
                        tbSpeaker2FirstName.Text = drProposalSpeaker.FirstName;
                        tbSpeaker2MiddleInitial.Text = drProposalSpeaker.MiddileInitial;
                        tbSpeaker2LastName.Text = drProposalSpeaker.LastName;
                        tbSpeaker2Title.Text = drProposalSpeaker.Title;
                        tbSpeaker2Organization.Text = drProposalSpeaker.Organization;
                        tbSpeaker2EmailAddress.Text = drProposalSpeaker.EmailAddress;
                        tbSpeaker2Address1.Text = drProposalSpeaker.Address1;
                        tbSpeaker2Address2.Text = drProposalSpeaker.Address2;
                        tbSpeaker2City.Text = drProposalSpeaker.City;
                        try
                        {
                            ddlSpeaker2Country.ClearSelection();
                            ddlSpeaker2Country.SelectedIndex = (ddlSpeaker2Country.Items.IndexOf((ListItem)ddlSpeaker2Country.Items.FindByValue(drProposalSpeaker.CountryId.ToString())));
                        }
                        catch (System.Data.StrongTypingException)
                        {
                            ddlSpeaker2Country.ClearSelection();
                        }
                        
                        if(ddlSpeaker2Country.SelectedIndex > 0)
                        {
                            try
                            {
                                // Bind the states
                                // Populate the state/province based on the country selection
                                dtStates = smlogic.getStatesByCountryId(int.Parse(ddlSpeaker2Country.SelectedValue));
                                ddlSpeaker2State.DataSource = dtStates;

                                ddlSpeaker2State.DataBind();
                                ddlSpeaker2State.Items.Insert(0, new ListItem("-- Please Select --", "0"));
                                ddlSpeaker2State.Enabled = true;

                                ddlSpeaker2State.ClearSelection();
                                ddlSpeaker2State.SelectedIndex = (ddlSpeaker2State.Items.IndexOf((ListItem)ddlSpeaker2State.Items.FindByValue(drProposalSpeaker.StateId.ToString())));
                            }
                            catch (System.Data.StrongTypingException)
                            {
                                ddlSpeaker2State.ClearSelection();
                            }
                        }

                        tbSpeaker2Zip.Text = drProposalSpeaker.Zipcode;
                        tbSpeaker2Phone.Text = drProposalSpeaker.Phone;
                        tbSpeaker2Fax.Text = drProposalSpeaker.Fax;
                        tbSpeaker2OtherConferences.Text = drProposalSpeaker.SpeakerOtherConferences;
                        rblSpeaker2ResponsibleForFees.SelectedIndex = rblSpeaker2ResponsibleForFees.Items.IndexOf((ListItem)rblSpeaker2ResponsibleForFees.Items.FindByValue((Convert.ToInt32(drProposalSpeaker.ObtainedFinancialSupport)).ToString()));
                        rblSpeaker2MustBePaidRegistrant.SelectedIndex = rblSpeaker2MustBePaidRegistrant.Items.IndexOf((ListItem)rblSpeaker2MustBePaidRegistrant.Items.FindByValue((Convert.ToInt32(drProposalSpeaker.AwareMustBePaidRegistrant)).ToString()));

                        break;

                    case 3:
                        litConferenceProposalSpeaker3Id.Text = drProposalSpeaker.ConferenceProposalSpeakerId.ToString(); 
                        tbSpeaker3FirstName.Text = drProposalSpeaker.FirstName;
                        tbSpeaker3MiddleInitial.Text = drProposalSpeaker.MiddileInitial;
                        tbSpeaker3LastName.Text = drProposalSpeaker.LastName;
                        tbSpeaker3Title.Text = drProposalSpeaker.Title;
                        tbSpeaker3Organization.Text = drProposalSpeaker.Organization;
                        tbSpeaker3EmailAddress.Text = drProposalSpeaker.EmailAddress;
                        tbSpeaker3Address1.Text = drProposalSpeaker.Address1;
                        tbSpeaker3Address2.Text = drProposalSpeaker.Address2;
                        tbSpeaker3City.Text = drProposalSpeaker.City;
                        try
                        {
                            ddlSpeaker3Country.ClearSelection();
                            ddlSpeaker3Country.SelectedIndex = (ddlSpeaker3Country.Items.IndexOf((ListItem)ddlSpeaker3Country.Items.FindByValue(drProposalSpeaker.CountryId.ToString())));
                        }
                        catch (System.Data.StrongTypingException)
                        {
                            ddlSpeaker3Country.ClearSelection();
                        }

                        if(ddlSpeaker3Country.SelectedIndex > 0)
                        {
                            try
                            {
                                // Bind the states
                                // Populate the state/province based on the country selection
                                dtStates = smlogic.getStatesByCountryId(int.Parse(ddlSpeaker3Country.SelectedValue));
                                ddlSpeaker3State.DataSource = dtStates;

                                ddlSpeaker3State.DataBind();
                                ddlSpeaker3State.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                                ddlSpeaker3State.Enabled = true;

                                ddlSpeaker3State.ClearSelection();
                                ddlSpeaker3State.SelectedIndex = (ddlSpeaker3State.Items.IndexOf((ListItem)ddlSpeaker3State.Items.FindByValue(drProposalSpeaker.StateId.ToString())));
                            }
                            catch (System.Data.StrongTypingException)
                            {
                                ddlSpeaker3State.ClearSelection();
                            }
                        }

                        tbSpeaker3Zip.Text = drProposalSpeaker.Zipcode;
                        tbSpeaker3Phone.Text = drProposalSpeaker.Phone;
                        tbSpeaker3Fax.Text = drProposalSpeaker.Fax;
                        tbSpeaker3OtherConferences.Text = drProposalSpeaker.SpeakerOtherConferences;
                        rblSpeaker3ResponsibleForFees.SelectedIndex = rblSpeaker3ResponsibleForFees.Items.IndexOf((ListItem)rblSpeaker3ResponsibleForFees.Items.FindByValue((Convert.ToInt32(drProposalSpeaker.ObtainedFinancialSupport)).ToString()));
                        rblSpeaker3MustBePaidRegistrant.SelectedIndex = rblSpeaker3MustBePaidRegistrant.Items.IndexOf((ListItem)rblSpeaker3MustBePaidRegistrant.Items.FindByValue((Convert.ToInt32(drProposalSpeaker.AwareMustBePaidRegistrant)).ToString()));

                        break;
                }
            }
        }

        private void SendEmail()
        {
            InfrastructureClass infrastructure = new InfrastructureClass();

            List<string> to = new List<string>();
            List<string> cc = new List<string>();
            List<string> bc = new List<string>();

            to.Add(tbSpeaker1EmailAddress.Text);

            string from = System.Configuration.ConfigurationManager.AppSettings["fromEmailAddress"].ToString();

            StringBuilder sb = new StringBuilder();
            sb.Append("Dear ").Append(tbSpeaker1FirstName.Text).Append(" ").Append(tbSpeaker1LastName.Text).Append(",").Append("<br/><br/>");
            sb.Append("Hi! We received your conference proposal! Thank you for your submission. We are currently reviewing proposals and are looking forward to another great conference this year. Remember, you can log in to the conference website at any time to edit your proposal before the proposal closing date.<br/><br/>");
            sb.Append("For now, best wishes for a wonderful week! <br/><br/>");
            sb.Append("Thank you, <br/><br/>");
            sb.Append("The TABS Staff");

            infrastructure.SendEmail(from, to, cc, bc, "TABS Conference Proposal Received", sb.ToString(), true);
        }

        #endregion
    }
}