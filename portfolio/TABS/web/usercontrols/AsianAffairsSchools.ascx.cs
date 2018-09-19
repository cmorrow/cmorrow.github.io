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
      public partial class AsianAffairsSchools : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.FairClass displayFairs = new TABS_UserControls.resources.code.BAL.FairClass();
            protected void Page_Load(object sender, EventArgs e)
            {
                  repSchools.DataSource = displayFairs.GetActiveFairByYear(DateTime.Now.Year.ToString());
                  repSchools.DataBind();
            }

            public string returnDate(string date)
            {
                  DateTime bbb = Convert.ToDateTime(date);
                  return bbb.Day.ToString();
            }

            public string GetCultureDay(string date)
            {
                 return System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.DayNames[(int)(Convert.ToDateTime(date)).DayOfWeek];
                  //return "bozo";
            }
            public string GetCultureMonth(string dateStr)
            {
                  DateTime date = Convert.ToDateTime(dateStr);
                  string asdf = date.ToString("MMMM");
                  //  return System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames[(int)(Convert.ToDateTime(date)).DayOfWeek];
                  return asdf;
            }


      }
}