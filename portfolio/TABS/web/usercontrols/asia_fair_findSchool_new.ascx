<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="asia_fair_findSchool.ascx.cs" Inherits="TABS_UserControls.usercontrols.asia_fair_findSchool1" %>
<div class="asia-header both1812 floatclear">
    <h1 class="left"><asp:Label ID="lblCity" runat="server"></asp:Label></h1>
    <img src="<%=bannerPath %>" alt="" class="conf-img right" />
</div>
<div class="asia-cal left">
    <h3>This Year's Fairs</h3>
      <asp:Repeater ID="repFairs" runat="server">
      <ItemTemplate>
        <p><strong><a href='/find-a-school/explore-your-options/asia-fairs/asia-fair.aspx?languageId=<%#Eval("languageId") %>&cityName=<%#Eval("city") %>'><%#Eval("city") %>,<%#Eval("country") %></a></strong><br />

     <%#Eval("hotel") %><br />    
      <%# GetCultureDay(Eval("date").ToString())%>,
         <%# GetCultureMonth(Eval("date").ToString())%>&nbsp;
         <%# returnDate(Eval("date").ToString())%><br />  
      <%#Eval("startTime") %> - <%#Eval("endTime") %> Fair</p>
      </ItemTemplate>
      </asp:Repeater>
</div>
<div class="asia-reg right">
    <div style="background-color:Silver">
    <table>
        <tr>
            <td width="225px">
                  <br />
                  <div style="background-color:LightGrey; border:solid 1 black;">
                        <a href='/find-a-school/explore-your-options/asia-fairs/registration-form.aspx?langId=<%= languageId.ToString()%>'><b>Parents & Students</b><br />Register Online (Free)</a>
                  </div>
           </td>
            <td width="150px"><!--if you are... --><a href="/for-schools/marketing/asia-fairs.aspx"><asp:Label ID="lbIfYouAreASchool" runat="server" Text="Label"></asp:Label></a></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbRegistrationFreeText" runat="server" Text="Label"></asp:Label></td>
            <td></td>
        </tr>
    </table>
     </div>
</div>
<div class="asia-intro right">
    <table cellpadding="0" cellspacing="0" width="555">
        <tr class="tb-under">
            <td colspan="2"><asp:Label ID="lbforSchools" runat="server" Text="Label"></asp:Label><br />
            <asp:Label ID="lbSecondndParagText" runat="server" Text="" Font-Bold=false></asp:Label><br /><br />
            </td>
        </tr>
    </table>
</div>
<div class="asia-tabs left">
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
    <div class="pre-fair" style="font-weight:normal">
          <b><asp:Label ID="lbPartSchoolHdr" runat="server" Text="Label"></asp:Label></b><br />
          <asp:Label ID="lbPartSchoolsText" runat="server" Text="" Font-Bold=false></asp:Label>
            <!-- write schools block here -->
          <%=schoolsTable%>
      </div>
    <div class="pre-fair">
        <span><b><asp:Label ID="lbFairEventsHdr" runat="server" Text="Label"></asp:Label></b></span>
        <ul>
              <asp:Repeater ID="rpEvents" runat="server">
                  <ItemTemplate>
                        <li><%# Eval("eventName")%>, <%# Eval("eventStartTime")%> - <%# Eval("eventEndTime")%></li>
                  </ItemTemplate>
              </asp:Repeater>
        </ul>        

    </div>
    <div class="pre-fair">
        <span><b><asp:Label ID="lbSpecialInfoHdr" runat="server" Text="Special Information" Visible=false></asp:Label></b></span>
        <p><asp:Label ID="lbSpecialInfo" runat="server" Text="Special Information" Visible=false></asp:Label></p>
    </div>
    <div>
      <a href='/find-a-school/explore-your-options/asia-fairs/registration-form.aspx?langId=<%= languageId.ToString()%>'><asp:Literal ID="ltRegThisFair" runat="server"></asp:Literal></a>
    </div>
</div>