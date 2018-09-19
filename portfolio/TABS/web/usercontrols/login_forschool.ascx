<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login_forschool.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.login_forschool" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
  Namespace="System.Web.UI" TagPrefix="asp" %>
<div style="text-align: left;">
  <asp:MultiView ID="multiLogin" runat="server" ActiveViewIndex="0">
    <asp:View ID="viewLogin" runat="server">
      <table cellpadding="0" cellspacing="0" border="0">
        <tr>
          <td colspan="2">
            <label>
              Email Address</label>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="ep">
            <asp:TextBox ID="textUser" runat="server" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <label>
              Password</label>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="ep">
            <asp:TextBox ID="textPass" runat="server" TextMode="password" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
           <asp:Label ID="erroMsg" runat="server" Text="Incorrect credentials, please try again" Visible="false" ForeColor="White"></asp:Label>
          </td>
        </tr>
        <tr>
          <td class="sign-check" width="18">
            <asp:CheckBox ID="checkRemember" runat="server" />
          </td>
          <td>
            <label for="Checkbox1" class="lapel">
              <b>Keep me signed in</b><br />
              </label>
            <div id="schoolloginlink" class="log-help-txt">
              <a href="#schoolloginHelp" class="showOverlay">Login Help</a></div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            &nbsp;
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <table cellpadding="0" cellspacing="0" border="0">
              <tr>
                <td width="65">
                  <asp:ImageButton ID="buttonLogin" runat="server" ImageUrl="/resources/images/sign-log.gif"
                    Width="60" onclick="buttonLogin_Click" />
                </td>
                <td>
				  <div id="schoolloginHelp">
                  <div class="slide-login-div">
                    <div class="slide-login-bt">
                      &nbsp;</div>
                    <div class="slide-loginhelp-form floatclear">
                      <div class="slide-forgot-ur-pawd left">
                  <b>Forgot My Password?</b>
                        <p>
                          To receive password by email, please enter your e-mail address here:</p>
                        <p>
                          <asp:TextBox ID="textEmail" runat="server" /></p>
                        <p>
                          <asp:Button ID="buttonSend" runat="server" class="btn" Text="Submit" 
                            onclick="buttonSend_Click" /></p>
                      </div>
                      <a id="schoolcloseHelp" href="#schoolloginHelp" class="right overlay-close">
                        <img src="../resources/images/overlay-close.gif" alt="" /></a>
                      <div class="slide-need-to-reg left">
                        <asp:UpdatePanel ID="upPanel" runat="server">
                          <ContentTemplate>
                            <b>Need to Register?</b>
                            <p>
                              If your school is already a member, and you'd like to register, contact your administrator.</p>
                            <p>
                              To find your administrator</p>
                            <asp:DropDownList ID="dropSchool" runat="server" DataTextField="schoolname" DataValueField="schoolid"
                              AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="dropSchool_SelectedIndexChanged">
                              <asp:ListItem Text="--" Value="0" />
                            </asp:DropDownList>
                            <ul style="display: none;" id="adminList" runat="server">
                              <li>Your administrators:</li>
                              <asp:Repeater ID="repeatAdmin" runat="server">
                                <ItemTemplate>
                                  <li>
                                    <asp:Literal ID="literalAdmin" runat="server" /></li>
                                </ItemTemplate>
                              </asp:Repeater>
                            </ul>
                          </ContentTemplate>
                        </asp:UpdatePanel>
                      </div>
                    </div>
                    <div class="slide-login-bb">
                      &nbsp;</div>
                  </div>
				  </div>
				  <!-- end school login help overlay -->
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <a href="/for-schools/overview/join-tabs/become-a-member.aspx" class="left">
                    <img src="/resources/images/become-member-call.gif" class="top5 bot0" alt="" /></a>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
    </asp:View>
    <asp:View ID="viewLogout" runat="server">
      <p style="color: #fff;">
        You're logged in.<asp:Literal ID="literalUser2" runat="server" /></p>
    </asp:View>
  </asp:MultiView>
</div>
