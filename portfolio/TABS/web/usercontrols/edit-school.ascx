<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="edit-school.ascx.cs"
      Inherits="TABS_UserControls.usercontrols.edit_school" %>
<%@ Register Src="edit-school-media.ascx" TagName="edit" TagPrefix="uc1" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<asp:UpdateProgress ID="progress1" runat="server" AssociatedUpdatePanelID="editUpdatePanel"
      DynamicLayout="true">
      <ProgressTemplate>
            Please Wait While Saving...
      </ProgressTemplate>
</asp:UpdateProgress>
<asp:UpdatePanel ID="editUpdatePanel" UpdateMode="Conditional" runat="server">
      <ContentTemplate>
            <!-- General -->
            <div class="both1812 forum-top left">
                  <div class="forum-top left" style="background-color: #fff;">
                        <div class="floatclear">
                              <h1 class="user-temp left">
                                    school profile</h1>
                              <b class="update left">last updated on: &nbsp;
                                    <asp:Label ID="lblLastUpdated" runat="server"></asp:Label></b>
                        </div>
                        <p>
                              Please fill out the fields below to generate your custom school profile.</p>
                        <p>
                              <span class="ast">*</span> = required fields</p>
                        <p class="click-plus">
                              click the <span>+</span> to open the sections</p>
                        <p class="redBlock">
                          Note: You MUST click "Save" at the bottom of this page in order to save your data. After saving, this page may take a minute or two to refresh.
                        </p>

                  </div>
                  <div class="forum-right sp-bub right">
                        <div class="clear-sp left">
                              <div class="clear-bt">
                                    &nbsp;</div>
                              <div class="clear-bm">
                                    <asp:HyperLink ID="linkSchool" Target="_blank" runat="server" Text="view my school profile" />
                                    <p>
                                          See how my school profile looks from a visitor's point of view.</p>
                                    <span>opens in a new window</span>
                              </div>
                              <div class="clear-bb">
                                    &nbsp;</div>
                        </div>
                  </div>
            </div>
            <!-- Overview -->
            <div class="edit-school-tabs">
                  <h3 class="headershown floatclear">
                        overview</h3>
                  <div>
                        <div class="edit-school-non">
                              <span>*</span><h5 class="left">
                                    school name</h5>
                              <asp:TextBox ID="textSchoolName" runat="server" CssClass="school-name" Width="350" />
                        </div>
                        <div class="edit-school-border">
                              <span>*</span><h5>
                                    images</h5>
                              <div class="red" style="padding-top: 10px">
                                    Note: Upload a new image to replace an existing image.
                              </div>
                              <div class="edit-images">
                                    <div class="floatclear left textnimg">
                                          <div class="images-text">
                                                <b>Logo</b>
                                                <p>
                                                      168px x 168px</p>
                                          </div>
                                          <div class="schoolLogoImg">
                                                <asp:Image ID="imgPhotoLogo" runat="server" Width="168" Height="168" Visible="false" />
                                          </div>
                                    </div>
                                    <div class="imgup left">
                                          <br />
                                          <asp:FileUpload ID="filePhotoLogo" runat="server" />
                                    </div>
                                    <div class="clear">
                                    </div>
                              </div>
                              <div class="schoolBadges">
                                    <div class="schoolFrontImg">
                                          <strong>School Browser</strong><br />
                                          Front Image<br />
                                          280px x 150px<br />
                                          <asp:FileUpload ID="filePhotoImage1" runat="server" />
                                          <div class="preview">
                                                <asp:Image ID="imgPhotoImage1" runat="server" Visible="false" /></div>
                                    </div>
                                    <div class="schoolBackImg">
                                          <strong>School Browser</strong><br />
                                          Back Image<br />
                                          280px x 120px<br />
                                          <asp:FileUpload ID="filePhotoImage2" runat="server" />
                                          <div class="preview">
                                                <asp:Image ID="imgPhotoImage2" runat="server" Visible="false" /></div>
                                    </div>
                                    <div class="clear">
                                    </div>
                              </div>
                              <!-- end schoolBadges -->
                        </div>
                        <!-- end edit-school-border -->
                        <div class="edit-school-border">
                              <span>*</span><h5>
                                    boarding school type</h5>
                              <table cellspacing="0" cellpadding="0">
                                    <tr>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkCoed" Text="Coed " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkAllBoys" Text="All Boys " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkAllGirls" Text="All Girls " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkMilitary" Text="Military " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkElementary" Text="Elementary " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkJunior" Text="Junior " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkSecondary" Text="Secondary " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkPrePro" Text="Pre-Professional Arts " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <div class="left">
                                    <span>*</span><h5 class="full">
                                          short description</h5>
                                    <p>
                                          <em class="notice">(300 characters)</em></p>
                              </div>
                              <asp:TextBox ID="textShortDescription" runat="server" Rows="5" Columns="1" TextMode="multiLine"
                                    CssClass="edit-school-desc" />
                              <table class="short-desc-table">
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>Address 1:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAddress1" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                Address 2:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAddress2" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>City:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCity" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>Country:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="dropCountry" runat="server" AutoPostBack="true" DataTextField="country"
                                                      DataValueField="countryid" AppendDataBoundItems="true" OnSelectedIndexChanged="dropCountry_SelectedIndexChanged">
                                                      <asp:ListItem Text="--" Value="0" />
                                                </asp:DropDownList>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>State/Province:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="dropState" runat="server" DataTextField="state" DataValueField="stateid"
                                                      AppendDataBoundItems="true">
                                                      <asp:ListItem Text="--" Value="0" />
                                                </asp:DropDownList>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>ZIP/Postal Code:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textZip" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>Main School Phone:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textMainPhone" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td colspan="5">
                                                &nbsp;
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>Dir. of Admission: (Last Name)
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textDirLastName" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td class="field-label">
                                                <span>*</span>Dir. of Admission: <em class="notice">(First Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textDirFirstName" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>Email:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textEmail" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td class="field-label">
                                                Fax:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textFax" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                <span>*</span>Admissions Phone:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAdmPhone" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td class="field-label">
                                                <span>*</span>Website:<em class="notice">(http://www.url.com)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textWeb" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="field-label">
                                                Admissions<br />
                                                Toll-Free Phone:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAdmFree" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    events for families</h5>
                              <cc1:Grid ID="eventGrid" FolderStyle="/resources/obout/grand_gray" AllowAddingRecords="false"
                                    runat="server" AutoGenerateColumns="False" OnDeleteCommand="eventGrid_DeleteCommand">
                                    <Columns>
                                          <cc1:Column ID="Column1" runat="server" TemplateId="tempEvent" HeaderText="Event Details"
                                                Width="600">
                                          </cc1:Column>
                                          <cc1:Column ID="Column2" HeaderText="Edit" TemplateId="tempEdit" Width="100" runat="server">
                                          </cc1:Column>
                                          <cc1:Column ID="Column3" AllowDelete="true" HeaderText="Delete" Width="100" runat="server">
                                          </cc1:Column>
                                          <cc1:Column ID="Column4" Width="10" AllowEdit="false" DataField="profileeventid"
                                                Visible="false">
                                          </cc1:Column>
                                    </Columns>
                                    <Templates>
                                          <cc1:GridTemplate ID="tempEdit" runat="server">
                                                <Template>
                                                      <a href='/for-schools/edit-school-profile/add-school-event.aspx?id=<%# Container.DataItem["profileeventid"]%>'>
                                                            Edit</a>
                                                </Template>
                                          </cc1:GridTemplate>
                                          <cc1:GridTemplate ID="tempEvent" runat="server">
                                                <Template>
                                                      <b>
                                                            <%# Container.DataItem["profilevent"]%></b><br />
                                                      <%# Container.DataItem["startdate"]%>&nbsp;-&nbsp;<%# Container.DataItem["enddate"]%>,&nbsp;<%# Container.DataItem["city"]%>,&nbsp;<%# Container.DataItem["state"]%>,&nbsp;<%# Container.DataItem["country"]%><br />
                                                      <%# Container.DataItem["shortdescription"]%>
                                                </Template>
                                          </cc1:GridTemplate>
                                    </Templates>
                              </cc1:Grid>
                              <p>
                                    <a style="color: Red; font-weight: bold;" href="/for-schools/edit-school-profile/add-school-event.aspx">
                                          Add Event</a></p>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    news for families</h5>
                              <cc1:Grid ID="newsGrid" FolderStyle="/resources/obout/grand_gray" AllowAddingRecords="false"
                                    runat="server" AutoGenerateColumns="False" OnDeleteCommand="newsGrid_DeleteCommand">
                                    <Columns>
                                          <cc1:Column ID="Column5" runat="server" TemplateId="tempNews" HeaderText="News Details"
                                                Width="600">
                                          </cc1:Column>
                                          <cc1:Column ID="Column6" HeaderText="Edit" TemplateId="tempEdit2" Width="100" runat="server">
                                          </cc1:Column>
                                          <cc1:Column ID="Column7" AllowDelete="true" HeaderText="Delete" Width="100" runat="server">
                                          </cc1:Column>
                                          <cc1:Column ID="Column8" Width="10" AllowEdit="false" DataField="profilenewsid" Visible="false">
                                          </cc1:Column>
                                    </Columns>
                                    <Templates>
                                          <cc1:GridTemplate ID="tempEdit2" runat="server">
                                                <Template>
                                                      <a href='/for-schools/edit-school-profile/add-school-news.aspx?id=<%# Container.DataItem["profilenewsid"]%>'>
                                                            Edit</a>
                                                </Template>
                                          </cc1:GridTemplate>
                                          <cc1:GridTemplate ID="tempNews" runat="server">
                                                <Template>
                                                      <b>
                                                            <%# Container.DataItem["headline"]%></b><br />
                                                      <%# Container.DataItem["publishdate"]%><br />
                                                      <%# Container.DataItem["summary"]%>
                                                </Template>
                                          </cc1:GridTemplate>
                                    </Templates>
                              </cc1:Grid>
                              <p>
                                    <a style="color: Red; font-weight: bold;" href="/for-schools/edit-school-profile/add-school-news.aspx">
                                          Add News</a></p>
                        </div>
                        <div class="edit-school-border hos">
                              <h5>
                                    head of school</h5>
                              <p>
                                    Information regarding the Head of School’s years of service will not appear in the
                                    school’s public profile.</p>
                              <div id="head-of-school">
                                    <div>
                                          <p>
                                                Prefix:</p>
                                          <asp:DropDownList ID="dropPrefix" runat="server" DataTextField="prefix" DataValueField="prefixid"
                                                AppendDataBoundItems="true">
                                                <asp:ListItem Text="--" Value="0" />
                                          </asp:DropDownList>
                                    </div>
                                    <div class="hos-name">
                                          <span>*</span><p>
                                                First Name:</p>
                                          <asp:TextBox ID="textHeadmasterFirstName" runat="server" />
                                    </div>
                                    <div class="hos-name">
                                          <span>*</span><p>
                                                Last Name:</p>
                                          <asp:TextBox ID="textHeadmasterLastName" runat="server" />
                                    </div>
                              </div>
                              <div>
                                    <span>*</span><p>
                                          Title:</p>
                                    <asp:TextBox ID="textHeadmasterTitle" runat="server" />
                              </div>
                              <div>
                                    <p>
                                          <span>*</span>Year Started as Head of Current School:</p>
                                    <asp:TextBox ID="textHeadmasterCurrentYear" runat="server" Text="0" />
                              </div>
                              <div>
                                    <p>
                                          <span>*</span>Cumulative Years as Boarding School Head:</p>
                                    <asp:TextBox ID="textHeadmasterBoardYear" runat="server" Text="0" />
                              </div>
                              <div>
                                    <p>
                                          <span>*</span>Since beginning of career as Head, has Head taken a hiatus or served
                                          in any other positions?</p>
                                    <asp:RadioButtonList ID="radioHeadmasterHiatus" runat="server" TextAlign="right"
                                          CssClass="yesNoRadio" RepeatDirection="Horizontal">
                                          <asp:ListItem Text="Yes" Value="1" />
                                          <asp:ListItem Text="No" Value="2" />
                                    </asp:RadioButtonList>
                              </div>
                              <div class="indent200">
                                    <p>
                                          If yes, please enter number of years not served as Head during this time:</p>
                                    <asp:TextBox ID="textHeadmasterHiatusYear" runat="server" Text="0" />
                              </div>
                              <div>
                                    <p>
                                          <span>*</span>Is boarding school Head retiring this school year?</p>
                                    <asp:RadioButtonList ID="radioHeadmasterRetiring" runat="server" TextAlign="right"
                                          CssClass="yesNoRadio" RepeatDirection="Horizontal">
                                          <asp:ListItem Text="Yes" Value="1" />
                                          <asp:ListItem Text="No" Value="2" />
                                    </asp:RadioButtonList>
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    <span class="red">*</span>specific grades offered</h5>
                              <table width="820px" cellpadding="0" cellspacing="0" border="0" class="grades-offered">
                                    <tr>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkPreK" Text="Pre-K " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkKingdergarten" Text="All Kindergarten " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkGrade1" Text="1st " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkGrade2" Text="2nd " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkGrade3" Text="3rd " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade4" Text="4th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade5" Text="5th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade6" Text="6th " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkGrade7" Text="7th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade8" Text="8th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade9" Text="9th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade10" Text="10th " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkGrade11" Text="11th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkGrade12" Text="12th " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkPostGrad" Text="Post-Graduate " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- Media Gallery -->
            <div class="edit-school-tabs">
                  <h3>
                        media gallery</h3>
                  <div>
                        <div id="media-gallery">
                              <uc1:edit ID="edit1" runat="server" />
                        </div>
                  </div>
            </div>
            <!-- Diversity -->
            <div class="edit-school-tabs">
                  <h3>
                        diversity</h3>
                  <div>
                        <div class="edit-school-non">
                              <p>
                                    Information regarding school diversity will not be displayed on your public school
                                    profile.</p>
                        </div>
                        <div class="edit-school-non">
                              <h5>
                                    international students and students of color</h5>
                              <table cellpadding="5" cellspacing="0" border="0" class="edit-small">
                                    <tr>
                                          <td>
                                                <span>*</span><b>No. of International Students:</b>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textDivInternational" runat="server" />
                                          </td>
                                          <td>
                                                (Only include visa-holding students)
                                          </td>
                                          <td style="display: none">
                                                <span>*</span><b>No. of International Students of Color:</b>
                                          </td>
                                          <td style="display: none">
                                                <asp:TextBox ID="textDivInternationalColor" runat="server" />
                                          </td>
                                          <td>
                                                <span>*</span><b>No. of Domestic Students of Color:</b>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textDivDomestic" runat="server" />
                                          </td>
                                          <td>
                                                (Only include US citizens and residents)
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    *Students by Country</h5>
                              <asp:HiddenField ID="hfCountryId" runat="server" />
                              <asp:HiddenField ID="hfCommand" runat="server" />
                              <asp:HiddenField ID="hfId" runat="server" />
                              <asp:HiddenField ID="hfSchoolId" runat="server" />
                              <table border="0" class="diversity">
                              <asp:Repeater ID="repDiversity" runat="server" OnItemCommand="repDiversity_onItemCommand" >
                                    <HeaderTemplate>
                                          
                                                <tr class="header"><td width="150">Country</td>
                                                <td>Number of Students</td>
                                                <td class="edit" width="100">Edit</td></tr>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                                <tr><td><asp:Label ID="tbCountry" runat="server" Text='<%#Eval("country") %>' /></td>
                                                      <td><asp:Label ID="tbNumOfStudents" runat="server" Text='<%#Eval("studentcount") %>' /></td>
                                                      <td>
                                                            <asp:Button ID="btnEdEdit" runat="server" Text="Edit" CommandArgument='<%#Eval("id") %>'    />
                                                            <asp:Button ID="btnEdDelete" runat="server" Text="Delete" CommandArgument='<%#Eval("id") %>' />
                                                      </td>
                                                </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                          <tr><td colspan="2"><asp:Button ID="btnEdInsert" runat="server" Text="Add New" OnClick="btnEdInsert_Click" /></td></tr>
                                    </FooterTemplate>
                              </asp:Repeater>
                              </table>
                                
                               <div id="gridStudentCountryPan" style="border:solid 1 black; width:400px;" runat=server visible=false>
                                    <table>
                                          <tr style="font-weight:bold; text-align:center">
                                                <td colspan="2">Add/Edit School Diversity</td>
                                          </tr>
                                          <tr>
                                                <td>Country</td>
                                                <td><asp:DropDownList ID="ddlPanCountry" runat="server"></asp:DropDownList>
                                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                      ErrorMessage="Required" ControlToValidate="ddlPanCountry" ValidationGroup="myEdit"></asp:RequiredFieldValidator></td>
                                          </tr>
                                          <tr>
                                                <td>Number of Students</td>
                                                <td><asp:TextBox ID="tbGridNumStudents" runat="server"></asp:TextBox><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbGridNumStudents"  ValidationGroup="myEdit"></asp:RequiredFieldValidator></td>
                                          </tr>
                                          <tr>
                                                <td></td>
                                                <td><asp:Button ID="btnSaveEdit" runat="server" Text="Save"  ValidationGroup="myEdit" CausesValidation=true OnClick="btnSaveEdit_Click" />
                                                    <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" OnClick="btnCancelEdit_Click" />
                                                </td>
                                          </tr>
                                    </table>
                              </div>
                        </div>
                  </div>
            </div>
            <!-- At A Glance -->
            <div class="edit-school-tabs">
                  <h3>
                        at a glance</h3>
                  <div>
                        <div class="edit-school-non">
                              <h5>
                                    at a glance image</h5>
                              <div class="img-up">
                                    <p class="left">
                                          Upload:</p>
                                    <asp:Image ID="imgGlance" runat="server" Style="max-width: 200px;" Visible="false" />
                                    <asp:FileUpload ID="fileGlanceImage" runat="server" />
                                    (300px x 450px max)
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    basic facts</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td width="125">
                                                <span>*</span>Founded:
                                          </td>
                                          <td width="90" class="edit-small">
                                                <asp:TextBox ID="textGlanceFounded" runat="server" Text="1900" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Campus Size:
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceCampusSize" runat="server" Text="0" />&nbsp; acres
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                <span>*</span>Religious Affiliation:
                                          </td>
                                          <td valign="top" width="150">
                                                <asp:RadioButtonList ID="radioReligions" runat="server" TextAlign="right" DataTextField="religion"
                                                      CssClass="radioList" DataValueField="religionid" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    accreditation</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                <span>*</span>Most Recent Year Accredited:
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="textGlanceAccredited" runat="server" Text="0" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Accredition 1:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="dropGlanceAccredit1" runat="server" DataTextField="accredition"
                                                      DataValueField="accreditid" AppendDataBoundItems="true">
                                                      <asp:ListItem Text="--" Value="0" />
                                                </asp:DropDownList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Accredition 2:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="dropGlanceAccredit2" runat="server" DataTextField="accredition"
                                                      DataValueField="accreditid" AppendDataBoundItems="true">
                                                      <asp:ListItem Text="--" Value="0" />
                                                </asp:DropDownList>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    student body</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                Boarding
                                          </td>
                                          <td>
                                                Day
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Girls
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceGirlsBoarding" runat="server" Text="0" />
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceGirlsDay" runat="server" Text="0" />
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Boys
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceBoysBoarding" runat="server" Text="0" />
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceBoysDay" runat="server" Text="0" />
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                              <table>
                                    <tr>
                                          <td>
                                                <span>*</span>Boarding Grade Range (K-12)
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textGradeRangeBoard" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Day Grade Range (K-12)
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textGradeRangeDay" runat="server" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    admission</h5>
                              <table cellpadding="5" cellspacing="0" border="0" width="600px">
                                    <tr>
                                          <td width="30%">
                                                <span>*</span>Admission Deadline:
                                          </td>
                                          <td width="70%">
                                                <table cellpadding="5" cellspacing="0" border="0" width="300px">
                                                      <tr>
                                                            <td width="30%">
                                                                  <asp:DropDownList ID="dropGlanceAdmissionType" runat="server" DataTextField="admissiontype"
                                                                        DataValueField="admissiontypeid" AppendDataBoundItems="true">
                                                                        <asp:ListItem Text="--" Value="0" />
                                                                  </asp:DropDownList>
                                                            </td>
                                                            <td width="70%">
                                                                  Month
                                                                  <asp:DropDownList ID="dropMonth" runat="server" AppendDataBoundItems="true">
                                                                        <asp:ListItem Text="Jan" Value="1" />
                                                                        <asp:ListItem Text="Feb" Value="2" />
                                                                        <asp:ListItem Text="Mar" Value="3" />
                                                                        <asp:ListItem Text="Apr" Value="4" />
                                                                        <asp:ListItem Text="May" Value="5" />
                                                                        <asp:ListItem Text="Jun" Value="6" />
                                                                        <asp:ListItem Text="Jul" Value="7" />
                                                                        <asp:ListItem Text="Aug" Value="8" />
                                                                        <asp:ListItem Text="Sep" Value="9" />
                                                                        <asp:ListItem Text="Oct" Value="10" />
                                                                        <asp:ListItem Text="Nov" Value="11" />
                                                                        <asp:ListItem Text="Dec" Value="12" />
                                                                  </asp:DropDownList>
                                                                  Day
                                                                  <asp:DropDownList ID="dropDay" runat="server" AppendDataBoundItems="true">
                                                                        <asp:ListItem Text="1" Value="1" />
                                                                        <asp:ListItem Text="2" Value="2" />
                                                                        <asp:ListItem Text="3" Value="3" />
                                                                        <asp:ListItem Text="4" Value="4" />
                                                                        <asp:ListItem Text="5" Value="5" />
                                                                        <asp:ListItem Text="6" Value="6" />
                                                                        <asp:ListItem Text="7" Value="7" />
                                                                        <asp:ListItem Text="8" Value="8" />
                                                                        <asp:ListItem Text="9" Value="9" />
                                                                        <asp:ListItem Text="10" Value="10" />
                                                                        <asp:ListItem Text="11" Value="11" />
                                                                        <asp:ListItem Text="12" Value="12" />
                                                                        <asp:ListItem Text="13" Value="13" />
                                                                        <asp:ListItem Text="14" Value="14" />
                                                                        <asp:ListItem Text="15" Value="15" />
                                                                        <asp:ListItem Text="16" Value="16" />
                                                                        <asp:ListItem Text="17" Value="17" />
                                                                        <asp:ListItem Text="18" Value="18" />
                                                                        <asp:ListItem Text="19" Value="19" />
                                                                        <asp:ListItem Text="20" Value="20" />
                                                                        <asp:ListItem Text="21" Value="21" />
                                                                        <asp:ListItem Text="22" Value="22" />
                                                                        <asp:ListItem Text="23" Value="23" />
                                                                        <asp:ListItem Text="24" Value="24" />
                                                                        <asp:ListItem Text="25" Value="25" />
                                                                        <asp:ListItem Text="26" Value="26" />
                                                                        <asp:ListItem Text="27" Value="27" />
                                                                        <asp:ListItem Text="28" Value="28" />
                                                                        <asp:ListItem Text="29" Value="29" />
                                                                        <asp:ListItem Text="30" Value="30" />
                                                                        <asp:ListItem Text="31" Value="31" />
                                                                  </asp:DropDownList>
                                                            </td>
                                                      </tr>
                                                </table>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>App. Fee:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textGlanceApplicationFee" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td colspan="2">
                                                If not in US dollars, then also specify currency
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Currency:<br />
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="dropGlanceCurrencies" runat="server" DataTextField="currency"
                                                      DataValueField="currencyid" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Accept TABS Admission App.
                                          </td>
                                          <td width="200">
                                                <asp:RadioButtonList ID="radioGlanceAcceptTabsApplication" runat="server" TextAlign="Right"
                                                      CssClass="yesNoRadio" RepeatDirection="Horizontal">
                                                      <asp:ListItem Text="Yes" Value="1" />
                                                      <asp:ListItem Text="No" Value="2" />
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    tuition and financial aid</h5>
                              <table cellpadding="5" cellspacing="0" border="0" width="600px">
                                    <tr>
                                          <td width="176">
                                                <span>*</span>7-day Boarding Tuition:<br />
                                                <em class="notice">(If Not Applicable, enter N/A)</em>
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlance7DayTuition" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>5-day Boarding Tuition:
                                                <br />
                                                <em class="notice">(If Not Applicable, enter N/A)</em>
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlance5DayTuition" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Day Tuition Fee:<br />
                                                <em class="notice">(If Not Applicable, enter N/A)</em>
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceDayTuition" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Payment Plans Offered:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="radioGlancePaymentPlans" runat="server" TextAlign="Right"
                                                      CssClass="yesNoRadio" RepeatDirection="Horizontal">
                                                      <asp:ListItem Text="Yes" Value="1" />
                                                      <asp:ListItem Text="No" Value="2" />
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Need-based aid offered:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="radioGlanceNeedBasedAid" runat="server" TextAlign="Right"
                                                      CssClass="yesNoRadio" RepeatDirection="Horizontal">
                                                      <asp:ListItem Text="Yes" Value="1" />
                                                      <asp:ListItem Text="No" Value="2" />
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Percentage of students receiving need-based aid:
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="textGlanceNeedAirPercentage" runat="server" Text="0" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Average need-based aid per student:<br />
                                                <em class="notice">(Enter value for most recent year)</em>
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceNeedAirAverage" runat="server" Text="0" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <div class="floatclear">
                                    <h5 class="left">
                                          school finances</h5>
                              </div>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Show in Profile
                                          </td>
                                          <td colspan="2">
                                                <asp:RadioButtonList ID="radioGlanceShowFinance" runat="server" TextAlign="Right"
                                                      CssClass="yesNoRadio" RepeatDirection="Horizontal">
                                                      <asp:ListItem Text="Yes" Value="True" Selected="true" />
                                                      <asp:ListItem Text="No" Value="False" />
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Merit scholarships offered:
                                          </td>
                                          <td colspan="2">
                                                <asp:RadioButtonList ID="radioGlanceMerit" runat="server" TextAlign="Right" CssClass="yesNoRadio"
                                                      RepeatDirection="Horizontal">
                                                      <asp:ListItem Text="Yes" Value="1" />
                                                      <asp:ListItem Text="No" Value="2" />
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Percentage of students receiving merit scholarships:
                                          </td>
                                          <td colspan="2" class="edit-small">
                                                <asp:TextBox ID="textGlanceMeritPercentage" runat="server" Text="0" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Average merit scholarship per student:
                                          </td>
                                          <td class="edit-80">
                                                <asp:TextBox ID="textGlanceMeritAverage" runat="server" Text="0" />
                                          </td>
                                          <td>
                                                Enter value for most recent year
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Current endowment:
                                          </td>
                                          <td colspan="2" class="edit-small">
                                                <asp:TextBox ID="textGlanceCurrentEndowment" runat="server" Text="0" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Per student endowment:
                                          </td>
                                          <td colspan="2">
                                                <asp:TextBox ID="textGlanceStudentEndowment" runat="server" Text="0" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- Academics -->
            <div class="edit-school-tabs">
                  <h3>
                        academics</h3>
                  <div>
                        <div class="edit-school-non">
                              <h5>
                                    academics image</h5>
                              <div class="img-up">
                                    <p class="left">
                                          Upload:</p>
                                    <asp:Image ID="imgAcademic" runat="server" Style="max-width: 200px;" Visible="false" />
                                    <asp:FileUpload ID="fileAcademic" runat="server" />
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    academics</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Summary:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="textAcademicSummary" runat="server" TextMode="MultiLine" Height="150px"
                                                      Width="350px" MaxLength="300" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                Dept. Director: <em class="notice">(Last Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicDirLastName" runat="server" />
                                          </td>
                                          <td class="tablecolumn">
                                                Dept. Director: <em class="notice">(First Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicDirFirstName" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                Dept. Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicDirTitle" runat="server" />
                                          </td>
                                          <td class="tablecolumn">
                                                <span>*</span>Average Class Size:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicAvgClassSize" runat="server" Text="0" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                <span>*</span>No. of Full Time Teachers:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicFullTimeTeachers" runat="server" Text="0" />
                                          </td>
                                          <td class="tablecolumn">
                                                <span>*</span>No. of AP Courses Offered:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicApClassesOffered" runat="server" Text="0" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                <span>*</span>&#037; of Teachers Holding Advanced Degrees:<br />
                                                <em class="notice">An Advanced degree is any degree above a bachelor's</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademictTeacherWithAdvDegree" runat="server" Text="0" />
                                          </td>
                                          <td class="tablecolumn">
                                                <span>*</span>Student/Teacher Ratio:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicStudentAndTeacherRatio" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                <span>*</span>Saturday Classes:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="radioAcademicSatClasses" runat="server" TextAlign="right"
                                                      CssClass="yesNoRadio" RepeatDirection="horizontal">
                                                      <asp:ListItem Text="Yes" Value="1" />
                                                      <asp:ListItem Text="No" Value="2" />
                                                </asp:RadioButtonList>
                                          </td>
                                          <td class="tablecolumn">
                                                <span>*</span>Summer Programs Offered:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="radioAcademicSummerPrograms" runat="server" TextAlign="right"
                                                      CssClass="yesNoRadio" RepeatDirection="horizontal">
                                                      <asp:ListItem Text="Yes" Value="1" />
                                                      <asp:ListItem Text="No" Value="2" />
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                Noteworthy Achievements:
                                                <br />
                                                <em class="notice">150 characters max</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textAcademicNoteworthy" runat="server" TextMode="multiline" Height="150px"
                                                      Width="200px" MaxLength="150" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <table width="800px">
                                    <tr>
                                          <td>
                                                <p class="sm-h">
                                                      Support Programs</p>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                                <p class="sm-h">
                                                      Advanced/Enrichment Programs</p>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td width="33%">
                                                <asp:CheckBox ID="checkSPAdd" runat="server" TextAlign="Right" Text="ADD/ADHD Support" />
                                          </td>
                                          <td width="33%">
                                                <asp:CheckBox ID="checkSPWrite" runat="server" TextAlign="Right" Text="Writing Center" />
                                          </td>
                                          <td width="33%">
                                                <asp:CheckBox ID="checkAcademic5Day" runat="server" TextAlign="Right" Text="5-Day Boarding" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkSPCollege" runat="server" TextAlign="Right" Text="College Counseling" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkSPESLA" runat="server" TextAlign="Right" Text="ESL: Beginning" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkAcademicAP" runat="server" TextAlign="Right" Text="AP Courses" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkSPESLB" runat="server" TextAlign="Right" Text="ESL: Intermediate" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkSPESLC" runat="server" TextAlign="Right" Text="ESL: Advanced" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkAcademicBaccalaureate" runat="server" TextAlign="Right" Text="International Baccalaureate" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkSPEve" runat="server" TextAlign="Right" Text="Evening Study Assistance" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkSPLearningCenter" runat="server" TextAlign="Right" Text="Learning Center" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkAcademicDistanceLearning" runat="server" TextAlign="Right"
                                                      Text="Distance Learning" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkSPLearningDiff" runat="server" TextAlign="Right" Text="Learning Differences Support" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkSPPeer" runat="server" TextAlign="Right" Text="Peer Tutoring" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkAcademicPostGrad" runat="server" TextAlign="Right" Text="Postgraduate Year" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                <asp:CheckBox ID="checkSPSkills" runat="server" TextAlign="Right" Text="Study Skills Assistance" />
                                          </td>
                                          <td valign="top">
                                                <asp:CheckBox ID="checkSPSubj" runat="server" TextAlign="Right" Text="Subject Tutoring" />
                                          </td>
                                          <td valign="top">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                <asp:CheckBox ID="checkSPTech" runat="server" TextAlign="Right" Text="Technology Center" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                          </td>
                                          <td valign="top">
                                                Other:&nbsp;<asp:TextBox ID="textAcademicEnrichmentOther" TextMode="MultiLine" Height="100"
                                                      runat="server" />&nbsp;
                                          </td>
                                          <td valign="top">
                                                Other:&nbsp;<asp:TextBox ID="textAcademicSupportOther" TextMode="MultiLine" Height="100"
                                                      runat="server" />
                                                <asp:CheckBox Visible="false" ID="checkAcademicInternational" runat="server" TextAlign="Right"
                                                      Text="International" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox Visible="false" ID="checkSPAssistance" runat="server" TextAlign="Right"
                                                      Text="Assitance" />
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    academic programs</h5>
                              <div class="three-col">
                                    <div class="left">
                                          <p class="sm-h">
                                                English:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicclassics" Text="Classics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccreativeWriting" Text="Creative Writing " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichonors" Text="Honors " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicliterature" Text="Literature " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicplaywriting" Text="Playwriting " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpoetry" Text="Poetry " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicEnglishOther" TextMode="MultiLine" Height="100"
                                                      runat="server" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                History:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicasianHistory" Text="Asian History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicclassicalHistory" Text="Classical History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiceuropeHistory" Text="European History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichistoryHonors" Text="Honors " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmedievalHistory" Text="Medieval History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicusHistory" Text="United States History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicworldHistory" Text="World History  " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicHistoryOther" TextMode="MultiLine" Height="100"
                                                      runat="server" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Foreign Languages:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmandarin" Text="Chinese-Mandarin " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccantonese" Text="Chinese-Cantonese " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfrench" Text="French " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgerman" Text="German " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicitalian" Text="Italian " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicjapanese" Text="Japanese " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicrussian" Text="Russian " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicspanish" Text="Spanish " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgreek" Text="Greek " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiclatin" Text="Latin " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicForeign" TextMode="MultiLine" Height="100"
                                                      runat="server" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Religion/Philosophy:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicbible" Text="The Bible " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicethics" Text="Ethics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfaith" Text="Faith " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmoralPhilosophy" Text="Moral Philosophy " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmythology" Text="Mythology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphilosophy" Text="Philosophy " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicreligiousStudy" Text="Religious Studies " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsocialJustice" Text="Social Justice " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademictheology" Text="Theology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicworldReligion" Text="World Religions  " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicReligionOther" TextMode="MultiLine"
                                                      Height="100" runat="server" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                AP Courses Available:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicartHistoryAP" Text="Art History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicbiologyAP" Text="Biology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccalculusAB" Text="Calculus AB " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccalculusBC" Text="Calculus BC " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicchemistryAP" Text="Chemistry " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccompScienceA" Text="Computer Science A " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccompScienceAB" Text="Computer Science AB " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmacroeconomicsAP" Text="Macroeconomics " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmicroeconomicsAP" Text="Microeconomics " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicenglishLanguageAP" Text="English Language " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicenglishLitAP" Text="English Literature " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicenvironmentalScienceAP" Text="Environmental Science "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiceuropeanHistoryAP" Text="European History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfrenchLanguageAP" Text="French Language " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfrenchLitAP" Text="French Literature " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgermanLanguageAP" Text="German Language " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccompGovtPoliticsAP" Text="Comparative Government &amp; Politics "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicusGovAndPoliticsAP" Text="US Government & Politics "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichumanGeographyAP" Text="Human Geography " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiclatinLitAP" Text="Latin Literature " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiclatinVergilAP" Text="Latin: Vergil " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmusicTheoryAP" Text="Music Theory " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphysicsB" Text="Physics B " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphysicsC" Text="Physics C " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpsychologyAP" Text="Psychology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicspanishLanguageAP" Text="Spanish Language " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicspanishLitAP" Text="Spanish Literature " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicstatisticsAP" Text="Statistics " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicstudioArtAP" Text="Studio Art " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicusHistoryAP" Text="US History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicworldHistoryAP" Text="World History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicAPOther" TextMode="MultiLine" Height="100"
                                                      runat="server" />
                                                </li>
                                          </ul>
                                    </div>
                                    <div class="left">
                                          <p class="sm-h">
                                                Humanities/Social Sciences:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicantropology" Text="Anthropology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiceconomics" Text="Economics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpsychology" Text="Psychology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsociology" Text="Sociology " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicSocialOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Sciences:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicanatomy" Text="Anatomy " TextAlign="right" runat="server" />
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicanimalBehavior" Text="Animal Behavior " TextAlign="right"
                                                            runat="server" />
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicastronomy" Text="Astronomy " TextAlign="right" runat="server" />
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicastrophysics" Text="Astrophysics " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicbiology" Text="Biology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicbiotech" Text="Biotechnology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicbotany" Text="Botany " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicchemistry" Text="Chemistry " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicearthScience" Text="Earth Science " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicecology" Text="Ecology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicelectronics" Text="Electronics " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicentomology" Text="Entomology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicenvironmentalScience" Text="Environmental Science "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicepidemiology" Text="Epidemiology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgenetics" Text="Genetics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgeology" Text="Geology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichealth" Text="Health " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmarineBiology" Text="Marine Biology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmeteorology" Text="Meteorology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmicrobiology" Text="Microbiology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicoceanography" Text="Oceanography " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicornithology" Text="Ornithology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpaleontology" Text="Paleontology " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphysicalScience" Text="Physical Science " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphysics" Text="Physics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphysiology" Text="Physiology " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsportsMedicine" Text="Sports Medicine " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiczoology" Text="Zoology " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicScienceOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Math:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicalgebra" Text="Algebra " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccalculus" Text="Calculus " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfunctions" Text="Functions " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichonorsMath" Text="Honors Math " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgeometry" Text="Geometry " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicprobability" Text="Probability " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicstatistics" Text="Statistics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademictrig" Text="Trigonometry " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicMathOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Computer Studies:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccomApp" Text="Computer Applications " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccomProgramming" Text="Computer Programming " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccomScience" Text="Computer Science " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmultimedia" Text="Multimedia " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicwebDesign" Text="Web Design " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicComputerOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Music:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicband" Text="Band " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicchoralMusic" Text="Choral Music " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccomposition" Text="Composition " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicelectronicMusic" Text="Electronic Music " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichistoryJazz" Text="History of Jazz " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichistoryOfMusic" Text="History of Music " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicindividualInstructions" Text="Individual Instructions "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmusicAppreciation" Text="Music Appreciation " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmusicHistory" Text="Music History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmusicTheory" Text="Music Theory " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicopera" Text="Opera " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicorchestra" Text="Orchestra " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicprincipleOfArranging" Text="Principles of Arranging "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicrecording" Text="Recording " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsolfegeEarTraining" Text="Solfege/Ear Training " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsongwriting" Text="Songwriting " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicvoice" Text="Voice " TextAlign="right" runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicMusicOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                                </li>
                                          </ul>
                                    </div>
                                    <div class="left">
                                          <p class="sm-h">
                                                Performing/Visual Arts:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdesign3d" Text="3-D Design " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicacting" Text="Acting " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicanimation" Text="Animation " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicarchitecture" Text="Architecture " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicart" Text="Art " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicartHistory" Text="Art History " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicballet" Text="Ballet " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicceramics" Text="Ceramics " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicchoreography" Text="Choreography " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdance" Text="Dance " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdebate" Text="Debate " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdesign" Text="Design " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdirecting" Text="Directing " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdrama" Text="Drama " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicdrawing" Text="Drawing " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfashionDesign" Text="Fashion Design " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfiberArts" Text="Fiber Arts " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicfilmVideo" Text="Film and Video " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicgraphicDesign" Text="Graphic Design " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademichistoryTheater" Text="History of Theater " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicjournalism" Text="Journalism " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiclightingDesign" Text="Lighting Design " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmetal" Text="Metal " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicmodernDance" Text="Modern Dance " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpainting" Text="Painting " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicphotography" Text="Photography " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicportfolio" Text="Portfolio " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpottery" Text="Pottery " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicprintmaking" Text="Printmaking " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicproduction" Text="Production " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpublicSpeaking" Text="Public Speaking " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpublications" Text="Publications " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicscreenPrinting" Text="Screen-printing " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicscreenwriting" Text="Screenwriting " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsculpture" Text="Sculpture " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsilkscreen" Text="Silkscreen " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicstagecraft" Text="Stagecraft " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicstudioart" Text="Studio Art " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademictvProduction" Text="Television Production " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademictextiles" Text="Textiles " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademictheaterArt" Text="Theater Arts " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademictheaterDesign" Text="Theater Design " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicweaving" Text="Weaving " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicwoodworking" Text="Woodworking " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicVisualOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Special Programs:</p>
                                          <ul>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiccommunityService" Text="Community Service " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicexchangePrograms" Text="Exchange Programs " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicindependentStudy" Text="Independent Study " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicinternships" Text="Internships " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicjrotc" Text="JROTC " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicleadership" Text="Leadership " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademiclearningSeaPrograms" Text="Learning at Sea Programs "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicoutdoorEducation" Text="Outdoor Education " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicpersonalFinance" Text="Personal Finance " TextAlign="right"
                                                            runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicrifleTeam" Text="Rifle Team " TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicsemesterYearOffCampus" Text="Semester/Year Off-Campus "
                                                            TextAlign="right" runat="server" /></li>
                                                <li>
                                                      <asp:CheckBox ID="checkAcademicstudyAbroad" Text="Study Abroad" TextAlign="right"
                                                            runat="server" /></li>
                                                <li>Other:&nbsp;<asp:TextBox ID="textAcademicSpecialOther" TextMode="MultiLine" Height="100"
                                                      runat="server" />
                                                </li>
                                          </ul>
                                          <p class="sm-h">
                                                Distinctive or New Programs Offered:</p>
                                          <p>
                                                Enter the names of up to 4 programs, one per line.</p>
                                          <asp:TextBox ID="textAcademicDistinctiveOther" runat="server" TextMode="multiLine"
                                                Height="150px" Width="225px" />
                                    </div>
                              </div>
                        </div>
                  </div>
            </div>
            <!-- Campus Life -->
            <div class="edit-school-tabs">
                  <h3>
                        campus life</h3>
                  <div>
                        <div class="edit-school-non">
                              <h5>
                                    campus life image</h5>
                              <div class="img-up">
                                    <p class="left">
                                          Upload:</p>
                                    <asp:Image ID="imgCampusLife" runat="server" Style="max-width: 200px;" Visible="false" />
                                    <asp:FileUpload ID="fileCampusLife" runat="server" />
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    campus life</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Summary:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="textCampusSummary" runat="server" TextMode="MultiLine" Height="150px"
                                                      Width="350px" MaxLength="300" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                Dept. Director: <em class="notice">(Last Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textcampusDirLastName" runat="server" />
                                          </td>
                                          <td class="tablecolumn">
                                                Dept. Director: <em class="notice">(First Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textcampusDirFirstName" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="tablecolumn">
                                                Dept. Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textcampusDirTitle" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    dorm life</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Average no. of students per dorm:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textavgStudentsDorm" runat="server" Text="0" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>No. of girls dorms:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textgirlsDorms" runat="server" Text="0" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>No. of boys dorms:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textboysDorms" runat="server" Text="0" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Dorm Amenities:
                                          </td>
                                          <td colspan="3">
                                                <asp:CheckBox ID="checkboxGameRoom" Text="Game Room " TextAlign="right" runat="server" /><br />
                                                <asp:CheckBox ID="checkboxLaundry" Text="Laundry Facilities " TextAlign="right" runat="server" /><br />
                                                <asp:CheckBox ID="checkboxLounge" Text="Lounge " TextAlign="right" runat="server" /><br />
                                                <asp:CheckBox ID="checkboxWIFI" Text="Wireless Internet " TextAlign="right" runat="server" /><br />
                                                <asp:CheckBox ID="checkboxVending" Text="Vending Machines " TextAlign="right" runat="server" /><br />
                                                Other:&nbsp;<asp:TextBox ID="textCampusDormOther" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>Dress Code:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="dropCampusDressCode" runat="server" DataTextField="dresscode"
                                                      DataValueField="dresscodeid" AppendDataBoundItems="true">
                                                      <asp:ListItem Text="--" Value="0" />
                                                </asp:DropDownList>
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    student life</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Summary:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCampusStudentLife" runat="server" TextMode="multiLine" Width="225px"
                                                      Height="350px" MaxLength="300" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    facilities</h5>
                              <table width="820px">
                                    <tr>
                                          <td width="33%">
                                                <asp:CheckBox ID="checkboxallWeatherTrack" Text="All-weather track " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td width="33%">
                                                <asp:CheckBox ID="checkboxbaseballField" Text="Baseball field(s) " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td width="33%">
                                                <asp:CheckBox ID="checkboxbasketballCourt" Text="Basketball court(s) " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxfitnessCenter" Text="Fitness Center " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxtechCenterFacility" Text="Technology Center " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxvolleyballCourt" Text="Volleyball court(s) " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxsandVolleyballCourt" Text="Sand volleyball court(s) " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxfootballField" Text="Football field " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxindoorBasketballCourt" Text="Indoor basketball court(s) "
                                                      TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxracquetballCourt" Text="Racquetball court(s) " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxpool" Text="Pool " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxindoorPool" Text="Indoor pool " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxindoorClimbingWall" Text="Indoor climbing wall " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                Other:&nbsp;<asp:TextBox ID="textCampusFacilitiesOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    clubs and organizations</h5>
                              <table width="820px">
                                    <tr>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkboxamnestyIntl" Text="Amnesty International " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkboxanimalRights" Text="Animal Rights Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkboxarchaeologyClub" Text="Archaeology Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="checkboxasianClub" Text="Asian Club " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxastronomyClub" Text="Astronomy Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxchessClub" Text="Chess Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxclassicsClub" Text="Classics Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxcommunityServiceClub" Text="Community Service " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxcomputerClub" Text="Computer Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxdebateClub" Text="Debate Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxdiversityClub" Text="Diversity Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxdormProctors" Text="Dorm Proctors " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxdramaClub" Text="Drama Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxenvironmentalClub" Text="Environmental Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxFCA" Text="FCA " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxfencingClub" Text="Fencing " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxfoodCouncil" Text="Food Council " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxforeignLanguageClub" Text="Foreign Language Clubs " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxfreeTibet" Text="Free Tibet " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxfutureBizLeader" Text="Future Bus. Leaders of Am. " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxgardeningClub" Text="Gardening " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxhabitatForHumanity" Text="Habitat for Humanity " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxhonorCouncil" Text="Honor Council " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxhorsebackRiding" Text="Horseback Riding " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxinternationalClub" Text="International Clubs " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxinvestmentClub" Text="Investment Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxjewishStudentOrg" Text="Jewish Student Org " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxliteraryMagazine" Text="Literary Magazine " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxmathClub" Text="Math Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxmodelUN" Text="Model UN " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxmockTrial" Text="Mock Trial " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxnationalHonorSociety" Text="National Honor Society " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxnewspaperClub" Text="Newspaper " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxoutingClub" Text="Outing Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxpeerCounseling" Text="Peer Counseling " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxpeerTutoring" Text="Peer Tutoring " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxpepClub" Text="Pep Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxphotographyClub" Text="Photography " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxquizBowl" Text="Quiz Bowl " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxsailingClub" Text="Sailing Club " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxscienceBowl" Text="Science Bowl " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxscienceFictionClub" Text="Science Fiction Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxscoutingClub" Text="Scouting " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxsexualitiesClub" Text="Sexualities Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxskateboardClub" Text="Skateboarding Clubs " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxsnowboardClub" Text="Snowboarding " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxsolarCarClub" Text="Solar Car Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxstudentActiviyClub" Text="Student Activities " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxstudentGovtClub" Text="Student Government " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxstudentPublicationClub" Text="Student Publications " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxstudentRadioStation" Text="Student Radio Station " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxSADD" Text="SADD " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxsurfingClub" Text="Surfing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxtheaterClub" Text="Theater " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxtvStation" Text="TV Station " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxweightliftingClub" Text="Weightlifting " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxwoodworkClub" Text="Woodworking Club " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxyearbook" Text="Yearbook " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxyogaClub" Text="Yoga " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="checkboxyoungDemocrats" Text="Young Democrats " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="checkboxyoungRepublicans" Text="Young Republicans " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                Other:&nbsp;<asp:TextBox ID="textCampusClubOther" runat="server" TextMode="MultiLine"
                                                      Height="100" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- Athletics -->
            <div class="edit-school-tabs">
                  <h3>
                        arts &amp; athletics</h3>
                  <div>
                        <div class="edit-school-non">
                              <h5>
                                    arts &amp; athletics image</h5>
                              <div class="img-up">
                                    <p class="left">
                                          Upload:</p>
                                    <asp:Image ID="imgAA" runat="server" Style="max-width: 200px;" Visible="false" />
                                    <asp:FileUpload ID="fileAA" runat="server" />
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    summary</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Summary:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="artNote" runat="server" Height="150px" Width="350px" TextMode="multiline"
                                                      MaxLength="300" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Arts Department Director: <em class="notice">(Last Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="artDirLastName" runat="server" />
                                          </td>
                                          <td>
                                                Arts Department Director: <em class="notice">(First Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="artDirFirstName" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Arts Department Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="artDirTitle" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Athletics Department Director: <em class="notice">(Last Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="athDirLastName" runat="server" />
                                          </td>
                                          <td>
                                                Athletics Department Director: <em class="notice">(First Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="athDirFirstName" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                Athletics Department Director Title:
                                          </td>
                                          <td valign="top">
                                                <asp:TextBox ID="athDirTitle" runat="server" />
                                          </td>
                                          <td valign="top">
                                                Noteworthy Achievements:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="athNoteworthy" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    arts</h5>
                              <table width="820px">
                                    <tr>
                                          <td width="25%">
                                                <asp:CheckBox ID="acapella" Text="A Cappella Group " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="artClub" Text="Art Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="audioVisualClub" Text="Audiovisual Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td width="25%">
                                                <asp:CheckBox ID="brassEnsemble" Text="Brass Ensemble " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="chamberChoir" Text="Chamber Choir " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="chamberEnsemble" Text="Chamber Ensemble " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="chamberOrchestra" Text="Chamber Orchestra " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="choralMusicArt" Text="Choral Music " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="artDance" Text="Dance " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="dramaClubArt" Text="Drama Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="folkMusicClub" Text="Folk Music Club " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="gleeClub" Text="Glee Club " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="gospelChoir" Text="Gospel Choir " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="guitarEnsemble" Text="Guitar Ensemble " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="improvGroup" Text="Improvisation Group " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="jazzEnsemble" Text="Jazz Ensemble " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="pepBand" Text="Pep Band " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="rockBand" Text="Rock Band " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="stageBand" Text="Stage Band " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="stringEnsemble" Text="String Ensemble " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                <asp:CheckBox ID="techCrew" Text="Tech Crew " TextAlign="right" runat="server" />
                                          </td>
                                          <td valign="top">
                                                <asp:CheckBox ID="theater" Text="Theater " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                Other:&nbsp;<asp:TextBox ID="textArtsOther" TextMode="MultiLine" Height="100" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    athletics</h5>
                              <table width="820px">
                                    <tr>
                                          <td width="25%">
                                                <p class="sm-h">
                                                      Interscholastic Sports</p>
                                          </td>
                                          <td width="25%">
                                          </td>
                                          <td width="25%">
                                          </td>
                                          <td width="25%">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interAerobics" Text="Aerobics " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interAlpineRacing" Text="Alpine Ski Racing " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interAlpineSkiing" Text="Alpine Skiing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interBadminton" Text="Badminton " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interBaseball" Text="Baseball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interBasketball" Text="Basketball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interBowling" Text="Bowling " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interCamping" Text="Camping " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interCanoeing" Text="Canoeing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interCheerleading" Text="Cheerleading " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interCrew" Text="Crew " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interCricket" Text="Cricket " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interCrossCountry" Text="Cross-Country Running " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interCurling" Text="Curling " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interDance" Text="Dance " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interDiving" Text="Diving " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interDrillTeam" Text="Drill Team " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interEquestrian" Text="Equestrian " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interFencing" Text="Fencing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interFieldHockey" Text="Field Hockey " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td class="style1">
                                                <asp:CheckBox ID="interFigureSkating" runat="server" Text="Figure Skating" TextAlign="right" />
                                          </td>
                                          <td class="style1">
                                                <asp:CheckBox ID="interGolf" runat="server" Text="Golf " TextAlign="right" />
                                          </td>
                                          <td class="style1">
                                                <asp:CheckBox ID="interGymnastics" runat="server" Text="Gymnastics " TextAlign="right" />
                                          </td>
                                          <td class="style1">
                                                <asp:CheckBox ID="interIceClimbing" runat="server" Text="Ice Climbing " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interFootball" runat="server" Text="Football " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interHiking" runat="server" Text="Hiking " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interHorseback" runat="server" Text="Horseback Riding " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interKickball" runat="server" Text="Kickball " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interFreestyleSki" runat="server" Text="Free Style Skiing " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interIceSkating" runat="server" Text="Ice Skating " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interKayaking" runat="server" Text="Kayaking " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interHandball" runat="server" Text="Handball " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interLacrosse" runat="server" Text="Lacrosse " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interLuge" runat="server" Text="Luge " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interMartialArt" runat="server" Text="Martial Arts " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interIceHockey" runat="server" Text="Ice Hockey " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interNordicSkiRacing" runat="server" Text="Nordic Ski Racing "
                                                      TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interNordicSki" runat="server" Text="Nordic Skiing " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interOutdoorEdu" runat="server" Text="Outdoor Education " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interKickboxing" runat="server" Text="Kickboxing " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interPolo" runat="server" Text="Polo " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interPowerLifting" runat="server" Text="Power Lifting " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interRacquet" runat="server" Text="Racquet Ball " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interMtBike" runat="server" Text="Mountain Biking " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interRifle" runat="server" Text="Rifle Team " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interRockClimbing" runat="server" Text="Rock Climbing " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interRugby" runat="server" Text="Rugby " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interPaddleTennis" runat="server" Text="Paddle Tennis " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interSkateboard" runat="server" Text="Skateboarding " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interSkiJump" runat="server" Text="Ski Jumping " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interSnowboard" runat="server" Text="Snowboarding " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interRafting" runat="server" Text="Rafting " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interSoftball" runat="server" Text="Softball " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interSquash" runat="server" Text="Squash " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interSurfing" runat="server" Text="Surfing " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interSailing" runat="server" Text="Sailing " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interTableTennis" runat="server" Text="Table Tennis " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interTennis" runat="server" Text="Tennis " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interTrackField" runat="server" Text="Track and Field " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interSoccer" runat="server" Text="Soccer " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interVolleyball" runat="server" Text="Volleyball " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interWaterPolo" runat="server" Text="Water Polo " TextAlign="right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="interWeightLifting" runat="server" Text="Weight Lifting " TextAlign="right" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interSwimming" runat="server" Text="Swimming " TextAlign="right" />
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                          <td>
                                                Other:<asp:TextBox ID="textSportsOther" runat="server" Height="100" TextMode="MultiLine" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="interUltFrisbee" runat="server" Text="Ultimate Frisbee " TextAlign="right" />
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                <asp:CheckBox ID="interWrestling" runat="server" Text="Wrestling " TextAlign="right" />
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                              <table width="820px">
                                    <tr>
                                          <td width="25%">
                                                <p class="sm-h">
                                                      Recreational Sports</p>
                                          </td>
                                          <td width="25%">
                                          </td>
                                          <td width="25%">
                                          </td>
                                          <td width="25%">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="reAerobics" Text="Aerobics " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recAlpineSkiRacing" Text="Alpine Ski Racing " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recAlpineSki" Text="Alpine Skiing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recBadminton" Text="Badminton " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recBaseball" Text="Baseball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recBasketball" Text="Basketball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recBowling" Text="Bowling " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recCamping" Text="Camping " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recCanoeing" Text="Canoeing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recCheerleading" Text="Cheerleading " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recCrew" Text="Crew " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recCricket" Text="Cricket " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recCrossCountry" Text="Cross-Country Running " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recCurling" Text="Curling " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recDance" Text="Dance " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recDiving" Text="Diving " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recDrillTeam" Text="Drill Team " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recEquestrian" Text="Equestrian " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recFencing" Text="Fencing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recFieldHockey" Text="Field Hockey " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recFigureSkating" Text="Figure Skating " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recFootball" Text="Football " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recFreeStyleSki" Text="Free Style Skiing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recGolf" Text="Golf " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recGymnastics" Text="Gymnastics " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recHandball" Text="Handball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recHiking" Text="Hiking " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recHorseback" Text="Horseback Riding " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recIceClimbing" Text="Ice Climbing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recIceHockey" Text="Ice Hockey " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recIceSkating" Text="Ice Skating " TextAlign="Right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recKickball" Text="Kickball " TextAlign="Right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recKickboxing" runat="server" Text="Kickboxing " TextAlign="Right" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recKayaking" Text="Kayaking " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recLacrosse" Text="Lacrosse " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recLuge" Text="Luge " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recMartialArts" Text="Martial Arts " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recMtBike" Text="Mountain Biking " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recNordicSkiRacing" Text="Nordic Ski Racing " TextAlign="right"
                                                      runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recNordicSkiing" Text="Nordic Skiing " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recOutdoorEdu" Text="Outdoor Education " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recPaddleTennis" Text="Paddle Tennis " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recPolo" Text="Polo " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recPowerLifting" Text="Power Lifting " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recRacquet" Text="Racquet Ball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recRafting" Text="Rafting " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recRifilTeam" Text="Rifle Team " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recRockCilmbing" Text="Rock Climbing " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recRugby" Text="Rugby " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSailing" Text="Sailing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSkateboarding" Text="Skateboarding " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSkiJumping" Text="Ski Jumping " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recSnowboarding" Text="Snowboarding " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSoccer" Text="Soccer " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSoftball" Text="Softball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSquash" Text="Squash " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recSurfing" Text="Surfing " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recSwimming" Text="Swimming " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recTableTennis" Text="Table Tennis " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recTennis" Text="Tennis " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <asp:CheckBox ID="recTrackField" Text="Track and Field " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recUltFrisbee" Text="Ultimate Frisbee " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recVolleyball" Text="Volleyball " TextAlign="right" runat="server" />
                                          </td>
                                          <td>
                                                <asp:CheckBox ID="recWaterPolo" Text="Water Polo " TextAlign="right" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td valign="top">
                                                <asp:CheckBox ID="recWeightLifting" Text="Weight Lifting " TextAlign="right" runat="server" />
                                          </td>
                                          <td valign="top">
                                                <asp:CheckBox ID="recWrestling" Text="Wrestling " TextAlign="right" runat="server" />
                                          </td>
                                          <td colspan="2">
                                                Other:&nbsp;<asp:TextBox ID="textRecOther" runat="server" TextMode="MultiLine" Height="100" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- College Information -->
            <div class="edit-school-tabs">
                  <h3>
                        college information</h3>
                  <div>
                        <div class="edit-school-non">
                              <h5>
                                    college information image</h5>
                              <div class="img-up">
                                    <p class="left">
                                          Upload:</p>
                                    <asp:Image ID="imgCollegeInfo" runat="server" Style="max-width: 200px;" Visible="false" />
                                    <asp:FileUpload ID="fileCollegeInfo" runat="server" />
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    summary</h5>
                              <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                          <td>
                                                Summary:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="textCollegeSummary" runat="server" TextMode="MultiLine" Height="150px"
                                                      Width="350px" MaxLength="300" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Department Director: <em class="notice">(Last Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeDirLastName" runat="server" />
                                          </td>
                                          <td>
                                                Department Director: <em class="notice">(First Name)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeDirFirstName" runat="server" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Department Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeDirTitle" runat="server" />
                                          </td>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    colleges</h5>
                              <table cellpadding="5">
                                    <tr>
                                          <td width="300">
                                                <span>*</span>Percentage of graduates who go on to colleges, university, or service
                                                academies
                                          </td>
                                          <td class="edit-small" width="150">
                                                <asp:TextBox ID="textCollegePercHigherEd" runat="server" Text="0" Width="50px" />%
                                                (0 - 100)
                                          </td>
                                          <td class="align-r">
                                                <b>Percentile SAT scores</b>
                                          </td>
                                          <td>
                                                <b>25th %</b>
                                          </td>
                                          <td>
                                                <b>75th %</b>
                                          </td>
                                          <td>
                                                &nbsp;
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td class="align-r">
                                                Critical Reading
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox runat="server" ID="tbCriticalReading25" />
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox runat="server" ID="tbCriticalReading75" />
                                          </td>
                                          <td class="edit-small">
                                                (0-800)
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td class="align-r">
                                                Mathematics:
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox runat="server" ID="tbMathematics25" />
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox runat="server" ID="tbMathematics75" />
                                          </td>
                                          <td class="edit-small">
                                                (0-800)
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                          </td>
                                          <td class="align-r">
                                                Writing
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox runat="server" ID="tbWriting25" />
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox runat="server" ID="tbWriting75" />
                                          </td>
                                          <td class="edit-small">
                                                (0-800)
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    colleges attended in the past 5 years</h5>
                              <table class="align-r">
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <p class="sm-h">
                                                      College Name</p>
                                          </td>
                                          <td>
                                                <p class="sm-h">
                                                      No. of Students</p>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>1
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt1" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt1No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>2
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt2" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt2No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>3
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt3" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt3No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>4
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt4" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt4No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <span>*</span>5
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt5" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt5No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                6
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt6" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt6No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                7
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt7" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt7No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                8
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt8" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt8No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                9
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt9" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt9No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                10
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt10" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt10No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                11
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt11" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt11No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                12
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt12" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt12No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                13
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt13" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt13No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                14
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt14" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt14No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                15
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt15" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt15No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                16
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt16" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt16No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                17
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt17" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt17No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                18
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt18" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt18No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                19
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt19" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt19No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                20
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt20" runat="server" />
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCollegeAtt20No" runat="server" Width="25px" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    distinguished alumni</h5>
                              <table class="align-r">
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <p class="sm-h">
                                                      Alumnus/Alumna Name</p>
                                          </td>
                                          <td>
                                                <p class="sm-h">
                                                      Class Year</p>
                                          </td>
                                          <td>
                                                <p class="sm-h">
                                                      Biographical Notes(100 characters max)</p>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                1
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName1" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear1" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes1" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                2
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName2" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear2" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes2" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                3
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName3" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear3" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes3" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                4
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName4" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear4" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes4" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                5
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName5" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear5" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes5" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                6
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName6" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear6" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes6" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                7
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName7" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear7" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes7" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                8
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName8" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear8" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes8" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                9
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName9" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear9" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes9" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                10
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAName10" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtAYear10" runat="server"></asp:TextBox>
                                          </td>
                                          <td class="edit-400">
                                                <asp:TextBox ID="txtANotes10" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    quotes from alumni</h5>
                              <table cellpadding="5">
                                    <tr>
                                          <td>
                                                <b>1</b>
                                          </td>
                                          <td colspan="3">
                                                <b>Quote<em class="notice">(200 characters max)</em></b>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td rowspan="3">
                                                <asp:TextBox ID="txtQuote1" TextMode="MultiLine" MaxLength="200" Width="300px" Height="100px"
                                                      runat="server" Style="margin-right: 0px"></asp:TextBox>
                                          </td>
                                          <td>
                                                <b>Alumnus/Alumna Name</b>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtQuoteName1" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <b>Class Year</b>
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="txtQuoteYear1" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <b>Biographical Notes</b><br />
                                                <em class="notice">(100 characters max)</em>
                                          </td>
                                          <td class="edit-250">
                                                <asp:TextBox ID="txtQuoteBio1" runat="server" MaxLength="100"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <b>2</b>
                                          </td>
                                          <td colspan="3">
                                                <b>Quote<em class="notice">(200 characters max)</em></b>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td rowspan="3">
                                                <asp:TextBox ID="txtQuote2" TextMode="MultiLine" MaxLength="200" Width="300px" Height="100px"
                                                      runat="server" Style="margin-right: 0px"></asp:TextBox>
                                          </td>
                                          <td>
                                                <b>Alumnus/Alumna Name</b>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtQuoteName2" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <b>Class Year</b>
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="txtQuoteYear2" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <b>Biographical Notes</b><br />
                                                <em class="notice">(100 characters max)</em>
                                          </td>
                                          <td class="edit-250">
                                                <asp:TextBox ID="txtQuoteBio2" runat="server" MaxLength="100"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <b>3</b>
                                          </td>
                                          <td colspan="3">
                                                <b>Quote<em class="notice">(200 characters max)</em></b>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td rowspan="3">
                                                <asp:TextBox ID="txtQuote3" TextMode="MultiLine" MaxLength="200" Width="300px" Height="100px"
                                                      runat="server" Style="margin-right: 0px"></asp:TextBox>
                                          </td>
                                          <td>
                                                <b>Alumnus/Alumna Name</b>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtQuoteName3" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <b>Class Year</b>
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="txtQuoteYear3" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                          </td>
                                          <td>
                                                <b>Biographical Notes</b><br />
                                                <em class="notice">(100 characters max)</em>
                                          </td>
                                          <td class="edit-250">
                                                <asp:TextBox ID="txtQuoteBio3" runat="server" MaxLength="100"></asp:TextBox>
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- Summer Programs -->
            <div class="edit-school-tabs">
                  <h3>
                        summer programs</h3>
                  <div>
                        <div class="edit-school-non">
                              <h5>
                                    summer programs image</h5>
                              <div class="img-up">
                                    <p class="left">
                                          upload:</p>
                                    <asp:Image ID="imgsummer" runat="server" Style="max-width: 200px;" Visible="false" />
                                    <asp:FileUpload ID="summerImgUpload" runat="server" />
                              </div>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    summary</h5>
                              <table>
                                    <tr>
                                          <td>
                                                Summary:<br />
                                                <em class="notice">(300 characters)</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textSummerProgramSummary" runat="server" Rows="5" Columns="80" TextMode="multiLine" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    program 1</h5>
                              <table>
                                    <tr>
                                          <td>
                                                Name of Program:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Director Name:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1DirName" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1DirTitle" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Program Type:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="ddlProgram1Type" runat="server">
                                                      <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                                                      <asp:ListItem Text="Arcademic" Value="Arcademic"></asp:ListItem>
                                                      <asp:ListItem Text="Arts" Value="Arts"></asp:ListItem>
                                                      <asp:ListItem Text="Athletics" Value="Athletics"></asp:ListItem>
                                                      <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Starts On
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1Start" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                Ends On
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1End" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Boarding:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="ddlProgram1Boarding" runat="server">
                                                      <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                                                      <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                                                      <asp:ListItem Text="Boarding" Value="Boarding"></asp:ListItem>
                                                      <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Description:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="txtProgram1Desc" runat="server" MaxLength="300" TextMode="MultiLine"
                                                      Width="300px" Height="150px"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Application/Registration<br />
                                                Deadline
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1Deadline" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Tuition:
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="txtProgram1Tuition" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Financial Aid Available:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="rdoProgram1" TextAlign="Right" CssClass="yesNoRadio" runat="server">
                                                      <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                      <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                </asp:RadioButtonList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Website URL:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram1Url" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    program 2</h5>
                              <table>
                                    <tr>
                                          <td>
                                                Name of Program:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Director Name:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2DirName" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2DirTitle" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Program Type:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="ddlProgram2Type" runat="server">
                                                      <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                                                      <asp:ListItem Text="Arcademic" Value="Arcademic"></asp:ListItem>
                                                      <asp:ListItem Text="Arts" Value="Arts"></asp:ListItem>
                                                      <asp:ListItem Text="Athletics" Value="Athletics"></asp:ListItem>
                                                      <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Starts On
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2Start" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                Ends On
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2End" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Boarding:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="ddlProgram2Boarding" runat="server">
                                                      <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                                                      <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                                                      <asp:ListItem Text="Boarding" Value="Boarding"></asp:ListItem>
                                                      <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Description:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="txtProgram2Desc" runat="server" MaxLength="300" TextMode="MultiLine"
                                                      Width="300px" Height="150px"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Application/Registration<br />
                                                Deadline
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2Deadline" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Tuition:
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="txtProgram2Tuition" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Financial Aid Available:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="rdoProgram2" TextAlign="Right" CssClass="yesNoRadio" runat="server">
                                                      <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                      <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                </asp:RadioButtonList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Website URL:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram2Url" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                              </table>
                        </div>
                        <div class="edit-school-border">
                              <h5>
                                    program 3</h5>
                              <table>
                                    <tr>
                                          <td>
                                                Name of Program:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Director Name:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3DirName" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                Director Title:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3DirTitle" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Program Type:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="ddlProgram3Type" runat="server">
                                                      <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                                                      <asp:ListItem Text="Arcademic" Value="Arcademic"></asp:ListItem>
                                                      <asp:ListItem Text="Arts" Value="Arts"></asp:ListItem>
                                                      <asp:ListItem Text="Athletics" Value="Athletics"></asp:ListItem>
                                                      <asp:ListItem Text="Others" Value="Others"></asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Starts On
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3Start" runat="server"></asp:TextBox>
                                          </td>
                                          <td>
                                                Ends On
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3End" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Boarding:
                                          </td>
                                          <td>
                                                <asp:DropDownList ID="ddlProgram3Boarding" runat="server">
                                                      <asp:ListItem Text="--select--" Value="--select--"></asp:ListItem>
                                                      <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                                                      <asp:ListItem Text="Boarding" Value="Boarding"></asp:ListItem>
                                                      <asp:ListItem Text="Both" Value="Both"></asp:ListItem>
                                                </asp:DropDownList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Description:<br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td colspan="3">
                                                <asp:TextBox ID="txtProgram3Desc" runat="server" MaxLength="300" TextMode="MultiLine"
                                                      Width="300px" Height="150px"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Application/Registration<br />
                                                Deadline
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3Deadline" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Tuition:
                                          </td>
                                          <td class="edit-small">
                                                <asp:TextBox ID="txtProgram3Tuition" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Financial Aid Available:
                                          </td>
                                          <td>
                                                <asp:RadioButtonList ID="rdoProgram3" CssClass="yesNoRadio" runat="server">
                                                      <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                                      <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                                </asp:RadioButtonList>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                Website URL:
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtProgram3Url" runat="server"></asp:TextBox>
                                          </td>
                                          <td colspan="2">
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- Custom Tab -->
            <div class="edit-school-tabs">
                  <h3>
                        custom</h3>
                  <div>
                        <div class="edit-school-non">
                              <table>
                                    <tr>
                                          <td>
                                                <b>Activate This Tab:</b>
                                          </td>
                                          <td>
                                                <asp:RadioButtonList RepeatDirection="Horizontal" ID="rdoCustom" CssClass="yesNoRadio"
                                                      runat="server">
                                                      <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                                                      <asp:ListItem Text="No" Selected="True" Value="False"></asp:ListItem>
                                                </asp:RadioButtonList>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <b>Title of This Tab:</b><br />
                                                <em class="notice">10 characters max</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="txtCustomTitle" runat="server"></asp:TextBox>
                                          </td>
                                    </tr>
                                    <tr>
                                          <td>
                                                <b>Body Text:</b><br />
                                                <em class="notice">300 characters max</em>
                                          </td>
                                          <td>
                                                <asp:TextBox ID="textCustomSummary" runat="server" Rows="20" Columns="80" TextMode="multiLine" />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </div>
            </div>
            <!-- Submit -->
      </ContentTemplate>
</asp:UpdatePanel>
<p>
      &nbsp;</p>
      <p class="redBlock" style="margin:10px auto;">
        Note: You MUST click "Save" at the bottom of this page in order to save your data. After saving, this page may take a minute or two to refresh.
      </p>

<div class="edit-submit-box">
      <asp:Button ID="buttonUpdate" runat="server" Text="Save" CssClass="edit-save" />
      <input type="reset" value="Cancel" class="edit-reset" />
</div>

<!-- Renewal -->
<asp:UpdatePanel ID="renewlUpdatePanel" runat="server">
      <ContentTemplate>
            <div id="renewDiv" visible="false" runat="server" class="confirmation-box left">
                  <div class="confirmation-bt">
                        &nbsp;</div>
                  <div class="confirmation-bm floatclear">
                        <asp:CheckBox ID="chxConfirmRenewal" CssClass="left" runat="server" OnCheckedChanged="chxConfirmRenewal_CheckedChanged" />
                        <p>
                              Checking this box serves as my signature and confirms that all information in my
                              school profile is accurate for membership renewal. By accepting inclusion in the
                              <asp:Label ID="lblRenewalYr" runat="server"></asp:Label>
                              membership directory, my school agrees to pay its annual dues of&nbsp;
                              <asp:Label ID="lblDue" runat="server"></asp:Label>
                              I understand that payment is due&nbsp;<asp:Label ID="lblDueDate" runat="server"></asp:Label>.</p>
                        <asp:HyperLink ID="membershipLink" NavigateUrl="#paybox" runat="server" CssClass="renew-member showOverlay"
                              Text="Renew Our Membership"></asp:HyperLink>
                        <div class="overlaybox">
                              <div class="paybox" id="paybox">
                                    <div>
                                          <img src="/resources/images/overlay-bt.png" alt="" /></div>
                                    <div class="paybox-bm">
                                          <asp:MultiView ID="renewPayView" runat="server" ActiveViewIndex="0">
                                                <asp:View ID="choiceView" runat="server">
                                                      <b>Select Payment Method</b>
                                                      <table>
                                                            <tr>
                                                                  <td>
                                                                        <a href="#pay-credit">
                                                                              <input type="radio" checked="checked" value="credit-card" name="pay" /></a>Credit
                                                                        Card
                                                                  </td>
                                                                  <td>
                                                                        <a href="#pay-later">
                                                                              <input type="radio" value="pay-later" name="pay" /></a>Pay Later
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  <td>
                                                                        <a href="#chk-mon">
                                                                              <input type="radio" value="chkmon-order" name="pay" /></a>Check/Money Order
                                                                  </td>
                                                                  <td>
                                                                        (by credit card or check/money order)
                                                                  </td>
                                                            </tr>
                                                      </table>
                                                </asp:View>
                                          </asp:MultiView>
                                          <div id="fault-page" class="pop-fir">
                                                <div class="pop-up">
                                                      &nbsp;
                                                </div>
                                                <div class="btns">
                                                      <a class="canc">
                                                            <input type="button" value="Cancel" /></a>
                                                </div>
                                          </div>
                                          <div id="pay-credit">
                                                <div class="pop-up">
                                                      <asp:MultiView ID="ccPayView" ActiveViewIndex="0" runat="server">
                                                            <asp:View ID="billingView" runat="server">
                                                                  <ul>
                                                                        <li>
                                                                              <label>
                                                                                    Full Name:</label>&nbsp;<asp:TextBox ID="txtFName" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <label>
                                                                                    Email:</label>&nbsp;<asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <label>
                                                                                    Address 1:</label>&nbsp;<asp:TextBox ID="txtAdd1" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <label>
                                                                                    Address 2:</label>&nbsp;<asp:TextBox ID="txtAdd2" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <label>
                                                                                    City:</label>&nbsp;<asp:TextBox ID="txtCity" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <label>
                                                                                    Country:</label>&nbsp;<asp:DropDownList ID="ddlCountry" runat="server" DataTextField="country"
                                                                                          DataValueField="countryid" AutoPostBack="true">
                                                                                    </asp:DropDownList>
                                                                        </li>
                                                                        <li>
                                                                              <label>
                                                                                    State:</label>&nbsp;<asp:DropDownList ID="ddlState" runat="server" DataTextField="state"
                                                                                          DataValueField="stateid">
                                                                                    </asp:DropDownList>
                                                                        </li>
                                                                        <li>
                                                                              <label>
                                                                                    Zip:</label><asp:TextBox ID="txtZip" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <label>
                                                                                    Phone:</label>&nbsp;<asp:TextBox ID="txtPhone" runat="server"></asp:TextBox></li>
                                                                        <li>
                                                                              <asp:Button ID="btnNextCC" Text="Next" runat="server" OnClick="btnNextCC_Click" /></li>
                                                                  </ul>
                                                            </asp:View>
                                                            <asp:View ID="ccView" runat="server">
                                                                  <b>Full Name:</b>&nbsp;<asp:Label ID="lblFullName" runat="server"></asp:Label><br />
                                                                  <b>Credit Card:</b>&nbsp;<asp:TextBox ID="txtCC" runat="server"></asp:TextBox><br />
                                                                  <b>CCV:</b>&nbsp;<asp:TextBox ID="txtCCV" runat="server"></asp:TextBox><br />
                                                                  <b>Exp Date</b>&nbsp;<asp:TextBox ID="txtExp" runat="server"></asp:TextBox><br />
                                                                  <b>Total:</b>&nbsp;<asp:Label ID="lblTotalDue" runat="server"></asp:Label><br />
                                                                  <asp:Button ID="btnBackToPerson" Text="Back" runat="server" OnClick="btnBackToPerson_Click" />&nbsp;
                                                                  <asp:Button ID="btnThanks" Text="Submit Payment" runat="server" OnClick="btnThanks_Click" />
                                                            </asp:View>
                                                            <asp:View ID="tyView" runat="server">
                                                                  <h4>
                                                                        Thank you</h4>
                                                                  Your credit card payment has been received and your account has been renewed
                                                            </asp:View>
                                                      </asp:MultiView>
                                                </div>
                                          </div>
                                          <div id="pay-later" class="pop-suddn">
                                                <div class="pop-up">
                                                      <p>
                                                            When you are ready to submit payment, please visit the School Account page and click
                                                            Submit Payment.</p>
                                                </div>
                                                <div class="btns">
                                                      <a class="canc">
                                                            <input type="button" value="Close" /></a>
                                                </div>
                                          </div>
                                          <div id="thx" class="pop-suddn">
                                                <div class="pop-up">
                                                      <p>
                                                            Thank you</p>
                                                      <p>
                                                            We'll update your account status and notify you when we receive your check.</p>
                                                </div>
                                                <div class="btns">
                                                      <a class="canc">
                                                            <input type="button" value="Close" /></a>
                                                </div>
                                          </div>
                                          <div id="chk-mon" class="pop-suddn">
                                                <div class="pop-up">
                                                      <p>
                                                            Please mail a check or money order for USD &lt;##&gt; to
                                                      </p>
                                                      <table>
                                                            <tr>
                                                                  <td>
                                                                  </td>
                                                                  <td>
                                                                        The Association of Boarding Schools
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  <td>
                                                                  </td>
                                                                  <td>
                                                                        9 SW Park Square, Suite 201
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  <td>
                                                                  </td>
                                                                  <td>
                                                                        Asheville NC 28801
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  <td>
                                                                  </td>
                                                                  <td>
                                                                        USA
                                                                  </td>
                                                            </tr>
                                                      </table>
                                                      <p>
                                                            It should be payable to:</p>
                                                      <table>
                                                            <tr>
                                                                  <td>
                                                                  </td>
                                                                  <td>
                                                                        The Association of Boarding Schools
                                                                  </td>
                                                            </tr>
                                                            <tr>
                                                                  <td>
                                                                        <input type="checkbox" />
                                                                  </td>
                                                                  <td>
                                                                        I agree to send a check or money order in the amount of ## within 10 business days.
                                                                  </td>
                                                            </tr>
                                                      </table>
                                                </div>
                                                <div class="btns">
                                                      <a class="canc">
                                                            <input type="button" value="Cancel" /></a><a href="#thx" class="thanks"><input type="submit"
                                                                  value="Next>" /></a>
                                                </div>
                                          </div>
                                    </div>
                                    <div>
                                          <img src="/resources/images/overlay-bb.png" alt="" /></div>
                              </div>
                        </div>
                  </div>
                  <div class="confirmation-bb">
                        &nbsp;</div>
            </div>
      </ContentTemplate>
</asp:UpdatePanel>
