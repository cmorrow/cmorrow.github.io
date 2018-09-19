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
      public partial class tabs_news : System.Web.UI.UserControl
      {
            private TABS_UserControls.resources.code.BAL.NewsClass newslogic = new TABS_UserControls.resources.code.BAL.NewsClass();

            protected void Page_Load(object sender, EventArgs e)
            {
                  if (!Page.IsPostBack)
                  {
                        repeatTABSNews1.DataSource = newslogic.getTABSNews();
                        repeatTABSNews1.DataBind();

                        repeatSchoolNews1.DataSource = newslogic.getSchoolNews();
                        repeatSchoolNews1.DataBind();

                        repeatWebNews1.DataSource = newslogic.getWebNews();
                        repeatWebNews1.DataBind();


                  }
                  int tabIndex = Convert.ToInt16(Request.QueryString["id"]);

                  if ((tabIndex >= 0) && (tabIndex < 3))
                  {
                        switch (tabIndex)
                        {
                              case 1:
                                    tab0_Click(null, null);
                                    break;
                              case 2:
                                    tab1_Click(null, null);
                                    break;
                              case 3:
                                    tab2_Click(null, null);
                                    break;
                        }
                  }
                  else
                  {
                        mvTabs.ActiveViewIndex = 0;
                  }
            }

            protected void tab0_Click(Object sender, EventArgs e)
            {
                  mvTabs.ActiveViewIndex = 0;

            }
            protected void tab1_Click(Object sender, EventArgs e)
            {
                  mvTabs.ActiveViewIndex = 1;

            }
            protected void tab2_Click(Object sender, EventArgs e)
            {

                  mvTabs.ActiveViewIndex = 2;
            }
      }
}