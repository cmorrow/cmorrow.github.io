<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_profileeventsdetail.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.news_profileeventsdetail" %>
<asp:Repeater ID="repeatSchool" runat="server">
  <ItemTemplate>
    <div class="school-detail no-width">
      <h1><%#Eval("schoolname") %></h1>
      <p>
        <strong>
          <%#Eval("city") %>,
          <%#Eval("state") %>,
          <%#Eval("country") %>
        </strong>
		</p>
    </div>
  </ItemTemplate>
</asp:Repeater>
<asp:Repeater ID="repeatEvent" runat="server">
  <ItemTemplate>
    <h1 class="red"><%#Eval("profileevent") %></h1>
    <p>
      <span class="event-time">
        <%#Eval("startdate") %>
        to
        <%#Eval("enddate") %></span>
		<br />
      <%#Eval("location") %>,
      <%#Eval("address1") %>
      <%#Eval("address2") %>,
      <%#Eval("city") %>,
      <%#Eval("state") %>,
      <%#Eval("country") %></p>
      <h4><%#Eval("profileeventtype") %></h4>
    <p>
      <%#Eval("shortdescription") %></p>
    <p>
      <%#Eval("longdescription") %></p>
    <p class="bold">
      Contact:
      <%#Eval("contact") %>,
      <%#Eval("phone") %></p>
    <p class="bold">
      Website: <a href="<%#Eval("url") %>">
        <%#Eval("url") %></a></p>
  </ItemTemplate>
</asp:Repeater>
<asp:LinkButton CssClass="top10 bold" ID="lbBack" runat="server" Text="Back to the School Profile"
  OnClick="lbBack_Click"></asp:LinkButton>
