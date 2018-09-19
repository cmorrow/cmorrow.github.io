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
    public partial class navigation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Node currentpage = Node.GetCurrent();
            string currentPageShort = currentpage.Name.ToLower().Replace(" ", "");
            Response.Write("CRAIG: " + currentPageShort);
            //Response.End();

            string[] for_home = { "", "Home", "RSS Feed", "Sitemap", "Legal" };
            string[] for_students = { "", "For Students", "Student Lounge", "The Basics", "5 Good Reasons", "Old School", "Famous Grads", "History - For Students", "Myths 101" };
            string[] for_parents = { "", "For Parents", "The Fundamentals", "The Advantages", "The Tradition", "Distinguished Alumni", "History - For Parents", "Common Misconceptions" };
            string[] find_school = { "", "Find a School", "School Browser", "Guided Search", "Guided Search Result", "A-Z School List", "School Profile", "Explore Your Options", "Campus Visits", "Asia Fairs", "School Fairs", "Summer Programs", "Contact Schools", "Request a Free Directory", "Find an Expert" };
            string[] how_apply = { "", "How to Apply", "Application", "Testing", "Expenses & Aid", "After You Apply", "International Applicants", "U.S Visas", "International Visas", "Administration Application Form" };
            string[] for_schools = { "", "For Schools", "Professional Development", "Forum", "Marketing", "Become a Member", "TABS Library", "Job Board", "Sponsors", "Educational Consultants", "Join TABS", "Conferences", "Workshops", "Asia Fairs", "Whats New", "Research and Stats", "News", "Articles and Op-Eds", "Bookstore", "Helpful Links", "Directors Cut", "Job Board", "Sponsors", "Educational Consultants", "TABS Calendar For Schools", "TABS Calendar Detail", "Workshop", "eNewsletter", "Student Parent Form", "Student Parent Confirm", "Add Job", "Job Listing", "Account Info", "Users", "Users Add", "My Profile", "Post Edit Jobs", "Edit School Profile", "Find a Colleague", "TAB Library", "Proposal Conference", "Proposal Thankyou", "Asia Fair" };
            string[] about_tabs = { "", "About Tabs", "About Us", "Corporate Sponsors", "About Sponsorship", "Friends In Education", "Articles", "Contact Us", "Our Mission", "Board of Trustees", "TABS Staff", "TABS Calendar", "TABS Calendar Event", "eNewsletter TABS", "Press Room", "Reports & Finances", "Careers with TABS", "Sponsorships", "Send A Idea" };

            if (Array.IndexOf(for_home, currentpage.Name) > 0) liHome.Attributes.Add("class", "current");

            if (Array.IndexOf(for_students, currentpage.Name) > 0) liStudents.Attributes.Add("class", "current");
            if (Array.IndexOf(for_parents, currentpage.Name) > 0) liParents.Attributes.Add("class", "current");
            if (Array.IndexOf(find_school, currentpage.Name) > 0)
            {
                liFindSchool.Attributes.Add("class", "current");

                AddClassToElement(currentPageShort, "highlight");
            }
            if (Array.IndexOf(how_apply, currentpage.Name) > 0) liApply.Attributes.Add("class", "current");
            if (Array.IndexOf(for_schools, currentpage.Name) > 0) liSchools.Attributes.Add("class", "current");
            if (Array.IndexOf(about_tabs, currentpage.Name) > 0) liTABS.Attributes.Add("class", "current");
			

            if (Session["userid"] == null) {
                sendidea.Visible = false;
                liMEMBER.Visible = false;
            }
        }

        private void AddClassToElement(string elementName, string className)
        {
            HtmlContainerControl li = (HtmlContainerControl)FindControlRecursive(Page, "li" + elementName.ToLower());

            if (li != null)
            {
                li.Attributes.Add("class", "highlight");
            }
        }
        
        private Control FindControlRecursive(Control root, string id)
        {
            try
            {
                if (root.ID.Equals(id))
                {
                    return root;
                }
            }
            catch (Exception)
            {
            }

            foreach (Control c in root.Controls)
            {
                Control t = FindControlRecursive(c, id);
                if (t != null)
                {
                    return t;
                }
            }

            return null;
        } 
    }
}