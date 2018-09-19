<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_schools.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_schools" %>

<div>
    <h3>SCHOOL<span>news1</span></h3>
    <asp:Repeater ID="repeatNews" runat="server">
        <ItemTemplate>
            <div>
                <h5><a href='/for-schools/professional-development/tabs-calendar-for-schools/tabs-calendar-detail.aspx?section=school&eventid=<%#Eval("schoolNewsId") %>'><%#Eval("headline") %></a></h5>
                <p><b>Source</b> - <%#Eval("source") %><br />
                <span><%# Convert.ToDateTime(Eval("publishdate")).ToShortDateString() %></span></p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <a href="" class="left">More...</a>
</div>