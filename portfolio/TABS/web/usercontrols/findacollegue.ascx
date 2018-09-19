<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="findacollegue.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.findacollegue" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<div class="both1812">
  <h1 class="user-temp">
    find a colleague</h1>
      <table>
        <tr>
          <td colspan="4">
            Enter text for at least two criteria and click <em>Search.</em>
          </td>
        </tr>
        <tr>
          <td>
            <b>First Name:</b>
          </td>
          <td>
           <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
          </td>
          <td>           
          <b>Last Name:</b>
          </td>
          <td>
            <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>
            <b>Position</b>
          </td>
          <td colspan="3">
            <asp:TextBox ID="txtPosition" runat="server" CssClass="edit-300"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td>
            <b>School:</b>
          </td>
          <td colspan="2">
            <asp:DropDownList ID="ddlSchools" runat="server" AppendDataBoundItems="true" DataTextField="schoolname"
              DataValueField="schoolid">
                            <asp:ListItem Text="" Value=""></asp:ListItem>

            </asp:DropDownList>
          </td>
          <td>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="edit-save" 
              onclick="btnSearch_Click" />
          </td>
        </tr>
      </table>
      <p>
        &nbsp;</p>
      <cc1:Grid ID="gridUsers" AllowAddingRecords="false" PageSize="10" runat="server" AllowGrouping="true" AllowPaging="true" AutoGenerateColumns="False">
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
          <cc1:Column id="Column4" Width="110" AllowEdit="false" DataField="state" HeaderText="State/Prov."></cc1:Column>
          <cc1:Column id="Column5" Width="100" AllowEdit="false" DataField="country" HeaderText="Country"></cc1:Column>
          <cc1:Column id="Column6" Width="100" AllowEdit="false" DataField="title" HeaderText="Job Title"></cc1:Column>
          <cc1:Column id="Column7" Width="130" Wrap="true" AllowEdit="false" DataField="sortname" HeaderText="Institution"></cc1:Column>
        </Columns>
         <Templates>
          <cc1:GridTemplate ID="infoTpl" runat="server">
            <Template>
              <%# Container.DataItem["address1"]%>,<br />
              <%# Container.DataItem["city"]%>,
              <%# Container.DataItem["state"]%>,
              <%# Container.DataItem["zip"]%><br />
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
        </Templates>

      </cc1:Grid>
</div>
