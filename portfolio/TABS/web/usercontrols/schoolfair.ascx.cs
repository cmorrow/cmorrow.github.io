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
    public partial class schoolfair : System.Web.UI.UserControl
    {
        SchoolClass schoollogic = new SchoolClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) {
                fairGrid.DataSource = schoollogic.getSchoolEventsByEventType(3); // School Fair Type
                fairGrid.DataBind();
            }

            this.Page.Title = "Boarding School Fairs - Explore Your Options - The Association of Boarding Schools - TABS";
        }
    }
}