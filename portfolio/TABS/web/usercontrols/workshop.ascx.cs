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
    public partial class workshop : System.Web.UI.UserControl
    {
        #region Variable Declarations

        private WorkshopClass WorkshopBAL = new WorkshopClass();

        #endregion

        #region Event Handlers

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["workshopId"]))
                {
                    try
                    {
                        int workshopId = int.Parse(Request.QueryString["workshopid"]);

                        WorkshopDataset._tabs_WorkshopsDataTable dt = WorkshopBAL.GetWorkshop(workshopId);

                        if (dt.Rows.Count > 0)
                        {
                            // Get conference info
                            BindWorkshop(ref dt);

                            BindWorkshopContent(workshopId);
                        }
                    }
                    catch (FormatException)
                    {
                        lblError.Text = "Invalid workshop";
                        lblError.Visible = true;
                    }
                }
            }
        }

        #endregion

        #region Methods

        private void BindWorkshop(ref WorkshopDataset._tabs_WorkshopsDataTable dt)
        {
            litWorkshopTitle.Text = dt[0].WorkshopTitle;
        }

        private void BindWorkshopContent(int workshopId)
        {
            WorkshopDataset._tabs_WorkshopTabContentDataTable dt = WorkshopBAL.GetWorkshopTabContent(workshopId);

            // Bind the standard info
            WorkshopDataset._tabs_WorkshopTabContentRow dr = null;
            string tabName = string.Empty;
            string tabNameShort = string.Empty;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dr = dt[i];

                // Set the visibility of the tab
                tabName = dr.WorkshopTabType;

                tabNameShort = tabName.Replace(" ", string.Empty).Replace("-", string.Empty).Replace("&", string.Empty);

                // Get the tab list item
                HtmlContainerControl li = (HtmlContainerControl)ulTabs.FindControl("li" + tabNameShort);

                if (li != null)
                {
                    li.Visible = dr.VisibleOnSite;

                    // Get the literal holding the title
                    Literal litTitle = (Literal)li.FindControl("lit" + tabNameShort + "TabTitle");

                    if (litTitle != null)
                    {
                        litTitle.Text = tabName;
                    }

                    // Set the title of the content area
                    Literal litContentTitle = (Literal)divMainContainer.FindControl("lit" + tabNameShort + "ContentTitle");

                    if (litContentTitle != null)
                    {
                        litContentTitle.Text = tabName;
                    }

                    // Set the content of the tab
                    Literal litContent = (Literal)divMainContainer.FindControl("lit" + tabNameShort + "Content");

                    if (litContent != null)
                    {
                        litContent.Text = dr.TabContent;
                    }
                }
            }
        }

        #endregion
    }
}