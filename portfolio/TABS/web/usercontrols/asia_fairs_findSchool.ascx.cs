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
      /// <summary>
      /// Populates the find a school - explore options - asia fairs
      /// shows a list of available fairs in english
      /// populates other text fields in selected language
      /// </summary>
      public partial class asia_fair_findSchool : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.FairsIntroClass fairsIntro = new TABS_UserControls.resources.code.BAL.FairsIntroClass();
            private TABS_UserControls.resources.code.BAL.SpecificFairClass specificFair = new TABS_UserControls.resources.code.BAL.SpecificFairClass();
            private TABS_UserControls.resources.code.BAL.LanguageClass languageFair = new TABS_UserControls.resources.code.BAL.LanguageClass();
            public int languageId = 0;
            public string languageIdStr;
            public string schoolsTable;
            public string bannerPath;
            //   public string pdfPath;
            public int fairIntroId;
            public DataTable dtFairIntroduction;
            public DataTable dtSpecificFair;
            protected void Page_Load(object sender, EventArgs e)
            {
                  // only need a language id - if no language Id default to English
                  languageId = Convert.ToInt32(Request.QueryString["languageId"]);
                  if (languageId < 1)
                  {
                        FairCookie myCookie = new FairCookie();
                        myCookie = ReadCookie(myCookie);

                        if (myCookie.LanguageId > 0) //see if there is a ccokie
                        {
                              languageId = myCookie.LanguageId;

                        }
                        else
                        {
                              DataTable bb = languageFair.GetLanguageByName("english");
                              languageId = Convert.ToInt32(bb.Rows[0]["id"]);
                        }
                  }
                  languageIdStr = languageId.ToString();
                  //Get the fairIntro text
                  string currentYear = DateTime.Now.Year.ToString();

                  DataTable fairsDt = specificFair.GetActiveFairsByYearGreaterEqualDate(specificFair.GetfairYearToDisplay().ToString(), DateTime.Now);
                  if (fairsDt.Rows.Count > 0)
                  {
                        repFairs.DataSource = fairsDt;
                        repFairs.DataBind();
                  }
                  dtFairIntroduction = fairsIntro.GetFairIntroByYear(currentYear);
                  if (dtFairIntroduction.Rows.Count > 0)
                  {
                        GetCurrentAsianFairPage();
                  }

                  this.Page.Title = "Asia Fairs - The Association of Boarding Schoo";

            }

            public string returnDate(string date)
            {
                  DateTime bbb = Convert.ToDateTime(date);
                  return bbb.Day.ToString();
            }

            public string GetCultureDay(string date)
            {
                  return System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.DayNames[(int)(Convert.ToDateTime(date)).DayOfWeek];
            }
            public string GetCultureMonth(string dateStr)
            {
                  DateTime date = Convert.ToDateTime(dateStr);
                  string asdf = date.ToString("MMMM");
                  //  return System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames[(int)(Convert.ToDateTime(date)).DayOfWeek];
                  return asdf;
            }

            public void GetCurrentAsianFairPage()
            {
                  lbForSchools.Text = dtFairIntroduction.Rows[0]["forStudentsParents"].ToString();
                  bannerPath = dtFairIntroduction.Rows[0]["bannerPath"].ToString();
            }

            public FairCookie ReadCookie(FairCookie myCookie)
            {
                  HttpCookie cookie = Request.Cookies["language"];
                  if (cookie != null)
                  {
                        if (cookie["languageId"] != null)
                        {
                              myCookie.LanguageId = Convert.ToInt32(cookie["languageId"].ToString());
                        }
                        if (cookie["cityName"] != null)
                        {
                              myCookie.CityName = cookie["cityName"].ToString();
                        }

                  }
                  return myCookie;
            }

            public void writeCookie2()
            {

                  HttpCookie cookie = new HttpCookie("language");
                  cookie["languageId"] = "1";
                  cookie["cityName"] = "fair 2 city";
                  Response.Cookies.Add(cookie);

            }

            private void writeCookie()
            {
                  HttpCookie cookie = new HttpCookie("language");

                  //Set the cookies value
                  cookie.Values["cityName"] = "fair 2 city"; ;
                  cookie.Values["languageId"] = "2";

                  //     cookie.Values.Add;
                  //Set the cookie to expire in 1 minute
                  DateTime dtNow = DateTime.Now;

                  cookie.Expires = DateTime.Now.AddDays(5);

                  //Add the cookie
                  Response.Cookies.Add(cookie);

            }
      }
}