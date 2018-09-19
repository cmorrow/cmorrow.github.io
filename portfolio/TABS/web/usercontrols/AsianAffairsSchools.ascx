<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AsianAffairsSchools.ascx.cs" Inherits="TABS_UserControls.usercontrols.AsianAffairsSchools" %>
<div>
      <asp:Repeater ID="repSchools" runat="server">
      <ItemTemplate>
      <h5><%#Eval("city") %>,<%#Eval("country") %></h5>
      <p><a href='<%#Eval("hotelUrl") %>'> <%#Eval("hotel") %> </a></p>    
      <p><%# GetCultureDay(Eval("date").ToString())%>,
         <%# GetCultureMonth(Eval("date").ToString())%>,
         <%# returnDate(Eval("date").ToString())%></p>
      <p><%#Eval("setUpStartTime") + " Setup, " %><%#Eval("startTime") %> - <%#Eval("endTime") %> Fair</p>
      </ItemTemplate>
      </asp:Repeater>


</div>