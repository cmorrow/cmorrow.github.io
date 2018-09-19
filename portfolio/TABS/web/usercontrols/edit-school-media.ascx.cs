
using System;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using TABS_UserControls.resources.code.DTO;

namespace TABS_UserControls.usercontrols
{
	public partial class edit_school_media : System.Web.UI.UserControl
	{
		public int userid;
		public int schoolid;
		private TABS_UserControls.resources.code.BAL.UserClass userlogic = new TABS_UserControls.resources.code.BAL.UserClass();
		private TABS_UserControls.resources.code.BAL.tabs_admin adminlogic = new TABS_UserControls.resources.code.BAL.tabs_admin();

		public string rootDirectory, imageDirectory, videoDirectory, audioDirectory;
		public string rootPath, imagePath, videoPath, audioPath;
		const int mediaItemsLimit = 10; // if we were cooler, this would be infinite.
        const int mediaVideoLimit = 3;
        const int mediaAudioLimit = 3;

		protected void Page_Load(object sender, EventArgs e)
		{
			// Snag proper IDs
			userid = Convert.ToInt16(Session["userid"]);
            //debug
            //userid = 1;
			
            schoolid = userlogic.getUserByUserID(userid)[0].schoolid;

			// Initialize Upload Directories
			InitializeUploadDirectories();

			// Load Photos, Audio, Video tabs
			if (!IsPostBack)
				LoadMedia();
		}

		#region Initialization and Generic Media Methods
		private void InitializeUploadDirectories()
		{
			// Proper location of directories
			rootDirectory = @ConfigurationManager.AppSettings["SchoolDirectory"] + schoolid + @"\";
			imageDirectory = rootDirectory + @"images\";
			audioDirectory = rootDirectory + @"audio\";
			videoDirectory = rootDirectory + @"video\";

			// Get virtual path
			rootPath = "/" + rootDirectory.ToLower().Replace(Server.MapPath("~").ToLower(), "").Replace("\\", "/");
			imagePath = rootPath + "images/";
			audioPath = rootPath + "audio/";
			videoPath = rootPath + "video/";

			// Create directories, if they don't exist
			if (!Directory.Exists(rootDirectory))
				Directory.CreateDirectory(rootDirectory);

			if (!Directory.Exists(imageDirectory))
				Directory.CreateDirectory(imageDirectory);

			if (!Directory.Exists(audioDirectory))
				Directory.CreateDirectory(audioDirectory);

			if (!Directory.Exists(videoDirectory))
				Directory.CreateDirectory(videoDirectory);
		}

		private void LoadMedia()
		{
			// Load Photos
			LoadPhotos();

			// Load Videos
			LoadVideos();

			// Load Audio
			LoadAudio();
		}

		public void DeleteMedia(object sender, EventArgs e)
		{
			// Snag the base control id
			var baseId = ((Button)sender).ID.Replace("DeleteButton", "");

			// Snag the id, compensate for null
			var id = 0;
			Int32.TryParse(((HiddenField)FindControl(baseId + "id")).Value, out id);

			// Persist 
			new MediaFacade().DeleteMedia(id);

			LoadMedia();
		}
		#endregion

		#region Photos
		private void LoadPhotos()
		{
			var mediaList = new MediaFacade().GetPhotosBySchoolId(schoolid);

			for (var i = 0; i < mediaItemsLimit; i++)
			{
				var baseId = "photo" + (i + 1);

				if (mediaList.Count >= (i+1))
				{
					((HiddenField) FindControl(baseId + "id")).Value = mediaList[i].Id.ToString();
					((TextBox) FindControl(baseId + "title")).Text = mediaList[i].Title;
					((HyperLink) FindControl(baseId + "preview")).ImageUrl = imagePath + mediaList[i].Thumbnail;
					((HyperLink) FindControl(baseId + "preview")).NavigateUrl = imagePath + mediaList[i].HighRes;
				}
				else
				{
					((HiddenField)FindControl(baseId + "id")).Value = null;
					((TextBox)FindControl(baseId + "title")).Text = null;
					((HyperLink)FindControl(baseId + "preview")).ImageUrl = null;
					((HyperLink)FindControl(baseId + "preview")).NavigateUrl = null;
				}

				FindControl(baseId + "DeleteButton").Visible = mediaList.Count >= (i + 1);
			}
		}

