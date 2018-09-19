<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="library_detail.ascx.cs" Inherits="TABS_UserControls.usercontrols.library_detail" %>
<asp:Repeater ID="repeatArticle" runat="server">
    <ItemTemplate>
        <h3><%#Eval("title")%></h3>
        
        <p><%#Eval("summary")%></p>
        <p class="top10">-------</p>
        <p class="top10"><%#Eval("article")%></p>
    </ItemTemplate>
</asp:Repeater>
<asp:Label runat=server ID=lbErrMsg Text="" Visible=false ForeColor="Red" Font-Bold=true />
