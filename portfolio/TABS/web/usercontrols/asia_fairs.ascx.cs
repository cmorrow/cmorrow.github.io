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
      public partial class asia_fairs : System.Web.UI.UserControl
      {
            public string pdfPath;
            public string bannerPath;
            private TABS_UserControls.resources.code.BAL.SpecificFairClass displayFairs = new TABS_UserControls.resources.code.BAL.SpecificFairClass();
            private TABS_UserControls.resources.code.BAL.FairsIntroClass fairIntro = new TABS_UserControls.resources.code.BAL.FairsIntroClass();
            protected void Page_Load(object sender, EventArgs e)
            {
                  string yearToDisplay = displayFairs.GetfairYearToDisplay().ToString();
                  DataTable dtFairs = displayFairs.GetActiveFairsByYearGreaterEqualDate(yearToDisplay, DateTime.Now);
                  if (dtFairs.Rows.Count > 0)
                  {
                        repFairs.DataSource = dtFairs;
                        repFairs.DataBind();
                  }
                  GetCurrentAsianFairIntroPage();

                  this.Page.Title = "Asia Fairs - Participating Boarding Schools - The Association of Boarding Schools - TABS";

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
              DateTime   date = Convert.ToDateTime(dateStr);
                  string asdf = date.ToString("MMMM");
                //  return System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames[(int)(Convert.ToDateTime(date)).DayOfWeek];
                  return asdf;
            }

            /// <summary>
            /// gets fairs intro text (english only)
            /// </summary>
            public void GetCurrentAsianFairIntroPage()
            {
                  string currentYear = DateTime.Now.Year.ToString();
                  DataTable dt = fairIntro.GetFairIntroByYear(currentYear);
                  if (dt.Rows.Count > 0)
                  {
                        lbForSchools.Text = dt.Rows[0]["forSchools"].ToString();
                        lbFairCostsTab.Text = dt.Rows[0]["FairCostsTab"].ToString();
                        lbReservations.Text = dt.Rows[0]["hotelFlightReservationsTabs"].ToString();
                        lbGeneralInfo.Text = dt.Rows[0]["generalInfoTabs"].ToString();
                        pdfPath = dt.Rows[0]["pdfPath"].ToString();
                        bannerPath = dt.Rows[0]["bannerPath"].ToString();
                  }
            }

      }
}