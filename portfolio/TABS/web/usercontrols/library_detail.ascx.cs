using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols {
    public partial class library_detail : System.Web.UI.UserControl 
    {
        NewsClass logic = new NewsClass();

        protected void Page_Load(object sender, EventArgs e) 
        {
            int articleId = Convert.ToInt32(Request.QueryString["articleId"]);
            if (articleId < 1) {
                lbErrMsg.Text = "Error! No Article found.";
                lbErrMsg.Visible = true;
            } else {
                lbErrMsg.Text = "";
                lbErrMsg.Visible = false;
            }
            if (!IsPostBack) {
                repeatArticle.DataSource = logic.getLibraryByLibraryId(articleId);
                repeatArticle.DataBind();
            }


        }
    }
}