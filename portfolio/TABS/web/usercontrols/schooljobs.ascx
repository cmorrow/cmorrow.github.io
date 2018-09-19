<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="schooljobs.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.schooljobs" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="cc1" %>
<div class="both1812">
  <h1 class="user-temp">
    jobs</h1>
  <span>Job openings posted by your institution:</span> <a href="/for-schools/post-edit-jobs/add-job.aspx">Add New Job...</a><br /><br />
  <div class="jobs">
    <cc1:Grid ID="jobGrid" runat="server" AllowAddingRecords="false" AutoGenerateColumns="false" 
      onrowdatabound="jobGrid_RowDataBound" ondeletecommand="DeleteRecord">
      <Columns>
        <cc1:Column ID="Column1" Width="230" AllowEdit="false" TemplateId="infoTpl" HeaderText="Title and Description" runat="server">
        </cc1:Column>
        <cc1:Column ID="Column2" Width="170" AllowEdit="false" DataField="jobstartdate" HeaderText="Estimated Start"
          runat="server">
        </cc1:Column>
        <cc1:Column ID="Column3" Width="170" AllowEdit="false" DataField="postingdate" HeaderText="Posted"
          runat="server">
        </cc1:Column>
        <cc1:Column ID="Column4" Width="170" AllowEdit="false" DataField="expirationdate"
          HeaderText="Expires" runat="server">
        </cc1:Column>
        <cc1:Column ID="Column5" Width="10" AllowEdit="false" DataField="JobId" Visible="false"></cc1:Column>
        <cc1:Column id="Column6" AllowDelete="true" HeaderText="Edit" Width="100" runat="server"></cc1:Column>
       </Columns>
      <Templates>
        <cc1:GridTemplate ID="infoTpl" runat="server">
          <Template>
           <a href='/for-schools/post-edit-jobs/add-job.aspx?job=<%# Container.DataItem["JobId"]%>'><%# Container.DataItem["JobTitle"]%></a>
           <br />
           <asp:Label ID="lblJobType" runat="server"></asp:Label><br />
           <%# Container.DataItem["JobDescription"]%><br />
          </Template>
        </cc1:GridTemplate>
      </Templates>
    </cc1:Grid>
  </div>
</div>
