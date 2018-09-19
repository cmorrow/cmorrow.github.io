<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="professionaldevelopment.ascx.cs" Inherits="TABS_UserControls.usercontrols.professionaldevelopment" %>

<div class="pro-dev-box"> 
    <h3>Conferences</h3>
    <asp:Label runat="server" ID="lblrtpConferences" Text="No conferences are scheduled at this time." Visible="false" />
    <asp:Repeater runat="server" ID="rptConferences">
        <ItemTemplate>
            <div>
                <a href="/for-schools/professional-development/tabs-calendar-for-schools/tabs-calendar-detail.aspx?eventid=<%#Eval("eventid") %>"><%# Eval("event") %></a>
                <p><span><%# ((DateTime)Eval("startdate")).ToShortDateString() %>-<%# ((DateTime)Eval("enddate")).ToShortDateString()%></span></p>
                <p><%# Eval("location") %>, <%#Eval("city") %>, <%# Eval("stateshort") %>, <%# Eval("country") %></p>
                <p><%# Eval("shortDescription") %></p>                   
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>    
<div class="pro-dev-box">
    <h3>Workshops</h3>   
    <asp:Label runat="server" ID="lblrptWorkshops" Text="No workshops are scheduled at this time." Visible="false" />
    <asp:Repeater runat="server" ID="rptWorkshops">
        <ItemTemplate>
            <div>
                <a href="/for-schools/professional-development/tabs-calendar-for-schools/tabs-calendar-detail.aspx?eventid=<%#Eval("eventid") %>"><%# Eval("event") %></a>
                <p><span><%# ((DateTime)Eval("startdate")).ToShortDateString() %>-<%# ((DateTime)Eval("enddate")).ToShortDateString()%></span></p>
                <p><%# Eval("location") %>, <%#Eval("city") %>, <%# Eval("stateshort") %>, <%# Eval("country") %></p>
                <p><%# Eval("shortDescription") %></p>                   
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div class="pro-dev-box">
    <h3>Webinars</h3>
    <asp:Label runat="server" ID="lblrptWebinars" Text="No webinars are scheduled at this time." Visible="false" />
    <asp:Repeater runat="server" ID="rptWebinars">
        <ItemTemplate>
            <div>
                <a href="/for-schools/professional-development/tabs-calendar-for-schools/tabs-calendar-detail.aspx?eventid=<%#Eval("eventid") %>"><%# Eval("event") %></a>
                <p><span><%# ((DateTime)Eval("startdate")).ToShortDateString() %>-<%# ((DateTime)Eval("enddate")).ToShortDateString()%></span></p>
                <p><%# Eval("location") %>, <%#Eval("city") %>, <%# Eval("stateshort") %>, <%# Eval("country") %></p>
                <p><%# Eval("shortDescription") %></p>                   
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>