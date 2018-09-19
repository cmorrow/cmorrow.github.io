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
      public partial class asia_fair : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.FairsIntroClass fairIntro = new TABS_UserControls.resources.code.BAL.FairsIntroClass();
            private TABS_UserControls.resources.code.BAL.SpecificFairClass specificFair = new TABS_UserControls.resources.code.BAL.SpecificFairClass();
            private TABS_UserControls.resources.code.BAL.LanguageClass languageFair = new TABS_UserControls.resources.code.BAL.LanguageClass();
            private TABS_UserControls.resources.code.BAL.SpedificFairSchooClass schoolFair = new TABS_UserControls.resources.code.BAL.SpedificFairSchooClass();
            DataTable dtSpecificFair = new DataTable();
            DataTable dtFairsIntro = new DataTable();
            private int fairId = 0;
            public string schoolsTable;
            public string bannerPath;
            public string pdfPath;

            protected void Page_Load(object sender, EventArgs e)
            {
                  //populate the table of available fairs
                  fairId = Convert.ToInt16(Request.QueryString["id"]);
                  DataTable dtActiveFairs = specificFair.GetActiveFairsByYearGreaterEqualDate(specificFair.GetfairYearToDisplay().ToString(), DateTime.Now);
                  repFairs.DataSource = dtActiveFairs;
                  repFairs.DataBind();


                  //Get the specific fair data
                  //if there is not a valid id
                  if (fairId > 0)
                  {
                        dtSpecificFair = specificFair.GetSpecificFairById(fairId);
                  }
                  else
                  {
                        //get the first city in the list
                        dtSpecificFair = specificFair.GetSpecificFairById(Convert.ToInt32(dtActiveFairs.Rows[0]["id"]));
                  }
                  //get the fair intro data that is common to all fairs for the year
                  if (dtSpecificFair.Rows.Count > 0)
                  {
                        dtFairsIntro = fairIntro.GetFairsIntroTextBySpecificFairId(Convert.ToInt32(dtSpecificFair.Rows[0]["id"]));
                  }
                  //if no data get the current year's
                  if (dtFairsIntro.Rows.Count < 1)
                  {
                        dtFairsIntro = fairIntro.GetFairIntroByYear(DateTime.Today.Year.ToString());
                  }
                  
                  if (dtFairsIntro.Rows.Count > 0)
                  {
                        bannerPath = dtFairsIntro.Rows[0]["bannerpath"].ToString();
                        pdfPath = dtFairsIntro.Rows[0]["pdfPath"].ToString();
                        writeHoteldata();
                        writeFairData();
                        writeFairSchoolData();
                        writeEventdata();
                  }
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
            }

            public string GetCultureMonth(string dateStr)
            {
                  DateTime date = Convert.ToDateTime(dateStr);
                  string asdf = date.ToString("MMMM");
                  //  return System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.MonthNames[(int)(Convert.ToDateTime(date)).DayOfWeek];
                  return asdf;
            }

            /// <summary>
            /// Get hotel data for a specified hotel - english
            /// </summary>
            public void writeHoteldata()
            {
                  lbHotelName.Text = "<a href ='" + dtSpecificFair.Rows[0]["hotelUrl"] + "'>" + dtSpecificFair.Rows[0]["hotel"] + "</a>";
                  lbHotelLocation.Text = dtSpecificFair.Rows[0]["hotelLocation"].ToString();
            }

            public void writeEventdata()
            {
                  rpEvents.DataSource = specificFair.GetSpecificFairEventDataByFairId(fairId);
                  rpEvents.DataBind();
            }

            public void writeFairData()
            {
                  //
                  DataTable dt = specificFair.GetSpecificFairById(fairId);
                  if (dt.Rows.Count > 0)
                  {
                        lbforSchools.Text = dtFairsIntro.Rows[0]["forSchools"].ToString();
                        lbHotelFairDate.Text = GetCultureDay(dt.Rows[0]["date"].ToString()) + ", " + GetCultureMonth(dt.Rows[0]["date"].ToString()) + " " + Convert.ToDateTime(dt.Rows[0]["date"].ToString()).Day;
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
                  }
            }

            //public void writeFairSchoolData()
            //{
            //      schoolsTable = "";
            //      DataTable dt = schoolFair.GetFairSchoolsDataByFairId(fairId);
            //      int cellCounter = 1;
            //      for (int i = 0; i < dt.Rows.Count; i++)
            //      {
            //            ArrayList dtProperties = new ArrayList();
            //            dtProperties.Add(dt.Rows[i]["fairSchoolName"].ToString());
            //            dtProperties.Add(dt.Rows[i]["fairSchoolCity"].ToString());
            //            dtProperties.Add(dt.Rows[i]["fairSchoolState"].ToString());
            //            dtProperties.Add(dt.Rows[i]["fairSchoolContactEmail"].ToString());
            //            dtProperties.Add(dt.Rows[i]["fairSchoolContactName"].ToString());
            //            dtProperties.Add(dt.Rows[i]["fairSchoolUrl"].ToString());
            //            if (cellCounter == 1)
            //            {
            //                 // schoolsTable = schoolsTable + "<tr>";
            //            }

            //            schoolsTable = schoolsTable + buildTableCell(dtProperties);
            //            if (cellCounter == 2)
            //            {
            //                  schoolsTable = schoolsTable + "<div class=\"clear\"></div>";
            //            }

            //            if (cellCounter == 1)
            //            {
            //                  cellCounter = 2;
            //            }
            //            else
            //            {
            //                  cellCounter = 1;
            //            }
            //      }
            //      if (cellCounter == 2)
            //      {
            //            schoolsTable = schoolsTable + "<div class=\"clear\"></div>";
            //      }

            //}

            //public string buildTableCell(ArrayList dtProperties)
            //{
            //      string schoolsTable = "<ul class=\"school\">";
            //      schoolsTable = schoolsTable + "<li><a href='" + dtProperties[5] + "' class='schoolName'>" + dtProperties[0] + "</a></li>";// fairSchoolName
            //      schoolsTable = schoolsTable + "<li>" + dtProperties[1] + ", " + dtProperties[2] + "</li>";//fairSchoolCity fairSchoolState
            //      schoolsTable = schoolsTable + "<li><b>Contact:</b> <a href='Mailto:" + dtProperties[3] + "'>" + dtProperties[4] + "</a></li>";//fairSchoolContactEmail fairSchoolContactName
            //      schoolsTable = schoolsTable + "</ul>";
            //      return schoolsTable;


            //}


            public void writeFairSchoolData()
            {
                  schoolsTable = "<table>";
                  DataTable dt = schoolFair.GetFairSchoolsDataByFairId((Convert.ToInt32(dtSpecificFair.Rows[0]["id"])));
                  int cellCounter = 1;
                  for (int i = 0; i < dt.Rows.Count; i++)
                  {
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

            public string buildTableCell(ArrayList dtProperties)
            {
                  string schoolsTable = "";
                  schoolsTable = schoolsTable + "<tr><td><a href='" + dtProperties[5] + "'>" + dtProperties[0] + "</a></td></tr>";// fairSchoolName
                  schoolsTable = schoolsTable + "<tr><td>" + dtProperties[1] + ", " + dtProperties[2] + "</td></tr>";//fairSchoolCity fairSchoolState
                  schoolsTable = schoolsTable + "<tr><td>" + dtProperties[4] + " " + "<a href='Mailto:" + dtProperties[3] + "'>" + dtProperties[5] + "</a></td></tr>";//fairSchoolContactEmail fairSchoolContactName
             
                  return schoolsTable;
            }


      }
}