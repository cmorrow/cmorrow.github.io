<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="users.ascx.cs" Inherits="TABS_UserControls.usercontrols.users" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<div class="both1812">
  <h1 class="user-temp">
    users at
    <asp:Label ID="lblSchoolName" runat="server"></asp:Label></h1>
  <a href="/for-schools/users/users-add.aspx">ADD USER</a>
  <div class="users-tabs top10">
    <ul class="conf-tabs-ul floatclear">
      <li class="active"><a href="#tabs-users1"><span>Users</span></a></li>
      <li><a href="#tabs-users2"><span>Positions</span></a></li>
      <div class="clear"></div>
    </ul>
    <div id="tabs-users1">
      <cc1:Grid ID="gridUsers" AllowAddingRecords="false" PageSize="10" runat="server"
        AllowGrouping="true" AllowPaging="true" AutoGenerateColumns="False" 
        onrowdatabound="gridUsers_RowDataBound" 
        ondeletecommand="gridUsers_DeleteCommand">
        <Columns>
          <cc1:Column ID="Column1" Width="110" AllowEdit="false" DataField="firstname" HeaderText="First Name"
            runat="server">
          </cc1:Column>
          <cc1:Column ID="Column2" Width="110" AllowEdit="false" DataField="lastname" HeaderText="Last Name"
            runat="server">
          </cc1:Column>
          <cc1:Column ID="Column3" Width="190" AllowEdit="false" TemplateId="infoTpl" HeaderText="Contact Information"
            runat="server">
          </cc1:Column>
          <cc1:Column ID="Column4" Width="100" AllowEdit="false" DataField="title" HeaderText="Job Title">
          </cc1:Column>
          <cc1:Column ID="Column5" Width="110" AllowEdit="false" DataField="usertype" HeaderText="TABS Role">
          </cc1:Column>
          <cc1:Column ID="Column6" Width="130" Wrap="true" AllowEdit="false" TemplateId="editTpl"
            HeaderText="">
          </cc1:Column>
          <cc1:Column ID="Column7" Visible="false" DataField="password">
          </cc1:Column>
          <cc1:Column id="Column8" Visible="false" DataField="userid"></cc1:Column>
        </Columns>
        <Templates>
          <cc1:GridTemplate ID="infoTpl" runat="server">
            <Template>
              Office:
              <%# Container.DataItem["phone"]%>
              <%# Container.DataItem["ext"]%><br />
              Alternate:
              <%# Container.DataItem["phone2"]%><br />
              Fax:
              <%# Container.DataItem["fax"]%><br />
              <asp:HyperLink Text='<%# Container.DataItem["username"] %>' NavigateUrl='<%# "mailto:" + Container.DataItem["username"] %>'
                ID="lbName" runat="server"></asp:HyperLink><br />
            </Template>
          </cc1:GridTemplate>
          <cc1:GridTemplate ID="editTpl" runat="server">
            <Template>
              <a href='/for-schools/users/users-add.aspx?user=<%# Container.DataItem["userid"] %>'>edit</a><br />
              <asp:HyperLink ID="lbPassword" Text="send password" NavigateUrl='<%# "/for-schools/users.aspx?action=pass&u=" + Container.DataItem["userid"] %>' runat="server"></asp:HyperLink>
              <asp:HyperLink ID="lbInactive" Text="inactivate" runat="server" NavigateUrl='<%#"/for-schools/users.aspx?action=inactive&u=" + Container.DataItem["userid"] %>'></asp:HyperLink>
              <asp:HyperLink ID="lbActive" Text="activate" runat="server" NavigateUrl='<%#"/for-schools/users.aspx?action=active&u=" + Container.DataItem["userid"] %>'></asp:HyperLink>
              <asp:Label visible="false" id="isactive" Text='<%# Container.DataItem["active"] %>' runat="server"><%# Container.DataItem["active"] %></asp:Label>
            </Template>
          </cc1:GridTemplate>
        </Templates>
      </cc1:Grid>
    </div>
    <div id="tabs-users2">
      <table cellpadding="5">
      <asp:Repeater ID="repeatPosition" runat="server">
      <ItemTemplate>
        <tr>
          <td>
            <%#Eval("PositionName")%>
          </td>
          <td>
            <%#Eval("Person") %>
          </td>
        </tr>
      </ItemTemplate>
      </asp:Repeater>
      </table>
    </div>
  </div>
</div>