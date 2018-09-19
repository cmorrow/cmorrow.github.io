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
using System.Data.SqlTypes;
using TABS_UserControls.resources.code.DAL;

namespace TABS_UserControls.usercontrols {
    public partial class postedit_jobs : System.Web.UI.UserControl {
        UserClass userlogic = new UserClass();
        SchoolClass schoologic = new SchoolClass();
        ProfileClass profilelogic = new ProfileClass();
        SchoolManagerClass manage = new SchoolManagerClass();
        tabs_admin adminlogic = new tabs_admin();
        JobClass joblogic = new JobClass();

        int jobid, userid, schoolid;

        protected void Page_Init(object sender, EventArgs e) {
            try { jobid = Convert.ToInt32(Request.QueryString["job"]); } catch { jobid = 0; }
            try { userid = Convert.ToInt32(Session["userid"].ToString()); } catch { userid = 0; }
            try { schoolid = userlogic.getSchoolByUserId(userid)[0].schoolid; } catch { schoolid = 0; }

            // debug
            //jobid = 8;
            //userid = 1;
            //schoolid = 1069;
        }

        protected void Page_Load(object sender, EventArgs e) 
        {
            if (jobid != 0) 
            {
                // This is a Existing
                if (!Page.IsPostBack) {
                    ddlCountry.DataSource = adminlogic.getCountry();
                    ddlCountry.DataBind();
                    ddlCountry.Items.FindByText("USA").Selected = true;
                    ddlState.DataSource = manage.getStatesByCountryId(Convert.ToInt16(ddlCountry.SelectedValue));
                    ddlState.DataBind();
                    ddlSchool.DataSource = schoologic.getSchools();
                    ddlSchool.DataBind();
                    chxListJob.DataSource = joblogic.getJobTypes();
                    chxListJob.DataBind();
                    rdoCalendar.DataSource = joblogic.GetCalendarYearTypes();
                    rdoCalendar.DataBind();
                    this.DisplayExistingJob(jobid);
                }
            } 
            else 
            {
                // This is a new Job
                if (!Page.IsPostBack) 
                {
                    ddlCountry.DataSource = adminlogic.getCountry();
                    ddlCountry.DataBind();
                    ddlCountry.Items.FindByText("USA").Selected = true;
                    ddlState.DataSource = manage.getStatesByCountryId(Convert.ToInt16(ddlCountry.SelectedValue));
                    ddlState.DataBind();
                    ddlSchool.DataSource = schoologic.getSchools();
                    ddlSchool.DataBind();
                    chxListJob.DataSource = joblogic.getJobTypes();
                    chxListJob.DataBind();
                    rdoCalendar.DataSource = joblogic.GetCalendarYearTypes();
                    rdoCalendar.DataBind();
                    ddlCategory.DataSource = joblogic.GetJobCategories();
                    ddlCategory.DataBind();
                    ddlSalary.DataSource = joblogic.GetJobSalaries();
                    ddlSalary.DataBind();
                    chxBenefits.DataSource = joblogic.getBenefits();
                    chxBenefits.DataBind();
                }
            }
        }

