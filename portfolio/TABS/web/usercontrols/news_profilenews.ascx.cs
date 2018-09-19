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
    public partial class news_profilenews : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();

        int schoolid;

        protected void Page_Init(object sender, EventArgs e)
        {
            try { schoolid = Convert.ToInt16(Request.QueryString["schoolid"]);}
            catch { schoolid = 0;}
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_profilenewsDataTable ds = schoollogic.getTop2ProfileNewsBySchoolID(schoolid);

                if (ds.Rows.Count > 0)
                {
                    repeatNews.DataSource = ds;
                    repeatNews.DataBind();
                }
                else
                {
                    literalDefault.Visible = true;
                }
            }
        }
    }
}