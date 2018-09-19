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
using TABS_UserControls.resources.code.DAL;

namespace TABS_UserControls.usercontrols
{
    public partial class workshops : System.Web.UI.UserControl
    {
        #region Variable Declarations

        WorkshopClass WorkshopBAL = new WorkshopClass();

        private const int _NUMYEARS = 3;

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Bind Workshops
                WorkshopDataset._tabs_WorkshopsDataTable dt = WorkshopBAL.GetWorkshops();

                if (dt.Rows.Count > 0)
                {
                    lblrptWorkshops.Visible = false;
                    BindWorkshops();
                }
                else
                {
                    lblrptWorkshops.Visible = true;
                    rptWorkshops.Visible = false;
                }
            }

            this.Page.Title = "Boarding School Workshops - The Association of Boarding Schools - TABS";

        }

        #endregion

        #region Methods

        private DataTable GetYears()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("year");

            int currentYear = DateTime.Now.Year;

            for(int i = currentYear; i < currentYear + _NUMYEARS; i++)
            {
                DataRow dr = dt.NewRow();
                dr["year"] = i;

                dt.Rows.Add(dr);
            }

            return dt;
        }

        private void BindWorkshops()
        {
            DataTable dt = GetYears();

            if (dt.Rows.Count > 0)
            {
                rptWorkshops.DataSource = dt;
                rptWorkshops.DataBind();
            }
        }

        #endregion

        protected void rptWorkshops_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater repeater = (Repeater)e.Item.FindControl("rptWorkshopsByYear");

            DataRowView drv = (DataRowView)e.Item.DataItem;
            string year = drv.Row.ItemArray[0].ToString();

            WorkshopDataset._tabs_WorkshopsDataTable dt = WorkshopBAL.GetWorkshopsByYear(year);

            if (dt.Rows.Count > 0)
            {
                repeater.DataSource = dt;
                repeater.DataBind();
            }
            else
            {
                e.Item.Visible = false;
                repeater.Visible = false;
            }
        }
    }
}