<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tabs_calendar_detail.ascx.cs" Inherits="TABS_UserControls.usercontrols.tabs_calendar_detail" %>
<asp:Repeater ID="repeatEvent" runat="server">
    <ItemTemplate>
        <h1 class="red"><%#Eval("event") %></h1>
        <p><span class="event-time"><%#Eval("startdate") %> to <%#Eval("enddate") %></span><br />
		<%#Eval("location") %>, <%#Eval("address1") %> <%#Eval("Address2") %>, <%#Eval("city") %>, <%#Eval("stateshort") %>, <%#Eval("country") %></p>

        <p class="top10"><%#Eval("eventtype") %></p>
        <p><%#Eval("shortdescription") %></p>
        <p class="top10"><%#Eval("longdescription") %></p>
        <p class="top10 bold">Contact: <%#Eval("contact") %>, <%#Eval("phone") %></p>
        <p class="top10 bold">website: <a href="<%#Eval("url") %>"><%#Eval("url") %></a></p>
    </ItemTemplate>
</asp:Repeater>
<asp:LinkButton CssClass="top10 bold" ID="lbBack" runat="server" Text="Back to the Event calendar"  onclick="lbBack_Click"></asp:LinkButton>
