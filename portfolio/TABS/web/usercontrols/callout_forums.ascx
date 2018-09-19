<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="callout_forums.ascx.cs" Inherits="TABS_UserControls.usercontrols.callout_forums" %>

<div class="callout-box right">
    <div class="brown-bt">&nbsp;</div>
    <div class="brown-bm left">
        <img src="/resources/images/forums.gif" alt="" class="bot8" /><br />
        <asp:MultiView ID="multiLink" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewLogin" runat="server">
                <p style="color:White;">Join a TABS forum to dialogue with your counterparts around the world.</p>
<%--                <a href="javascript:void(0);" class="left" onclick="javascript:alert('please sign in first');"><img src="/resources/images/login-access-call.gif" alt="" /></a>
--%>            </asp:View>
            <asp:View ID="viewGo" runat="server">
                <asp:Repeater ID="recentForum" runat="server">
                <ItemTemplate>
                <p>
                <a href="/for-schools/forum/posts.aspx?topicid=<%#Eval("topicid")%>"><%#Eval("post") %></a><br />
                <%# DataBinder.Eval(Container.DataItem, "createdate") %><br />
                In&nbsp; <%# DataBinder.Eval(Container.DataItem, "topic") %>
                </p>
                </ItemTemplate>
                </asp:Repeater>
                <a id="loginBtn" visible="false" runat="server" href="/for-schools/forum.aspx" class="left"><img src="/resources/images/login-access-call.gif" alt="" /></a>
            </asp:View>
        </asp:MultiView>
    </div>
    <div class="brown-bb clear">&nbsp;</div>
</div>