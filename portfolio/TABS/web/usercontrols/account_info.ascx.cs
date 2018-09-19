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
using TABS_UserControls.resources.code.DAL;

namespace TABS_UserControls.usercontrols
{
    public partial class account_info : System.Web.UI.UserControl
    {
        UserClass userlogic = new UserClass();
        int userid;

        protected void Page_Init(object sender, EventArgs e) {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }

            //userid = 1;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            UserDataset._tabs_usersDataTable dt = userlogic.getRenewalSchoolAccountInfo(userid);
            repAccountInfo.DataSource = dt;
            repAccountInfo.DataBind();
        }

        public string GetActive(bool active) {
            if (active == true) {
                return "Yes";
            } else { return "No"; }
        }

        public string GetStatus(string status) {
            if (String.IsNullOrEmpty(status)) {
                return "Not Renewed";
            } else { return status; }
        }
    }
}