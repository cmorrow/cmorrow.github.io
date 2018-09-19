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
using System.Globalization;

namespace TABS_UserControls.usercontrols {
    public partial class schoolcomparison : System.Web.UI.UserControl {
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        private int school1;
        private int school2;
        private int school3;
        private int school4;
        private int school5;
        private int totalcount1, totalcount2, totalcount3, totalcount4, totalcount5;
        DataTable dt1, dt2, dt3, dt4, dt5;

        protected void Page_Init(object sender, EventArgs e) {
            try { school1 = Convert.ToInt16(Request.QueryString["sc1"]); } catch { school1 = 0; }
            try { school2 = Convert.ToInt16(Request.QueryString["sc2"]); } catch { school2 = 0; }
            try { school3 = Convert.ToInt16(Request.QueryString["sc3"]); } catch { school3 = 0; }
            try { school4 = Convert.ToInt16(Request.QueryString["sc4"]); } catch { school4 = 0; }
            try { school5 = Convert.ToInt16(Request.QueryString["sc5"]); } catch { school5 = 0; }
        }

        protected void Page_Load(object sender, EventArgs e) {
            dt1 = schoollogic.getSchoolOverviewBySchoolID(school1);
            repeatSchool1.DataSource = dt1;
            if (school1 > 0) 
            {
                try
                {
                    totalcount1 = Convert.ToInt16(dt1.Rows[0]["boystotal"].ToString()) + Convert.ToInt16(dt1.Rows[0]["girlstotal"].ToString());
                }
                catch
                {
                    totalcount1 = 0;
                }
                repeatSchool1.DataBind();
            }
            dt2 = schoollogic.getSchoolOverviewBySchoolID(school2);
            repeatSchool2.DataSource = dt2;

            if (school2 > 0) 
            {
                try
                {
                    totalcount2 = Convert.ToInt16(dt2.Rows[0]["boystotal"].ToString()) + Convert.ToInt16(dt2.Rows[0]["girlstotal"].ToString());
                }
                catch
                {
                    totalcount2 = 0;
                }
                repeatSchool2.DataBind();
            }
            dt3 = schoollogic.getSchoolOverviewBySchoolID(school3);
            repeatSchool3.DataSource = dt3;
            
            if (school3 > 0) 
            {
                try
                {
                    totalcount3 = Convert.ToInt16(dt3.Rows[0]["boystotal"].ToString()) + Convert.ToInt16(dt3.Rows[0]["girlstotal"].ToString());
                }
                catch
                {
                    totalcount3 = 0;
                }
                repeatSchool3.DataBind();
            }
            dt4 = schoollogic.getSchoolOverviewBySchoolID(school4);
            repeatSchool4.DataSource = dt4;
            
            if (school4 > 0) 
            {
                try
                {
                    totalcount4 = Convert.ToInt16(dt4.Rows[0]["boystotal"].ToString()) + Convert.ToInt16(dt4.Rows[0]["girlstotal"].ToString());
                }
                catch
                {
                    totalcount4 = 0;
                }
                repeatSchool4.DataBind();
            }
            dt5 = schoollogic.getSchoolOverviewBySchoolID(school5);
            repeatSchool5.DataSource = dt5;
            
            if (school5 > 0) 
            {
                try
                {
                    totalcount5 = Convert.ToInt16(dt5.Rows[0]["boystotal"].ToString()) + Convert.ToInt16(dt5.Rows[0]["girlstotal"].ToString());
                }
                catch
                {
                    totalcount5 = 0;
                }
                repeatSchool5.DataBind();
            }
        }

        public static string GetPercentage(int value, int total, int places)
        {    
            Decimal percent = 0;    
            string retval = string.Empty;    
            String strplaces = new String('0', places); 
   
            if(String.IsNullOrEmpty(value.ToString())) value = 0;    
            if(String.IsNullOrEmpty(total.ToString())) total = 0;  
  
            if(value == 0 || total == 0)    
            {        
                percent = 0;    
            }    
            else    
            {        
                percent = Decimal.Divide(value, total) * 100;                
                if(places > 0)        
                {            
                    strplaces = "." + strplaces;        
                }    
            }        
            retval = percent.ToString("#" + strplaces);    
            return retval;
        }

        public string CalculatePercentage(string val, int repId) {
            string retVal = String.Empty;
            Decimal percent = 0;
            String strplaces = new String('0', 0);    
            switch (repId) 
            {
                case 1:
                    if (val.Equals("0") || totalcount1.Equals(0))
                    {
                        retVal = "NA";
                    }
                    else
                    {
                        percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount1)) * 100;
                        retVal = percent.ToString("#" + strplaces) + "%";
                    }
                    break;
                case 2:
                    if (val.Equals("0") || totalcount2.Equals(0))
                    {
                        retVal = "NA";
                    }
                    else
                    {
                        percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount2)) * 100;
                        retVal = percent.ToString("#" + strplaces) + "%";
                    }
                    break;
                case 3:
                    if (val.Equals("0") || totalcount3.Equals(0))
                    {
                        retVal = "NA";
                    }
                    else
                    {
                        percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount3)) * 100;
                        retVal = percent.ToString("#" + strplaces) + "%";
                    }
                    break;
                case 4:
                    if (val.Equals("0") || totalcount4.Equals(0))
                    {
                        retVal = "NA";
                    }
                    else
                    {
                        percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount4)) * 100;
                        retVal = percent.ToString("#" + strplaces) + "%";
                    }
                    break;
                case 5:
                    if (val.Equals("0") || totalcount5.Equals(0))
                    {
                        retVal = "NA";
                    }
                    else
                    {
                        percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount5)) * 100;
                        retVal = percent.ToString("#" + strplaces) + "%";
                    }
                    break;
                default:
                    break;                  
            }

            return retVal;
        }

        public string DetermineStatus(string val) {
            if (val.Equals("0"))
            {
                return "Not Offered";
            } 
            else
            { 
                return "Offered"; 
            }
        }

        public string DeterminePaymentStatus(string val) {
            if (val.Equals("0")) {
                return "Not Available";
            } else {
                return "Available";
            }
        }

        public string ConvertToDollar(string val)
        {
            if (val != "N/A") 
            {
                try
                {
                    return "$" + String.Format("{0:c}", Decimal.Parse(val, NumberStyles.Currency).ToString()) + "/yr";
                }
                catch
                {
                    return "N/A";
                }
            } 
            else 
            { 
                return val; 
            }
        }

    }
}