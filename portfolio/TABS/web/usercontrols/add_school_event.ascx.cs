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
    public partial class add_school_event : System.Web.UI.UserControl
    {
        int eventid, schoolid, userid;
        EventClass eventlogic = new EventClass();
        UserClass userlogic = new UserClass();
        SchoolManagerClass manage = new SchoolManagerClass();
        private TABS_UserControls.resources.code.BAL.tabs_admin adminlogic = new TABS_UserControls.resources.code.BAL.tabs_admin();

        protected void Page_Init(object sender, EventArgs e) {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            try { schoolid = userlogic.getSchoolByUserId(userid)[0].schoolid; } catch { schoolid = 0; }
            try { eventid = Convert.ToInt16(Request.QueryString["id"]); } catch { eventid = 0; }
                        
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                ddlCountry.DataSource = adminlogic.getCountry();
                ddlCountry.DataBind();
                ddlCountry.Items.FindByText("USA").Selected = true;
                ddlState.DataSource = manage.getStatesByCountryId(Convert.ToInt16(ddlCountry.SelectedItem.Value));
                ddlState.DataBind();

                if (eventid > 0) {
                    DataTable dt = eventlogic.getProfileEventByEventId(eventid);
                    txtAdd1.Text = dt.Rows[0]["address1"].ToString();
                    txtAdd2.Text = dt.Rows[0]["address2"].ToString();
                    txtCity.Text = dt.Rows[0]["city"].ToString();
                    txtDesc.Text = dt.Rows[0]["longdescription"].ToString();
                    txtEnd.Text = dt.Rows[0]["enddate"].ToString();
                    txtEventName.Text = dt.Rows[0]["profileevent"].ToString();
                    txtLoc.Text = dt.Rows[0]["location"].ToString();
                    txtPerson.Text = dt.Rows[0]["contact"].ToString();
                    txtPhone.Text = dt.Rows[0]["phone"].ToString();
                    txtStart.Text = dt.Rows[0]["startdate"].ToString();
                    txtSummary.Text = dt.Rows[0]["shortdescription"].ToString();
                    txtUrl.Text = dt.Rows[0]["url"].ToString();
                    string temp = dt.Rows[0]["countryid"].ToString();
                    ddlCountry.Items.FindByValue(temp).Selected = true;
                    ddlState.Items.FindByValue(dt.Rows[0]["stateid"].ToString()).Selected = true;
                    ddlEventType.Items.FindByValue(dt.Rows[0]["profileeventtypeid"].ToString()).Selected = true;
                }
            }

        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e) {
            ddlState.DataSource = manage.getStatesByCountryId(int.Parse(ddlCountry.SelectedValue));
            ddlState.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e) 
        {
            DateTime endDate = DateTime.MinValue;
            if (txtEnd.Text.Length > 0) {
                endDate = Convert.ToDateTime(txtEnd.Text);

            } 
            if (eventid > 0) 
            {
                eventlogic.updateProfileEvent(txtEventName.Text, Convert.ToInt16(ddlEventType.SelectedValue), Convert.ToDateTime(txtStart.Text), 
                    endDate, txtLoc.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt16(ddlCountry.SelectedValue), 
                    Convert.ToInt16(ddlState.SelectedValue), txtPerson.Text, txtPhone.Text, txtUrl.Text, txtSummary.Text, txtDesc.Text, 
                    eventid);
            } 
            else 
            {
                eventlogic.addProfileEvent(txtEventName.Text, Convert.ToInt16(ddlEventType.SelectedValue), Convert.ToDateTime(txtStart.Text), 
                    Convert.ToDateTime(txtEnd.Text), txtLoc.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, 
                    Convert.ToInt16(ddlCountry.SelectedValue), Convert.ToInt16(ddlState.SelectedValue), txtPerson.Text, 
                    txtPhone.Text, txtUrl.Text, txtSummary.Text, txtDesc.Text, schoolid);
            }

            Response.Redirect("/for-schools/edit-school-profile.aspx");

        }

        protected void btnCancel_Click(object sender, EventArgs e) {
            Response.Redirect("/for-schools/edit-school-profile.aspx");

        }
    }
}