        protected void DisplayExistingJob(int jobid) 
        {
            TABS_UserControls.resources.code.DAL.JobsDataset._tabs_JobsRow row = joblogic.getSchoolJobByJobId(jobid)[0];
            postDate.Text = row.PostingDate.ToString();
            expireDate.Text = row.ExpirationDate.ToString();
            jobtitle.Text = row.JobTitle.ToString();
            ddlSchool.Items.FindByValue(row.SchoolId.ToString()).Selected = true;
            txtPerson.Text = row.ContactName.ToString();
            txtEmail.Text = row.ContactEmail.ToString();
            chxHideEmail.Checked = row.HideContactEmail;
            chxHidePerson.Checked = row.HideContactName;
            chxHideSchool.Checked = row.HideSchool;

            DataTable jobTypes = joblogic.getJobTypesByJobId(jobid);
            foreach (DataRow dr in jobTypes.Rows) 
            {
                chxListJob.Items.FindByValue(dr["JobTypeId"].ToString()).Selected = true;
            }

            DataTable jobCal = joblogic.getCalendarYearsByJobId(jobid);
            foreach (DataRow dr2 in jobCal.Rows) {
                rdoCalendar.Items.FindByValue(dr2["CalendarYearTypeId"].ToString()).Selected = true;
            }

            ddlCategory.DataSource = joblogic.GetJobCategories();
            ddlCategory.DataBind();
            ddlCategory.Items.FindByValue(row.JobCategoryId.ToString()).Selected = true;
            txtStartDate.Text = row.ExpirationDate.ToString();
            ddlSalary.DataSource = joblogic.GetJobSalaries();
            ddlSalary.DataBind();
            ddlSalary.Items.FindByValue(row.SalaryId.ToString()).Selected = true;
            txtDesc.Text = row.JobDescription.ToString();
            txtReq.Text = row.JobRequirements.ToString();
            chxBenefits.DataSource = joblogic.getBenefits();
            chxBenefits.DataBind();

            DataTable jobBenefit = joblogic.getJobBenefitsById(jobid);
            foreach (DataRow dr2 in jobBenefit.Rows) {
                chxBenefits.Items.FindByValue(dr2["JobBenefitId"].ToString()).Selected = true;
            }

            DataTable jobApp = joblogic.getJobAppliesByJobId(jobid);
            DataTable personDT = new DataTable();
            JobsDataset._tabs_JobContactInformationRow controw = null;


            for (int i = 0; i < jobApp.Rows.Count; i++)
            {
                int applyId = Convert.ToInt32(jobApp.Rows[i]["JobApplyMethodId"].ToString());
                personDT = joblogic.getJobContactInfoById(Convert.ToInt32(jobApp.Rows[i]["JobsToJobApplyMethodId"].ToString()));
                controw = (JobsDataset._tabs_JobContactInformationRow)personDT.Rows[0];

                switch (applyId)
                {
                    case 1:
                        chxRegular.Checked = true;
                        txtAttnReg.Text = controw.ContactName;
                        txtAdd1.Text = controw.StreetAddress1;
                        txtAdd2.Text = controw.StreetAddress2;
                        txtCity.Text = controw.City;
                        txtZip.Text = controw.Zipcode;
                        ddlCountry.Items.FindByValue(controw.CountryId.ToString()).Selected = true;
                        ddlState.Items.FindByValue(controw.StateId.ToString()).Selected = true;

                        break;
                    case 2:
                        chxFax.Checked = true;
                        txtAttnFax.Text = controw.ContactName;
                        txtFaxNumber.Text = controw.FaxNumber;
                        break;
                    case 3:
                        chxEmail.Checked = true;
                        txtContactName.Text = controw.ContactName;
                        txtEmail2.Text = controw.EmailAddress;
                        break;
                    case 4:
                        chxOnline.Checked = true;
                        txtUrl.Text = controw.URL;
                        break;
                    default:
                        break;
                }
            }

            //if (jobApp.Rows.Count > 0) 
            //{
            //    DataTable personDT = joblogic.getJobContactInfoById(Convert.ToInt32(jobApp.Rows[0]["JobsToJobApplyMethodId"].ToString()));
            //    if (personDT.Rows.Count > 0) 
            //    {
            //        TABS_UserControls.resources.code.DAL.JobsDataset._tabs_JobContactInformationRow controw = (TABS_UserControls.resources.code.DAL.JobsDataset._tabs_JobContactInformationRow)personDT.Rows[0];
            //        txtAttnReg.Text = controw.ContactName;
            //        txtAdd1.Text = controw.StreetAddress1;
            //        txtAdd2.Text = controw.StreetAddress2;
            //        txtCity.Text = controw.City;
            //        txtZip.Text = controw.Zipcode;
            //        ddlCountry.Items.FindByValue(controw.CountryId.ToString()).Selected = true;
            //        ddlState.Items.FindByValue(controw.StateId.ToString()).Selected = true;
            //        txtAttnFax.Text = controw.ContactName;
            //        txtFaxNumber.Text = controw.FaxNumber;
            //        txtContactName.Text = controw.ContactName;
            //        txtEmail2.Text = controw.EmailAddress;
            //        txtUrl.Text = controw.URL;
            //    }
            //}
            txtInstructions.Text = row.SpecificInstructions.ToString();


        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e) 
        {
            ddlState.DataSource = manage.getStatesByCountryId(Convert.ToInt32(ddlCountry.SelectedValue));
            ddlState.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e) 
        {
            try { jobid = Convert.ToInt32(Request.QueryString["job"]); } catch { jobid = 0; }
            try { userid = Convert.ToInt32(Session["userid"].ToString()); } catch { userid = 0; }
            try { schoolid = userlogic.getSchoolByUserId(userid)[0].schoolid; } catch { schoolid = 0; }

            if (jobid > 0) 
            {
                this.updatedJob();
            } 
            else 
            {
                this.saveJob();
            }
        }

