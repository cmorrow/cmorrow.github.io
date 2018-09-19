<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="asia_fairs.ascx.cs" Inherits="TABS_UserControls.usercontrols.asia_fairs" %>
<div class="bm left no-padding">
      <div class="asia-header both1812 floatclear">
          <img class="left" src="/resources/images/asiafair_h.gif" alt="" />
          <a href="http://tabsbeta.lbiatlanta.com/for-schools/marketing/asia-fairs.aspx"><img src="<%=bannerPath %>" alt="" class="conf-img right" /></a>
      </div>
      <div id="asiaWrapper">
            <div class="asia-cal">
                 <asp:Repeater ID="repFairs" runat="server">
                        <ItemTemplate>
                              <h4><a href='/for-schools/marketing/asia-fairs/asia-fair.aspx?id=<%#Eval("id") %>'><%#Eval("city") %>,&nbsp;<%#Eval("country") %></a></h4>
                              <p><%#Eval("hotel") %><br />    
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
				            <a href="/find-a-school/explore-your-options/asia-fairs.aspx">If you are a student or parent interested in attending a fair, click here.</a>
			            </div>
			            <div class="clear"></div>
		            </div>
		            <!-- end top div -->

	                  <div class="content">
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
                  <div id="school-tabs" class="floatclear">
                        <ul id="join-tabs-ul">
	                        <li><a href="#library1">Fair Costs</a></li>
	                        <li><a href="#library2">Hotel &amp; Flight Reservations</a></li>
	                        <li class="last"><a href="#library3">General Information</a></li>
	                  </ul>
                        <div id="library1" class="w570">
							<h3 class="red">Fair Costs</h3>
							<asp:Label ID="lbFairCostsTab" runat="server" Text=""></asp:Label>
							<table class="rounded">
								<tbody>
									<tr class="heading">
										<td colspan="3">
											<h3>Member Discount</h3>
											<p>Register for all 8 TABS fairs and save 10%!</p>
										</td>
									</tr>
									<tr class="dark">
										<td class="left">City</td>
										<td>Member</td>
										<td class="right">Non-member</td>
									</tr>
									<tr>
										<td class="left">Bangkok</td>
										<td>$950</td>
										<td class="right">$1,950</td>
									</tr>
									<tr>
										<td class="left">Beijing</td>
										<td>$1,450</td>
										<td class="right">$2,950</td>
									</tr>
									<tr>
										<td class="left">Ho Chi Minh City</td>
										<td>$950</td>
										<td class="right">$1,950</td>
									</tr>
									<tr>
										<td class="left">Hong Kong</td>
										<td>$1,150</td>
										<td class="right">N/A</td>
									</tr>
									<tr>
										<td class="left">New Delhi</td>
										<td>$950</td>
										<td class="right">$1,950</td>
									</tr>
									<tr>
										<td class="left">Seoul</td>
										<td>$950</td>
										<td class="right">$1,950</td>
									</tr>
									<tr>
										<td class="left">Shanghai</td>
										<td>$1,450</td>
										<td class="right">$2,950</td>
									</tr>
									<tr>
										<td class="left">Taipei</td>
										<td>$950</td>
										<td class="right">$1,950</td>
									</tr>
									<tr>
										<td class="left">Tokyo</td>
										<td>$1,150</td>
										<td class="right">$2,350</td>
									</tr>
									<tr>
										<td class="left"><strong>All TABS Fairs</strong><br/><em>(except for Hong Kong)</em></td>
										<td>$7,920</td>
										<td class="right">$18,000</td>
									</tr>
									<tr class="lastRow">
										<td class="left"><strong>All TABS Fairs &amp; Hong Kong</strong></td>
										<td>$9,070</td>
										<td class="right"></td>
									</tr>
									<tr>
										<td class="bottom" colspan="3">&nbsp;</td>
									</tr>
								</tbody>
							</table>
				
	                  </div>
	                  <div id="library2" class="w570">
							<h3 class="red">Hotel and Flight Reservations</h3>
							<asp:Label ID="lbReservations" runat="server" Text=""></asp:Label>
							<table class="rounded">
								<tbody>
									<tr class="heading">
										<td colspan="3">
											<h3>Hotel Room Rates</h3>
										</td>
									</tr>
									<tr class="dark">
										<td class="left">City</td>
										<td>Single</td>
										<td class="right">Double</td>
									</tr>
									<tr>
										<td class="left">Bangkok</td>
										<td>$212</td>
										<td class="right">$250</td>
									</tr>
									<tr>
										<td class="left">Beijing</td>
										<td>$220</td>
										<td class="right">$249</td>
									</tr>
									<tr>
										<td class="left">Ho Chi Minh City</td>
										<td>$225</td>
										<td class="right">$248</td>
									</tr>
									<tr>
										<td class="left">Hong Kong</td>
										<td>TBA</td>
										<td class="right">TBA</td>
									</tr>
									<tr>
										<td class="left">New Delhi</td>
										<td>$260</td>
										<td class="right">$280</td>
									</tr>
									<tr>
										<td class="left">Seoul</td>
										<td>$201</td>
										<td class="right">&nbsp;</td>
									</tr>
									<tr>
										<td class="left">Shanghai</td>
										<td>$249</td>
										<td class="right">$278</td>
									</tr>
									<tr>
										<td class="left">Taipei</td>
										<td>$216</td>
										<td class="right">&nbsp;</td>
									</tr>
									<tr class="lastRow">
										<td class="left">Tokyo</td>
										<td>$227</td>
										<td class="right">&nbsp;</td>
									</tr>
									<tr>
										<td class="bottom" colspan="3"></td>
									</tr>
								</tbody>
							</table>
							<p><em>Hotel prices are subject to change based on currency exchange rates at time of hotel booking.</em></p>

	                  </div>
	                  <div id="library3" class="w570">
	                        <h3>General Information</h3>
	                        <p><asp:Label ID="lbGeneralInfo" runat="server" Text=""></asp:Label></p>
	                  </div>
	            </div>
            </div>
            <div class="clear"></div>
      </div>
<!-- end #asiaWrapper -->
</div>


