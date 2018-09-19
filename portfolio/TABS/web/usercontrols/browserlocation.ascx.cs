using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Text;
using TABS_UserControls.resources.code.BAL;
using System.Data;
using System.Reflection;

namespace TABS_UserControls.usercontrols {
    public partial class browserlocation : System.Web.UI.UserControl 
    {
        SchoolClass schoollogic = new SchoolClass();
        List<Schools> list = new List<Schools>();
        Schools item = new Schools();

        protected void Page_Load(object sender, EventArgs e) {
            string zip;
            if (Request.Params["zipcode"] == null) {
                zip = "28801";
            } else {
                zip = Request.Params["zipcode"].ToString();
            }
            try 
            {
                DataTable temp = schoollogic.getSchoolBrowserByZipCode(zip);
                foreach (DataRow row in temp.Rows) {
                    item = new Schools();
                    item.Name = row["sortname"].ToString();
                    item.Id = row["schoolid"].ToString();
                    item.Distance = row["distance"].ToString();
                    list.Add(item);
                }

            } 
            catch (Exception) 
            {
                item = new Schools();
                item.Name = "0";
                item.Id = "0";
                item.Distance = "0";
                list.Add(item);
            }

            DataTable finalDT = ListToDataTable(list);
            this.OutputXML(finalDT);
        }

        public DataTable ListToDataTable<T>(List<T> list) {
            DataTable dt = new DataTable();

            foreach (PropertyInfo info in typeof(T).GetProperties()) {
                dt.Columns.Add(new DataColumn(info.Name, info.PropertyType));
            }
            foreach (T t in list) {
                DataRow row = dt.NewRow();
                foreach (PropertyInfo info in typeof(T).GetProperties()) {
                    row[info.Name] = info.GetValue(t, null);
                }
                dt.Rows.Add(row);
            }
            return dt;
        }

        public void OutputXML(DataTable dt) 
        {
            XmlDataDocument xmlDoc = new XmlDataDocument();
            XmlDeclaration xmlDec;
            XmlWriter xmlWriter;

            // setup response
            Response.Clear();
            Response.ContentType = "text/xml";
            Response.Charset = "utf-8";
            xmlWriter = new XmlTextWriter(Response.OutputStream, Encoding.UTF8);


            // create xml data document with xml declaration
            DataSet ds = new DataSet();
            ds.DataSetName = "Schools";
            dt.TableName = "School";
            ds.Tables.Add(dt);
            xmlDoc = new XmlDataDocument(ds);
            xmlDoc.DataSet.EnforceConstraints = false;
            xmlDec = xmlDoc.CreateXmlDeclaration("1.0", "UTF-8", null);
            xmlDoc.PrependChild(xmlDec);

            // write xml document to response
            xmlDoc.WriteTo(xmlWriter);
            xmlWriter.Flush();
            xmlWriter.Close();
            Response.End();

        }

    }

    public class Schools {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Distance { get; set; }
    }
}