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
    public partial class pressroom_detail : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NewsClass logic = new NewsClass();
            DataTable dt;
            if (Request.Params["id"] != null) 
            {
                switch (Request.Params["section"].ToString())
                {
                    case "tabs":
                        //tabsnewsid, headline, publishdate, summary, article, [public], school, userid, createdate - Tabs
                        dt = logic.getTABNewsById(Convert.ToInt32(Request.Params["id"]));
                        lblHeadline.Text = dt.Rows[0]["headline"].ToString();
                        lblDate.Text = dt.Rows[0]["publishdate"].ToString();
                        lblSummary.Text = dt.Rows[0]["summary"].ToString();
                        lblBody.Text = dt.Rows[0]["article"].ToString();
                        break;
                    case "web":
                        //schoolnewsid, headline, source, url, publishdate, summary, userid, creatdate - School
                        dt = logic.getWebNewsById(Convert.ToInt32(Request.Params["id"]));
                        lblHeadline.Text = dt.Rows[0]["headline"].ToString();
                        lblSource.Text = dt.Rows[0]["source"].ToString();
                        lblDate.Text = dt.Rows[0]["publishdate"].ToString();
                        lblSummary.Text = dt.Rows[0]["summary"].ToString();
                        lblBody.Text = "";
                        break;
                    case "school":
                        //webnewsid, headline, source, url, publishdate, summary, userid, createdate - Web
                        dt = logic.getSchoolNewsById(Convert.ToInt32(Request.Params["id"]));
                        lblHeadline.Text = dt.Rows[0]["headline"].ToString();
                        lblSource.Text = dt.Rows[0]["source"].ToString();
                        lblDate.Text = dt.Rows[0]["publishdate"].ToString();
                        lblSummary.Text = dt.Rows[0]["summary"].ToString();
                        lblBody.Text = "";
                        break;
	                default:
                        //tabsnewsid, headline, publishdate, summary, article, [public], school, userid, createdate - Tabs
                        dt = logic.getTABNewsById(Convert.ToInt32(Request.Params["id"]));
                        lblHeadline.Text = dt.Rows[0]["headline"].ToString();
                        lblDate.Text = dt.Rows[0]["publishdate"].ToString();
                        lblSummary.Text = dt.Rows[0]["summary"].ToString();
                        lblBody.Text = dt.Rows[0]["article"].ToString();
                        break;
                }
                


            }
        }
    }
}