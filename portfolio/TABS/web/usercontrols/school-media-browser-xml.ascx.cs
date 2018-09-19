using System;
using System.Configuration;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using TABS_UserControls.resources.code.BAL;
using System.Data;
using System.Collections.Generic;
using System.Reflection;

namespace TABS_UserControls.usercontrols {
    public partial class school_media_browser_xml : System.Web.UI.UserControl {
        public string rootDirectory, imageDirectory, videoDirectory, audioDirectory;
        public string rootPath, imagePath, videoPath, audioPath;

        List<ProfileXml> xmlList = new List<ProfileXml>();
        ProfileXml profileXml = new ProfileXml();
        List<MediaImage> imgList = new List<MediaImage>();
        List<MediaVideo> vidList = new List<MediaVideo>();
        List<MediaAudio> audList = new List<MediaAudio>();
        MediaAudio aud = new MediaAudio();
        MediaVideo vid = new MediaVideo();
        MediaImage img = new MediaImage();


        protected void Page_Load(object sender, EventArgs e) {
            // Snag school id
            var schoolId = 0;
            Int32.TryParse(Request["schoolId"], out schoolId);
            //schoolId = 1069;

            // Proper location of directories
            rootDirectory = @ConfigurationManager.AppSettings["SchoolDirectory"] + schoolId + @"\";
            imageDirectory = rootDirectory + @"images\";
            audioDirectory = rootDirectory + @"audio\";
            videoDirectory = rootDirectory + @"video\";

            // Get virtual path
            rootPath = "/" + rootDirectory.ToLower().Replace(Server.MapPath("~").ToLower(), "").Replace("\\", "/");
            imagePath = rootPath + "images/";
            audioPath = rootPath + "audio/";
            videoPath = rootPath + "video/";

            // Build media browser dto
            var audio = new MediaFacade().GetAudioBySchoolId(schoolId);
            var videos = new MediaFacade().GetVideosBySchoolId(schoolId);
            var photos = new MediaFacade().GetPhotosBySchoolId(schoolId);

            xmlList = new List<ProfileXml>();
            profileXml = new ProfileXml();
            profileXml.SchoolId = schoolId;
            imgList = new List<MediaImage>();
            vidList = new List<MediaVideo>();
            audList = new List<MediaAudio>();
            aud = new MediaAudio();
            vid = new MediaVideo();
            img = new MediaImage();


            if (photos.Count > 0) {
                foreach (var media in photos) {
                    img = new MediaImage();
                    img.Title = media.Title;
                    img.HighRes = media.HighRes;
                    img.Thumbnail = media.Thumbnail;
                    img.Src = String.Empty;
                    imgList.Add(img);
                }
            } else {
                img = new MediaImage();
                //imgList.Add(img);
            }




            if (videos.Count > 0) {
                foreach (var media in videos) {
                    vid = new MediaVideo();
                    vid.Title = media.Title;
                    vid.HighRes = media.HighRes;
                    vid.Thumbnail = media.Thumbnail;
                    vid.Src = String.Empty;
                    vidList.Add(vid);
                }
            } else {
                vid = new MediaVideo();
                //vidList.Add(vid);
            }


            if (audio.Count > 0) {
                foreach (var media in audio) {
                    aud = new MediaAudio();
                    aud.Title = media.Title;
                    aud.HighRes = media.HighRes;
                    aud.Thumbnail = media.Thumbnail;
                    aud.Src = media.Image;
                    audList.Add(aud);
                }
            } else {
                aud = new MediaAudio();
                //audList.Add(aud);
            }

            profileXml.Audios = audList;
            profileXml.Videos = vidList;
            profileXml.Images = imgList;

            xmlList.Add(profileXml);

            DataTable finalDT = ListToDataTable(xmlList);
            this.OutputXML(finalDT);


            #region Nick Old Code

            /*
		    // I wanted to do some fancy xml serialization, but given time constraints and the format of the xml, 
			// stringbuilder is the fastest way to get this done.
			StringBuilder sb = new StringBuilder();
			sb.Append("<school_profile>");

			// Config
			sb.Append("<config><paths>");
			sb.Append("<photos>");
			sb.Append("<highres path=\"" + imagePath + "\"/>");
			sb.Append("<thumbnail path=\"" + imagePath + "\"/>");
			sb.Append("</photos>");
			sb.Append("<videos>");
			sb.Append("<highres path=\"" + videoPath + "\"/>");
			sb.Append("<thumbnail path=\"" + videoPath + "\"/>");
			sb.Append("</videos>");
			sb.Append("<audios>");
			sb.Append("<highres path=\"" + audioPath + "\"/>");
			sb.Append("<thumbnail path=\"" + audioPath + "\"/>");
			sb.Append("</audios>");
			sb.Append("</paths></config>");

			// Profile
			sb.Append("<profiles>");
			sb.Append("<profile>");
			sb.Append("<name>" + schoolId + "</name>"); 
			
			// Photos
			sb.Append("<photos>");
			foreach (var media in photos)
			{
				sb.Append("<media>");
				sb.Append("<title>" + media.Title + "</title>");
				sb.Append("<highres src=\"" + media.HighRes + "\"/>");
				sb.Append("<thumbnail src=\"" + media.Thumbnail + "\"/>");
				sb.Append("</media>");
			}
			sb.Append("</photos>");

			// Videos
			sb.Append("<videos>");
			foreach (var media in videos)
			{
				sb.Append("<media>");
				sb.Append("<title>" + media.Title + "</title>");
				sb.Append("<highres src=\"" + media.HighRes + "\"/>");
				sb.Append("<thumbnail src=\"" + media.Thumbnail + "\"/>");
				sb.Append("</media>");
			}
			sb.Append("</videos>");

			// Audio
			sb.Append("<audios>");
			foreach (var media in audio)
			{
				sb.Append("<media>");
				sb.Append("<title>" + media.Title + "</title>");
				sb.Append("<highres src=\"" + media.HighRes + "\"/>");
				sb.Append("<thumbnail src=\"" + media.Thumbnail + "\"/>");
				sb.Append("<img src=\"" + media.Image + "\"/>");
				sb.Append("</media>");
			}
			sb.Append("</audios>");

			sb.Append("</profile>");
			sb.Append("</profiles>");
			sb.Append("</school_profile>");

            xml.Text = sb.ToString();
			//Response.Write(sb.ToString());
            */
            #endregion
        }

