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
    public partial class proposal_management : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private ConferenceClass ConferenceBAL = new ConferenceClass();
        private Encryption64 EncryptionBAL = new Encryption64();

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                mvProposalManagement.SetActiveView(vLogin);
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Verify the user's info
            ConferencesDataset._tabs_ConferenceProposalSubmittersDataTable dt = ConferenceBAL.GetConferenceProposalSubmitter(tbEmailAddress.Text, tbPassword.Text);

            if (dt.Rows.Count > 0)
            {
                // Show user's proposals
                gridProposals.DataSource = dt;
                gridProposals.DataBind();

                mvProposalManagement.SetActiveView(vProposals);
            }
        }

        protected void lbLogOut_Click(object sender, EventArgs e)
        {
            tbEmailAddress.Text = string.Empty;
            tbPassword.Text = string.Empty;

            mvProposalManagement.SetActiveView(vLogin);
        }

        protected void gridProposals_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e)
        {
            if (e.Row.RowType == Obout.Grid.GridRowType.DataRow)
            {
                // Get the ConferenceProposalId
                int conferenceProposalId = int.Parse(((DataRowView)e.Row.DataItem)["ConferenceProposalId"].ToString());

                // Get the title
                ConferencesDataset._tabs_ConferenceProposalsDataTable dt =  ConferenceBAL.GetConferenceProposal(conferenceProposalId);

                HyperLink hlProposalTitle = (HyperLink)e.Row.Cells[0].FindControl("hlProposalTitle");

                hlProposalTitle.Text = dt[0].Title;
                hlProposalTitle.NavigateUrl += EncryptionBAL.Encrypt(conferenceProposalId.ToString(), "secretTABS");
            }
        }

        #endregion

        

        #region Methods


        #endregion
        
    }
}