<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_web.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_web" %>

<div>
    <h3>WEB<span>news</span></h3>
    <asp:Repeater ID="repeatNews" runat="server">
        <ItemTemplate>
            <div>
                <a href="<%#Eval("url") %>" target="_blank"><h5><%#Eval("headline") %></h5></a>
                <p><b>Source</b> - <%#Eval("source") %><br />
                <span><%# Convert.ToDateTime(Eval("publishdate")).ToShortDateString() %></span></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <a href="/about-tabs/about-us/tabs-news.aspx?schoolNewsID=3" class="left">More...</a>
</div>