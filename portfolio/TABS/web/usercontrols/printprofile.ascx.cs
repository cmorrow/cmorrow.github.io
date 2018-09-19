using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TABS_UserControls.resources.code.BAL;
using TABS_UserControls.resources.code.DAL;
using System.Data;

namespace TABS_UserControls.usercontrols
{
    public partial class printprofile : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private SchoolClass SchoolBAL = new SchoolClass();
        private tabs_admin AdminBAL = new tabs_admin();
        private int schoolId;

        #endregion

        #region Event Handlers

        protected void Page_Init(object sender, EventArgs e)
        {
            try { schoolId = Convert.ToInt16(Request.QueryString["schoolid"]); }
            catch { schoolId = 0; }

            //schoolId = 1149;
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (schoolId > 0) {
                    rptPrintSchoolProfile.DataSource = SchoolBAL.getSchoolBySchoolID(schoolId);
                    rptPrintSchoolProfile.DataBind();

                    SchoolDataset._tabs_glanceDataTable dtGlance = SchoolBAL.getGlanceBySchoolID(schoolId);

                    rptAtAGlance.DataSource = dtGlance;
                    rptAtAGlance.DataBind();

                    BindOtherFields(ref dtGlance);
                }
            }
        }

        protected void rptPrintSchoolProfile_ItemDataBound1(object sender, RepeaterItemEventArgs e)
        {
            Image img = (Image)e.Item.FindControl("imgLogo");
            img.ImageUrl = "/binary-image.aspx?schoolid=" + schoolId + "&section=logo";

            Image imgGlance = (Image)e.Item.FindControl("imgGlance");
            imgGlance.ImageUrl = "/binary-image.aspx?section=glance&schoolid=" + schoolId;
            
            bool display = this.DisplayImages("glance");
            if (display == false) 
            {
                imgGlance.Style.Add("visibility", "hidden");
            }
            
            // Fill Types
            Literal litSchoolType = (Literal)e.Item.FindControl("litSchoolType");

            SchoolDataset._tabs_schoolsRow row = SchoolBAL.getSchoolBySchoolID(schoolId)[0];

            string type = "";

            if (row.allboys)
            {
                type += "All Boys";
            }
            else
            {
                if (row.allgirls)
                {
                    type += "All Girls";
                }
                else
                {
                    if (row.coed)
                    {
                        type += "Co-Ed";
                    }
                }
            }
            //if (row.junior)
            //{
            //    type += ", Junior";
            //}
            //if (row.kindergarten)
            //{
            //    type += ", Kindergarten";
            //}
            //if (row.secondary)
            //{
            //    type += ", Secondary";
            //}
            //if (row.military)
            //{
            //    type += ", Military";
            //}

            // Set Religion
            SchoolDataset._tabs_glanceDataTable dtGlance = SchoolBAL.getGlanceBySchoolID(schoolId);
            type += ", " + dtGlance[0].religion;

            litSchoolType.Text = type;
        }

        #endregion

        #region Methods

        public void BindOtherFields(ref SchoolDataset._tabs_glanceDataTable dtGlance)
        {
            // Get the Academics table
            SchoolDataset._tabs_academicsDataTable dtAcademics = SchoolBAL.getAcademicBySchoolID(schoolId);

            // Get the Dress code
            SchoolDataset._tabs_campuslifesDataTable dtCampusLife = SchoolBAL.getCampusLifeBySchoolID(schoolId);

            // Get the headmaster
            tabs_admin_dataset._tabs_headmastersDataTable dtHeadmaster = AdminBAL.getHeadmasterBySchoolID(schoolId);

            // Get the accreditations
            string accreditations = string.Empty;
            
            try
            {
                accreditations = dtGlance[0].accredit1;
                if (!String.IsNullOrEmpty(dtGlance[0].accredit2))
                {
                    accreditations += ", " + dtGlance[0].accredit2;
                }
            }
            catch (Exception)
            {
            }

            litClassSize.Text = dtAcademics[0].classsize.ToString();
            litStudentTeacherRatio.Text = dtAcademics[0].studentteacherratio;
            object oValue = dtCampusLife[0].dresscode;
            if (oValue is System.DBNull)
                litDressCode.Text = "N/A";
            else
                litDressCode.Text = dtCampusLife[0].dresscode;
            lit7DayTuition.Text = String.IsNullOrEmpty(dtGlance[0]._7daytuition) ? "NA" : DBToMoney(dtGlance[0]._7daytuition);
            lit5DayTuition.Text = String.IsNullOrEmpty(dtGlance[0]._5daytuition) ? "NA" : DBToMoney(dtGlance[0]._5daytuition);
            litDayTuition.Text = String.IsNullOrEmpty(dtGlance[0].daytuition) ? "NA" : DBToMoney(dtGlance[0].daytuition);
            litAdmissionDeadline.Text = dtGlance[0].admissiondate.ToShortDateString();
            litHeadmaster.Text = dtHeadmaster[0].firstname + " " + dtHeadmaster[0].lastname;
            litAccreditations.Text = accreditations;
            litESL.Text = dtAcademics[0].sp_esla == true ? "Offered" : "Not Offered";
            litAdvancedPlacement.Text = dtAcademics[0].adv_ap == true ? "Offered" : "Not Offered";
            litInternationalBaccalureate.Text = dtAcademics[0].adv_bacca == true ? "Offered" : "Not Offered";
            litPostGraduateStudy.Text = dtAcademics[0].adv_postgrad == true ? "Offered" : "Not Offered";
            litSummerPrograms.Text = dtAcademics[0].summer > 0 ? "Offered" : "Not Offered";
            litAcceptsTabsAdmission.Text = dtGlance[0].tabapplication > 0 ? "Yes" : "No";
            litPaymentsPlans.Text = dtGlance[0].paymentplan > 0 ? "Offered" : "Not Offered";
            litNeedBasedAid.Text = dtGlance[0].needaid > 0 ? "Offered" : "Not Offered";
            litMeritScholarships.Text = dtGlance[0].merit > 0 ? "Offered" : "Not Offered"; 
        }

        protected bool DisplayImages(string imgType)
        {
            bool retVal = true;
            switch (imgType)
            {
                case "glance":
                    if (DBNull.Value.Equals(SchoolBAL.getGlanceBySchoolID(schoolId)[0].image) == true || SchoolBAL.getGlanceBySchoolID(schoolId)[0].image == null)
                    {
                        retVal = false;
                    }
                    break;

                default:
                    break;
            }

            return retVal;
        }

        public string DBToMoney(string val) {
            if (val.Contains("N/A") || val.Contains("NA")) {
                return val;
            }
            if (val.Contains("$")) {
                val = val.Replace("$", "");
            }

            try {
                Decimal dec = Convert.ToDecimal(val);
                string retVal = dec.ToString();
                if (!retVal.Contains("$")) {
                    return "$" + retVal;
                } else { return retVal; }
            } catch {
                return val;
            }
        }

        public string DBToDate(string val) {
            DateTime dt = Convert.ToDateTime(val);
            return dt.ToShortDateString();
        }

        public string DBToPercentage(string val) {
            if (val.Contains("%")) {
                val = val.Replace("%", "");
            }

            return String.Format("{0:0%}", val);

        }


        #endregion

        
    }
}