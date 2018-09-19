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

using umbraco.presentation.nodeFactory;

namespace TABS_UserControls.usercontrols
{
    public partial class breadcrumb : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Node currentpage = Node.GetCurrent();

            // final link
            linkFinal.Text = currentpage.Name;

            // second link - does not exist if parent is home
            if (currentpage.Parent != null)
            {
                if (currentpage.Parent.Name != "Home")
                {
                    liSecondLink.Visible = true;
                    linkSecond.Text = currentpage.Parent.Name;
                    linkSecond.NavigateUrl = currentpage.Parent.NiceUrl;

                    // first link - does not exist if parent is home
                    if (currentpage.Parent.Parent != null)
                    {
                        if (currentpage.Parent.Parent.Name != "Home")
                        {
                            liFirstLink.Visible = true;
                            linkFirst.Text = currentpage.Parent.Parent.Name;
                            linkFirst.NavigateUrl = currentpage.Parent.Parent.NiceUrl;
                        }
                    }
                }
            }
        }
    }
}