		public void SavePhoto(object sender, EventArgs e)
		{
			var error = false;
			var errorMessage = "";

			// Snag the base control id
			var baseId = ((Button)sender).ID.Replace("SaveButton", "");

			// Save images to file
			var thumbnail = (FileUpload) FindControl(baseId + "thumbnail");
			var highres = (FileUpload)FindControl(baseId + "highres");

			// thumbnail
			if (thumbnail.HasFile && thumbnail.FileName.ToLower().EndsWith(".jpg"))
				thumbnail.SaveAs(imageDirectory + baseId + "_thumbnail.jpg");
			else
			{
				error = true;
				errorMessage += "<br />You must submit a JPG thumbnail.";
			}

			// highres
			if (highres.HasFile && highres.FileName.ToLower().EndsWith(".jpg"))
				highres.SaveAs(imageDirectory + baseId + ".jpg");
			else
			{
				error = true;
				errorMessage += "<br />You must submit a high-res JPG.";
			}

			if (!error)
			{
				// Snag the id, compensate for null
				var id = 0;
				Int32.TryParse(((HiddenField)FindControl(baseId + "id")).Value, out id);

				// build our value object
				var media = new Media
								{
									Id = id,
									SchoolId = schoolid,
									MediaType = MediaType.Photos,
									Title = ((TextBox)FindControl(baseId + "title")).Text,
									Thumbnail = baseId + "_thumbnail.jpg",
									HighRes = baseId + ".jpg"
								};

				// Persist value object
				new MediaFacade().SaveMedia(media);
			}

			((Literal) FindControl(baseId + "error")).Text = errorMessage;
			LoadPhotos();
		}
		#endregion

		#region Videos
		private void LoadVideos()
		{
			var mediaList = new MediaFacade().GetVideosBySchoolId(schoolid);

			for (var i = 0; i < mediaVideoLimit; i++)
			{
				var baseId = "video" + (i + 1);

				if (mediaList.Count >= (i + 1))
				{
					((HiddenField)FindControl(baseId + "id")).Value = mediaList[i].Id.ToString();
					((TextBox)FindControl(baseId + "title")).Text = mediaList[i].Title;
					((HyperLink)FindControl(baseId + "preview")).ImageUrl = videoPath + mediaList[i].Thumbnail;
				}
				else
				{
					((HiddenField)FindControl(baseId + "id")).Value = null;
					((TextBox)FindControl(baseId + "title")).Text = null;
					((HyperLink)FindControl(baseId + "preview")).ImageUrl = null;
				}

				FindControl(baseId + "DeleteButton").Visible = mediaList.Count >= (i + 1);
			}
		}

		public void SaveVideo(object sender, EventArgs e)
		{
			var error = false;
			var errorMessage = "";

			// Snag the base control id
			var baseId = ((Button)sender).ID.Replace("SaveButton", "");

			// Save images to file
			var thumbnail = (FileUpload)FindControl(baseId + "thumbnail");
			var highres = (FileUpload)FindControl(baseId + "highres");

			// thumbnail
			if (thumbnail.HasFile && thumbnail.FileName.ToLower().EndsWith(".jpg"))
				thumbnail.SaveAs(videoDirectory + baseId + "_thumbnail.jpg");
			else
			{
				error = true;
				errorMessage += "<br />You must submit a JPG thumbnail.";
			}

			// highres
			if (highres.HasFile && highres.FileName.ToLower().EndsWith(".flv"))
				highres.SaveAs(videoDirectory + baseId + ".flv");
			else
			{
				error = true;
				errorMessage += "<br />You must submit an FLV video.";
			}

			if (!error)
			{
				// Snag the id, compensate for null
				var id = 0;
				Int32.TryParse(((HiddenField)FindControl(baseId + "id")).Value, out id);

				// build our value object
				var media = new Media
				{
					Id = id,
					SchoolId = schoolid,
					MediaType = MediaType.Videos,
					Title = ((TextBox)FindControl(baseId + "title")).Text,
					Thumbnail = baseId + "_thumbnail.jpg",
					HighRes = baseId + ".flv"
				};

				// Persist value object
				new MediaFacade().SaveMedia(media);
			}

			((Literal)FindControl(baseId + "error")).Text = errorMessage;
			LoadVideos();
		}
		#endregion

