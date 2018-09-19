using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using System.Web.UI.HtmlControls;

namespace TABS_UserControls.usercontrols {
    public partial class searchresults : System.Web.UI.UserControl {
        string searchterm;
        SearchClass search = new SearchClass();
        List<string> searchlist = new List<string>(5);
        bool found = false;

        protected void Page_Init(object sender, EventArgs e) {
        }

        protected void Page_Load(object sender, EventArgs e) {
            try { searchterm = Request.QueryString["val"]; } catch { searchterm = ""; }
            try { if (Session["searchterms"] != null) { searchlist = Session["searchterms"] as List<string>; } } catch { searchlist = new List<string>(5); }


            if (!Page.IsPostBack) {
                txtSearchBox.Text = searchterm;
                this.CalculateRecentSearchTerms();
                gridSchool.DataSource = search.getSchoolsSearch(searchterm);
                gridSchool.DataBind();
                gridFamily.DataSource = search.getFamilyEvents(searchterm);
                gridFamily.DataBind();
                gridSchoolEvent.DataSource = search.getSchoolEvents(searchterm);
                gridSchoolEvent.DataBind();
                gridTabs.DataSource = search.getTABSEvents(searchterm);
                gridTabs.DataBind();
            }

            this.HideTabs();

            txtSearchBox.Attributes.Add("onkeydown", "if(event.which || event.keyCode){if ((event.which == 13) || (event.keyCode == 13)) {document.getElementById('" + btnSearch.UniqueID + "').click();return false;}} else {return true}; ");
            //string temp = "<script>javascript:highlightSearchTerms('" + searchterm + "');</script>";
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "timeout", temp, false);

        }

        protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e) {
            switch (ddlPageSize.SelectedValue.ToString()) {
                case "All":
                    gridSchool.AllowPaging = true;
                    gridSchool.PageSize = 5000;
                    gridSchoolEvent.AllowPaging = true;
                    gridSchoolEvent.PageSize = 5000;
                    gridFamily.AllowPaging = true;
                    gridFamily.PageSize = 5000;
                    gridTabs.AllowPaging = true;
                    gridTabs.PageSize = 5000;
                    break;
                case "10":
                    gridSchool.AllowPaging = true;
                    gridSchool.PageSize = 10;
                    gridSchoolEvent.AllowPaging = true;
                    gridSchoolEvent.PageSize = 10;
                    gridFamily.AllowPaging = true;
                    gridFamily.PageSize = 10;
                    gridTabs.AllowPaging = true;
                    gridTabs.PageSize = 10;
                    break;
                case "25":
                    gridSchool.AllowPaging = true;
                    gridSchool.PageSize = 25;
                    gridSchoolEvent.AllowPaging = true;
                    gridSchoolEvent.PageSize = 25;
                    gridFamily.AllowPaging = true;
                    gridFamily.PageSize = 25;
                    gridTabs.AllowPaging = true;
                    gridTabs.PageSize = 25;
                    break;
                case "50":
                    gridSchool.AllowPaging = true;
                    gridSchool.PageSize = 50;
                    gridSchoolEvent.AllowPaging = true;
                    gridSchoolEvent.PageSize = 50;
                    gridFamily.AllowPaging = true;
                    gridFamily.PageSize = 50;
                    gridTabs.AllowPaging = true;
                    gridTabs.PageSize = 50;
                    break;
                default:
                    break;
            }

            gridSchool.DataSource = search.getSchoolsSearch(txtSearchBox.Text);
            gridSchool.DataBind();
            gridFamily.DataSource = search.getFamilyEvents(txtSearchBox.Text);
            gridFamily.DataBind();
            gridSchoolEvent.DataSource = search.getSchoolEvents(txtSearchBox.Text);
            gridSchoolEvent.DataBind();
            gridTabs.DataSource = search.getTABSEvents(txtSearchBox.Text);
            gridTabs.DataBind();


        }

        protected void HideTabs() {
            int totaltabshidden = 0;
            if (gridSchool.Rows.Count == 0) {
                schoolTab.Visible = false;
                totaltabshidden += 1;
            }
            if (gridFamily.Rows.Count == 0) {
                familyTab.Visible = false;
                totaltabshidden += 1;
            }
            if (gridSchoolEvent.Rows.Count == 0) {
                schooleventTab.Visible = false;
                totaltabshidden += 1;
            }
            if (gridTabs.Rows.Count == 0) {
                tabsTab.Visible = false;
                totaltabshidden += 1;
            }
            if (totaltabshidden == 4) {
                lblNoResults.Visible = true;
            } else { lblNoResults.Visible = false; }
        }

        protected void gridSchool_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            //string val = searchTab.Value;
            //string name2 = "searchTabUpdate('" + val;
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScriptID", "<script language=JavaScript type=text/javascript>" + name2 + "');</script>");
            gridSchool.PageIndex = e.NewPageIndex;
            gridSchool.DataSource = search.getSchoolsSearch(txtSearchBox.Text);
            gridSchool.DataBind();
            //Page.RegisterClientScriptBlock("MyScript", "<script>searchTabUpdate('" + val + "');</script>"); 
        }

        protected void gridFamily_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            gridFamily.PageIndex = e.NewPageIndex;
            gridFamily.DataSource = search.getFamilyEvents(txtSearchBox.Text);
            gridFamily.DataBind();
        }

        protected void gridSchoolEvent_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            gridSchoolEvent.PageIndex = e.NewPageIndex;
            gridSchoolEvent.DataSource = search.getSchoolEvents(txtSearchBox.Text);
            gridSchoolEvent.DataBind();
        }

        protected void gridTabs_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            gridTabs.PageIndex = e.NewPageIndex;
            gridTabs.DataSource = search.getTABSEvents(txtSearchBox.Text);
            gridTabs.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e) {
            this.CalculateRecentSearchTerms();
            this.GetResults();
            this.HideTabs();
        }

        protected void CalculateRecentSearchTerms() {
            foreach (string s in searchlist) {
                if (s == txtSearchBox.Text) {
                    found = true;
                }
            }

            if (found == false) {
                if (searchlist.Count == 5) {
                    searchlist.RemoveAt(0);
                }
                searchlist.Add(txtSearchBox.Text);

            }

            if (searchlist.Count > 0) {
                repRecentSearch.DataSource = searchlist;
                repRecentSearch.DataBind();
            }

            Session["searchterms"] = searchlist;

        }

        protected void GetResults() {
            gridSchool.DataSource = search.getSchoolsSearch(txtSearchBox.Text);
            gridSchool.DataBind();
            gridFamily.DataSource = search.getFamilyEvents(txtSearchBox.Text);
            gridFamily.DataBind();
            gridSchoolEvent.DataSource = search.getSchoolEvents(txtSearchBox.Text);
            gridSchoolEvent.DataBind();
            gridTabs.DataSource = search.getTABSEvents(txtSearchBox.Text);
            gridTabs.DataBind();
        }

        public string ReturnBreifChars(string val) {
            if (val.Length > 150) {
                return val.Substring(0, 150);
            } else { return val; }
        }
    }
}