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
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols
{
    public partial class job_board : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private JobClass JobsBAL = new JobClass();
        private tabs_admin TabsAdminBAL = new tabs_admin();

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Bind Categories
                BindCategories();

                // Bind Job Types
                BindTypes();

                // Bind Locations
                BindLocations();

                // Bind Salary
                BindSalary();

                // Bind CalendarYear Types
                BindCalendarYearTypes();
                
                // See if we're coming back from a job detail page
                if (!String.IsNullOrEmpty(Request.QueryString["results"]))
                {
                    // Get the DataTable
                    DataTable dt = (DataTable)Session["TABS_JobBoard_DataTable"];

                    BindGrid(dt);

                    pnlSearch.Visible = false;
                    pnlResults.Visible = true;
                }
                else
                {
                    // Check for any jobs
                    if (JobsBAL.GetJobs().Rows.Count.Equals(0))
                    {
                        // Show "no jobs" panel.
                        pnlSearch.Visible = false;
                        pnlResults.Visible = false;
                        pnlNoResults.Visible = true;
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            // Job Categories
            List<int> jobCategoryTypeIds = new List<int>();

            for (int i = 0; i < cblJobCategories.Items.Count; i++)
            {
                if (cblJobCategories.Items[i].Selected)
                {
                    jobCategoryTypeIds.Add(Convert.ToInt32(cblJobCategories.Items[i].Value));
                }
            }

            // Job Types
            List<int> jobTypeIds = new List<int>();

            for (int i = 0; i < cblJobTypes.Items.Count; i++)
            {
                if (cblJobTypes.Items[i].Selected)
                {
                    jobTypeIds.Add(Convert.ToInt32(cblJobTypes.Items[i].Value));
                }
            }

            // Calendar Year Types
            List<int> calendarYearTypeIds = new List<int>();

            for (int i = 0; i < cblCalendarYear.Items.Count; i++)
            {
                if (cblCalendarYear.Items[i].Selected)
                {
                    calendarYearTypeIds.Add(Convert.ToInt32(cblCalendarYear.Items[i].Value));
                }
            }

            // Salaries
            List<int> salaryIds = new List<int>();

            if (cbSalaryUnspecified.Checked)
            {
                salaryIds.Add(Convert.ToInt32(ddlSalary.Items.FindByText("Not Specified").Value));
            }

            salaryIds.Add(Convert.ToInt32(ddlSalary.SelectedValue));

            // Locations
            List<int> locationIds = new List<int>();

            for (int i = 0; i < lbStates.Items.Count; i++)
            {
                if (lbStates.Items[i].Selected)
                {
                    locationIds.Add(Convert.ToInt32(lbStates.Items[i].Value));
                }
            }

            // Keywords
            string keywords = Utility.GetCleanString(tbKeywords.Text);

            keywords = String.IsNullOrEmpty(keywords) ? "|||" : keywords;

            // Search
            JobsDataset._tabs_JobsDataTable dt = JobsBAL.SearchJobs(jobCategoryTypeIds, keywords, jobTypeIds, calendarYearTypeIds, salaryIds, locationIds);

            // Bind Obout grid
            BindGrid(dt);

            pnlSearch.Visible = false;
            pnlResults.Visible = true;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            // Clear out any selections
            cblJobCategories.SelectedIndex = -1;
            tbKeywords.Text = string.Empty;
            cblJobTypes.SelectedIndex = -1;
            cblCalendarYear.SelectedIndex = -1;
            ddlSalary.SelectedIndex = -1;
            cbSalaryUnspecified.Checked = false;
            lbStates.SelectedIndex = -1;
        }
        protected void btnBackToSearch_Click(object sender, EventArgs e)
        {
            pnlSearch.Visible = true;
            pnlResults.Visible = false;
        }

        #endregion

        #region Methods

        private void BindCategories()
        {
            JobsDataset._tabs_JobCategoriesDataTable dt = JobsBAL.GetJobCategories();

            cblJobCategories.DataSource = dt;
            cblJobCategories.DataBind();
        }

        private void BindTypes()
        {
            JobsDataset._tabs_JobTypesDataTable dt = JobsBAL.GetJobTypes();

            cblJobTypes.DataSource = dt;
            cblJobTypes.DataBind();
        }

        private void BindLocations()
        {
            // Only get locations where there are jobs
            JobsDataset._tabs_JobsDataTable dtJobs = JobsBAL.GetJobs();

            tabs_admin_dataset._tabs_schoolsDataTable dtSchools = null;
            tabs_admin_dataset._tabs_statesDataTable dtState = null;
            tabs_admin_dataset._tabs_statesDataTable dtStates = new tabs_admin_dataset._tabs_statesDataTable();
            Hashtable htLocations = new Hashtable();

            for (int i = 0; i < dtJobs.Rows.Count; i++)
            {
                dtSchools = TabsAdminBAL.getSchoolByID(dtJobs[i].SchoolId);
                dtState = TabsAdminBAL.GetState(dtSchools[0].stateid);

                if (!dtStates.Rows.Contains(dtState[0].stateid))
                {
                    DataRow dr = dtStates.NewRow();
                    dr["state"] = dtState[0].state;
                    dr["stateid"] = dtState[0].stateid;
                    dtStates.Rows.Add(dr);
                }
            }

            lbStates.DataSource = dtStates;
            lbStates.DataBind();
        }

        private void BindSalary()
        {
            JobsDataset._tabs_JobSalariesDataTable dt = JobsBAL.GetJobSalaries();

            ddlSalary.DataSource = dt;
            ddlSalary.DataBind();
        }

        private void BindCalendarYearTypes()
        {
            JobsDataset._tabs_CalendarYearTypesDataTable dt = JobsBAL.GetCalendarYearTypes();

            cblCalendarYear.DataSource = dt;
            cblCalendarYear.DataBind();
        }

        private void BindGrid(DataTable dt)
        {
            // Store the DataTable in Session
            Session["TABS_JobBoard_DataTable"] = dt;
            
            gridResults.DataSource = dt;
            gridResults.DataBind();
        }

        #endregion
    }
}