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
    public partial class admission_app_form : System.Web.UI.UserControl
    {
        SchoolClass schoollogic = new SchoolClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            repAppFee.DataSource = schoollogic.getAllSchoolsApplicationFees();
            repAppFee.DataBind();
        }
    }
}