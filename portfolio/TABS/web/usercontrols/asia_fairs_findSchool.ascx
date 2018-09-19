<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="asia_fairs_findSchool.ascx.cs" Inherits="TABS_UserControls.usercontrols.asia_fair_findSchool" %>
<div class="asia-header both1812 floatclear">
    <img class="left" src="/resources/images/asiafair_h.gif" alt="" />
    <img src="<%=bannerPath %>" alt="" class="conf-img right" />
</div>
<div id="asiaWrapper">
<div class="asia-cal left">
    <h3>This Year's Fairs</h3>
     	<asp:Repeater ID="repFairs" runat="server">
             <ItemTemplate>
                   <h4><a href='/find-a-school/explore-your-options/asia-fairs/asia-fair.aspx?cityName=<%#Eval("city") %>&languageId=<%=languageIdStr %>'><%#Eval("city") %>,<%#Eval("country") %></a></h4>
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
				<a class="asiaRegBtn" href="/find-a-school/explore-your-options/asia-fairs/registration-form.aspx"><strong>Parents &amp; Students</strong>
					<span>Register Online (Free)</span><span class="bot"></span></a>
				<p>Registration is free. Parents and students who register online will gain quicker access into the fair.</p>
            </div>
            <div class="right">
	            <a href="/for-schools/marketing/asia-fairs.aspx">If you are a school interested in participating in a fair, click here.</a>
            </div>
            <div class="clear"></div>
        </div>
        <!-- end top div -->
		<div class="content">
			<p><asp:Label ID="lbForSchools" runat="server" Text=""></asp:Label></p>
			<p>Click on the links to the left to learn more about each fair and to see a list of participating schools. Please refer to the schedule for fair dates, locations, and times. To view the participating schools, please use the city links on the left. Schools will be regularly added to the city web pages, so please check back for updates.</p>
			<!-- <%--<asp:Label ID="lbSecondndParagText" runat="server" Text=""></asp:Label>--%> -->
		</div>
</div>
<!-- end asia-reg -->
<div class="clear"></div>
</div>
<!-- end asiaWrapper -->
<%--<div class="asia-tabs right">
    <div id="school-tabs" class="floatclear join-tabs-mar">
       
        <div id="library1" class="w525">
        </div>
        <div id="library2" class="w525">
        </div>
        <div id="library3" class="w525">
        </div>
    </div>
</div>--%>



