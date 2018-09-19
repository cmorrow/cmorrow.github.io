<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_facts.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_facts" %>

<asp:Repeater ID="repeatFacts" runat="server">
    <ItemTemplate>
            <h4 class="red"><%#Eval("myth") %></h4>
	<!-- <strong><a name="#section<%#Eval("factid") %>"><%#Eval("myth") %></a></strong> -->
            <p><%#Eval("fact") %></p>
    </ItemTemplate>
</asp:Repeater>