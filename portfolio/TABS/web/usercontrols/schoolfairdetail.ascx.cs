using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using System.Data;

namespace TABS_UserControls.usercontrols {
    public partial class schoolfairdetail : System.Web.UI.UserControl {

        SchoolClass logic = new SchoolClass();

        protected void Page_Load(object sender, EventArgs e) 
        {
            int id;
            if (Request.Params["ID"] != null) {
                id = Convert.ToInt32(Request.Params["ID"]);
                DataTable dt = logic.getSchoolEventByEventId(id);

                lblSchoolName.Text = dt.Rows[0]["schoolname"].ToString();

                List<String> type = new List<string>();
                string typeVal = "";
                if (Convert.ToBoolean(dt.Rows[0]["coed"]) == true) 
                {
                    type.Add("Coed");
                }
                if (Convert.ToBoolean(dt.Rows[0]["allboys"]) == true) {
                    type.Add("All Boys");
                }
                if (Convert.ToBoolean(dt.Rows[0]["allgirls"]) == true) {
                    type.Add("All Girls");
                }
                if (Convert.ToBoolean(dt.Rows[0]["military"]) == true) {
                    type.Add("Military");
                }
                if (Convert.ToBoolean(dt.Rows[0]["preprofessionalarts"]) == true) {
                    type.Add("Pre-Professional Arts");
                }
                if (Convert.ToBoolean(dt.Rows[0]["secondary"]) == true) {
                    type.Add("Secondary");
                }
                if (Convert.ToBoolean(dt.Rows[0]["junior"]) == true) {
                    type.Add("Junior");
                }
                if (Convert.ToBoolean(dt.Rows[0]["elementary"]) == true) {
                    type.Add("Elementary");
                }

                for (int i = 0; i < type.Count; i++) {

                    if (i != type.Count) {
                        typeVal += type[i] + ", ";
                    } else {
                        typeVal += type[i];
                    }
                }



                lblSchoolType.Text = typeVal;
                lblEventName.Text = dt.Rows[0]["profileevent"].ToString();
                lblTime.Text = dt.Rows[0]["startdate"].ToString() + " to " + dt.Rows[0]["enddate"].ToString();
                lblLoc.Text = dt.Rows[0]["location"].ToString() + ", " + dt.Rows[0]["address1"].ToString() + ", " + dt.Rows[0]["city"].ToString() + ", " + dt.Rows[0]["state"].ToString() + ", " + dt.Rows[0]["country"].ToString();
                lblShortDesc.Text = dt.Rows[0]["shortdescription"].ToString();
                lblLongDesc.Text = dt.Rows[0]["longdescription"].ToString();
                lblContact.Text = dt.Rows[0]["contact"].ToString() + ", " + dt.Rows[0]["phone"].ToString();
                hlUrl.Text = dt.Rows[0]["url"].ToString();
                hlUrl.NavigateUrl = dt.Rows[0]["url"].ToString();
                backUrl.Text = "Back to Event Calendar";
                backUrl.NavigateUrl = "/find-a-school/explore-your-options/school-fairs.aspx";


            }
        }
    }
}