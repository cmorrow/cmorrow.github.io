<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="edit-school-media.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.edit_school_media" %>
<style type="text/css">
  .tab {
    width: 100%;
  }
  .hidden {
    display: none;
  }
  .tabHeader {
  }
  .tab ul {
    margin: 0px;
    padding: 5px;
  }
  .tab ul li {
    list-style-type: none;
    float: left;
    margin: 0;
    padding: 10px;
  }
  .tab .edit-school-border {
    border: none !important;
  }
  .error {
    color: #ff0000;
  }
</style>
<div id="mediaTabs">
  <ul class="conf-tabs-ul floatclear">
    <li class="active"><a href="#photosTab"><span>Photos</span></a></li>
    <li><a href="#videosTab"><span>Videos</span></a></li>
    <li><a href="#audioTab"><span>Audio</span></a></li>
    <div class="clear">
    </div>
  </ul>
  <asp:UpdatePanel ID="mediaUP" runat="server">
    <ContentTemplate>
      <div id="photosTab" class="tab">
          <p>
            For best quality, please limit your image size to 400px by 400px as well limit your
            image to 100K</p>
          <h5>
            photos</h5>
<!-- 10 total photos -->
          <ul>
			<!-- <li>
				<p><label><span>*</span>Title:</label> <input name="photo2title" type="text" value="snowboarding" maxlength="255" /></p>
				<p><label><span>*</span>Main Image:</label> <input type="file" class="file" name="" /></p>
				<p><label><span>*</span>Thumbnail:</label> <input type="file" class="file" name="ctl00$ctlntMain$co_7$edit1$photo2highres" id="ctl00contentSubMain_contentMainContent_edit-school_7_edit1_photo2highres" /></p>
				<p class="indent"><a href="resources/images/schoolimages/1141/images/photo2.jpg" target="_blank"><img class="thumbImage" src="resources/images/schoolimages/1141/images/photo2_thumbnail.jpg" /></a>
					uploaded</p>
				<p><input type="submit" name="ctl00" value="Save" /><input type="submit" name="DeleteButton" value="Delete" /></p>
			</li> -->
            <li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo1title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo1highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo1thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo1preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo1SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo1DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo1id" runat="server" /><span class="error"><asp:Literal ID="photo1error" runat="server" /></span>
				</p>
            </li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo2title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo2highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo2thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo2preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo2SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo2DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo2id" runat="server" /><span class="error"><asp:Literal ID="photo2error" runat="server" /></span>
				</p>
            </li>
			<li class="divider"></li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo3title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo3highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo3thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo3preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo3SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo3DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo3id" runat="server" /><span class="error"><asp:Literal ID="photo3error" runat="server" /></span>
				</p>
            </li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo4title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo4highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo4thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo4preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo4SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo4DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo4id" runat="server" /><span class="error"><asp:Literal ID="photo4error" runat="server" /></span>
				</p>
            </li>
			<li class="divider"></li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo5title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo5highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo5thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo5preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo5SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo5DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo5id" runat="server" /><span class="error"><asp:Literal ID="photo5error" runat="server" /></span>
				</p>
            </li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo6title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo6highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo6thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo6preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo6SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo6DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo6id" runat="server" /><span class="error"><asp:Literal ID="photo6error" runat="server" /></span>
				</p>
            </li>
			<li class="divider"></li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo7title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo7highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo7thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo7preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo7SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo7DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo7id" runat="server" /><span class="error"><asp:Literal ID="photo7error" runat="server" /></span>
				</p>
            </li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo8title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo8highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo8thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo8preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo8SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo8DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo8id" runat="server" /><span class="error"><asp:Literal ID="photo8error" runat="server" /></span>
				</p>
            </li>
			<li class="divider"></li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo9title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo9highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo9thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo9preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo9SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo9DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo9id" runat="server" /><span class="error"><asp:Literal ID="photo9error" runat="server" /></span>
				</p>
            </li>
			<li>
				<p><label><span>*</span>Title:</label> <asp:TextBox ID="photo10title" MaxLength="255" runat="server" /></p>
				<p><label><span>*</span>Main Image:</label> <asp:FileUpload ID="photo10highres" runat="server" /></p>
				<p><label><span>*</span>Thumbnail:</label> <asp:FileUpload ID="photo10thumbnail" runat="server" /></p>
				<p class="indent"><asp:HyperLink ID="photo10preview" Target="_blank" runat="server" CSSClass="thumbImage" /></p>
				<p class="buttons">
					<asp:Button ID="photo10SaveButton" Text="Save" OnClick="SavePhoto" runat="server" /> <asp:Button ID="photo10DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
					<asp:HiddenField ID="photo10id" runat="server" /><span class="error"><asp:Literal ID="photo10error" runat="server" /></span>
				</p>
            </li>
          </ul>
      </div>
      <div id="videosTab" class="tab hidden">
          <p>
            For best quality, please limit the size of your video upload to 15 MB.</p>
          <h5>
            videos</h5>
          <ul>
            <li>
              <table>
                <tr>
                  <td>
                    Title:
                  </td>
                  <td>
                    <asp:TextBox ID="video1title" MaxLength="255" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    Video:
                  </td>
                  <td>
                    <asp:FileUpload ID="video1highres" runat="server" />
                  </td>
                </tr>
                <tr valign="top">
                  <td>
                    Thumbnail:
                  </td>
                  <td>
                    <asp:FileUpload ID="video1thumbnail" runat="server" />
                    <br />
                    <asp:HyperLink ID="video1preview" Target="_blank" runat="server" />
                  </td>
                </tr>
                <tr class="buttons">
                  <td>
                    <asp:Button ID="video1SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
                  </td>
                  <td>
                    <asp:Button ID="video1DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
                  </td>
                </tr>
              </table>
              <asp:HiddenField ID="video1id" runat="server" />
              <span class="error">
                <asp:Literal ID="video1error" runat="server" /></span> </li>
            <li>
              <table>
                <tr>
                  <td>
                    Title:
                  </td>
                  <td>
                    <asp:TextBox ID="video2title" MaxLength="255" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    Video:
                  </td>
                  <td>
                    <asp:FileUpload ID="video2highres" runat="server" />
                  </td>
                </tr>
                <tr valign="top">
                  <td>
                    Thumbnail:
                  </td>
                  <td>
                    <asp:FileUpload ID="video2thumbnail" runat="server" />
                    <br />
                    <asp:HyperLink ID="video2preview" Target="_blank" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td class="buttons">
                    <asp:Button ID="video2SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
                  </td>
                  <td>
                    <asp:Button ID="video2DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
                  </td>
                </tr>
              </table>
              <asp:HiddenField ID="video2id" runat="server" />
              <span class="error">
                <asp:Literal ID="video2error" runat="server" /></span> </li>
            <li>
              <table>
                <tr>
                  <td>
                    Title:
                  </td>
                  <td>
                    <asp:TextBox ID="video3title" MaxLength="255" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    Video:
                  </td>
                  <td>
                    <asp:FileUpload ID="video3highres" runat="server" />
                  </td>
                </tr>
                <tr valign="top">
                  <td>
                    Thumbnail:
                  </td>
                  <td>
                    <asp:FileUpload ID="video3thumbnail" runat="server" />
                    <br />
                    <asp:HyperLink ID="video3preview" Target="_blank" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td class="buttons">
                    <asp:Button ID="video3SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
                  </td>
                  <td>
                    <asp:Button ID="video3DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
                  </td>
                </tr>
              </table>
              <asp:HiddenField ID="video3id" runat="server" />
              <span class="error">
                <asp:Literal ID="video3error" runat="server" /></span> </li>
            <%--        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video4title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video4highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video4thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video4preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video4SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video4DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video4id" runat="server" />
          <span class="error">
            <asp:Literal ID="video4error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video5title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video5highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video5thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video5preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video5SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video5DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video5id" runat="server" />
          <span class="error">
            <asp:Literal ID="video5error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video6title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video6highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video6thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video6preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video6SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video6DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video6id" runat="server" />
          <span class="error">
            <asp:Literal ID="video6error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video7title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video7highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video7thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video7preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video7SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video7DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video7id" runat="server" />
          <span class="error">
            <asp:Literal ID="video7error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video8title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video8highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video8thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video8preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video8SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video8DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video8id" runat="server" />
          <span class="error">
            <asp:Literal ID="video8error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video9title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video9highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video9thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video9preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video9SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video9DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video9id" runat="server" />
          <span class="error">
            <asp:Literal ID="video9error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="video10title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Video:
              </td>
              <td>
                <asp:FileUpload ID="video10highres" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="video10thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="video10preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="video10SaveButton" Text="Save" OnClick="SaveVideo" runat="server" />
              </td>
              <td>
                <asp:Button ID="video10DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="video10id" runat="server" />
          <span class="error">
            <asp:Literal ID="video10error" runat="server" /></span> </li>--%>
          </ul>
      </div>
      <div id="audioTab" class="tab hidden">
          <p>
            For best quality, please limit the size of your audio upload to 5 MB.
          </p>
          <h5>
            audios</h5>
          <ul>
            <li>
              <table>
                <tr>
                  <td>
                    Title:
                  </td>
                  <td>
                    <asp:TextBox ID="audio1title" MaxLength="255" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    MP3:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio1highres" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    Image:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio1image" runat="server" />
                  </td>
                </tr>
                <tr valign="top">
                  <td>
                    Thumbnail:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio1thumbnail" runat="server" />
                    <br />
                    <asp:HyperLink ID="audio1preview" Target="_blank" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td class="buttons">
                    <asp:Button ID="audio1SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
                  </td>
                  <td>
                    <asp:Button ID="audio1DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
                  </td>
                </tr>
              </table>
              <asp:HiddenField ID="audio1id" runat="server" />
              <span class="error">
                <asp:Literal ID="audio1error" runat="server" /></span> </li>
            <li>
              <table>
                <tr>
                  <td>
                    Title:
                  </td>
                  <td>
                    <asp:TextBox ID="audio2title" MaxLength="255" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    MP3:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio2highres" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    Image:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio2image" runat="server" />
                  </td>
                </tr>
                <tr valign="top">
                  <td>
                    Thumbnail:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio2thumbnail" runat="server" />
                    <br />
                    <asp:HyperLink ID="audio2preview" Target="_blank" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td class="buttons">
                    <asp:Button ID="audio2SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
                  </td>
                  <td>
                    <asp:Button ID="audio2DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
                  </td>
                </tr>
              </table>
              <asp:HiddenField ID="audio2id" runat="server" />
              <span class="error">
                <asp:Literal ID="audio2error" runat="server" /></span> </li>
            <li>
              <table>
                <tr>
                  <td>
                    Title:
                  </td>
                  <td>
                    <asp:TextBox ID="audio3title" MaxLength="255" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    MP3:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio3highres" runat="server" />
                  </td>
                </tr>
                <tr>
                  <td>
                    Image:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio3image" runat="server" />
                  </td>
                </tr>
                <tr valign="top">
                  <td>
                    Thumbnail:
                  </td>
                  <td>
                    <asp:FileUpload ID="audio3thumbnail" runat="server" />
                    <br />
                    <asp:HyperLink ID="audio3preview" Target="_blank" runat="server" />
                  </td>
                </tr>
                <tr class="buttons">
                  <td>
                    <asp:Button ID="audio3SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
                  </td>
                  <td>
                    <asp:Button ID="audio3DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
                  </td>
                </tr>
              </table>
              <asp:HiddenField ID="audio3id" runat="server" />
              <span class="error">
                <asp:Literal ID="audio3error" runat="server" /></span> </li>
            <%--        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio4title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio4highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio4image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio4thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio4preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio4SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio4DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio4id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio4error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio5title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio5highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio5image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio5thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio5preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio5SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio5DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio5id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio5error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio6title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio6highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio6image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio6thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio6preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio6SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio6DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio6id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio6error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio7title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio7highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio7image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio7thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio7preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio7SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio7DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio7id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio7error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio8title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio8highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio8image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio8thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio8preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio8SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio8DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio8id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio8error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio9title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio9highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio9image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio9thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio9preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio9SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio9DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio9id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio9error" runat="server" /></span> </li>
        <li>
          <table>
            <tr>
              <td>
                Title:
              </td>
              <td>
                <asp:TextBox ID="audio10title" MaxLength="255" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                MP3:
              </td>
              <td>
                <asp:FileUpload ID="audio10highres" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                Image:
              </td>
              <td>
                <asp:FileUpload ID="audio10image" runat="server" />
              </td>
            </tr>
            <tr valign="top">
              <td>
                Thumbnail:
              </td>
              <td>
                <asp:FileUpload ID="audio10thumbnail" runat="server" />
                <br />
                <asp:HyperLink ID="audio10preview" Target="_blank" runat="server" />
              </td>
            </tr>
            <tr>
              <td>
                <asp:Button ID="audio10SaveButton" Text="Save" OnClick="SaveAudio" runat="server" />
              </td>
              <td>
                <asp:Button ID="audio10DeleteButton" Text="Delete" OnClick="DeleteMedia" runat="server" />
              </td>
            </tr>
          </table>
          <asp:HiddenField ID="audio10id" runat="server" />
          <span class="error">
            <asp:Literal ID="audio10error" runat="server" /></span> </li>--%>
          </ul>
      </div>
    </ContentTemplate>
  </asp:UpdatePanel>
</div>

<script type="text/javascript">
  function ShowTab(element) { // This could be much shortened if we had jquery available to us

    // Make all tabs hidden
    SetElementDisplayStyle("photosTab", "none");
    SetElementDisplayStyle("videosTab", "none");
    SetElementDisplayStyle("audioTab", "none");

    // Make selected tab visible
    SetElementDisplayStyle(element.getAttribute("href").replace("#", ""), "block");

    return false;
  }

  function SetElementDisplayStyle(elementId, style) {
    document.getElementById(elementId).style.display = style;
  }
</script>