        protected void updatedJob() 
        {
            // delete key relationships
            DataTable jobApp = joblogic.getJobAppliesByJobId(jobid);
            for(int i=0; i< jobApp.Rows.Count; i++) 
            {
                int applyid = Convert.ToInt32(jobApp.Rows[i]["JobsToJobApplyMethodId"].ToString());
                joblogic.deleteJobRelationships(jobid, applyid);
            } 

            DateTime startDate;
            //int salaryId;

            // catch non req fields
            if (String.IsNullOrEmpty(txtStartDate.Text)) 
            {
                startDate = (DateTime)SqlDateTime.Null;
            } 
            else 
            {
                startDate = Convert.ToDateTime(txtStartDate.Text);
            }

            // Update
            //joblogic.updateJobs(jobid, Convert.ToInt32(ddlCategory.SelectedValue), Convert.ToInt32(ddlSalary.SelectedValue), Convert.ToDateTime(postDate.Text), Convert.ToDateTime(expireDate.Text), jobtitle.Text, schoolid, txtPerson.Text, txtEmail.Text, chxHidePerson.Checked, chxHideEmail.Checked, Convert.ToDateTime(txtStartDate.Text), txtDesc.Text, txtReq.Text, txtInstructions.Text, txtCalOther.Text, chxHideSchool.Checked);

            joblogic.updateJobs(jobid, Convert.ToInt32(ddlCategory.SelectedValue), Convert.ToInt32(ddlSalary.SelectedValue), Convert.ToDateTime(postDate.Text), Convert.ToDateTime(expireDate.Text), jobtitle.Text, schoolid, txtPerson.Text, txtEmail.Text, chxHidePerson.Checked, chxHideEmail.Checked, startDate, txtDesc.Text, txtReq.Text, txtInstructions.Text, txtCalOther.Text, chxHideSchool.Checked);


            for (int x = 0; x < chxListJob.Items.Count; x++) {
                if (chxListJob.Items[x].Selected) {
                    joblogic.insertJobTypes(jobid, Convert.ToInt32(chxListJob.Items[x].Value));
                }
            }
            for (int c = 0; c < rdoCalendar.Items.Count; c++) {
                if (rdoCalendar.Items[c].Selected) {
                    joblogic.insertJobCalendars(jobid, Convert.ToInt32(rdoCalendar.Items[c].Value));
                }
            }

            for (int b = 0; b < chxBenefits.Items.Count; b++) {
                if (chxBenefits.Items[b].Selected) {
                    joblogic.insertJobBenefits(jobid, Convert.ToInt32(chxBenefits.Items[b].Value), chxBenefits.Items[b].Text);
                }
            }

            int val = 1;
            if (chxRegular.Checked) 
            {
                val = joblogic.insertJobApplyMethods(jobid, 1);
                joblogic.insertJobApplyContact(val, txtAttnReg.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            } 
            if (chxEmail.Checked) 
            {
                val = joblogic.insertJobApplyMethods(jobid, 3);
                joblogic.insertJobApplyContact(val, txtContactName.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            }
            if (chxFax.Checked) 
            {
                val = joblogic.insertJobApplyMethods(jobid, 2);
                joblogic.insertJobApplyContact(val, txtAttnFax.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            }
            if (chxOnline.Checked) 
            {
                val = joblogic.insertJobApplyMethods(jobid, 4);
                joblogic.insertJobApplyContact(val, txtAttnReg.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            }
            Response.Redirect("/for-schools/post-edit-jobs.aspx");
        }

        protected void saveJob() 
        {
            DateTime startDate;
            //int salaryId;

            // catch non req fields
            if (String.IsNullOrEmpty(txtStartDate.Text)) {
                startDate = (DateTime)SqlDateTime.Null;
            } else {
                startDate = Convert.ToDateTime(txtStartDate.Text);
            }

            // Insert
            int retVal = joblogic.insertJob(Convert.ToInt32(ddlCategory.SelectedValue), Convert.ToInt32(ddlSalary.SelectedValue), Convert.ToDateTime(postDate.Text), Convert.ToDateTime(expireDate.Text), jobtitle.Text, schoolid, txtPerson.Text, txtEmail.Text, chxHidePerson.Checked, chxHideEmail.Checked, startDate, txtDesc.Text, txtReq.Text, txtInstructions.Text, txtCalOther.Text, chxHideSchool.Checked);

            DataTable jobApp = joblogic.getJobAppliesByJobId(retVal);
            for (int x = 0; x < chxListJob.Items.Count; x++) {
                if (chxListJob.Items[x].Selected) {
                    joblogic.insertJobTypes(retVal, Convert.ToInt32(chxListJob.Items[x].Value));
                }
            }
            for (int c = 0; c < rdoCalendar.Items.Count; c++) {
                if (rdoCalendar.Items[c].Selected) {
                    joblogic.insertJobCalendars(retVal, Convert.ToInt32(rdoCalendar.Items[c].Value));
                }
            }

            for (int b = 0; b < chxBenefits.Items.Count; b++) {
                if (chxBenefits.Items[b].Selected) {
                    joblogic.insertJobBenefits(retVal, Convert.ToInt32(chxBenefits.Items[b].Value), chxBenefits.Items[b].Text);
                }
            }

            int val = 1;
            if (chxRegular.Checked) 
            {
                val = joblogic.insertJobApplyMethods(retVal, 1);
                joblogic.insertJobApplyContact(val, txtAttnReg.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            } 
            if (chxEmail.Checked) 
            {
                val = joblogic.insertJobApplyMethods(retVal, 3);
                joblogic.insertJobApplyContact(val, txtContactName.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            } 
            if (chxFax.Checked) 
            {
                val = joblogic.insertJobApplyMethods(retVal, 2);
                joblogic.insertJobApplyContact(val, txtAttnFax.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            } 
            if (chxOnline.Checked) 
            {
                val = joblogic.insertJobApplyMethods(retVal, 4);
                joblogic.insertJobApplyContact(val, txtAttnReg.Text, txtAdd1.Text, txtAdd2.Text, txtCity.Text, Convert.ToInt32(ddlState.SelectedValue), Convert.ToInt32(ddlCountry.SelectedValue), txtZip.Text, txtFaxNumber.Text, txtEmail2.Text, txtUrl.Text);
            }
            
            Response.Redirect("/for-schools/post-edit-jobs.aspx");
        }

        protected void chxRegular_CheckedChanged(object sender, EventArgs e) 
        {

            if (warining1.Visible == false) 
            {
                warining1.Visible = true;
                warining2.Visible = true;
                warining3.Visible = true;
                warining4.Visible = true;
                warining5.Visible = true;
                warining6.Visible = true;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = false;
            } 
            else 
            {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = false;
            }
        }

        protected void chxFax_CheckedChanged(object sender, EventArgs e) {

            if (warining7.Visible == false) {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = true;
                warining8.Visible = true;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = false;
            } else {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = false;
            }
        }

        protected void chxEmail_CheckedChanged(object sender, EventArgs e) {

            if (warining9.Visible == false) {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = true;
                warining10.Visible = true;
                warining11.Visible = false;
            } else {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = false;
            }
        }

        protected void chxOnline_CheckedChanged(object sender, EventArgs e) {

            if (warining11.Visible == false) {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = true;
            } else {
                warining1.Visible = false;
                warining2.Visible = false;
                warining3.Visible = false;
                warining4.Visible = false;
                warining5.Visible = false;
                warining6.Visible = false;
                warining7.Visible = false;
                warining8.Visible = false;
                warining9.Visible = false;
                warining10.Visible = false;
                warining11.Visible = false;
            }
        }
    }
}