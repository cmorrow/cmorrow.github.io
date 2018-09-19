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
using TABS_UserControls.resources.code;
using TABS_UserControls.resources.code.BAL;

namespace TABS_UserControls.usercontrols
{
    public partial class friends_in_education : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var sponsors = new SponsorshipClass();

            if(!Page.IsPostBack)
            {
                boardingRep.DataSource = sponsors.GetFriendsByEducationType(1);
                boardingRep.DataBind();

                educationalRep.DataSource = sponsors.GetFriendsByEducationType(2);
                educationalRep.DataBind();

                sisterRep.DataSource = sponsors.GetFriendsByEducationType(3);
                sisterRep.DataBind();
            }
        }

      }
}