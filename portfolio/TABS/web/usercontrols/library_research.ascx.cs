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
    public partial class library_research : System.Web.UI.UserControl
    {
        NewsClass logic = new NewsClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                gridResearch.DataSource = logic.getLibraryContentsByType(1); //Research and Stats
                gridResearch.DataBind();
            }
            this.Page.Title = "Boarding School Research &amp; Stats - The Association of Boarding Schools - TABS";
        }

        protected void gridResearch_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) 
            {
                //[tabs.library].libraryid, [tabs.library].title, [tabs.library].author, [tabs.library].publishdate, [tabs.library].member, [tabs.library].librarytypeid, 
                //[tabs.librarytypes].librarytype, [tabs.library].summary, [tabs.library].article, [tabs.library].createdate, [tabs.library].pdfurl, [tabs.library].ispdf

                if(Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem,"ispdf")) == true)
                {
                    Image pImg = e.Row.FindControl("pdfImg") as Image;
                    pImg.Visible = true;
                }
                if (Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "member")) == true) {
                    Image lImg = e.Row.FindControl("lockImg") as Image;
                    lImg.Visible = true;

                    HyperLink link = e.Row.FindControl("lnkArticle") as HyperLink;
                    link.Text = DataBinder.Eval(e.Row.DataItem, "title").ToString();
                    if (Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "ispdf")) == true) {
                        link.NavigateUrl = DataBinder.Eval(e.Row.DataItem, "pdfurl").ToString();
                    } else {
                        link.NavigateUrl = "/for-schools/tabs-library/article-detail.aspx?articleId=" + DataBinder.Eval(e.Row.DataItem, "libraryid").ToString();
                    }


                    if (Session["userid"] != null) {
                        link.Enabled = true;
                    } else {
                        link.Enabled = false;
                    }
                } else 
                {
                    HyperLink link = e.Row.FindControl("lnkArticle") as HyperLink;
                    link.Enabled = true;
                    link.Text = DataBinder.Eval(e.Row.DataItem, "title").ToString();
                    if (Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "ispdf")) == true) {
                        link.NavigateUrl = DataBinder.Eval(e.Row.DataItem, "pdfurl").ToString();
                    } else {
                        link.NavigateUrl = "/for-schools/tabs-library/article-detail.aspx?articleId=" + DataBinder.Eval(e.Row.DataItem, "libraryid").ToString();
                    }
                }

                Label lbl = e.Row.FindControl("lblSummary") as Label;
                lbl.Text = DataBinder.Eval(e.Row.DataItem, "summary").ToString();
            }
        }
    }
}