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
    public partial class news_tabs : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.NewsClass newslogic = new TABS_UserControls.resources.code.BAL.NewsClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            // server-side binding
            repeatNews.ItemDataBound += new RepeaterItemEventHandler(repeatNews_ItemDataBound);
            if (!Page.IsPostBack)
            {
                repeatNews.DataSource = newslogic.getTop3TABSNewsForSchool();
                repeatNews.DataBind();
            }
        }

        void repeatNews_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string val;
            
            // summary
            Literal summary = (Literal)e.Item.FindControl("literalSummary");
            val = DataBinder.Eval(e.Item.DataItem, "summary").ToString();
            if (val.Length > 75) val = val.Substring(0, 75);
            summary.Text = val;

            // date
            Literal publishdate = (Literal)e.Item.FindControl("literalPublishDate");
            publishdate.Text = Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "publishdate")).ToShortDateString();
        }
    }
}