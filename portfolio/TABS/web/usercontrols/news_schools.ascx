<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_schools.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_schools" %>

<div>
    <h3>SCHOOL<span>news</span></h3>
    <asp:Repeater ID="repeatNews" runat="server">
        <ItemTemplate>
            <div>
                <h5><a href="<%#Eval("url") %>" target="_blank"><%#Eval("headline") %></a></h5>
                <p><b>Source</b> - <%#Eval("source") %><br />
                <span><%# Convert.ToDateTime(Eval("publishdate")).ToShortDateString() %></span></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <a href="/about-tabs/about-us/tabs-news.aspx?schoolNewsID=2" class="left">More...</a>
</div>