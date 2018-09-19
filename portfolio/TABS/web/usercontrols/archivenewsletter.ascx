<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="archivenewsletter.ascx.cs" Inherits="TABS_UserControls.usercontrols.archivenewsletter" %>
<asp:UpdatePanel ID="archivePanel" runat="server">
<ContentTemplate>
<asp:GridView BorderWidth="0" AllowPaging="true" AutoGenerateColumns="false" PageSize="10" ID="gridArchive" runat="server">
<Columns>
<asp:HyperLinkField DataTextFormatString="{0:d}"  DataTextField=createddate  datanavigateurlfields="newsletterid" datanavigateurlformatstring="/default.aspx?id={0}" />
</Columns>
</asp:GridView>
</ContentTemplate>
</asp:UpdatePanel>
