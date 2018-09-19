<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_tabs.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_tabs" %>

<div>
<h3>TABS<span>news</span></h3>
<asp:Repeater ID="repeatNews" runat="server">
    <ItemTemplate>
        <div>
            <h5><a href="/for-schools/tabs-library/articles-and-op-eds/article-detail.aspx?tabsNewsId=<%#Eval("tabsnewsid") %>"><%#Eval("headline") %></a></h5>
            <p><asp:Literal ID="literalSummary" runat="server" /><br />
            <span><asp:Literal ID="literalPublishDate" runat="server" /></span></p>
        </div>
    </ItemTemplate>
</asp:Repeater>
<a href="/about-tabs/about-us/tabs-news.aspx?schoolNewsID=1" class="left">More...</a>
</div>