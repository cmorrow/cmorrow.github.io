<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="summerprogram.ascx.cs" Inherits="TABS_UserControls.usercontrols.summerprogram" %><%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<cc1:Grid ID="summerGrid" runat="server" CallbackMode="true" Serialize="true" GenerateRecordIds="true"
  Width="538px" FolderStyle="/resources/obout/grand_gray" AllowAddingRecords="false"
  AllowRecordSelection="true" AllowGrouping="true" GroupBy="schoolname" AllowPaging="true"
  AllowSorting="true" AutoGenerateColumns="false">
  <Columns>
     <cc1:Column ID="Column1" AllowEdit="false" Visible="false" DataField="schoolname" HeaderText="School Name" ShowHeader="false" runat="server"></cc1:Column>
     <cc1:Column ID="Column2" AllowEdit="false" DataField="profileevent" TemplateId="eventTpl" HeaderText="Event" runat="server"></cc1:Column>
     <cc1:Column ID="Column3" Wrap="true" Width="365" AllowEdit="false" DataField="shortdescription" HeaderText="Description" runat="server"></cc1:Column>
  </Columns>
  <Templates>
  <cc1:GridTemplate ID="eventTpl" runat="server">
  <Template>
        <asp:HyperLink Text='<%# Container.DataItem["profileevent"] %>' NavigateUrl='<%# "../for-schools/school-events-detail.aspx?schoolid=000000&type=2&eventid=" + Container.DataItem["profileeventid"]%>'
          ID="lbName" runat="server"></asp:HyperLink><br />
  </Template>
  </cc1:GridTemplate>
  </Templates>
</cc1:Grid>
