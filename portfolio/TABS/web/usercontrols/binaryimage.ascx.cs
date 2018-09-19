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
    public partial class binaryimage : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.PhotoClass photologic = new TABS_UserControls.resources.code.BAL.PhotoClass();
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        private TABS_UserControls.resources.code.BAL.WebLibraryClass librarylogic = new TABS_UserControls.resources.code.BAL.WebLibraryClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            int schoolid;
            int libraryid;

            try
            {
                schoolid = Convert.ToInt16(Request.QueryString["schoolid"]);
                libraryid = Convert.ToInt16(Request.QueryString["libraryid"]);
            }
            catch
            {
                schoolid = 0;
                libraryid = 0;
            }

            string database = Request.QueryString["section"];
            byte[] img = null;

            switch (database)
            {
                case "logo":
                    img = this.ReturnImg(photologic.getPhotosBySchoolID(schoolid)[0].logo);
                    //img = photologic.getPhotosBySchoolID(schoolid)[0].logo;
                    break;
                case "glance":
                    img = this.ReturnImg(schoollogic.getGlanceBySchoolID(schoolid)[0].image);
                    //img = schoollogic.getGlanceBySchoolID(schoolid)[0].image;
                    break;
                case "frontcard":
                    img = this.ReturnImg(photologic.getPhotosBySchoolID(schoolid)[0].image1);
                    //img = photologic.getPhotosBySchoolID(schoolid)[0].image1;
                    break;
                case "backcard":
                    img = this.ReturnImg(photologic.getPhotosBySchoolID(schoolid)[0].image2);
                    //img = photologic.getPhotosBySchoolID(schoolid)[0].image2;
                    break;
                case "academics":
                    img = this.ReturnImg(schoollogic.getAcademicBySchoolID(schoolid)[0].image);
                    //img = schoollogic.getAcademicBySchoolID(schoolid)[0].image;
                    break;
                case "pdf":
                    img = librarylogic.getLibraryByLibraryID(libraryid)[0].pdf;
                    break;
                case "campus":
                    img = this.ReturnImg(schoollogic.getCampusLifeBySchoolID(schoolid)[0].image);
                    //img = schoollogic.getCampusLifeBySchoolID(schoolid)[0].image;
                    break;
                case "arts":
                    img = this.ReturnImg(schoollogic.getArtsBySchoolID(schoolid)[0].image);
                    //img = schoollogic.getArtsBySchoolID(schoolid)[0].image;
                    break;
                case "collegeinfo":
                    img = this.ReturnImg(schoollogic.getCollegeInfoBySchoolID(schoolid)[0].image);
                    //img = schoollogic.getCollegeInfoBySchoolID(schoolid)[0].image;
                    break;
                case "summer":
                    //img = this.ReturnImg(schoollogic.getSummerProgramBySchoolID(schoolid)[0].image);
                    ////img = schoollogic.getSummerProgramBySchoolID(schoolid)[0].image;
                    break;
                default:
                    break;
            }

            Response.BinaryWrite(img);
        }

        protected byte[] ReturnImg(byte[] img) 
        {
            byte[] retImg;
            if (DBNull.Value.Equals(img) || img == null) 
            {
                return retImg = System.Text.Encoding.UTF8.GetBytes(String.Empty);
            } else {
                return img;
            }
        }
    }
}