<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="breadcrumb.ascx.cs" Inherits="TABS_UserControls.usercontrols.breadcrumb" %>

<ul class="breadcrumb">
    <li><a href="/home.aspx">home</a> /</li>
    <li id="liFirstLink" runat="server" visible="false"><asp:HyperLink ID="linkFirst" runat="server" /> /</li>
    <li id="liSecondLink" runat="server" visible="false"><asp:HyperLink ID="linkSecond" runat="server" /> /</li>
    <li class="selected"><asp:Literal ID="linkFinal" runat="server" /></li>
</ul>
