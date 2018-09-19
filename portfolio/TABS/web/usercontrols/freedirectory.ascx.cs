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
using TABS_UserControls.resources.code.DAL;
using TABS_UserControls.resources.code.BAL;
using System.Text;
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols
{
    public partial class freedirectory : System.Web.UI.UserControl
    {
        #region Variable Declarations

        public enum ContactType
        {
            Under13 = 1,
            Consultant = 2,
            Over13 = 3,
            Business = 4,
            Parent = 5,
            None = 6,
            Staff = 7
        }

        public enum Gender
        {
            Male = 1,
            Female = 2
        }

        private TABS_UserControls.resources.code.BAL.tabs_admin adminlogic = new TABS_UserControls.resources.code.BAL.tabs_admin();

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindCountries();
            }
        }

        protected void rbDescribes_CheckedChanged(object sender, EventArgs e)
        {
            // On changed, automatically show the main panel
            ShowPanel(ref pnlMain, true);

            // Hide the panels
            ShowPanel(ref pnlParentInfo, false);
            ShowPanel(ref pnlCompanyAndTitle, false);
            ShowPanel(ref pnlMoreStudentInfo, false);
            ShowPanel(ref pnlAboutTheStudent, false);
            ShowPanel(ref pnlTabsSchool, false);
            ShowPanel(ref pnlTabsYes, false);
            ShowPanel(ref pnlTabsNo, false);
            ShowPanel(ref pnlParentInterestLevel, false);
            ShowPanel(ref pnlCreditCard, false);
            ShowPanel(ref pnlOtherPreferences, false);
            
            trNormalRates.Visible = true; 
            trSchoolRates.Visible = false;
            rblTabsMember.SelectedIndex = -1;
            tbTotalCost.Text = string.Empty;
            tbNumberofCatalogs.Text = string.Empty;

            RadioButton rb = (RadioButton)sender;

            switch (rb.ID)
            {
                case "rbUnder13":
                    Session["rbDescribes.ID"] = (int)ContactType.Under13;
                    ShowUnder13Views(); 
                    break;

                case "rbConsultant":
                    Session["rbDescribes.ID"] = (int)ContactType.Consultant; 
                    ShowConsultantViews(); 
                    break;

                case "rbOver13":
                    Session["rbDescribes.ID"] = (int)ContactType.Over13; 
                    ShowOver13Views(); 
                    break;

                case "rbBusiness":
                    Session["rbDescribes.ID"] = (int)ContactType.Business; 
                    ShowBusinessViews(); 
                    break;

                case "rbParent":
                    Session["rbDescribes.ID"] = (int)ContactType.Parent; 
                    ShowParentViews(); 
                    break;

                case "rbNone":
                    Session["rbDescribes.ID"] = (int)ContactType.None; 
                    ShowNoneViews(); 
                    break;

                case "rbStaff":
                    Session["rbDescribes.ID"] = (int)ContactType.Staff; 
                    ShowStaffViews(); 
                    break;

                default:
                    break;
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Determine which country dropdown is calling
            DropDownList ddl = (DropDownList)sender;

            if (ddl.ID.Equals("ddlCountry"))
            {
                // Always reset the number of catalogs requested so that the total box can work
                tbNumberofCatalogs.Text = string.Empty;
                tbTotalCost.Text = string.Empty;

                if (ddlCountry.SelectedValue.Equals("0"))
                {
                    ddlState.Items.Clear();
                    Session.Remove("ddlState.DataSource");
                    ddlState.Enabled = false;

                    // Hide the Credit card panel
                    ShowPanel(ref pnlCreditCard, false);
                }
                else
                {
                    // Populate the state/province based on the country selection
                    SchoolManagerClass smlogic = new SchoolManagerClass();
                    SchoolManageDataset._tabs_statesDataTable dt = smlogic.getStatesByCountryId(int.Parse(ddlCountry.SelectedValue));
                    ddlState.DataSource = dt;

                    //Store the datasource in the session
                    Session.Add("ddlState.DataSource", dt);

                    ddlState.DataBind();
                    ddlState.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                    ddlState.Enabled = true;
                }
            }
            else
            {
                if (ddlBillingCountry.SelectedValue.Equals("0"))
                {
                    ddlBillingState.Items.Clear();
                    ddlBillingState.Enabled = false;
                }
                else
                {
                    // Populate the state/province based on the country selection
                    SchoolManagerClass smlogic = new SchoolManagerClass();
                    SchoolManageDataset._tabs_statesDataTable dt = smlogic.getStatesByCountryId(int.Parse(ddlCountry.SelectedValue));
                    ddlBillingState.DataSource = dt;

                    //Store the datasource in the session
                    Session.Add("ddlState.DataSource", dt);

                    ddlBillingState.DataBind();
                    ddlBillingState.Items.Insert(0, new ListItem("-- Please Select --", "0"));

                    ddlBillingState.Enabled = true;
                }
            }
        }

        protected void tbNumberofCatalogs_TextChanged(object sender, EventArgs e)
        {
            if (ddlCountry.SelectedIndex > 0)
            {
                TextBox tb = (TextBox)sender;

                int result;
                Int32.TryParse(tb.Text, out result);

                // if catalog requested and is not a staff member of a school
                if (result > 0 && rbStaff.Checked == false)
                {
                    // Calculate the costs
                    double cost = 0.00;

                    if (result == 1)
                    {
                        if (ddlCountry.SelectedItem.Text.ToLower().Equals("united states") || ddlCountry.SelectedItem.Text.ToLower().Equals("canada"))
                        {
                            cost = 0.00;
                        }
                        else
                        {
                            // Other countries
                            cost = 30.00;
                        }
                    }
                    else
                    {
                        if (result > 1 && result < 26)
                        {
                            if (ddlCountry.SelectedItem.Text.ToLower().Equals("united states") || ddlCountry.SelectedItem.Text.ToLower().Equals("canada"))
                            {
                                cost = result * 5;
                            }
                            else
                            {
                                // Other countries
                                cost = result * 25;
                            }
                        }
                        else
                        {
                            if (result > 25 && result < 51)
                            {
                                if (ddlCountry.SelectedItem.Text.ToLower().Equals("united states") || ddlCountry.SelectedItem.Text.ToLower().Equals("canada"))
                                {
                                    cost = result * 3;
                                }
                                else
                                {
                                    // Other countries
                                    cost = result * 20;
                                }
                            }
                            else
                            {
                                if (result > 50)
                                {
                                    tbTotalCost.Text = "Call (828)258-5354";
                                }
                            }
                        }
                    }

                    if (result < 51)
                    {
                        tbTotalCost.Text = String.Format("{0:c}", cost);
                    }

                    if (cost > 0)
                    {
                        ShowPanel(ref pnlCreditCard, true);
                    }
                    else
                    {
                        ShowPanel(ref pnlCreditCard, false);
                    }
                }
                else
                {
                    // if catalog requested and is a staff member of a school
                    if (result > 0 && rbStaff.Checked)
                    {
                        // Calculate the costs
                        double cost = 0.00;

                        // for staff members in the US or Canada
                        if (ddlCountry.SelectedItem.Text.ToLower().Equals("united states") || ddlCountry.SelectedItem.Text.ToLower().Equals("canada"))
                        {
                            if (result > 1 && result < 51)
                            {
                                cost = 0.00;
                            }
                            else
                            {
                                if (result > 50)
                                {
                                    tbTotalCost.Text = "Call (828)258-5354";
                                }
                            }
                        }
                        else
                        {
                            // for staff members outside of the US or Canada
                            if (result == 1)
                            {
                                cost = 15.00;
                            }
                            else
                            {
                                if (result > 1 && result < 26)
                                {
                                    cost = result * 25;
                                }
                                else
                                {
                                    if (result > 25 && result < 51)
                                    {
                                        cost = result * 20;
                                    }
                                    else
                                    {
                                        if (result > 50)
                                        {
                                            tbTotalCost.Text = "Call (828)258-5354";
                                        }
                                    }
                                }
                            }
                        }

                        if (result < 51)
                        {
                            tbTotalCost.Text = String.Format("{0:c}", cost);
                        }

                        if (cost > 0)
                        {
                            ShowPanel(ref pnlCreditCard, true);
                        }
                        else
                        {
                            ShowPanel(ref pnlCreditCard, false);
                        }
                    }
                    else
                    {
                        tbTotalCost.Text = string.Empty;

                        ShowPanel(ref pnlCreditCard, false);
                    }
                }
            }
            else
            {
                tbTotalCost.Text = "Please select your country";
                ShowPanel(ref pnlCreditCard, false);
            }

            Page.SetFocus(tbTotalCost);
        }

        protected void cbSameAsMailingAddress_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cb = (CheckBox)sender;

            if (cb.Checked)
            {
                tbBillingFirstName.Text = tbFirstName.Text;
                tbBillingLastName.Text = tbLastName.Text;
                tbBillingStreetAddress1.Text = tbStreetAddress1.Text;
                tbBillingStreetAddress2.Text = tbStreetAddress2.Text;
                tbBillingCity.Text = tbCity.Text;
                BindDropDownList((DataTable)Session["ddlCountry.DataSource"], ref ddlBillingCountry);
                ddlBillingCountry.SelectedIndex = ddlCountry.SelectedIndex;
                tbBillingZip.Text = tbZip.Text;
                BindDropDownList((DataTable)Session["ddlState.DataSource"], ref ddlBillingState);
                
                // When the state isn't selected, the entire "same as mailing" functionality breaks
                if (ddlState.SelectedIndex > 0)
                {
                    ddlBillingState.SelectedIndex = ddlState.SelectedIndex;
                }
                ddlBillingState.Enabled = true;
            }
            else
            {
                tbBillingFirstName.Text = string.Empty;
                tbBillingLastName.Text = string.Empty;
                tbBillingStreetAddress1.Text = string.Empty;
                tbBillingStreetAddress2.Text = string.Empty;
                tbBillingCity.Text = string.Empty;
                ddlBillingCountry.SelectedIndex = 0;
                tbBillingZip.Text = string.Empty;
                ddlBillingState.Items.Clear();
                ddlBillingState.Enabled = false;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                // Submit the data to the database
                SubmitData();

                // Send Email Confirmation
                SendEmail(rbUnder13.Checked);

                // Redirect to the thank you page
                Response.Redirect("/find-a-school/explore-your-options/request-a-free-directory/thank-you.aspx", true);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/find-a-school/explore-your-options.aspx", true);
        }

        protected void rblTabsMember_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rbl = (RadioButtonList)sender;

            if (rbl.SelectedItem.Text.Equals("Yes"))
            {
                BindSchools();

                ShowPanel(ref pnlTabsYes, true);
                ShowPanel(ref pnlTabsNo, false);
            }
            else
            {
                ShowPanel(ref pnlTabsYes, false);
                ShowPanel(ref pnlTabsNo, true);
            }
        }

        #endregion

        #region Methods

        private void SendEmail(bool isUnder13)
        {
            InfrastructureClass infrastructure = new InfrastructureClass();

            List<string> to = new List<string>();
            List<string> cc = new List<string>();
            List<string> bc = new List<string>();

            to.Add(tbEmail.Text);

            string from = System.Configuration.ConfigurationManager.AppSettings["fromEmailAddress"].ToString();

            StringBuilder sb = new StringBuilder();
            sb.Append("Dear ").Append(tbFirstName.Text).Append(" ").Append(tbLastName.Text).Append(",\r\n\r\n");
            sb.Append("Thanks for contacting TABS. Your request has been processed and your free NowBoarding Directory should be at your doorstep in 2-3 weeks! We hope you enjoy exploring all of the incredible schools in our directory. You may just find the perfect one for you!\r\n\r\n");
            sb.Append("TABS is a non-profit organization representing nearly 300 college-prep boarding schools in the U.S., Canada, and abroad. We hope you’ll continue to visit boardingschools.com to learn more about some of the word’s leading schools and to see how they’re preparing young people for college success—and for full and rewarding lives. \r\n\r\n");
            sb.Append("We hope to see you soon on boardingschools.com! Have a great week!\r\n\r\n");
            sb.Append("Thank you,\r\n\r\n");
            sb.Append("The TABS Staff");

            infrastructure.SendEmail(from, to, cc, bc, "TABS Order Confirmation", sb.ToString(), false);

            if(isUnder13)
            {
                sb.Append("Dear ").Append(tbParentFirstName.Text).Append(" ").Append(tbParentLastName.Text).Append(",\r\n\r\n");
                sb.Append("Hello!  Recently, your child, ").Append(tbFirstName.Text).Append(", visited The Association of Boarding Schools’ website, boardingschools.com, and either requested a complimentary copy of NowBoarding, our magazine and directory, or submitted a form seeking information from one or more of our member schools.  \r\n\r\n");
                sb.Append("As a matter of policy, we inform parents and legal guardians about how we collect, use, and disclose personal information from children under 13 years of age.  Please feel free to read our complete privacy policy at your convenience, available at the bottom of any page of our site.  If you have any questions, just give us a call (828-258-5354) or send us a note (tabs@tabs.org), and we’ll do our best to help.\r\n\r\n");
                sb.Append("TABS is a non-profit organization representing nearly 300 college-prep boarding schools in the U.S., Canada, and abroad. We hope you’ll continue to visit boardingschools.com to learn more about some of the word’s leading schools and to see how they’re preparing young people for college success—and for full and rewarding lives. \r\n\r\n");
                sb.Append("For now, best wishes for a wonderful week!\r\n\r\n");
                sb.Append("Thank you,\r\n\r\n");
                sb.Append("The TABS Staff");

                infrastructure.SendEmail(from, to, cc, bc, "TABS Activity Notification", sb.ToString(), false);
            }
        }

        private void BindSchools()
        {
            tabs_admin_dataset._tabs_schoolsDataTable dt = adminlogic.getSchools();
            ddlTabsSchools.DataSource = dt;
            ddlTabsSchools.DataBind();
            ddlTabsSchools.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        private void BindCountries()
        {
            // Countries
            tabs_admin_dataset._tabs_countryDataTable dt = adminlogic.getCountry();
            ddlCountry.DataSource = dt;

            //Store the datasource in the session
            Session.Add("ddlCountry.DataSource", dt);

            ddlCountry.DataBind();
            ddlCountry.Items.Insert(0,new ListItem("-- Please Select --", "0"));
            ddlCountry.Items.FindByText("United States").Selected = true;

            // Bind States
            // Populate the state/province based on the country selection
            SchoolManagerClass smlogic = new SchoolManagerClass();
            SchoolManageDataset._tabs_statesDataTable dt2 = smlogic.getStatesByCountryId(int.Parse(ddlCountry.SelectedValue));
            ddlState.DataSource = dt2;

            //Store the datasource in the session
            Session.Add("ddlState.DataSource", dt2);

            ddlState.DataBind();
            ddlState.Items.Insert(0, new ListItem("-- Please Select --", "0"));

            ddlState.Enabled = true;


            // Citizenship
            ddlCitizenship.DataSource = dt;
            ddlCitizenship.DataBind();
            ddlCitizenship.Items.Insert(0, new ListItem("-- Please Select --", "0"));

            // Billing Countries
            // Just bind while we already have the data
            ddlBillingCountry.DataSource = dt;
            ddlBillingCountry.DataBind();
            ddlBillingCountry.Items.Insert(0, new ListItem("-- Please Select --", "0"));

        }

        private void BindDropDownList(DataTable datasource, ref DropDownList ddl)
        {
            try
            {
                ddl.Items.Clear();
                ddl.DataSource = datasource;
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem("-- Please Select --", "0"));
            }
            catch { }
            
        }

        private void BindCurrentSchoolTypes()
        {
            DirectoryRequestDataset._tabs_SchoolTypesDataTable dt = adminlogic.GetSchoolTypes();
            ddlCurrentSchoolType.DataSource = dt;
            ddlCurrentSchoolType.DataBind();
            ddlCurrentSchoolType.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        private void BindInterestLevel()
        {
            DirectoryRequestDataset._tabs_InterestLevelDataTable dt = adminlogic.GetInterestLevels();
            ddlInterestLevel.DataSource = dt;
            ddlInterestLevel.DataBind();
            ddlInterestLevel.Items.Insert(0, new ListItem("-- Please Select --", "0"));

            // Bind this one also to avoid extra database trips
            ddlParentInterestLevel.DataSource = dt;
            ddlParentInterestLevel.DataBind();
            ddlParentInterestLevel.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        private void BindRelationshipToStudent()
        {
            DirectoryRequestDataset._tabs_RelationshipToStudentDataTable dt = adminlogic.GetRelationshipToStudent();
            ddlRelationship.DataSource = dt;
            ddlRelationship.DataBind();
            ddlRelationship.Items.Insert(0, new ListItem("-- Please Select --", "0"));
        }

        private void ShowUnder13Views()
        {
            // Show panels
            ShowPanel(ref pnlParentInfo, true);

            ShowOver13Views();
        }

        private void ShowOver13Views()
        {
            // Show panels
            ShowPanel(ref pnlMoreStudentInfo, true);
            ShowPanel(ref pnlOtherPreferences, true);
            
            // Set the title for the contact section
            litContactSectionTitle.Text = "Student Information";

            // Set the More Student Info fields
            litIam.Text = "I am";
            litStudentCitizenship.Text = "Citizenship";
            litCurrentGrade.Text = "I am currently in grade";
            litConsideringGrade.Text = "I am considering boarding school for grade";
            litCurrentlyAttending.Text = "I am currently attending";
            litInterest.Text = "My interest level is";

            // Bind the current school types
            BindCurrentSchoolTypes();

            // Bind the interest level
            BindInterestLevel();
        }

        private void ShowBusinessViews()
        {
            ShowConsultantViews();
        }

        private void ShowParentViews()
        {
            // Show panels
            ShowPanel(ref pnlMoreStudentInfo, true);
            ShowPanel(ref pnlAboutTheStudent, true);
            ShowPanel(ref pnlParentInterestLevel, true);
            ShowPanel(ref pnlOtherPreferences, true);
            
            // Set the title for the contact section
            litContactSectionTitle.Text = "Contact Information";

            // Set the More Student Info fields
            litIam.Text = "Student Gender";
            litStudentCitizenship.Text = "Student Citizenship";
            litCurrentGrade.Text = "Student currently in grade";
            litConsideringGrade.Text = "Considering boarding school for grade";
            litCurrentlyAttending.Text = "Currently attending";
            litInterest.Text = "Student interest level is";

            // Bind the current school types
            BindCurrentSchoolTypes();

            // Bind the interest level
            BindInterestLevel();

            // Bind the relationship
            BindRelationshipToStudent();
        }

        private void ShowConsultantViews()
        {
            // Show panels
            ShowPanel(ref pnlCompanyAndTitle, true);

            // Set the title for the contact section
            litContactSectionTitle.Text = "Mailing Information";
        }

        private void ShowNoneViews()
        {
            ShowConsultantViews();
        }

        private void ShowStaffViews()
        {
            // Show panels
            ShowPanel(ref pnlTabsSchool, true);

            trNormalRates.Visible = false;
            trSchoolRates.Visible = true;

            // Set the title for the contact section
            litContactSectionTitle.Text = "Contact Information";
        }

        private void ShowPanel(ref Panel pnl, bool visible)
        {
            if (pnl != null)
            {
                pnl.Visible = visible;
            }
        }

        private void SubmitData()
        {
            // Process CC card if applicable
            double result;
            bool valid = double.TryParse(tbTotalCost.Text.TrimStart('$'), out result);

            List<string> response;
            int? transactionStatusId = null;
            int? responseReasonCode = null;
            string responseReasonCodeText = string.Empty;
            string transactionId = string.Empty;

            if (valid)
            {
                if (result > 0)
                {
                    // Submit the Transaction
                    TABS_UserControls.resources.code.BAL.AuthorizeNet anet = new TABS_UserControls.resources.code.BAL.AuthorizeNet();
                    response = anet.SubmitTransaction(tbCreditCardNumber.Text, tbExpirationMonth.Text + tbExpirationYear.Text, tbTotalCost.Text,
                        "Directory Request", tbFirstNameOnCard.Text, tbLastNameOnCard.Text, tbBillingStreetAddress1.Text,
                        ddlBillingState.SelectedValue, tbBillingZip.Text);

                    transactionStatusId = int.Parse(response[0]);
                    responseReasonCode = int.Parse(response[2]);
                    responseReasonCodeText = response[3];
                    transactionId = response[6];
                }
            }

            // Determine Gender
            int gender;
            if(rbMale.Checked)
            {
                gender = (int)Gender.Male;
            }
            else
            {
                gender = (int)Gender.Female;
            }

            int? citizenship;
            try
            {
                citizenship = int.Parse(ddlCitizenship.SelectedValue);
            }
            catch (System.FormatException)
            {
                citizenship = null;
            }

            

            int? gradeConsidering = null;
            if(tbApplyForGrade.Text.Length > 0)
            {
                try
                {
                    gradeConsidering = int.Parse(tbApplyForGrade.Text);
                }
                catch
                {
                    gradeConsidering = null;
                }
            }

            // Check the billing fields
            int? billingCountryId;
            try
            {
                billingCountryId = int.Parse(ddlBillingCountry.SelectedValue);

                if (billingCountryId == 0)
                {
                    billingCountryId = null;
                }
            }
            catch (System.FormatException)
            {
                billingCountryId = null;
            }

            int? billingStateId;
            try
            {
                billingStateId = int.Parse(ddlBillingState.SelectedValue);
            }
            catch (System.FormatException)
            {
                billingStateId = null;
            }

            int? currentGrade;
            try
            {
                currentGrade = int.Parse(tbCurrentGrade.Text);
            }
            catch (System.FormatException)
            {
                currentGrade = null;
            }

            int? interestLevel;
            try
            {
                interestLevel = int.Parse(ddlInterestLevel.SelectedValue);

                if (interestLevel == 0)
                {
                    interestLevel = null;
                }
            }
            catch (System.FormatException)
            {
                interestLevel = null;
            }

            int? relationshipToStudent;
            try
            {
                relationshipToStudent = int.Parse(ddlRelationship.SelectedValue);
            }
            catch (System.FormatException)
            {
                relationshipToStudent = null;
            }

            int? parentInterestLevel;
            try
            {
                parentInterestLevel = int.Parse(ddlParentInterestLevel.SelectedValue);

                if (parentInterestLevel == 0)
                {
                    parentInterestLevel = null;
                }
            }
            catch (System.FormatException)
            {
                parentInterestLevel = null;
            }

            int? tabsSchool;
            try
            {
                tabsSchool = int.Parse(ddlTabsSchools.SelectedValue);
            }
            catch (System.FormatException)
            {
                tabsSchool = null;
            }

            string lastFour = string.Empty;
            if (tbCreditCardNumber.Text.Length > 0)
            {
                lastFour = tbCreditCardNumber.Text.Substring(tbCreditCardNumber.Text.Length - 4, 4);
            }

            int? schoolType;
            try
            {
                schoolType = ddlCurrentSchoolType.SelectedIndex;

                if (ddlCurrentSchoolType.SelectedIndex <= 0)
                {
                    schoolType = null;
                }
                else
                {
                    schoolType = int.Parse(ddlCurrentSchoolType.SelectedValue);
                }
            }
            catch (System.FormatException)
            {
                schoolType = null;
            }
            

            adminlogic.InsertDirectoryRequest(int.Parse(Session["rbDescribes.ID"].ToString()), tbFirstName.Text, tbLastName.Text,
                tbEmail.Text, tbStreetAddress1.Text, tbStreetAddress2.Text, tbCity.Text, int.Parse(ddlCountry.SelectedValue),
                tbZip.Text, int.Parse(ddlState.SelectedValue), gender, citizenship, tbCompanyName.Text,
                tbTitlePosition.Text, tbBillingStreetAddress1.Text, tbBillingStreetAddress2.Text, tbBillingCity.Text,
                billingCountryId, tbBillingZip.Text, billingStateId, 
                DateTime.Parse(System.Data.SqlTypes.SqlDateTime.MinValue.ToString()), currentGrade,
                gradeConsidering, schoolType, interestLevel,
                tbParentFirstName.Text, tbParentLastName.Text, tbParentEmail.Text, relationshipToStudent,
                parentInterestLevel, tabsSchool, tbSchool.Text,
                lastFour, double.Parse(tbTotalCost.Text.TrimStart('$')), transactionId, transactionStatusId, responseReasonCode, responseReasonCodeText, 
                int.Parse(tbNumberofCatalogs.Text), cbEmailUpdates.Checked, cbMailingList.Checked);
        }

        #endregion
    }
}