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
      /// Must Get all fair related data by fair_city and fair_languageId
      /// </summary>
      public partial class asia_fair_findSchool1 : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.FairsIntroClass fairsIntro = new TABS_UserControls.resources.code.BAL.FairsIntroClass();
            private TABS_UserControls.resources.code.BAL.SpecificFairClass specificFair = new TABS_UserControls.resources.code.BAL.SpecificFairClass();
            private TABS_UserControls.resources.code.BAL.LanguageClass languageFair = new TABS_UserControls.resources.code.BAL.LanguageClass();
            private TABS_UserControls.resources.code.BAL.SpedificFairSchooClass schoolFair = new TABS_UserControls.resources.code.BAL.SpedificFairSchooClass();

            public int languageId = 0; 
            private string cityName;
            public string schoolsTable;
            public string pdfPath;
            public int fairIntroId;
            public DataTable dtFairIntroduction;
            public DataTable dtSpecificFair;
            public string bannerPath;

            protected void Page_Load(object sender, EventArgs e)
            {
                  //must have a language id and a city name
                  //if no city name get record with same city name and new language id
                  //if no language id default languageid to 1 (english)


                //  writeCookie();


                  languageId = Convert.ToInt16(Request.QueryString["languageId"]);
                  DataTable fairsDt = specificFair.GetActiveFairsByYearGreaterEqualDate(specificFair.GetfairYearToDisplay().ToString(), DateTime.Now);
                  DataTable dtActiveFairs = specificFair.GetActiveFairsByYearGreaterEqualDate(specificFair.GetfairYearToDisplay().ToString(), DateTime.Now);
                  if (fairsDt.Rows.Count > 0)
                  {
                        //create a new datatable
                        DataTable tb = new DataTable();
                        // create the columns

                        tb.Columns.Add("city");
                        tb.Columns.Add("country");
                        tb.Columns.Add("hotel");
                        tb.Columns.Add("date");
                        tb.Columns.Add("startTime");
                        tb.Columns.Add("endTime");
                        tb.Columns.Add("languageId");

                        for (int z = 0; z < fairsDt.Rows.Count; z++)
                        {
                              DataRow dr = tb.NewRow();
                              dr["city"] = fairsDt.Rows[z]["city"];
                              dr["country"] = fairsDt.Rows[z]["country"];
                              dr["hotel"] = fairsDt.Rows[z]["hotel"];
                              dr["date"] = fairsDt.Rows[z]["date"];
                              dr["startTime"] = fairsDt.Rows[z]["startTime"];
                              dr["endTime"] = fairsDt.Rows[z]["endTime"];
                              dr["languageId"] = fairsDt.Rows[z]["languageId"];
                              if (languageId > 0)
                              {
                                    dr["languageId"] = languageId;
                              }
                              else
                              {
                                    dr["languageId"] = fairsDt.Rows[z]["languageId"];
                              }
                              tb.Rows.Add(dr);
                        }
                        repFairs.DataSource = tb;
                        repFairs.DataBind();
                  }
                  

                  
                  FairCookie myCookie = new FairCookie();
                  myCookie = ReadCookie(myCookie);
                  if (languageId < 1)
                  {
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
                  cityName = Request.QueryString["cityName"];
                  if (string.IsNullOrEmpty(cityName))
                  {
                        //see if there is a value in the cookie
                        if (!string.IsNullOrEmpty(myCookie.CityName))
                        {
                              cityName = myCookie.CityName;
                        }
                        else
                        {
                              //get the first listing 
                              cityName = dtActiveFairs.Rows[0]["city"].ToString();
                        }
                  }
                  if ((languageId > 0) && (!string.IsNullOrEmpty(cityName)))
                  {
                        //all data is sent - load the page
                        dtSpecificFair = specificFair.GetSpecificFairByCityNameAndLanguageId(cityName, languageId);
                        //if there is no language being passed use english
                        if (dtSpecificFair.Rows.Count < 1)
                        {
                              dtSpecificFair = specificFair.GetSpecificFairByCityNameAndLanguageId(cityName, 1);
                        }
                        //if still no data use the first city in the list
                        if (dtSpecificFair.Rows.Count < 1)
                        {
                              dtSpecificFair = specificFair.GetSpecificFairByCityNameAndLanguageId(fairsDt.Rows[0]["city"].ToString(), 1);
                        }

                        lblCity.Text = dtSpecificFair.Rows[0]["city"].ToString() + ", " + dtSpecificFair.Rows[0]["country"].ToString();

                        //Get the fairIntro text
                        if (dtSpecificFair.Rows.Count > 0)
                        {
                              dtFairIntroduction = fairsIntro.GetFairIntroByYear(dtSpecificFair.Rows[0]["year"].ToString());
                        }
                  }
                  if (dtSpecificFair.Rows.Count > 0)
                  {
                        writeHoteldata();
                        writeFairData();
                        writeFairSchoolData();
                        writeEventdata(); 
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

            public void writeHoteldata()
            {
                  lbHotelName.Text = "<a href ='" + dtSpecificFair.Rows[0]["hotelUrl"] + "'>" + dtSpecificFair.Rows[0]["hotel"] + "</a>";
                  lbHotelLocation.Text = dtSpecificFair.Rows[0]["hotelLocation"].ToString();
            }

            public void writeEventdata()
            {
                  rpEvents.DataSource = specificFair.GetSpecificFairEventDataByFairId(Convert.ToInt32(dtSpecificFair.Rows[0]["id"]));
                  rpEvents.DataBind();
            }

            public void writeFairData()
            {
                  Session["fairId"] = dtSpecificFair.Rows[0]["id"];
                  lbforSchools.Text = dtSpecificFair.Rows[0]["forStudentsParents"].ToString();
                  lbHotelFairDate.Text = GetCultureDay(dtSpecificFair.Rows[0]["date"].ToString()) + ", " + GetCultureMonth(dtSpecificFair.Rows[0]["date"].ToString()) + " " + Convert.ToDateTime(dtSpecificFair.Rows[0]["date"].ToString()).Day;
                  lbHotelSetUpTime.Text = dtSpecificFair.Rows[0]["setUpStartTime"].ToString();
                  lbHotelStartTime.Text = dtSpecificFair.Rows[0]["startTime"].ToString();
                  lbHotelEndTime.Text = dtSpecificFair.Rows[0]["endTime"].ToString();
                  if (string.IsNullOrEmpty(dtSpecificFair.Rows[0]["specialInformation"].ToString()))
                  {
                        lbSpecialInfoHdr.Visible = false;
                        lbSpecialInfo.Visible = false;
                  }
                  else
                  {
                        lbSpecialInfoHdr.Visible = true;
                        lbSpecialInfo.Visible = true;
                        lbSpecialInfo.Text = dtSpecificFair.Rows[0]["specialInformation"].ToString();
                  }

                  pdfPath = dtFairIntroduction.Rows[0]["pdfPath"].ToString();
                  bannerPath = dtFairIntroduction.Rows[0]["bannerPath"].ToString();
                  lbRegistrationFreeText.Text = dtSpecificFair.Rows[0]["registrationFreeText"].ToString(); 
                   lbPartSchoolsText.Text = dtSpecificFair.Rows[0]["participatingSchoolsText"].ToString();
                  lbIfYouAreASchool.Text = dtSpecificFair.Rows[0]["StudentParentAttendFairLinkText"].ToString();
                  lbSecondndParagText.Text = dtSpecificFair.Rows[0]["secondndParagText"].ToString();
                  lbSpecialInfoHdr.Text = dtSpecificFair.Rows[0]["specialInfoHdr"].ToString();
                  lbPartSchoolHdr.Text = dtSpecificFair.Rows[0]["participatingSchoolsHdr"].ToString();
                  lbFairEventsHdr.Text = dtSpecificFair.Rows[0]["PreFairEventsHdr"].ToString();
                  ltRegThisFair.Text = dtSpecificFair.Rows[0]["regThisFairLinkText"].ToString();
            }


            public void writeFairSchoolData() 
            {
                schoolsTable = "<table>";
                DataTable dt = schoolFair.GetFairSchoolsDataByFairId((Convert.ToInt32(dtSpecificFair.Rows[0]["id"])));
                for (int i = 0; i < dt.Rows.Count; i++) {
                    ArrayList dtProperties = new ArrayList();
                    dtProperties.Add(dt.Rows[i]["fairSchoolName"].ToString());
                    dtProperties.Add(dt.Rows[i]["fairSchoolCity"].ToString());
                    dtProperties.Add(dt.Rows[i]["fairSchoolState"].ToString());
                    dtProperties.Add(dt.Rows[i]["fairSchoolContactEmail"].ToString());
                    dtProperties.Add(dt.Rows[i]["fairSchoolContactName"].ToString());
                    dtProperties.Add(dt.Rows[i]["fairSchoolUrl"].ToString());
                    schoolsTable = schoolsTable + buildTableCell(dtProperties);
                }

                schoolsTable = schoolsTable + "</table>";

            }

            public string buildTableCell(ArrayList dtProperties) {
                string schoolsTable = "";
                schoolsTable = schoolsTable + "<tr><td><b><a href='" + dtProperties[5] + "'>" + dtProperties[0] + "</a></b></td></tr>";// fairSchoolName
                schoolsTable = schoolsTable + "<tr><td>" + dtProperties[1] + ", " + dtProperties[2] + "</td></tr>";//fairSchoolCity fairSchoolState
                schoolsTable = schoolsTable + "<tr><td><a href='Mailto:" + dtProperties[3] + "'>" + dtProperties[4] + "</a> <br/>" + "<a target='_blank' href='" + dtProperties[5] + "'>" + dtProperties[5] + "</a><br/><br/></td></tr>";//fairSchoolContactEmail fairSchoolContactName

                return schoolsTable;
            }

            #region UL and LI
            //public void writeFairSchoolData() {
            //    schoolsTable = "";
            //    DataTable dt = schoolFair.GetFairSchoolsDataByFairId((Convert.ToInt32(dtSpecificFair.Rows[0]["id"])));
            //    int cellCounter = 1;
            //    for (int i = 0; i < dt.Rows.Count; i++) {
            //        ArrayList dtProperties = new ArrayList();
            //        dtProperties.Add(dt.Rows[i]["fairSchoolName"].ToString());
            //        dtProperties.Add(dt.Rows[i]["fairSchoolCity"].ToString());
            //        dtProperties.Add(dt.Rows[i]["fairSchoolState"].ToString());
            //        dtProperties.Add(dt.Rows[i]["fairSchoolContactEmail"].ToString());
            //        dtProperties.Add(dt.Rows[i]["fairSchoolContactName"].ToString());
            //        dtProperties.Add(dt.Rows[i]["fairSchoolUrl"].ToString());
            //        if (cellCounter == 1) {
            //            // schoolsTable = schoolsTable + "<tr>";
            //        }

            //        schoolsTable += buildTableCell(dtProperties);
            //        if (cellCounter == 2) {
            //            schoolsTable = schoolsTable + "<div class=\"clear\"></div>";
            //        }

            //        if (cellCounter == 1) {
            //            cellCounter = 2;
            //        } else {
            //            cellCounter = 1;
            //        }
            //    }
            //    if (cellCounter == 2) {
            //        schoolsTable = schoolsTable + "<div class=\"clear\"></div>";
            //    }

            //}

            //public string buildTableCell(ArrayList dtProperties)
            //{
            //    string schoolsTable = "<ul class=\"school\" style=\"width:250px;\">";
            //    schoolsTable = schoolsTable + "<li style=\"display:block;\"><a href='" + dtProperties[5] + "'>" + dtProperties[0] + "</a></li>";// fairSchoolName
            //      schoolsTable = schoolsTable + "<li style=\"display:block;\">" + dtProperties[1] + ", " + dtProperties[2] + "</li>";//fairSchoolCity fairSchoolState
            //      schoolsTable = schoolsTable + "<li style=\"display:block;\">" + dtProperties[4] + " " + "<a href='Mailto:" + dtProperties[3] + "'>" + dtProperties[5] + "</a></li>";//fairSchoolContactEmail fairSchoolContactName
            //       schoolsTable = schoolsTable + "</ul>";
            //      return schoolsTable;
            //}
            #endregion

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

            private void writeCookie()
            {
                  HttpCookie cookie = new HttpCookie("language");

                  //Set the cookies value
                  cookie.Values["cityName"] = "sai gon "; ;
                  cookie.Values["languageId"] = "1";

                  //     cookie.Values.Add;
                  //Set the cookie to expire in 1 minute
                  DateTime dtNow = DateTime.Now;

                  cookie.Expires = DateTime.Now.AddDays(5);

                  //Add the cookie
                  Response.Cookies.Add(cookie);

            }


      }
}