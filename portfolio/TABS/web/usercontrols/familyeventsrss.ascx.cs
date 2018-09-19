using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using System.Data;
using System.Xml;
using System.Text;

namespace TABS_UserControls.usercontrols {
    public partial class familyeventsrss : System.Web.UI.UserControl 
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            RssClass rss = new RssClass();

            // Clear any previous output from the buffer
            Response.Clear();
            Response.ContentType = "text/xml";
            XmlTextWriter feedWriter
              = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);

            feedWriter.WriteStartDocument();

            // These are RSS Tags
            feedWriter.WriteStartElement("rss");
            feedWriter.WriteAttributeString("version", "2.0");

            feedWriter.WriteStartElement("channel");
            feedWriter.WriteElementString("title", "TABS Family Events");
            feedWriter.WriteElementString("link", "http://www.boardingschools.com");
            feedWriter.WriteElementString("description", "TABS");
            feedWriter.WriteElementString("copyright",
              "Copyright 2009 boardingschools.com. All rights reserved.");

            // Get list of 10 most recent posts
            DataTable dt = rss.getFamilyEventsRSS();
            if (dt.Rows.Count > 0) {
                foreach (DataRow row in dt.Rows) 
                {
                    feedWriter.WriteStartElement("item");
                    feedWriter.WriteElementString("title", row["event"].ToString());
                    feedWriter.WriteElementString("description", row["shortdescription"].ToString());
                    string baseurl = "/about-tabs/about-us/tabs-calendar/tabs-calendar-event.aspx?section=tabs&eventid=";
                    feedWriter.WriteElementString("link", baseurl + row["eventid"].ToString());
                    feedWriter.WriteElementString("pubDate", row["startdate"].ToString());
                    feedWriter.WriteEndElement();

                }
            } 
            else 
            {

                feedWriter.WriteStartElement("item");
                feedWriter.WriteElementString("title", "No Latest Events for Family");
                feedWriter.WriteElementString("description", "");
                feedWriter.WriteElementString("link", "");
                feedWriter.WriteElementString("pubDate", "");
                feedWriter.WriteEndElement();
            }

            // Close all open tags tags
            feedWriter.WriteEndElement();
            feedWriter.WriteEndElement();
            feedWriter.WriteEndDocument();
            feedWriter.Flush();
            feedWriter.Close();

            Response.End();

        }
    }
}