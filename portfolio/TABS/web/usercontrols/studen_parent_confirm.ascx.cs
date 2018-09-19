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
    public partial class studen_parent_confirm : System.Web.UI.UserControl
    {
          private TABS_UserControls.resources.code.BAL.SpecificFairClass specificFair = new TABS_UserControls.resources.code.BAL.SpecificFairClass();

          protected void Page_Load(object sender, EventArgs e)
          {
            //    lbAddress1.Text = "Session[fairFormParent] is " + Session["fairFormParent"].ToString();
                if ((Session["fairFormParent"] != null) && ((Session["FairId"] != null)))
                {
                      FairFormParent parent = (FairFormParent)Session["fairFormParent"];
                      if (parent != null)
                      {
                            WriteFairData();
                            lbAddress1.Text = parent.Address1;
                            lbAddress2.Text = parent.Address2;
                            lbCity.Text = parent.City;
                            lbCountry.Text = parent.Country;
                            lbEmail.Text = parent.Email;
                            lbFamilyName.Text = parent.FamilyName;
                            lbGivenName.Text = parent.GivenName;
                            lbPhone.Text = parent.Phone;
                            lbZip.Text = parent.PostalCode;
                            lbState.Text = parent.State;
                            lbTitle.Text = parent.Title;
                            lbConfirmNumber.Text = parent.ConfirmationNumber.ToString();
                            if (parent.FairFormStudent[0] != null)
                            {
                                  if (!string.IsNullOrEmpty(parent.FairFormStudent[0].Age.ToString()))
                                  {
                                        lbStudAge1.Text = parent.FairFormStudent[0].Age.ToString();
                                  }
                                  else
                                  {
                                        lbStudAge1.Text = "Unknown";
                                  }
                                  lbStudFamilyName1.Text = parent.FairFormStudent[0].FamilyName;
                                  lbStudGender1.Text = parent.FairFormStudent[0].Gender;
                                  lbStudGivenName1.Text = parent.FairFormStudent[0].GivenName;

                            }
                            if (parent.FairFormStudent.Count > 1)
                            {
                                  if (parent.FairFormStudent[1] != null)
                                  {
                                        if (!string.IsNullOrEmpty(parent.FairFormStudent[1].Age.ToString()))
                                        {
                                              lbStudAge2.Text = parent.FairFormStudent[1].Age.ToString();
                                        }
                                        else
                                        {
                                              lbStudAge2.Text = "Unknown";
                                        }
                                        lbStudFamilyName2.Text = parent.FairFormStudent[1].FamilyName;
                                        lbStudGender2.Text = parent.FairFormStudent[1].Gender;
                                        lbStudGivenName2.Text = parent.FairFormStudent[1].GivenName;

                                  }
                            }
                            if (parent.FairFormStudent.Count > 2)
                            {
                                  if (parent.FairFormStudent[2] != null)
                                  {
                                        if (!string.IsNullOrEmpty(parent.FairFormStudent[2].Age.ToString()))
                                        {
                                              lbStudAge3.Text = parent.FairFormStudent[2].Age.ToString();
                                        }
                                        else
                                        {
                                              lbStudAge3.Text = "Unknown";
                                        }
                                        lbStudFamilyName3.Text = parent.FairFormStudent[2].FamilyName;
                                        lbStudGender3.Text = parent.FairFormStudent[2].Gender;
                                        lbStudGivenName3.Text = parent.FairFormStudent[2].GivenName;

                                  }
                            }
                      }
                }
                else
                { 
                      lblMsg.Text = "Your session has timed out.  Please check your email for you fair confirmation.";
                }
          }

        private void WriteFairData()
        {
              DataTable dt = specificFair.GetSpecificFairById(Convert.ToInt16(Session["FairId"].ToString()));
              lbFairCity.Text = dt.Rows[0]["city"].ToString();
              lbFairCountry.Text = dt.Rows[0]["country"].ToString();
              DateTime fairDate = (DateTime) dt.Rows[0]["date"];
              lbFairDay.Text = fairDate.DayOfWeek.ToString();
              lbFairDate.Text = fairDate.ToString("Y");
              lbEndTime.Text = dt.Rows[0]["endTime"].ToString();
              lbStartTime.Text = dt.Rows[0]["startTime"].ToString();
              lbFairHotel.Text = dt.Rows[0]["hotel"].ToString();
        }

        public string returnDate(string date)
        {
              DateTime bbb = Convert.ToDateTime(date);
              return bbb.Day.ToString();
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