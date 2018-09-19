<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="library_research.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.library_research" %>
<div class="tabs-library-box">
  <asp:GridView AutoGenerateColumns="false" ShowHeader="false" AllowPaging="true" PageSize="10"
    ID="gridResearch" runat="server" BorderColor="White" BorderWidth="0" 
    onrowdatabound="gridResearch_RowDataBound">
    <Columns>
      <asp:TemplateField>
        <ItemTemplate>
          <div>
            <asp:HyperLink ID="lnkArticle" runat="server"></asp:HyperLink><asp:Image ID="pdfImg"
              runat="server" Visible="false" ImageUrl="/resources/images/template/pdf.gif" /><asp:Image ID="lockImg"
                runat="server" Visible="false" ImageUrl="/resources/images/template/lock-red.gif" />
            <p>
              <asp:Label ID="lblSummary" runat="server"></asp:Label></p>
          </div>
        </ItemTemplate>
      </asp:TemplateField>
    </Columns>
  </asp:GridView>
</div>
