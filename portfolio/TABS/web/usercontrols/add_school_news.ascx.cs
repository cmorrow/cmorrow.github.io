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
    public partial class add_school_news : System.Web.UI.UserControl
    {
        int newsId, schoolid, userid;
        NewsClass newslogic = new NewsClass();
        UserClass userlogic = new UserClass();

        protected void Page_Init(object sender, EventArgs e) {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            try { schoolid = userlogic.getSchoolByUserId(userid)[0].schoolid; } catch { schoolid = 0; }
            try { newsId = Convert.ToInt16(Request.QueryString["id"]); } catch { newsId = 0; }
            //userid = 1;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                //if (Request.QueryString["id"] != null) {
                //    newsId = Convert.ToInt16(Request.QueryString["id"].ToString());
                //} else {
                //    newsId = 0;
                //}

                if (newsId > 0) {
                    DataTable dt = newslogic.getProfileNewsById(newsId);
                    txtDate.Text = dt.Rows[0]["publishdate"].ToString();
                    txtHeadline.Text = dt.Rows[0]["headline"].ToString();
                    txtSource.Text = dt.Rows[0]["source"].ToString();
                    txtSummary.Text = dt.Rows[0]["summary"].ToString();
                    txtUrl.Text = dt.Rows[0]["url"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e) 
        {
            if (newsId > 0) 
            {
                newslogic.updateProfileNews(txtHeadline.Text, txtSource.Text, txtUrl.Text, Convert.ToDateTime(txtDate.Text), txtSummary.Text, schoolid, newsId);
            } 
            else 
            {
                newslogic.addProfileNews(txtHeadline.Text, txtSource.Text, txtUrl.Text, Convert.ToDateTime(txtDate.Text), txtSummary.Text, schoolid);
            }

            Response.Redirect("/for-schools/edit-school-profile.aspx");

        }

        protected void btnCancel_Click(object sender, EventArgs e) {
            Response.Redirect("/for-schools/edit-school-profile.aspx");
        }
    }
}