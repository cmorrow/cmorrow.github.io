using System;
using System.Collections;
using System.Collections.Generic;
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
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols {
    public partial class languageselector : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {

            LanguageClass lang = new LanguageClass();
            languageRepeater.DataSource = lang.GetAllLanguages();
            languageRepeater.DataBind();
        }

        protected void languageRepeater_ItemCommand(object source, RepeaterCommandEventArgs e) 
        {
            if (e.CommandName != "languageClick") return;
            var btn = e.CommandSource as LinkButton;
            if (btn == null) return;
            int id = 1;
            // id, language
            switch (btn.Text.ToLower()) 
            { case "english":
                    id = 1;
                    break;
                case "chinese" :
                    id = 2;
                    break;
                case "korean":
                    id = 3;
                    break;
                case "thai" :
                    id = 4;
                    break;
                case "hindi":
                    id = 5;
                    break;
                case "japanese":
                    id = 6;
                    break;
                case "vietnamese":
                    id = 7;
                    break;                    
                default:
                    id = 1;
                    break;
            }
            writeCookie(id);
            Session["newlang"] = btn.Text;
            Response.Redirect("/find-a-school/explore-your-options/asia-fairs.aspx?languageId=" + id.ToString());

        }

        public void writeCookie(int id) {

            HttpCookie cookie = new HttpCookie("language");
            cookie.Values["languageId"] = id.ToString();
            //Set the cookie to expire in 1 minute
            cookie.Expires = DateTime.Now.AddDays(5);
            Response.Cookies.Add(cookie);

        }


    }

}