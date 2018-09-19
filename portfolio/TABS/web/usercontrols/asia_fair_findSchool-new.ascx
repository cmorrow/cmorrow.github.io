<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="asia_fair_findSchool.ascx.cs" Inherits="TABS_UserControls.usercontrols.asia_fair_findSchool1" %>
<div class="asia-header both1812 floatclear">
    <h1 class="left">Tokyo, Japan Asia Fair</h1>
    <img src="<%=bannerPath %>" alt="" class="conf-img right" />
</div>
<div id="asiaWrapper">
<div class="asia-cal left">
    <h3>This Year's Fairs</h3>
      <asp:Repeater ID="repFairs" runat="server">
      <ItemTemplate>
       <h4><a href='/for-schools/marketing/asia-fairs/asia-fair.aspx?id=<%#Eval("id") %>'><%#Eval("city") %>,<%#Eval("country") %></a></h4>
     <%#Eval("hotel") %><br />    
      <%# GetCultureDay(Eval("date").ToString())%>,
         <%# GetCultureMonth(Eval("date").ToString())%>&nbsp;
         <%# returnDate(Eval("date").ToString())%><br />  
      <%#Eval("startTime") %> - <%#Eval("endTime") %> Fair</p>
      </ItemTemplate>
      </asp:Repeater>
</div>
<div class="asia-reg right">
        <h3>Registration</h3>
        <div class="top">
            <div class="left">
				<a class="asiaRegBtn" href="/find-a-school/explore-your-options/asia-fairs/registration-form.aspx"><strong>Parents &amp; Students</strong>
					<span>Register Online (Free)</span><span class="bot"></span></a>
				<p><asp:Label ID="lbRegistrationFreeText" runat="server" Text="Label"></asp:Label></p>
            </div>
            <div class="right">
	            <a href="/for-schools/marketing/asia-fairs.aspx"><asp:Label ID="lbIfYouAreASchool" runat="server" Text="Label"></asp:Label></a>
            </div>
            <div class="clear"></div>
        </div>
        <!-- end top div -->
		<div class="content">
			<p><asp:Label ID="lbForSchools" runat="server" Text=""></asp:Label></p>
			<p><asp:Label ID="lbSecondndParagText" runat="server" Text=""></asp:Label></p>
			<h1><asp:Label ID="lbHotelName" runat="server" Text=""></asp:Label></h1>
			<p><b><asp:Label ID="lbHotelLocation" runat="server" Text=""></asp:Label>
	            |
	            <asp:Label ID="lbHotelFairDate" runat="server" Text=""></asp:Label>
	            |
	             SetUp: <asp:Label ID="lbHotelSetUpTime" runat="server" Text=""></asp:Label>
	            |
	            Fair: <asp:Label ID="lbHotelStartTime" runat="server" Text=""></asp:Label> - <asp:Label ID="lbHotelEndTime" runat="server" Text=""></asp:Label>
	        </b></p>
		</div>
</div>
<!-- end asia-reg -->

<div class="asia-tabs right">
    <div class="pre-fair" style="font-weight:normal">
          <h4><asp:Label ID="lbPartSchoolHdr" runat="server" Text="Label"></asp:Label></h4>
          <asp:Label ID="lbPartSchoolsText" runat="server" Text="" Font-Bold=false></asp:Label>
            <!-- write schools block here -->
          <%=schoolsTable%>
      </div>
    <div class="pre-fair">
        <h4><asp:Label ID="lbFairEventsHdr" runat="server" Text="Label"></asp:Label></h4>
        <ul>
              <asp:Repeater ID="rpEvents" runat="server">
                  <ItemTemplate>
                        <li><%# Eval("eventName")%>, <%# Eval("eventStartTime")%> - <%# Eval("eventEndTime")%></li>
                  </ItemTemplate>
              </asp:Repeater>
        </ul>        

    </div>
    <div class="pre-fair">
        <h4><asp:Label ID="lbSpecialInfoHdr" runat="server" Text="Special Information" Visible=false></asp:Label></h4>
        <p><asp:Label ID="lbSpecialInfo" runat="server" Text="Special Information" Visible=false></asp:Label></p>
    </div>
    <div>
      <a href="/find-a-school/explore-your-options/asia-fairs/registration-form.aspx"><asp:Literal ID="ltRegThisFair" runat="server"></asp:Literal></a>
    </div>
</div>
<!-- end asia-tabs -->
<div class="clear"></div>
</div>
<!-- end asiaWrapper -->