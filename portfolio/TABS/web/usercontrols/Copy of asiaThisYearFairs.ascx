<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="asiaThisYearFairs.ascx.cs" Inherits="TABS_UserControls.usercontrols.asiaThisYearFairs" %>
<div>
      <asp:Repeater ID="repSchools" runat="server">
      <ItemTemplate>
       <p><strong><%#Eval("city") %>,<%#Eval("country") %></strong><br />
     <a href='<%#Eval("hotelUrl") %>'> <%#Eval("hotel") %> </a><br />    
      <%# GetCultureDay(Eval("date").ToString())%>,
         <%# GetCultureMonth(Eval("date").ToString())%>&nbsp;
         <%# returnDate(Eval("date").ToString())%><br />  
      <%#Eval("startTime") %> - <%#Eval("endTime") %> Fair</p>
      </ItemTemplate>
      </asp:Repeater>


</div>