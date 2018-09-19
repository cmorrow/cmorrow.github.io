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

namespace TABS_UserControls.usercontrols
{
      public partial class article_detail : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.NewsClass newsLogic = new TABS_UserControls.resources.code.BAL.NewsClass();

            protected void Page_Load(object sender, EventArgs e)
            {
                  int newsId = Convert.ToInt32(Request.QueryString["tabsNewsId"]);
                  if (newsId < 1)
                  {
                        lbErrMsg.Text = "Error! No Article found.";
                        lbErrMsg.Visible = true;
                  }
                  else
                  {
                        lbErrMsg.Text = "";
                        lbErrMsg.Visible = false;
                  }
                  if (!IsPostBack)
                  {
                        repeatArticle.DataSource = newsLogic.getTABNewsById(newsId);
                        repeatArticle.DataBind();
                  }
            }
      }
}