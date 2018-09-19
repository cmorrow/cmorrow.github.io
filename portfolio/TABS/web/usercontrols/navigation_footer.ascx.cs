using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using TABS_UserControls.resources.code.BAL;
using TABS_UserControls.resources.code.DAL;

namespace TABS_UserControls.usercontrols {
    public partial class navigation_footer : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            var sponsors = new SponsorshipClass();

            if(!Page.IsPostBack)
            {
                // Bind Boarding School Networks
                boardRep.DataSource = sponsors.GetFriendsAbbrevation(1);
                boardRep.DataBind();

                // Bind Partner Organizations
                partnerRep.DataSource = sponsors.GetFriendsAbbrevation(2);
                partnerRep.DataBind();

                // Bind Sister Associations
                sisterRep.DataSource = sponsors.GetFriendsAbbrevation(3);
                sisterRep.DataBind();

                // Bind Sponsors
                //SponsorRep.DataSource = sponsors.GetAllSponsorships();
                SponsorRep.DataSource = sponsors.getRedandSignatureSponsors();
                SponsorRep.DataBind();
            }
        }
    }
}