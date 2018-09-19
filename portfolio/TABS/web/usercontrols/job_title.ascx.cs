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
    public partial class job_title : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private JobClass JobBAL = new JobClass();
        private SchoolClass SchoolBAL = new SchoolClass();
        private tabs_admin TabsAdminBAL = new tabs_admin();

        private enum ApplyMethod
        {
            RegularMail = 1,
            Fax = 2,
            Email = 3,
            Online = 4

        }

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["jobId"]))
                {
                    int jobId = 0;
                    bool successful = int.TryParse(Request.QueryString["jobId"], out jobId);

                    if (jobId > 0)
                    {
                        JobsDataset._tabs_JobsDataTable dt = JobBAL.GetJob(jobId);

                        if (dt.Rows.Count > 0)
                        {
                            BindJobData(ref dt);
                        }
                    }
                }
            }
        }

        #endregion

        #region Methods

        private void BindJobData(ref JobsDataset._tabs_JobsDataTable dt)
        {
            JobsDataset._tabs_JobsRow dr = (JobsDataset._tabs_JobsRow)dt[0];

            int jobId = dr.JobId;

            litJobTitle.Text = dr["JobTitle"] != DBNull.Value ? dr.JobTitle : string.Empty;
            litStartDate.Text = dr["JobStartDate"] != DBNull.Value ? dr.JobStartDate.ToShortDateString() : string.Empty;
            litRequirements.Text = dr["JobRequirements"] != DBNull.Value ? dr.JobRequirements : string.Empty;
            litSpecificInstructions.Text = dr["SpecificInstructions"] != DBNull.Value ? dr.SpecificInstructions : string.Empty;
            litJobDescription.Text = dr["JobDescription"] != DBNull.Value ? dr.JobDescription : string.Empty;

            if (dr.HideContactName && dr.HideContactEmail)
            {
                divContactInformation.Visible = false;
            }
            else
            {
                divContactInformation.Visible = true;

                if (!dr.HideContactName)
                {
                    litContactName.Text += dr.ContactName;
                }

                if (!dr.HideContactEmail)
                {
                    litContactEmail.Text += dr.ContactEmail;
                }
            }

            litSalary.Text = dr["JobSalary"] != DBNull.Value ? dr.JobSalary : string.Empty;
            litCategory.Text = dr["JobCategory"] != DBNull.Value ? dr.JobCategory : string.Empty;
            litPostingExpires.Text = dr["ExpirationDate"] != DBNull.Value ? dr.ExpirationDate.ToShortDateString() : string.Empty;

            // Job Types
            JobsDataset._tabs_JobsToJobTypesDataTable dtJobsToJobTypes = JobBAL.GetJobsToJobTypes(jobId);
            JobsDataset._tabs_JobTypesDataTable dtJobTypes = new JobsDataset._tabs_JobTypesDataTable();

            for(int i = 0; i < dtJobsToJobTypes.Rows.Count; i++)
            {
                dtJobTypes = JobBAL.GetJobType(dtJobsToJobTypes[i].JobTypeId);
                if (!litJobAndCalendarTypes.Text.Length.Equals(0))
                {
                    litJobAndCalendarTypes.Text += ", ";
                }
                litJobAndCalendarTypes.Text += dtJobTypes[0].JobType;
            }

            // Calendar Types
            JobsDataset._tabs_JobsToCalendarYearTypesDataTable dtJobsToCalendarYearTypes = JobBAL.GetJobsToCalendarYearTypes(jobId);
            JobsDataset._tabs_CalendarYearTypesDataTable dtCalendarYearTypes = new JobsDataset._tabs_CalendarYearTypesDataTable();
            
            for (int j = 0; j < dtJobsToCalendarYearTypes.Rows.Count; j++)
            {
                dtCalendarYearTypes = JobBAL.GetCalendarYearType(dtJobsToCalendarYearTypes[j].CalendarYearTypeId);
                if (!litJobAndCalendarTypes.Text.Length.Equals(0))
                {
                    litJobAndCalendarTypes.Text += ", ";
                }
                litJobAndCalendarTypes.Text += dtCalendarYearTypes[0].CalendarYearType;
            }

            // Benefits
            JobsDataset._tabs_JobsToJobBenefitsDataTable dtJobsToJobBenefits = JobBAL.GetJobsToJobBenefits(jobId);
            JobsDataset._tabs_JobBenefitsDataTable dtJobBenefits = new JobsDataset._tabs_JobBenefitsDataTable();

            for (int k = 0; k < dtJobsToJobBenefits.Rows.Count; k++)
            {
                dtJobBenefits = JobBAL.GetJobBenefit(dtJobsToJobBenefits[k].JobBenefitId);
                litBenefits.Text += dtJobBenefits[0].Description;
            }

            // Get School Info
            SchoolDataset._tabs_schoolsDataTable dtSchool = SchoolBAL.getSchoolBySchoolID(dr.SchoolId);
            SchoolDataset._tabs_schoolsRow drSchool = (SchoolDataset._tabs_schoolsRow)dtSchool[0];

            if (dr.HideSchool)
            {
                litEmployer.Text = "Not Listed";
                divEmployerInformation.Visible = false;
            }
            else
            {
                litEmployer.Text = drSchool.schoolname;
                litSchoolName.Text = drSchool.schoolname;
                litSchoolAddress1.Text = drSchool.address1;
                litSchoolAddress2.Text = drSchool.address2;
                if (litSchoolAddress2.Text.Length > 0)
                {
                    litSchoolAddress2.Text += "<br />";
                }

                litSchoolCity.Text = drSchool.city;
                litSchoolState.Text = drSchool.state;
                litSchoolZip.Text = drSchool.zip;
                litSchoolCountry.Text = drSchool.country;
                litLocation.Text = drSchool.city + " " + drSchool.state + ", " + drSchool.country;
            }

            // Get Application info
            JobsDataset._tabs_JobsToJobApplyMethodsDataTable dtJobsToJobApplyMethods = JobBAL.GetJobsToJobApplyMethods(jobId);
            JobsDataset._tabs_JobApplyMethodsDataTable dtJobApplyMethods = new JobsDataset._tabs_JobApplyMethodsDataTable();
            JobsDataset._tabs_JobContactInformationDataTable dtJobContactInformation = new JobsDataset._tabs_JobContactInformationDataTable();
            JobsDataset._tabs_JobContactInformationRow drContactInfo = null;


            for (int l = 0; l < dtJobsToJobApplyMethods.Rows.Count; l++)
            {
                dtJobApplyMethods = JobBAL.GetJobApplyMethod(dtJobsToJobApplyMethods[l].JobApplyMethodId);
                dtJobContactInformation = JobBAL.GetJobContactInformation(dtJobsToJobApplyMethods[l].JobsToJobApplyMethodId);

                drContactInfo = dtJobContactInformation[0];

                switch(dtJobApplyMethods[0].JobApplyMethodId)
                {
                    case (int)ApplyMethod.RegularMail:
                        divRegularMail.Visible = true;

                        litRegularMailAttn.Text = drContactInfo.ContactName;
                        litRegularMailAddress1.Text = drContactInfo.StreetAddress1;
                        litRegularMailAddress2.Text = drContactInfo.StreetAddress2;
                        if (litRegularMailAddress2.Text.Length > 0)
                        {
                            litRegularMailAddress2.Text += "<br />";
                        }
                        litRegularMailCity.Text = drContactInfo.City;

                        if (!drContactInfo["StateId"].Equals(DBNull.Value))
                        {
                            litRegularMailState.Text = TabsAdminBAL.GetState(drContactInfo.StateId)[0].state;
                        }
                        litRegularMailZip.Text = drContactInfo.Zipcode;
                        if (!drContactInfo["CountryId"].Equals(DBNull.Value))
                        {
                            litRegularMailCountry.Text = TabsAdminBAL.GetCountryByCountryId(drContactInfo.CountryId)[0].country;
                        }
                        break;

                    case (int)ApplyMethod.Fax:
                        divFax.Visible = true;

                        litFaxAttn.Text = drContactInfo.ContactName;
                        litFaxNum.Text = drContactInfo.FaxNumber;

                        break;

                    case (int)ApplyMethod.Email:
                        divEmail.Visible = true;

                        litEmailContact.Text = drContactInfo.ContactName;
                        litEmailEmail.Text = drContactInfo.EmailAddress;
                        litEmailEmailText.Text = drContactInfo.EmailAddress;

                        break;

                    case (int)ApplyMethod.Online:
                        divOnline.Visible = true;

                        litURL.Text = drContactInfo.URL;
                        litURLText.Text = drContactInfo.URL;

                        break;

                }
            }
        }

        #endregion
    }
}