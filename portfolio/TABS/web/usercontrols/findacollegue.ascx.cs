using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using System.Data;

namespace TABS_UserControls.usercontrols {
    public partial class findacollegue : System.Web.UI.UserControl 
    {
        UserClass userlogic = new UserClass();
        SchoolClass schoollogic = new SchoolClass();
        protected void Page_Load(object sender, EventArgs e) 
        {
            if (!Page.IsPostBack) {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_schoolsDataTable ds = schoollogic.getSchools();
                ddlSchools.DataSource = ds;
                ddlSchools.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e) 
        {
              gridUsers.DataSource = null;
              gridUsers.DataBind();
              if (txtFName.Text.Length > 0 && ddlSchools.SelectedIndex > 0) 
            {
                    this.BindByNameandSchool(txtFName.Text, txtLName.Text, Convert.ToInt32(ddlSchools.SelectedItem.Value));
            } 
            else if (txtFName.Text.Length > 0 && txtPosition.Text.Length > 0) 
            {

                this.BindByNameandTitle(txtFName.Text, txtLName.Text, txtPosition.Text);
            }
            else if (txtPosition.Text.Length > 0 && ddlSchools.SelectedIndex > 0) 
            {
                this.BindByTitleandSchool(txtPosition.Text, Convert.ToInt32(ddlSchools.SelectedItem.Value));
            }

            if (txtFName.Text.Length > 0 && ddlSchools.SelectedIndex > 0 && txtPosition.Text.Length > 0) 
            {
                  this.BindByNameTitleandSchool(Convert.ToInt32(ddlSchools.SelectedItem.Value), txtPosition.Text, txtFName.Text, txtLName.Text);
            }


        }

        public void BindByNameandTitle(string firstname, string lastname, string title) {
            gridUsers.DataSource = userlogic.getColleagueByNameandTitle(firstname, lastname, title);
            gridUsers.DataBind();
        }

        public void BindByNameandSchool(string firstname, string lastname, int schoolid) {
            gridUsers.DataSource = userlogic.getColleagueByNameandSchool(firstname, lastname, schoolid);
            gridUsers.DataBind();
        }

        public void BindByTitleandSchool(string title, int schoolid) {
            gridUsers.DataSource = userlogic.getColleagueByTitleandSchool(title, schoolid);
            gridUsers.DataBind();
        }

        public void BindByNameTitleandSchool(int schoolid, string title, string firstname, string lastname)
        {
              gridUsers.DataSource = userlogic.GetColleagueByNameAndTitleAndSchool(schoolid, title, firstname, lastname);
              gridUsers.DataBind();
        }

       
    }
}