		#region Audio
		private void LoadAudio()
		{
			var mediaList = new MediaFacade().GetAudioBySchoolId(schoolid);

			for (var i = 0; i < mediaAudioLimit; i++)
			{
				var baseId = "audio" + (i + 1);

				if (mediaList.Count >= (i + 1))
				{
					((HiddenField)FindControl(baseId + "id")).Value = mediaList[i].Id.ToString();
					((TextBox)FindControl(baseId + "title")).Text = mediaList[i].Title;
					((HyperLink)FindControl(baseId + "preview")).ImageUrl = audioPath + mediaList[i].Thumbnail;
					((HyperLink)FindControl(baseId + "preview")).NavigateUrl = audioPath + mediaList[i].Image;
				}
				else
				{
					((HiddenField)FindControl(baseId + "id")).Value = null;
					((TextBox)FindControl(baseId + "title")).Text = null;
					((HyperLink)FindControl(baseId + "preview")).ImageUrl = null;
					((HyperLink)FindControl(baseId + "preview")).NavigateUrl = null;
				}

				FindControl(baseId + "DeleteButton").Visible = mediaList.Count >= (i + 1);
			}
		}

		public void SaveAudio(object sender, EventArgs e)
		{
			var error = false;
			var errorMessage = "";

			// Snag the base control id
			var baseId = ((Button)sender).ID.Replace("SaveButton", "");

			// Save images to file
			var thumbnail = (FileUpload)FindControl(baseId + "thumbnail");
			var image = (FileUpload) FindControl(baseId + "image");
			var highres = (FileUpload)FindControl(baseId + "highres");

			// thumbnail
			if (thumbnail.HasFile && thumbnail.FileName.ToLower().EndsWith(".jpg"))
				thumbnail.SaveAs(audioDirectory + baseId + "_thumbnail.jpg");
			else
			{
				error = true;
				errorMessage += "<br />You must submit a JPG thumbnail.";
			}

			// image
			if (image.HasFile && image.FileName.ToLower().EndsWith(".jpg"))
				image.SaveAs(audioDirectory + baseId + ".jpg");
			else
			{
				error = true;
				errorMessage += "<br />You must submit a JPG image.";
			}

			// highres
			if (highres.HasFile && highres.FileName.ToLower().EndsWith(".mp3"))
				highres.SaveAs(audioDirectory + baseId + ".mp3");
			else
			{
				error = true;
				errorMessage += "<br />You must submit an audio MP3.";
			}

			if (!error)
			{
				// Snag the id, compensate for null
				var id = 0;
				Int32.TryParse(((HiddenField)FindControl(baseId + "id")).Value, out id);

				// build our value object
				var media = new Media
				{
					Id = id,
					SchoolId = schoolid,
					MediaType = MediaType.Audio,
					Title = ((TextBox)FindControl(baseId + "title")).Text,
					Thumbnail = baseId + "_thumbnail.jpg",
					Image = baseId + ".jpg",
					HighRes = baseId + ".mp3"
				};

				// Persist value object
				new MediaFacade().SaveMedia(media);
			}

			((Literal)FindControl(baseId + "error")).Text = errorMessage;
			LoadAudio();
		}
		#endregion
	}
}