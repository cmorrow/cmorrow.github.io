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
using System.Text;
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols {
    public partial class contactschool : System.Web.UI.UserControl {
        private TABS_UserControls.resources.code.BAL.tabs_admin adminlogic = new TABS_UserControls.resources.code.BAL.tabs_admin();
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        SchoolManagerClass managerlogic = new SchoolManagerClass();
        private int sc1 = 0, sc2 = 0, sc3 = 0, sc4 = 0, sc5 = 0;

        protected void Page_Load(object sender, EventArgs e) {
            // server-side binding

            if (!Page.IsPostBack) 
            {
                this.BindSchoolDropdowns();
                this.BindCountryandState();
                this.contactView.Visible = false;

                for (int i = DateTime.Now.Year; i < DateTime.Now.Year+10; i++)
                {
                    ddlPStart.Items.Add(i.ToString() + "-" + (i + 1).ToString());
                    ddlStudentStart.Items.Add(i.ToString() + "-" + (i + 1).ToString());
                }

                ddlPStart.SelectedIndex = 0;
                ddlStudentStart.SelectedIndex = 0;
            }

            this.Page.Title = "Contact Boarding Schools - The Association of Boarding Schools - TABS";

        }

        protected void rdoUserType_SelectedIndexChanged(object sender, EventArgs e) {
            switch (rdoUserType.SelectedValue) {
                case "under13":
                    contactView.ActiveViewIndex = 0;
                    parentInfo1.Visible = true;
                    parentInfo2.Visible = true;
                    parentInfo3.Visible = true;
                    parentInfo4.Visible = true;
                    break;
                case "staff":
                    contactView.ActiveViewIndex = 1;
                    break;
                case "over13":
                    contactView.ActiveViewIndex = 0;
                    parentInfo1.Visible = false;
                    parentInfo2.Visible = false;
                    parentInfo3.Visible = false;
                    parentInfo4.Visible = false;
                    break;
                case "consultant":
                    contactView.ActiveViewIndex = 1;
                    break;
                case "mother":
                    contactView.ActiveViewIndex = 2;
                    break;
                case "none":
                    contactView.ActiveViewIndex = 1;
                    break;
                case "father":
                    contactView.ActiveViewIndex = 2;
                    break;
                default:
                    contactView.ActiveViewIndex = 0;
                    parentInfo1.Visible = true;
                    parentInfo2.Visible = true;
                    parentInfo3.Visible = true;
                    parentInfo4.Visible = true;
                    break;
            }

            contactView.Visible = true;

        }

        public void BindCountryandState() {
            ddlParentCountry.DataSource = adminlogic.getCountry();
            ddlParentCountry.DataBind();
            ddlParentCountry.Items.FindByText("United States").Selected = true;
            ddlStudentCountry1.DataSource = adminlogic.getCountry();
            ddlStudentCountry1.DataBind();
            ddlStudentCountry1.Items.FindByText("United States").Selected = true;
            ddlStaffCountry.DataSource = adminlogic.getCountry();
            ddlStaffCountry.DataBind();
            ddlStaffCountry.Items.FindByText("United States").Selected = true;

            ddlStudentState1.DataSource = managerlogic.getStatesByCountryId(Convert.ToInt32(ddlStudentCountry1.SelectedValue));
            ddlStudentState1.DataBind();
            ddlStudentState1.Enabled = true;
            ddlStaffState.DataSource = managerlogic.getStatesByCountryId(Convert.ToInt32(ddlStaffCountry.SelectedValue));
            ddlStaffState.DataBind();
            ddlStaffState.Enabled = true;
            ddlParentState.DataSource = managerlogic.getStatesByCountryId(Convert.ToInt32(ddlParentCountry.SelectedValue));
            ddlParentState.DataBind();
            ddlParentState.Enabled = true;


        }

        public void BindSchoolDropdowns() {
            if (Request.Params["sc"] != null) {
                sc1 = Convert.ToInt32(Request.Params["sc"].ToString());
            }
            if (Request.Params["sc2"] != null) {
                sc2 = Convert.ToInt32(Request.Params["sc2"].ToString());
            }
            if (Request.Params["sc3"] != null) {
                sc3 = Convert.ToInt32(Request.Params["sc3"].ToString());
            }
            if (Request.Params["sc4"] != null) {
                sc4 = Convert.ToInt32(Request.Params["sc4"].ToString());
            }
            if (Request.Params["sc5"] != null) {
                sc5 = Convert.ToInt32(Request.Params["sc5"].ToString());
            }


            TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_schoolsDataTable ds = schoollogic.getSchools();

            dropSchool1.DataSource = ds;
            dropSchool1.DataBind();
            if (sc1 > 0) {
                dropSchool1.SelectedIndex = dropSchool1.Items.IndexOf(dropSchool1.Items.FindByValue(sc1.ToString()));
            }

            dropSchool2.DataSource = ds;
            dropSchool2.DataBind();
            if (sc2 > 0) {
                dropSchool2.SelectedIndex = dropSchool2.Items.IndexOf(dropSchool1.Items.FindByValue(sc2.ToString()));
            }


            dropSchool3.DataSource = ds;
            dropSchool3.DataBind();
            if (sc3 > 0) {
                dropSchool3.SelectedIndex = dropSchool3.Items.IndexOf(dropSchool1.Items.FindByValue(sc3.ToString()));
            }


            dropSchool4.DataSource = ds;
            dropSchool4.DataBind();
            if (sc4 > 0) {
                dropSchool4.SelectedIndex = dropSchool4.Items.IndexOf(dropSchool1.Items.FindByValue(sc4.ToString()));
            }

            dropSchool5.DataSource = ds;
            dropSchool5.DataBind();
            if (sc5 > 0) {
                dropSchool5.SelectedIndex = dropSchool5.Items.IndexOf(dropSchool1.Items.FindByValue(sc5.ToString()));
            }
        }

        // Student Form
        protected void btnSaveStudent_Click(object sender, EventArgs e) 
        {
            if (dropSchool1.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool1.SelectedValue), 1);
            }
            if (dropSchool2.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool2.SelectedValue), 1);
            }
            if (dropSchool3.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool3.SelectedValue), 1);
            }
            if (dropSchool4.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool4.SelectedValue), 1);
            }
            if (dropSchool5.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool5.SelectedValue), 1);
            }

            SendToRequestor(txtSEmail1.Text);
            if (parentInfo1.Visible == true)
            {
                this.SendToParent(txtPEmail1.Text);
            }
            Response.Redirect("/find-a-school/explore-your-options/contact-schools/thank-you.aspx");

        }

        // Staff Form
        protected void btnSaveStaff_Click(object sender, EventArgs e) 
        {
            if (dropSchool1.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool1.SelectedValue), 3);
            }
            if (dropSchool2.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool2.SelectedValue), 3);
            }
            if (dropSchool3.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool3.SelectedValue), 3);
            }
            if (dropSchool4.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool4.SelectedValue), 3);
            }
            if (dropSchool5.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool5.SelectedValue), 3);
            }

            SendToRequestor(txtStaffEmail.Text);
            Response.Redirect("/find-a-school/explore-your-options/contact-schools/thank-you.aspx");

        }

        // Parent Form
        protected void btnSaveParent_Click(object sender, EventArgs e) 
        {
            if (dropSchool1.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool1.SelectedValue), 2);
            }
            if (dropSchool2.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool2.SelectedValue), 2);
            }
            if (dropSchool3.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool3.SelectedValue), 2);
            }
            if (dropSchool4.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool4.SelectedValue), 2);
            }
            if (dropSchool5.SelectedIndex > 0) {
                this.SendToSchool(Convert.ToInt32(dropSchool5.SelectedValue), 2);
            }
            SendToRequestor(txtParentEmail.Text);
            Response.Redirect("/find-a-school/explore-your-options/contact-schools/thank-you.aspx");

        }

        protected void ddlStudentCountry1_SelectedIndexChanged(object sender, EventArgs e) {
            ddlStudentState1.DataSource = managerlogic.getStatesByCountryId(Convert.ToInt32(ddlStudentCountry1.SelectedValue));
            ddlStudentState1.DataBind();
            ddlStudentState1.Enabled = true;
        }

        protected void ddlStaffCountry_SelectedIndexChanged(object sender, EventArgs e) {
            ddlStaffState.DataSource = managerlogic.getStatesByCountryId(Convert.ToInt32(ddlStaffCountry.SelectedValue));
            ddlStaffState.DataBind();
            ddlStaffState.Enabled = true;
        }

        protected void ddlParentCountry_SelectedIndexChanged(object sender, EventArgs e) {
            ddlParentState.DataSource = managerlogic.getStatesByCountryId(Convert.ToInt32(ddlParentCountry.SelectedValue));
            ddlParentState.DataBind();
            ddlParentState.Enabled = true;
        }

        protected void SendToSchool(int id, int type) 
        {
            // Need to send email to Tabs
            StringBuilder sb = new StringBuilder();
            DataTable dt = schoollogic.getSchoolBySchoolID(id);    
            sb.AppendLine("Dear " + dt.Rows[0]["schoolname"].ToString() + ",");
            sb.AppendLine("Hello! A TABS visitor has made an inquiry to your school through our website! Please find the visitor’s information request and contact information below. ");

            switch (type) {
                case 1: // Student
                    sb.AppendLine(GetStudent());
                    break;
                case 2: // Parent
                    sb.AppendLine(GetParent());
                    break;
                case 3: // Staff
                    sb.AppendLine(GetStaffRequest());
                    break;
                default:
                    break;
            }

            sb.AppendLine("In order to deliver high-quality inquiries to your desktop, we do not permit mass or blanket inquiries on the TABS site.  Site users are limited to requesting information from, at most, five (5) schools at one time.");
            sb.AppendLine("Bookmark and return often to TABS.org to hear the latest from around the boarding school universe.");
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");


           InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(dt.Rows[0]["email"].ToString());
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "TABS Request for Materials", sb.ToString(), false);

        }

        public string GetStaffRequest() 
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("First Name: " + txtStaffFName.Text);
            sb.AppendLine("Last Name: " + txtStaffLName.Text);
            sb.AppendLine("Email: " + txtStaffEmail.Text);
            sb.AppendLine("Address 1: " + txtStaffAdd1.Text);
            sb.AppendLine("Address 2: " + txtStaffAdd2.Text);
            sb.AppendLine("City: " + txtStaffCity.Text);
            sb.AppendLine("Zip Code: " + txtStaffZip.Text);
            sb.AppendLine("State: " + ddlStaffState.SelectedItem.Text);
            sb.AppendLine("Country: " + ddlStaffCountry.Text);
            sb.AppendLine("Phone: " + txtStaffPhone.Text);
            sb.AppendLine("");
            sb.AppendLine("Additional Information: " + txtStaffInfo.Text);
            return sb.ToString();
        }

        protected void SendToRequestor(string email) 
        {
            // Need to send email to Tabs
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Dear " + email + ",");
            sb.AppendLine("Congratulations! You’re now one step closer to starting your boarding school adventure! Expect to hear from (list of schools they contacted, separated by commas, with “and” inserted between penultimate and final schools in list) very soon and thanks for taking the first step toward your future on boardingschools.com!");
            sb.AppendLine("");
            sb.AppendLine("The Association of Boarding Schools (TABS) is the official home of college-prep boarding schools and the definitive guide for students and families. We hope you’ll continue to visit boardingschools.com to learn more about some of the word’s leading schools and to see how they’re preparing young people for college success—and for full and rewarding lives.");
            sb.AppendLine("");
            sb.AppendLine("Have a great week!");
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");
            
            InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(email);
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "Your TABS Request Has Been Processed!", sb.ToString(), false);
        }

        public string GetStudent() 
        {
            StringBuilder sb = new StringBuilder();
            if (parentInfo1.Visible == true) // Parent Needed
            {
                sb.AppendLine("Parent/Guardian First Name: " + txtPFName1.Text);
                sb.AppendLine("Parent/Guardian Last Name: " + txtPLName1.Text);
                sb.AppendLine("Parent/Guardian Email Address: " + txtPEmail1.Text);
            }

            sb.AppendLine("First Name: " + txtSFName1.Text);
            sb.AppendLine("Last Name: " + txtSLName1.Text);
            sb.AppendLine("Email: " + txtSEmail1.Text);
            sb.AppendLine("Address 1: " + txtSAdd1.Text);
            sb.AppendLine("Address 2: " + txtSAdd2.Text);
            sb.AppendLine("City: " + txtSCity1.Text);
            sb.AppendLine("Zip Code: " + txtSZip1.Text);
            sb.AppendLine("State: " + ddlStudentState1.SelectedItem.Text);
            sb.AppendLine("Country: " + ddlStudentCountry1.SelectedItem.Text);
            sb.AppendLine("Phone: " + txtSPhone1.Text);
            sb.AppendLine("");
            sb.AppendLine("Gender: " + rdoGender1.SelectedItem.Text);
            sb.AppendLine("Citizenship: " + txtSCitizen1.Text);
            sb.AppendLine("I am interested in applying for: " + rdoApply1.SelectedItem.Text);
            sb.AppendLine("I am currently in grade: " + txtSGrade1.Text);
            sb.AppendLine("I am applying for grade: " + txtSApplyingFor.Text);
            sb.AppendLine("I'd like to start in: " + ddlStudentStart.SelectedValue);
            sb.AppendLine("My current school is: " + txtCurrentSchool1.Text);
            sb.AppendLine("Top 3 Academic Interests: " + txtSAcademic1 + ", " + txtSAcademic2.Text + ", " + txtSAcademic3.Text);
            sb.AppendLine("Top 3 Extracurricular Interests: " + txtSExtra1 + ", " + txtSExtra2.Text + ", " + txtSExtra3.Text);
            string t ="";
            if(chxSummer1.Checked) { t += "Summer Programs"; }
            if(chxESL1.Checked) {t+= "ESL"; }
            sb.AppendLine("Other Interests: " + t);
            sb.AppendLine("Additional Information: " + txtAddInfo.Text);
            return sb.ToString();

        }

        public string GetParent() {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Parent/Guardian First Name: " + txtParentFName.Text);
            sb.AppendLine("Parent/Guardian Last Name: " + txtParentLName.Text);
            sb.AppendLine("Parent/Guardian email Address: " + txtParentEmail.Text);
            sb.AppendLine("Address 1: " + txtParentAdd1.Text);
            sb.AppendLine("Address 2: " + txtParentAdd2.Text);
            sb.AppendLine("City: " + txtParentCity.Text);
            sb.AppendLine("Zip Code: " + txtParentZip.Text);
            sb.AppendLine("State: " + ddlParentState.SelectedItem.Text);
            sb.AppendLine("Country: " + ddlParentCountry.SelectedItem.Text);
            sb.AppendLine("Phone: " + txtParentPhone.Text);
            sb.AppendLine("");
            sb.AppendLine("Student First Name: " + txtParentSFName.Text);
            sb.AppendLine("Student Last Name: " + txtParentSLName.Text);
            sb.AppendLine("Gender: " + rdoGender2.SelectedItem.Text);
            sb.AppendLine("Citizenship: " + txtSCitizen2.Text);
            sb.AppendLine("I am interested in applying for: " + rdoApply2.SelectedItem.Text);
            sb.AppendLine("I am currently in grade: " + txtSGrade2.Text);
            sb.AppendLine("I am applying for grade: " + txtApplyingGrade2.Text);
            sb.AppendLine("I'd like to start in: " + ddlPStart.SelectedValue);
            sb.AppendLine("My current school is: " + txtSchool2.Text);
            sb.AppendLine("Top 3 Academic Interests: " + txtSAcademic4.Text + ", " + txtSAcademic5.Text + ", " + txtSAcademic6.Text);
            sb.AppendLine("Top 3 Extracurricular Interests: " + txtSExtra4.Text + ", " + txtSExtra5.Text + ", " + txtSExtra6.Text);
            string t = "";
            if (chxSummer2.Checked) { t += "Summer Programs"; }
            if (chxESL2.Checked) { t += "ESL"; }
            sb.AppendLine("Other Interests: " + t);
            sb.AppendLine("Additional Information: " + txtAddInfo2.Text);
            return sb.ToString();

        }

        public void SendToParent(string email) 
        {
            // Need to send email to Tabs
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Dear " + txtPFName1.Text + " " + txtPLName1.Text + ",");
            sb.AppendLine("Hello!  Recently, your child, " + txtSFName1.Text + " " + txtSLName1.Text + ", visited The Association of Boarding Schools’ website, boardingschools.com, and either requested a complimentary copy of NowBoarding, our magazine and directory, or submitted a form seeking information from one or more of our member schools.  In making the request, "  + txtSFName1.Text + " supplied us with the following information:");
            sb.AppendLine("");
            sb.AppendLine(GetStudent());
            sb.AppendLine("");
            sb.AppendLine("As a matter of policy, we inform parents and legal guardians about how we collect, use, and disclose personal information from children under 13 years of age.  Please feel free to read our complete privacy policy at your convenience, available at the bottom of any page of our site.  If you have any questions, just give us a call (828-258-5354) or send us a note (tabs@tabs.org), and we’ll do our best to help.");
            sb.AppendLine("TABS is a non-profit organization representing approximately 300 college-prep boarding schools in the U.S., Canada, and overseas.  We hope you’ll visit boardingschools.com to learn about some of the world’s leading schools: come see how they’re preparing young people for great colleges— and for full and rewarding lives.");
            sb.AppendLine("");
            sb.AppendLine("For now, best wishes for a wonderful week!");
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");

            InfrastructureClass infra = new InfrastructureClass();
            List<string> to, cc, bc;
            to = new List<string>();
            cc = new List<string>();
            bc = new List<string>();
            to.Add(email);
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "TABS Activity Notification", sb.ToString(), false);
        }



    }
}