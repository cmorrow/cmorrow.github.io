using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace TABS_UserControls.usercontrols {
    public partial class navigation_misc : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) 
        {
            string url = Request.Url.AbsolutePath;
            if (url.Contains("asia-fairs"))
            {
                langLink.Style.Clear();
            }
            else
            {
                langLink.Style.Add("display","none");
            }

            if (Session["userid"] != null) {
                memberlink.InnerText = "You're Logged In";
            }

            if (Session["newlang"] != null) {
                languagelink.InnerText = Session["newlang"].ToString();
            } else { languagelink.InnerText = "english"; }
        }
    }
}