        private string ToXml(object obj) {
            StringWriter sw = new StringWriter();

            if (obj != null) {
                XmlTextWriter xt = new XmlTextWriter(sw);
                XmlSerializer xs = new XmlSerializer(obj.GetType());

                xs.Serialize(xt, obj);
                xt.Close();
            }

            return sw.ToString().Replace("utf-16", "utf-8");
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

        public void OutputXML(DataTable dt) {
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
            ds.DataSetName = "Profiles";
            dt.TableName = "Profile";
            dt.Columns[0].Namespace = "";
            ds.Tables.Add(dt);


            xmlDoc = new XmlDataDocument(ds);
            xmlDoc.DataSet.EnforceConstraints = false;
            xmlDec = xmlDoc.CreateXmlDeclaration("1.0", "UTF-8", null);
            xmlDoc.PrependChild(xmlDec);


            // write xml document to response
            //xmlDoc.WriteTo(xmlWriter);
            ds.WriteXml(xmlWriter);
            xmlWriter.Flush();
            xmlWriter.Close();
            Response.End();


        }
    }

    public class ProfileXml {
        public int SchoolId { get; set; }
        public List<MediaImage> Images { get; set; }
        public List<MediaVideo> Videos { get; set; }
        public List<MediaAudio> Audios { get; set; }
    }

    public class MediaAudio {
        public string Title { get; set; }
        public string HighRes { get; set; }
        public string Thumbnail { get; set; }
        public string Src { get; set; }
    }

    public class MediaImage {
        public string Title { get; set; }
        public string HighRes { get; set; }
        public string Thumbnail { get; set; }
        public string Src { get; set; }
    }

    public class MediaVideo {
        public string Title { get; set; }
        public string HighRes { get; set; }
        public string Thumbnail { get; set; }
        public string Src { get; set; }
    }

}