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
    public partial class become_member : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.tabs_admin adminlogic = new TABS_UserControls.resources.code.BAL.tabs_admin();
        private TABS_UserControls.resources.code.BAL.InquiryClass inquiryclass = new TABS_UserControls.resources.code.BAL.InquiryClass();
        SchoolManagerClass state = new SchoolManagerClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            // server-side binding
            buttonSave.Click += new EventHandler(buttonSave_Click);
            if (!Page.IsPostBack)
            {
                dropCountry.DataSource = adminlogic.getCountry();
                dropCountry.DataBind();
                dropCountry.Items.FindByText("United States").Selected = true;

                dropState.Items.Clear();
                dropState.DataSource = state.getStatesByCountryId(Convert.ToInt32(dropCountry.SelectedValue));
                dropState.DataBind();
                dropState.Enabled = true;


                dropInquiryTypes.DataSource = inquiryclass.getInquiryTypes();
                dropInquiryTypes.DataBind();
            }
        }

        void buttonSave_Click(object sender, EventArgs e)
        {
            int val = inquiryclass.addInquiry(textSchool.Text, textCity.Text, Convert.ToInt16(dropCountry.SelectedValue), Convert.ToInt16(dropState.SelectedValue), textContact.Text, textPhone.Text, textExt.Text, textTitle.Text, textEmail.Text, Convert.ToInt16(dropInquiryTypes.SelectedValue), Convert.ToInt16(radioNonProfit.SelectedValue), Convert.ToInt16(radioPrep.SelectedValue), textComment.Text);

            if (val > 0) Response.Redirect("/for-schools/overview/join-tabs/become-a-member/member-confirmation.aspx");


        }

        protected void dropCountry_SelectedIndexChanged(object sender, EventArgs e) 
        {
            dropState.Items.Clear();
            dropState.DataSource = state.getStatesByCountryId(Convert.ToInt32(dropCountry.SelectedValue));
            dropState.DataBind();
            dropState.Enabled = true;
        }
    }
}