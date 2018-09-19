<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_profileevents.ascx.cs" Inherits="TABS_UserControls.usercontrols.news_profileevents" %>

<h3><a href="#" class="sch">school events</a></h3>
<asp:Repeater ID="repeatEvents" runat="server">
    <ItemTemplate>
       <h5><a href="/for-schools/school-events-detail.aspx?eventid=<%#Eval("profileeventid")%>&schoolid=<%#Eval("schoolid")%>" target="_self"><%#Eval("profileevent")%></a></h5>
        <p><span><%# Convert.ToDateTime(Eval("startdate")).ToShortDateString() %>, <%#Eval("city") %>, <%#Eval("state") %>, <%#Eval("country") %></span><br />
        <%#Eval("shortdescription") %>
        </p>
    </ItemTemplate>
</asp:Repeater>

<asp:Literal ID="literalDefault" runat="server" Visible="false"><p>There are no events for this school</p></asp:Literal>