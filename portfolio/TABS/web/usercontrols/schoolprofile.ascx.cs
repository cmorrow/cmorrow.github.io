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
using TABS_UserControls.resources.code.DAL;
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols
{
    public partial class schoolprofile : System.Web.UI.UserControl
    { 
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        private TABS_UserControls.resources.code.BAL.PhotoClass photologic = new TABS_UserControls.resources.code.BAL.PhotoClass();
        public int schoolid;
        public string contactschoolurl, schoolname, basegoogleUrl, basegoogleUrl2, weburl, emailurl, name, name2, script;
        DataTable dt;

        protected void Page_Init(object sender, EventArgs e)
        { 
            try { schoolid = Convert.ToInt16(Request.QueryString["schoolid"]); }
            catch { schoolid = 0; }
            contactschoolurl = "find-a-school/explore-your-options/contact-schools.aspx?sc=" + schoolid.ToString();
            basegoogleUrl = "<script>pageTracker.trackPageview('/schoolprofile/";
            basegoogleUrl2 = "gTrackPage('/schoolprofile/";
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            repeatSchoolProfile.ItemDataBound += new RepeaterItemEventHandler(repeatSchoolProfile_ItemDataBound);

            if (!Page.IsPostBack) {
                dt = schoollogic.getSchoolBySchoolID(schoolid);
                repeatSchoolProfile.DataSource = dt;
                repeatSchoolProfile.DataBind();
           }

        }


        void repeatSchoolProfile_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            DataTable dt2 = schoollogic.getGoogleSchoolBySchoolId(schoolid);
            //schoolid, schoolname, email, web
            weburl = dt2.Rows[0]["web"].ToString();
            emailurl = dt2.Rows[0]["email"].ToString();
            name = basegoogleUrl + dt2.Rows[0]["schoolname"].ToString();
            name2 = basegoogleUrl2 + dt2.Rows[0]["schoolname"].ToString();
            this.Page.Title = dt2.Rows[0]["schoolname"].ToString() + " - The Association of Boarding Schools - TABS";


            schoolname = dt2.Rows[0]["schoolname"].ToString();

            Image img = (Image)e.Item.FindControl("profileimage");
            img.ImageUrl = "/binary-image.aspx?schoolid=" + schoolid + "&section=logo";

            string scriptweb = name2 +  "/web');return true;";
            string scriptemail = name2 + "/email');return true;";
            string scriptcontact = name2 + "/contact');return true;";

            HtmlAnchor link = (HtmlAnchor)e.Item.FindControl("contactschoollink");
            link.HRef = "/find-a-school/explore-your-options/contact-schools.aspx?sc=" + schoolid;
            link.Attributes.Add("onclick", scriptcontact);

            HyperLink weblink = (HyperLink)e.Item.FindControl("schoolweb");
            weblink.Attributes.Add("onclick", scriptweb);

            HyperLink emaillink = (HyperLink)e.Item.FindControl("schoolemail");
            emaillink.Attributes.Add("onclick", scriptemail);
            
            TABS_UserControls.resources.code.DAL.PhotoDataset._tabs_photosDataTable ds = photologic.getPhotosBySchoolID(schoolid);
            if (ds.Rows.Count > 0)
            {
                if (ds[0].IslogoNull() == true) img.Visible = false;
            }


             //Call Google Tracking for School Name
            Page.ClientScript.RegisterStartupScript(this.GetType(), "MyScriptID", "<script language=JavaScript type=text/javascript>" + name2 + "');</script>");
            //Page.RegisterStartupScript("MyScriptID", "<script language=JavaScript type=text/javascript>" + name2 + "');</script>");

            // Fill Types
            Label typeLbl = (Label)e.Item.FindControl("lblSchoolTypes");
            DataTable schoolDT = schoollogic.getSchoolsTypeById(schoolid);
            //SchoolDataset._tabs_schoolsRow row = schoollogic.getSchoolsTypeById(schoolid)[0];
            List<string> temp = new List<string>();
            if (Convert.ToBoolean(schoolDT.Rows[0]["allboys"].ToString())) {
                temp.Add("All Boys");
            }
            if (Convert.ToBoolean(schoolDT.Rows[0]["allgirls"].ToString())) {
                temp.Add("All Girls");
            }
            if (Convert.ToBoolean(schoolDT.Rows[0]["coed"].ToString())) {
                temp.Add("Co-Ed");
            }
            if (!String.IsNullOrEmpty(schoolDT.Rows[0]["religion"].ToString())) {
                temp.Add(schoolDT.Rows[0]["religion"].ToString());
            }

            if (temp.Count > 1) 
            {
                for (int i = 0; i < temp.Count; i++) 
                {
                    if (i == temp.Count - 1) {
                        typeLbl.Text += temp[i];
                    } else {
                        typeLbl.Text += temp[i] + ", ";
                    }
                }
            } 
            else 
            {
                typeLbl.Text = temp[0].ToString();
            }
            //if (row.junior) {
            //    temp += ", Junior";
            //}
            //if (row.kindergarten) {
            //    temp += ", Kindergarten";
            //}
            //if (row.secondary) {
            //    temp += ", Secondar";
            //}
            //if (row.military) {
            //    temp += ", Military";
            //}
            
       }

       
    }
}