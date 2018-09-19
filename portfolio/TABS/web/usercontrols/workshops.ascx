<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="workshops.ascx.cs" Inherits="TABS_UserControls.usercontrols.workshops" %>

<div class="pro-dev-box">   
    <asp:Label runat="server" ID="lblrptWorkshops" Text="No workshops are scheduled at this time." Visible="false"></asp:Label>
    <asp:Repeater runat="server" ID="rptWorkshops" 
        onitemdatabound="rptWorkshops_ItemDataBound">
        <ItemTemplate>
            <h3><%# Eval("year") %> Workshops</h3>
            <asp:Repeater runat="server" ID="rptWorkshopsByYear">
                <ItemTemplate>
                    <div>
                        <a href='/for-schools/professional-development/workshops/workshop.aspx?workshopid=<%# Eval("WorkshopId") %>'><%# Eval("WorkshopTitle") %></a>
                        <p><span><%# ((DateTime)Eval("StartDate")).ToShortDateString() %>-<%# ((DateTime)Eval("EndDate")).ToShortDateString()%></span></p>
                        <p><%# Eval("City") %>, <%# Eval("stateshort") %>, <%# Eval("country") %></p>
                        <p><%# Eval("Description") %></p>                   
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
</div>