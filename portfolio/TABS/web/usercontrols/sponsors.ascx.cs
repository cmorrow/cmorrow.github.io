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

namespace TABS_UserControls.usercontrols {
    public partial class sponsors : System.Web.UI.UserControl {
        SponsorshipClass _sponsors = new SponsorshipClass();

        protected void Page_Load(object sender, EventArgs e) {
            if (!Page.IsPostBack) {
                sigcorpsponsorRep.DataSource = _sponsors.GetAllSponsorshipByType(1);
                sigcorpsponsorRep.DataBind();
                if (sigcorpsponsorRep.Items.Count > 0) {
                    sigcorpsponsorRep.Visible = true;
                    sighead.Visible = true;
                } else {
                    sighead.Visible = false;
                    sigcorpsponsorRep.Visible = false;
                }

                redcorpsponsorRep.DataSource = _sponsors.GetAllSponsorshipByType(2);
                redcorpsponsorRep.DataBind();
                if (redcorpsponsorRep.Items.Count > 0) {
                    redcorpsponsorRep.Visible = true;
                    redhead.Visible = true;
                } else {
                    redcorpsponsorRep.Visible = false;
                    redhead.Visible = false;
                }
            }

            this.Page.Title = "Boarding School Sponsors - The Association of Boarding Schools - TABS";
        }

        public string IsNull(string input) {
            if (Convert.IsDBNull(input)) {
                return "";
            } else {
                return "ext: " + input;
            }
        }

        protected void showBtn_Click(object sender, EventArgs e) 
        {
            sigcorpsponsorRep.DataSource = _sponsors.GetAllSponsorshipByType(1);
            sigcorpsponsorRep.DataBind();
            if (sigcorpsponsorRep.Items.Count > 0) {
                sigcorpsponsorRep.Visible = true;
                sighead.Visible = true;
            } else {
                sighead.Visible = false;
                sigcorpsponsorRep.Visible = false;
            }

            redcorpsponsorRep.DataSource = _sponsors.GetAllSponsorshipByType(2);
            redcorpsponsorRep.DataBind();
            if (redcorpsponsorRep.Items.Count > 0) {
                redcorpsponsorRep.Visible = true;
                redhead.Visible = true;
            } else {
                redcorpsponsorRep.Visible = false;
                redhead.Visible = false;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e) {
            sigcorpsponsorRep.DataSource = _sponsors.GetSignatureSponsorshipByKeyword(txtSearchBox.Text);
            sigcorpsponsorRep.DataBind();
            if (sigcorpsponsorRep.Items.Count > 0) {
                sigcorpsponsorRep.Visible = true;
                sighead.Visible = true;
            } else {
                sighead.Visible = false;
                sigcorpsponsorRep.Visible = false;
            }

            redcorpsponsorRep.DataSource = _sponsors.GetRedSponsorshipByKeyword(txtSearchBox.Text);
            redcorpsponsorRep.DataBind();
            if (redcorpsponsorRep.Items.Count > 0) {
                redcorpsponsorRep.Visible = true;
                redhead.Visible = true;
            } else {
                redcorpsponsorRep.Visible = false;
                redhead.Visible = false;
            }
        }
    }
}
