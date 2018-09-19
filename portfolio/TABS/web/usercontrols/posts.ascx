<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="posts.ascx.cs" Inherits="TABS_UserControls.usercontrols.posts" %>
<div id="tabs-forum" class="container-box zero">
  <div class="bt">&nbsp;</div>
  <div class="bm left">
    <!-- topic info -->
    <div class="both1812">
      <h3 id="forumTitle"><asp:Label ID="lblTopic" runat="server"></asp:Label></h3>
      <div class="topic-crumb left">
        <strong>Latest Post:</strong> <asp:Label ID="lblLatestPost" runat="server"></asp:Label>
      </div>
      <div class="topic-crumb left">
        <strong>Number of Messages:</strong> <asp:Label ID="lblMsgCount" runat="server"></asp:Label>
      </div>
    </div>
    <!-- post list -->
    <asp:GridView Width="100%"  CssClass="forum-table zibra left" CellPadding="5" BorderWidth="0" BorderColor="White"
      ID="repeatPosts" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" runat="server"
      OnRowDataBound="repeatPosts_RowDataBound">
      <Columns>
        <asp:TemplateField ItemStyle-Width="4%" HeaderStyle-Width="4%">
          <ItemTemplate>
            &nbsp;</ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ItemStyle-Width="86%" HeaderStyle-Width="86%" HeaderText="">
          <ItemTemplate>
            <div>
              <h5>
                <%#Eval("post") %></h5>
              <p>
                <%#Eval("postbody") %></p>
            </div>
          </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ItemStyle-Width="10%" HeaderStyle-Width="10%">
          <ItemTemplate>
            <asp:Literal ID="literalUser" runat="server" />
          </ItemTemplate>
        </asp:TemplateField>
      </Columns>
    </asp:GridView>
    <p>&nbsp;</p>
    <!-- new post -->
    <asp:MultiView ID="multiNewTopic" runat="server" ActiveViewIndex="0">
      <asp:View ID="viewLogIn" runat="server">
        <div>
          You must be logged in to post new topics. Click <a id="memberlink_sub" href='#'>here</a>
          to login.
        </div>
      </asp:View>
      <asp:View ID="viewNew" runat="server">
          <table border="0" width="100%" class="addNewPost">
            <tr>
                <td colspan="2"><asp:Label runat="server" ID="lblMessage" Visible="false" Font-Names="Arial" ForeColor="Red" Font-Size="10pt" /></td>
            </tr>
            <tr>
              <td width="15%" valign="top">
                New Post (Subject):
              </td>
              <td>
                <asp:TextBox ID="textPost" Width="90%" runat="server" />
              </td>
            </tr>
            <tr>
              <td width="15%" valign="top">
                New Post (body):
              </td>
              <td>
                <asp:TextBox ID="textPostBody" runat="server" TextMode="MultiLine" Width="90%" Height="150px" /><br />
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Button ID="buttonAddPost" runat="server" Text="Add" />
              </td>
            </tr>
          </table>
      </asp:View>
    </asp:MultiView>
  </div>
  <div class="bb clear">&nbsp;</div>
</div>
