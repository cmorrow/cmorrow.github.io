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

using System.Data.Common;

namespace TABS_UserControls.usercontrols
{
    public partial class schoollist : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            repeatColLeft.ItemDataBound += new RepeaterItemEventHandler(repeatColLeft_ItemDataBound);
            repeatColRight.ItemDataBound += new RepeaterItemEventHandler(repeatColRight_ItemDataBound);
            if (!Page.IsPostBack)
            {
                string[] alphabetleft = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L" };
                string[] alphabetright = { "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
                repeatColLeft.DataSource = alphabetleft;
                repeatColLeft.DataBind();

                repeatColRight.DataSource = alphabetright;
                repeatColRight.DataBind();
            }
            
        }

        void repeatColRight_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rpt = (Repeater)e.Item.FindControl("repeatSchoolList");
            rpt.DataSource = schoollogic.getSchoolsByKeyword(e.Item.DataItem.ToString());
            rpt.DataBind();
        }

        void repeatColLeft_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rpt = (Repeater)e.Item.FindControl("repeatSchoolList");
            rpt.DataSource = schoollogic.getSchoolsByKeyword(e.Item.DataItem.ToString());
            rpt.DataBind();
        }
    }
}