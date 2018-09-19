<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navigation_footer.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.navigation_footer" %>
<div id="footer">
  <ul id="foot-link">
    <li class="off"><a href="/about-tabs/friends-in-education.aspx" class="education">
      Friends in Education</a>
      <ul id="friend-edu">
        <li class="len">
          <ul>
            <li class="friend-first">Boarding School Networks</li>
            <asp:Repeater ID="boardRep" runat="server">
              <ItemTemplate>
                <li>
                  <asp:HyperLink ID="boardLink" runat="server" NavigateUrl='<%# "/about-tabs/friends-in-education.aspx#" + DataBinder.Eval(Container.DataItem, "abbreviation") %>'
                    Text='<%# DataBinder.Eval(Container.DataItem,"abbreviation") %>'></asp:HyperLink></li>
              </ItemTemplate>
            </asp:Repeater>
          </ul>
        </li>
        <li class="len">
          <ul>
            <li class="friend-first">Partner Organizations</li>
            <asp:Repeater ID="partnerRep" runat="server">
              <ItemTemplate>
                <li>
                  <asp:HyperLink ID="partnerLink" runat="server" NavigateUrl='<%# "/about-tabs/friends-in-education.aspx#" + DataBinder.Eval(Container.DataItem, "abbreviation") %>'
                    Text='<%# DataBinder.Eval(Container.DataItem,"abbreviation") %>'></asp:HyperLink></li>
              </ItemTemplate>
            </asp:Repeater>
          </ul>
        </li>
        <li class="len">
          <ul>
            <li class="friend-first">Sister Associations</li>
            <asp:Repeater ID="sisterRep" runat="server">
              <ItemTemplate>
                <li>
                  <asp:HyperLink ID="sisterLink" runat="server" NavigateUrl='<%# "/about-tabs/friends-in-education.aspx#" + DataBinder.Eval(Container.DataItem, "abbreviation") %>'
                    Text='<%# DataBinder.Eval(Container.DataItem,"abbreviation") %>'></asp:HyperLink></li>
              </ItemTemplate>
            </asp:Repeater>
          </ul>
        </li>
      </ul>
    </li>
    <li class="off"><a href="/about-tabs/corporate-sponsors.aspx" class="sponsors">Corporate
      Sponsors</a> 
<ul id="corp-spon">
        <li class="len">
          <ul>
            <li class="friend-first">Signature and Red Level</li>
            <asp:Repeater ID="SponsorRep" runat="server">
              <ItemTemplate>
                <li>
                  <asp:HyperLink ID="sponsorLink" runat="server" NavigateUrl='<%# "/about-tabs/corporate-sponsors.aspx#" + DataBinder.Eval(Container.DataItem, "companyname") %>'
                    Text='<%# DataBinder.Eval(Container.DataItem,"companyname") %>'></asp:HyperLink></li>
              </ItemTemplate>
            </asp:Repeater>
          </ul>
        </li>
      </ul>
   </li>
  </ul>
  <ul id="site-link">
    <li><a href="/about-tabs/contact-us.aspx">Contact Us</a></li>
    <li><a href="/for-schools/job-board.aspx">Boarding School Jobs</a></li>
    <li><a href="/sitemap.aspx">Site Map</a></li>
    <li><a href="/legal.aspx">Legal</a></li>
  </ul>
  <p>
    &copy; 2009 The Association of Boarding Schools</p>
  <div id="social">
    <a href="/rss-feed.aspx" target="_self">
      <img src="/resources/images/template/rss.gif" alt="rss" title="rss" /></a> <a href="http://www.facebook.com/photo.php?pid=1846164&id=796619669&comments#/pages/Asheville-NC/Boarding-Schools-The-Official-Home/90921483524?ref=s"
        target="_blank">
        <img src="/resources/images/template/facebook.gif" alt="facebook" title="facebook" /></a>
    <a href="http://www.twitter.com/TABSorg" target="_blank">
      <img src="/resources/images/template/twitter.gif" alt="twitter" title="twitter" /></a>
  </div>
</div>
