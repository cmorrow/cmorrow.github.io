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

using System.Collections.Generic;

namespace TABS_UserControls.usercontrols
{
    public partial class recentlyviewed : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();

        private int schoolid;
        private int recent1;
        private int recent2;
        private int recent3;
        private int recent4;
        private int recent5;

        protected void Page_Init(object sender, EventArgs e)
        {
            bool val = false;

            try { schoolid = Convert.ToInt16(Request.QueryString["schoolid"]); }
            catch { schoolid = 0; }

            if (schoolid == Convert.ToInt16(Session["recent_1"])) val = true;
            if (schoolid == Convert.ToInt16(Session["recent_2"])) val = true;
            if (schoolid == Convert.ToInt16(Session["recent_3"])) val = true;
            if (schoolid == Convert.ToInt16(Session["recent_4"])) val = true;
            if (schoolid == Convert.ToInt16(Session["recent_5"])) val = true;

            if (val == false)
            {
                recent1 = schoolid;
                recent2 = Convert.ToInt16(Session["recent_1"]);
                recent3 = Convert.ToInt16(Session["recent_2"]);
                recent4 = Convert.ToInt16(Session["recent_3"]);
                recent5 = Convert.ToInt16(Session["recent_4"]);

                // reassign
                Session["recent_1"] = recent1;
                Session["recent_2"] = recent2;
                Session["recent_3"] = recent3;
                Session["recent_4"] = recent4;
                Session["recent_5"] = recent5;
            }
            else
            {
                recent1 = Convert.ToInt16(Session["recent_1"]);
                recent2 = Convert.ToInt16(Session["recent_2"]);
                recent3 = Convert.ToInt16(Session["recent_3"]);
                recent4 = Convert.ToInt16(Session["recent_4"]);
                recent5 = Convert.ToInt16(Session["recent_5"]);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // pull out all the recent items into queue
            if (recent1 > 0)
            {
                check_1.Text = " " + schoollogic.getSchoolBySchoolID(recent1)[0].schoolname;
                check_1.Visible = true;

            }
            if (recent2 > 0)
            {
                check_2.Text = " " + schoollogic.getSchoolBySchoolID(recent2)[0].schoolname;
                check_2.Visible = true;

            }
            if (recent3 > 0)
            {
                check_3.Text = " " + schoollogic.getSchoolBySchoolID(recent3)[0].schoolname;
                check_3.Visible = true;

            }
            if (recent4 > 0)
            {
                check_4.Text = " " + schoollogic.getSchoolBySchoolID(recent4)[0].schoolname;
                check_4.Visible = true;

            }
            if (recent5 > 0)
            {
                check_5.Text = " " + schoollogic.getSchoolBySchoolID(recent5)[0].schoolname;
                check_5.Visible = true;

            }

            // server-side binding
            buttonCompare.Click += new ImageClickEventHandler(buttonCompare_Click);
        }

        void buttonCompare_Click(object sender, ImageClickEventArgs e)
        {
            // validate logic here
            int counter = 0;
            string param = "";

            if (check_1.Checked)
            {
                counter += 1;
                param += "sc1=" + Session["recent_1"].ToString() + "&";
            }

            if (check_2.Checked)
            {
                counter += 1;
                param += "sc2=" + Session["recent_2"].ToString() + "&";
            }

            if (check_3.Checked)
            {
                counter += 1;
                param += "sc3=" + Session["recent_3"].ToString() + "&";
            }

            if (check_4.Checked)
            {
                counter += 1;
                param += "sc4=" + Session["recent_4"].ToString() + "&";
            }

            if (check_5.Checked)
            {
                counter += 1;
                param += "sc5=" + Session["recent_5"].ToString() + "&";
            }

            if (counter > 0)
            {
                Response.Redirect("/find-a-school/search-tools/school-comparison.aspx?" + param);
            }
        }
    }
}