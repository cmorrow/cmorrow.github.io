<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="TABS_UserControls.usercontrols.login" %>
<div>
  <asp:UpdatePanel ID="uPanel" runat="server">
    <ContentTemplate>
      <asp:MultiView ID="multiLogin" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewLogin" runat="server">
          <input type="hidden" value="/" name="origin" />
          <input type="hidden" value="true" name="xhr" />
          <label>Email</label>
          &nbsp;&nbsp;&nbsp;<asp:TextBox ID="textUser" runat="server" />
          <label>Password</label>
          &nbsp;&nbsp;&nbsp;<asp:TextBox ID="textPass" runat="server" TextMode="password" />
          <asp:Label ID="errorLbl" Visible="false" runat="server" Text="Incorrect Credentials, Please try again!"
            ForeColor="Red"></asp:Label><div style="text-align:center;">You must CLICK the Login button to log in.</div>
          <div class="buttons" style="vertical-align:middle">
            <asp:Button ID="buttonLogin" runat="server" Text="Login" CssClass="submit-nav" /> &nbsp;
            <a href="#" class="login-help">Login Help</a>
            <div class="clear">
            </div>
          </div>
          <div class="slide-loginhelp">
            <div id="loginHelp" class="slide-login-div">
              <div class="slide-login-bt">
                &nbsp;</div>
              <div class="slide-loginhelp-form floatclear">
                <div class="slide-forgot-ur-pawd left">
                  <b>Forgot our Password?</b>
                  <p>
                    To receive password by email, please enter your email address here:</p>
                  <p>
                    <asp:TextBox ID="textEmail" runat="server"></asp:TextBox></p>
                  <p>
                    <asp:Button ID="btnSend" runat="server" Text="Submit" CssClass="btnSubmit" OnClick="buttonSend_Click" />
                  </p>
                </div>
                <a id="closeHelp" href="#" class="right overlay-close">
                  <img src="/resources/images/overlay-close.gif" alt="" /></a>
                <div class="slide-need-to-reg left">
                  <asp:UpdatePanel ID="upPanel" runat="server">
                    <ContentTemplate>
                      <b>Need to Register?</b>
                      <p>
                        If your school is already a member, and you'd like to register, contact your administrator.</p>
                      <p>
                        To find your administrator</p>
                      <asp:DropDownList ID="ddlSchools" runat="server" OnSelectedIndexChanged="ddlSchools_SelectedIndexChanged"
                        AutoPostBack="True">
                      </asp:DropDownList>
                      <ul style="display: none;" id="adminList" runat="server">
                        <li>Your administrator:</li>
                        <li>
                          <asp:Label ID="lblFName" runat="server"></asp:Label></li>
                        <li>
                          <asp:Label ID="lblLName" runat="server"></asp:Label></li>
                      </ul>
                    </ContentTemplate>
                  </asp:UpdatePanel>
                </div>
              </div>
              <div class="slide-login-bb">
                &nbsp;</div>
            </div>
          </div>
        </asp:View>
        <asp:View ID="viewLogout" runat="server">
          <p>
            You're currently logged in as:
            <asp:Literal ID="literalUser" runat="server" /></p>
          <div class="slide-log-help-txt">
            <asp:LinkButton ID="logoutBtn" runat="server" Text="Logout" ></asp:LinkButton>
            <%// Button had CssClass="login-help", but that was breaking it. Removed it.  CT-8/21 %>
          </div>
        </asp:View>
      </asp:MultiView>
    </ContentTemplate>
  </asp:UpdatePanel>
</div>
