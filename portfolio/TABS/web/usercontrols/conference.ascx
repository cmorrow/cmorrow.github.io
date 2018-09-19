<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="conference.ascx.cs" Inherits="TABS_UserControls.usercontrols.conference" %>



    <h1 id="conf-head" class="left"><asp:Literal runat="server" id="litConferenceTitle" /></h1>
    <asp:Image runat="server" ID="imgConferenceLogo" CssClass="" />
    <!-- <img src="../resources/images/tabs_conference.gif" width="564" height="101" alt="Tabs Conference" /> -->
	<div class="clear"></div>
    <div id="tabs-conference" class="left">
        <div class="tc-container left">
            <div class="tc floatclear" runat="server" id="divMainContainer">
               <ul class="cf-menu left" runat="server" id="ulTabs">
                   <li runat="server" id="liRegistration" visible="false"><a href="#conference1" id="#conf1"><asp:Literal runat="server" ID="litRegistrationTabTitle" /></a></li>
                   <li runat="server" id="liCallForProposals" visible="false"><a href="#conference2" id="#conf2"><asp:Literal runat="server" ID="litCallForProposalsTabTitle" /></a></li>
                   <li runat="server" id="liSponsorshipOpportunities" visible="false"><a href="#conference3" id="#conf3"><asp:Literal runat="server" ID="litSponsorshipOpportunitiesTabTitle" /></a></li>
                   <li runat="server" id="liSchedule" visible="false"><a href="#conference4" id="#conf4"><asp:Literal runat="server" ID="litScheduleTabTitle" /></a></li>
                   <li runat="server" id="liKeynoteSpeakers" visible="false"><a href="#conference5" id="#conf5"><asp:Literal runat="server" ID="litKeynoteSpeakersTabTitle" /></a></li>
                   <li runat="server" id="liPreConferenceWorkshops" visible="false"><a href="#conference6" id="#conf6"><asp:Literal runat="server" ID="litPreConferenceWorkshopsTabTitle" /></a></li>
                   <li runat="server" id="liConcurrentSessions" visible="false"><a href="#conference7" id="#conf7"><asp:Literal runat="server" ID="litConcurrentSessionsTabTitle" /></a></li>
                   <li runat="server" id="liSpecialEvents" visible="false"><a href="#conference8" id="#conf8"><asp:Literal runat="server" ID="litSpecialEventsTabTitle" /></a></li>
                   <li runat="server" id="liSponsors" visible="false"><a href="#conference9" id="#conf9"><asp:Literal runat="server" ID="litSponsorsTabTitle" /></a></li>
                   <li runat="server" id="liExhibitors" visible="false"><a href="#conference10" id="#conf10"><asp:Literal runat="server" ID="litExhibitorsTabTitle" /></a></li>
                   <li runat="server" id="liHotelInformation" visible="false"><a href="#conference11" id="#conf11" class="cf-menu-green"><asp:Literal runat="server" ID="litHotelInformationTabTitle" /></a></li>
                   <li runat="server" id="liGroundTransportation" visible="false"><a href="#conference12" id="#conf12" class="cf-menu-green"><asp:Literal runat="server" ID="litGroundTransportationTabTitle" /></a></li>
                   <li runat="server" id="liBookstore" visible="false"><a href="#conference13" id="#conf13" class="cf-menu-brown"><asp:Literal runat="server" ID="litBookStoreTabTitle" /></a></li>
                   <li runat="server" id="liCustom" visible="false"><a href="#conference14" id="#conf14" class="cf-menu-brown"><asp:Literal runat="server" ID="litCustomTabTitle" /></a></li>  
                </ul>
            
                <div id="conference1" class="tr left">
                    <h3><asp:Literal runat="server" ID="litRegistrationContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litRegistrationContent" /></p>
                </div>
                <div id="conference2" class="tr left">
                    <h3><asp:Literal runat="server" ID="litCallForProposalsContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litCallForProposalsContent" /></p>
                    <p><a href="/for-schools/professional-development/conferences/proposal-conference.aspx">Submit a Proposal</a><br />
                    <a href="/for-schools/professional-development/conferences/proposal-management.aspx">Manage Your Proposals</a></p>
                        <ul class="conf-tabs-ul twoLines">
                            <li><a href="#call-cor-pro1"><span>Proposal<br />Categories</span></a></li>
                            <li><a href="#call-cor-pro2"><span>Suggested<br />Topics</span></a></li>
                            <li><a href="#call-cor-pro3"><span>Submission<br />and Review</span></a></li>
                            <li><a href="#call-cor-pro4"><span>Financial<br />Arrangements</span></a></li>
							<div class="clear"></div>
                        </ul>
                        <div id="call-cor-pro1">
							<h3>Proposal Categories</h3>
                            <p><asp:Literal runat="server" ID="litProposalCategoriesContent" /></p>
                        </div>
                        <div id="call-cor-pro2">
							<h3>Suggested Topics</h3>
                            <p><asp:Literal runat="server" ID="litSuggestedTopicsContent" /></p>
                        </div>
                        <div id="call-cor-pro3">
							<h3>Submission and Review</h3>
                            <p><asp:Literal runat="server" ID="litSubmissionAndReviewContent" /></p>
                        </div>
                        <div id="call-cor-pro4">
							<h3>Financial Arrangements</h3>
                            <p><asp:Literal runat="server" ID="litFinancialArrangementsContent" /></p>
                        </div>  
                </div>
                <div id="conference3" class="tr left">
                    <h3><asp:Literal runat="server" ID="litSponsorshipOpportunitiesContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litSponsorshipOpportunitiesContent" /></p>
                    <ul class="conf-tabs-ul">
                        <li><a href="#spon-oppt1"><span>Sponsorship Levels</span></a></li>
                        <li><a href="#spon-oppt2"><span>Exhibit Hall</span></a></li>
						<div class="clear"></div>
                    </ul>
                    <div id="spon-oppt1">
						<h3>Sponsorship Levels</h3>
                        <p><asp:Literal runat="server" ID="litSponsorshipLevelsContent" /></p>
                    </div>
                    <div id="spon-oppt2">
						<h3>Exhibit Hall</h3>
                        <p><asp:Literal runat="server" ID="litExhibitHallContent" /></p>
                    </div>
                </div>
                <div id="conference4" class="tr left">
                    <h3><asp:Literal runat="server" ID="litScheduleContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litScheduleContent" /></p>
                </div>
                <div id="conference5" class="tr left">
                    <h3><asp:Literal runat="server" ID="litKeyNoteSpeakersContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litKeyNoteSpeakersContent" /></p>
                </div>
                <div id="conference6" class="tr left">
                    <h3><asp:Literal runat="server" ID="litPreConferenceWorkshopsContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litPreConferenceWorkshopsContent" /></p>
                </div>
                <div id="conference7" class="tr left">
                    <h3><asp:Literal runat="server" ID="litConcurrentSessionsContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litConcurrentSessionsContent" /></p>
                        <ul class="conf-tabs-ul twoLines clear">
                            <asp:Repeater runat="server" ID="rptConcurrentSessionBlocks">
                                <ItemTemplate>
                                    <li><a href='#conccr-sess<%# Eval("ConferenceConcurrentSessionBlockId") %>'><span><%# Eval("BlockName") %>: <%# String.Format("{0:m}", (DateTime)Eval("BlockDate")) %><br /><%# String.Format("{0:t}", (DateTime)Eval("StartTime")) %></span></a></li>
                                </ItemTemplate>
								<FooterTemplate><div class="clear"></div></FooterTemplate>
                            </asp:Repeater>
                        </ul>
                        
                        <asp:Repeater runat="server" ID="rptSessions" 
                            onitemdatabound="rptSessions_ItemDataBound">
                            <ItemTemplate>
                                <div id='conccr-sess<%# Eval("ConferenceConcurrentSessionBlockId") %>'>
                                    <asp:Repeater runat="server" ID="rptSessionContent">
                                        <ItemTemplate>
                                            <p><span style="font-weight:bold"><%# Eval("BlockName") %>-<%# Eval("SessionOrder") %>: <%# Eval("SessionTitle") %></span><br />
                                            <%# Eval("SessionDescription") %></p>
                                            
                                            <asp:Repeater runat="server" ID="rptSpeakers">
                                                <HeaderTemplate><p style="font-weight:bold">Speakers:<br /></HeaderTemplate>
                                                <ItemTemplate>
                                                     - <%# Eval("FirstName") %> <%# Eval("LastName") %>, <%# Eval("Title") %>, <%# Eval("Institution") %><br />
                                                </ItemTemplate>
                                                <FooterTemplate></p></FooterTemplate>
                                            </asp:Repeater>
                                            
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                </div>
                <div id="conference8" class="tr left">
                    <h3><asp:Literal runat="server" ID="litSpecialEventsContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litSpecialEventsContent" /></p>
                </div>
                <div id="conference9" class="tr left">
                    <h3><asp:Literal runat="server" ID="litSponsorsContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litSponsorsContent" /></p>
                    
                    <asp:Repeater runat="server" ID="rptSponsors">
                        <ItemTemplate>
                            <div class="corp-box floatclear">
                                <div class="left">
                                    <asp:Image runat="server" ID="imgLogo" Width="125px" Height="125px" ImageUrl='<%# "~/resources/images/sponsors/" + DataBinder.Eval(Container.DataItem, "imagepath")%>' />
                                </div>
                                <div class="right">
                                    <h4><%# Eval("companyname") %></h4>
                                    <a href=""><%# Eval("url") %></a>
                                    <p><b>Primary Contact:</b> <%# Eval("firstname") %> <%# Eval("lastname") %>, <%# Eval("title") %></p>
                                    <p><a href='mailto:<%# Eval("email") %>'><%# Eval("email") %></a></p>
                                    <p><%# Eval("address1") %>  <%# Eval("address2") %>, <%# Eval("city") %> <%# Eval("stateshort") %> <%# Eval("zip") %></p>
                                    <p>T: <%# Eval("officephone") %></p>
                                    <p>F: <%# Eval("fax") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </div>
                <div id="conference10" class="tr left">
                    <h3><asp:Literal runat="server" ID="litExhibitorsContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litExhibitorsContent" /></p>
                    
                    <asp:Repeater runat="server" ID="rptExhibitors">
                        <ItemTemplate>
                            <div class="corp-box floatclear">
                                <div class="left">
                                    <asp:Image runat="server" ID="imgLogo" />
                                </div>
                                <div class="right">
                                    <h4><%# Eval("CompanyName") %></h4>
                                    <a href=""><%# Eval("CompanyURL") %></a>
                                    <p><b>Primary Contact:</b> <%# Eval("ContactFirstName") %> <%# Eval("ContactLastName") %></p>
                                    <p><a href='mailto:<%# Eval("ContactEmailAddress") %>'><%# Eval("ContactEmailAddress") %></a></p>
                                    <p><%# Eval("StreetAddress1") %>  <%# Eval("StreetAddress2") %>, <%# Eval("City") %> <%# Eval("stateshort") %> <%# Eval("Zipcode") %></p>
                                    <p>T: <%# Eval("OfficePhone") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </div>
                <div id="conference11" class="tr left">
                    <h3><asp:Literal runat="server" ID="litHotelInformationContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litHotelInformationContent" /></p>
                </div>
                <div id="conference12" class="tr left">
                    <h3><asp:Literal runat="server" ID="litGroundTransportationContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litGroundTransportationContent" /></p>
                </div>
                <div id="conference13" class="tr left">
                    <h3><asp:Literal runat="server" ID="litBookstoreContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litBookstoreContent" /></p>
                </div>
                <div id="conference14" class="tr left">
                    <h3><asp:Literal runat="server" ID="litCustomContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litCustomContent" /></p>
                </div>
            </div>
        </div>
        <div class="tc-close clear">&nbsp;</div>
    </div>