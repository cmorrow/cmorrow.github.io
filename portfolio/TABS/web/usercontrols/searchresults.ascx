<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="searchresults.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.searchresults" %>

<asp:UpdatePanel ID="searchPanel" UpdateMode="Conditional" runat="server">
  <ContentTemplate>
    <div class="search-area both1812 left">
      <p>
        You searched for:</p>
      <asp:TextBox ID="txtSearchBox" runat="server" CssClass="usf-field"></asp:TextBox>&nbsp;
      <asp:Button ID="btnSearch" runat="server" CssClass="usf-button" Text="Search" OnClick="btnSearch_Click" />
      &nbsp; Results per page:&nbsp;
      <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
        <asp:ListItem Value="All" Text="All"></asp:ListItem>
        <asp:ListItem Value="10" Selected="True" Text="10"></asp:ListItem>
        <asp:ListItem Value="25" Text="25"></asp:ListItem>
        <asp:ListItem Value="50" Text="50"></asp:ListItem>
      </asp:DropDownList>
      
      <div class="red" style="padding-top:15px">
        Didn't find what you were looking for?  Try our <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>.
      </div>
    </div>
    <div class="bl left18 top15 left">
      <div class="search-results">
      <input id="searchTab" type="hidden" runat="server" value="" name="searchTab" />
        <h1>Search Results</h1>
        <div class="users-tabs">
          <ul class="conf-tabs-ul">
            <li id="schoolTab" runat="server" class="active"><a href="#school-Tab"><span>Schools</span></a></li>
            <li id="familyTab" runat="server"><a href="#family-Tab" id="family-tab"><span>Events for Families</span></a></li>
            <li id="schooleventTab" runat="server"><a href="#school-eventTab" id="school-event-Tab"><span>Events for Schools</span></a></li>
            <li id="tabsTab" runat="server"><a href="#tabs-Tab" id="tabs-tab"><span>TABS Events</span></a></li>
            <div class="clear"></div>
          </ul>
          <div id="school-Tab">
            <asp:GridView Width="99%" BorderColor="White" BorderWidth="0" ID="gridSchool" AutoGenerateColumns="false"
              runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="gridSchool_PageIndexChanging">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <div>
                      <h5>
                        <a href='/school-profile.aspx?schoolid=<%#Eval("schoolid") %>'><%#Eval("schoolname") %></a><br /><span><asp:Label ID="lblName" Text='<%#Eval("location") %>' runat="server"></span></asp:Label>
                      </h5>
                      <p>
                        <asp:Label id="lblDesc" runat ="server" text ='<%# ReturnBreifChars(Eval("shortdescription").ToString()) %>'></asp:Label>...
                      </p>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            </asp:GridView>
          </div>
          <div id="family-Tab">
            <asp:GridView Width="99%" BorderColor="White" BorderWidth="0" ID="gridFamily" AutoGenerateColumns="false"
              runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="gridFamily_PageIndexChanging">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <div>
                      <h5>
                        <a href=""></a>
                        <asp:Label ID="lblName" Text='<%#Eval("location") %>' runat="server"></asp:Label>&nbsp;<a
                          href='/about-tabs/about-us/tabs-calendar/tabs-calendar-event.aspx?section=tabs&eventid=<%#Eval("eventid") %>'><span>Event
                            Info</span></a></h5>
                      <p>
                        <asp:Label id="lblDesc" runat ="server" text ='<%# ReturnBreifChars(Eval("shortdescription").ToString()) %>'></asp:Label>...
                      </p>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            </asp:GridView>
          </div>
          <div id="school-eventTab">
            <asp:GridView Width="99%" BorderColor="White" BorderWidth="0" ID="gridSchoolEvent"
              AutoGenerateColumns="false" runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="gridSchoolEvent_PageIndexChanging">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <div>
                      <h5>
                        <a href=""></a>
                        <asp:Label ID="lblName" Text='<%#Eval("location") %>' runat="server"></asp:Label>&nbsp;<a
                          href='/about-tabs/about-us/tabs-calendar/tabs-calendar-event.aspx?section=school&eventid=<%#Eval("eventid") %>'><span>Event
                            Info</span></a></h5>
                      <p>
                        <asp:Label id="lblDesc" runat ="server" text ='<%# ReturnBreifChars(Eval("shortdescription").ToString()) %>'></asp:Label>...
                      </p>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            </asp:GridView>
          </div>
          <div id="tabs-Tab">
            <asp:GridView Width="99%" BorderColor="White" BorderWidth="0" ID="gridTabs" AutoGenerateColumns="false"
              runat="server" AllowPaging="true" PageSize="10" OnPageIndexChanging="gridTabs_PageIndexChanging">
              <Columns>
                <asp:TemplateField>
                  <ItemTemplate>
                    <div>
                      <h5>
                        <a href=""></a>
                        <asp:Label ID="lblName" Text='<%#Eval("location") %>' runat="server"></asp:Label>&nbsp;<a
                          href='/about-tabs/about-us/tabs-calendar/tabs-calendar-event.aspx?section=tabs&eventid=<%#Eval("eventid") %>'><span>Event
                            Info</span></a></h5>
                      <p>
                        <asp:Label id="lblDesc" runat ="server" text ='<%# ReturnBreifChars(Eval("shortdescription").ToString()) %>'></asp:Label>...
                      </p>
                    </div>
                  </ItemTemplate>
                </asp:TemplateField>
              </Columns>
            </asp:GridView>
          </div>
          <div><asp:Label ID="lblNoResults" Visible="false" runat="server">Your search returned no results</asp:Label></div>
        </div>
      </div>
    </div>
    <div class="br right top15">
      <div class="callout-box right">
        <div class="olive-bt">
          &nbsp;</div>
        <div class="olive-bm left">
          <h3>
            recent searches</h3>
          <ul>
            <asp:Repeater ID="repRecentSearch" runat="server">
              <ItemTemplate>
                <li><a style="color: White; text-decoration: none;" href='/search-result.aspx?val=<%# Container.DataItem %>'>
                  <%# Container.DataItem %></a></li>
              </ItemTemplate>
            </asp:Repeater>
          </ul>
        </div>
        <div class="olive-bb clear">
          &nbsp;</div>
      </div>
    </div>
  </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript">
    function pageLoad(sender, args) {
        if (args.get_isPartialLoad()) {
            $('.users-tabs > div').hide(); // Hide all divs
            $('.users-tabs > div:first').show(); // Show the first div
            $('.users-tabs ul li:first').addClass('active'); // Set the class of the first link to active
        }
    }
</script>
