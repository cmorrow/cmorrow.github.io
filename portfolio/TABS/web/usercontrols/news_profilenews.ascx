<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_profilenews.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_profilenews" %>

<h3><a href="#" class="sch">school news</a></h3>
<asp:Repeater ID="repeatNews" runat="server">
    <ItemTemplate>
        <h5><a href="<%#Eval("url")%>" target="_blank"><%#Eval("headline") %></a></h5>
        <p><span><%#Eval("source") %></span><br />
        <%#Eval("summary").ToString() %>
        </p>    
    </ItemTemplate>
</asp:Repeater>

<asp:Literal ID="literalDefault" runat="server" Visible="false"><p>There is no news for this school</p></asp:Literal>
