<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="events_tabs.ascx.cs" Inherits="TABS_UserControls.usercontrols.events_tabs" %>



<div>
<asp:UpdatePanel ID="upTabs" runat=server>
        <ContentTemplate>
        
                <div class="left">
                <h3>TABS calendar</h3>
                     <ul class="calendar">
                        <asp:Repeater ID="repeatEvents" runat="server">
                            <ItemTemplate>
                                <li><a href="/for-schools/professional-development/tabs-calendar-for-schools/tabs-calendar-detail.aspx?section=schoolTabId&eventid=<%#Eval("eventId") %>"><%#Eval("event") %></a> <b><%#Eval("city") %>, <%#Eval("stateshort") %></b> <%# Convert.ToDateTime(Eval("startdate")).ToShortDateString() %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    <p>  <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">See all</asp:LinkButton><br /></p>
                </div>
                <div class="right">
        <div id="reg-tab">
            <asp:DropDownList ID="dropEventTypes" runat="server" AutoPostBack="true" 
                    DataTextField="eventtype" DataValueField="eventtypeid" 
                    onselectedindexchanged="dropEventTypes_SelectedIndexChanged1" />
        </div>
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clear">&nbsp;</div>
</div>