<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="asia_fair.ascx.cs" Inherits="TABS_UserControls.usercontrols.asia_fair" %>

<div class="asia-header both1812 floatclear">
    <h1 class="left">Tokyo, Japan Asia Fair</h1>
    <img src="<%=bannerPath %>" alt="" class="conf-img right" />
</div>
<div class="asia-cal left">
    <h3>This Year's Fairs</h3>
      <asp:Repeater ID="repFairs" runat="server">
      <ItemTemplate>
       <p><strong><a href='/for-schools/marketing/asia-fairs/asia-fair.aspx?id=<%#Eval("id") %>'><%#Eval("city") %>,<%#Eval("country") %></a></strong><br />
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
            <a class="asiaRegBtn" href="https://www.regonline.com/AsiaFairs"><strong>Participating Schools</strong>
            <span>Register Online</span><span class="bot"></span></a>
            <a href='<%=pdfPath %>'>Download paper form for registration by mail</a><br>
            <p>Registration requires payment by credit card. Schools must register in order to participate in a fair.</p>
        </div>
        <div class="right">
            <a href="/find-a-school/explore-your-options/asian-fairs.aspx">If you are a student or parent interested in attending a fair, click here.</a>
        </div>
        <div class="clear"></div>
    </div>
    <!-- end top div -->

      <div class="content gray">
           <p><b>Welcome to the 2009 Asia <br />
                  Boarding Schools Fairs</b></p>

            <p><asp:Label ID="lbForSchools" runat="server" Text=""></asp:Label></p>
            <p>Participants in the program will receive comprehensive packets of information and resources 
                  including electronic fair invitations (PDF format), suggested in-country contacts, country information, and detailed 
                  packing and planning lists. </p>
            <p>Registration is now open for the 2009 Asia Fairs. Use our convenient 
                  <a href="https://www.regonline.com/AsiaFairs">online registration form</a> and pay by credit 
                  card or check. Or, you may use our <a href='<%=pdfPath %>'>downloadable registration form</a>.</p>
            <p>Please refer to the schedule for fair dates, locations, and times. To view the participating 
                  schools, please use the city links on the left. Schools will be regularly added to the 
                  city web pages, so please check back for updates.</p>

            <p><a href="https://www.regonline.com/AsiaFairs">Register Online</a></p>

      </div>
</div>
<!-- end asia-reg -->
<div class="asia-tabs right">
    <div id="school-tabs">
        <h1><asp:Label ID="lbHotelName" runat="server" Text=""></asp:Label></h1>
    </div>
    <div class="to-jap">
        <p><b><asp:Label ID="lbHotelLocation" runat="server" Text=""></asp:Label>
            |
            <asp:Label ID="lbHotelFairDate" runat="server" Text=""></asp:Label>
            |
             SetUp: <asp:Label ID="lbHotelSetUpTime" runat="server" Text=""></asp:Label>
            |
            Fair: <asp:Label ID="lbHotelStartTime" runat="server" Text=""></asp:Label> - <asp:Label ID="lbHotelEndTime" runat="server" Text=""></asp:Label>
        </b></p>
    </div>
    <div class="pre-fair">
        <span>Participating Schools</span>
        <p>Please take a moment to review the participating school list. Click on the school's name to visit its website. Send an email message to the school's contact if you would like additional information prior to the fair. This list is continually growing, therefore please check back regularly</p>
            <!-- write schools block here -->
          <%=schoolsTable%>
      </div>
    <div class="pre-fair">
        <span>Pre-Fair Events</span>
        <ul>
              <asp:Repeater ID="rpEvents" runat="server">
                  <ItemTemplate>
                        <li><%# Eval("eventName")%>, <%# Eval("eventStartTime")%> - <%# Eval("eventEndTime")%></li>
                  </ItemTemplate>
              </asp:Repeater>
        </ul>        

    </div>
    <div class="pre-fair">
        <!-- <span><asp:Label ID="lbSpecialInfoHdr" runat="server" Text="Special Information" Visible=false></asp:Label></span>
                <p><asp:Label ID="lbSpecialInfo" runat="server" Text="Special Information" Visible=false></asp:Label></p> -->
    </div>
    <div>
      <a href="https://www.regonline.com/AsiaFairs">Register for this fair</a>
    </div>
</div>