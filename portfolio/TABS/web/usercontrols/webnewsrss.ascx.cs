using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using System.Xml;
using System.Text;
using System.Data;

namespace TABS_UserControls.usercontrols {
    public partial class webnewsrss : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
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
            feedWriter.WriteElementString("title", "TABS Web News");
            feedWriter.WriteElementString("link", "http://www.boardingschools.com");
            feedWriter.WriteElementString("description", "TABS");
            feedWriter.WriteElementString("copyright",
              "Copyright 2009 boardingschools.com. All rights reserved.");

            // Get list of 10 most recent posts
            DataTable dt = rss.getWebNewsRSS();
            if (dt.Rows.Count > 0) {
                foreach (DataRow row in dt.Rows) {
                    feedWriter.WriteStartElement("item");
                    feedWriter.WriteElementString("title", row["headline"].ToString());
                    feedWriter.WriteElementString("description", row["summary"].ToString());
                    string baseurl = "/about-tabs/about-us/press-room/articles.aspx?section=web&id=";
                    feedWriter.WriteElementString("link", baseurl + row["webnewsid"].ToString());
                    feedWriter.WriteElementString("pubDate", row["publishdate"].ToString());
                    feedWriter.WriteEndElement();

                }
            } else {

                feedWriter.WriteStartElement("item");
                feedWriter.WriteElementString("title", "No Latest Web News");
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