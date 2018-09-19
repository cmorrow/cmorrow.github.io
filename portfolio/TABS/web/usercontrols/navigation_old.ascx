<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="navigation.ascx.cs" Inherits="TABS_UserControls.usercontrols.navigation" %>

<ul class="sf-menu sf-navbar">
	<li id="liHome" runat="server"><a href="/home.aspx" class="home">home</a></li>
	<li id="liStudents" runat="server"><a href="/for-students.aspx" class="for-students">for students</a>
		<ul>
		    <li><a href="/for-students.aspx">student lounge</a></li>
			<li><a href="/for-students/the-basics.aspx">the basics</a></li>
			<li><a href="/for-students/5-good-reasons.aspx">5 good reasons</a></li>
			<li><a href="/for-students/old-school.aspx" class="arrow">old school</a>
				<ul>
				    <li><a href="/for-students/old-school.aspx">overview</a></li>
					<li><a href="/for-students/old-school/famous-grads.aspx">famous grads</a></li>
					<li><a href="/for-students/old-school/history.aspx">history</a></li>
				</ul>
			</li>
			<li><a href="/for-students/myths-101.aspx">myths 101</a></li>
		</ul>
	</li>
	<li id="liParents" runat="server"><a href="/for-parents.aspx" class="for-parents">for parents</a>
		<ul>
		    <li><a href="/for-parents.aspx">open house</a></li>
			<li><a href="/for-parents/the-fundamentals.aspx">the fundamentals</a></li>
			<li><a href="/for-parents/the-advantages.aspx">the advantages</a></li>
			<li><a href="/for-parents/the-tradition.aspx" class="arrow">the tradition</a>
				<ul>
				    <li><a href="/for-parents/the-tradition.aspx">overview</a></li>
					<li><a href="/for-parents/the-tradition/distinguished-alumni.aspx">distinguished alumni</a></li>
					<li><a href="/for-parents/the-tradition/history.aspx">history</a></li>
				</ul>
			</li>
			<li><a href="/for-parents/common-misconceptions.aspx">common misconceptions</a></li>
		</ul>
	</li>
	<li id="liFindSchool" runat="server"><a href="/find-a-school.aspx" class="find-a-school">find a school</a>
		<ul>
			<li><a href="/find-a-school.aspx" class="arrow">search tools</a>
			    <ul>
			        <li><a href="/school-browser.aspx">school browser</a></li>
			        <li><a href="/find-a-school/search-tools/guided-search.aspx">guided search</a></li>
			        <li><a href="/find-a-school/search-tools/a-z-school-list.aspx">a-z school list</a></li>
			    </ul>
			</li>
			<li><a href="/find-a-school/explore-your-options.aspx" class="arrow">explore your options</a>
				<ul>
				    <li><a href="/find-a-school/explore-your-options.aspx">overview</a></li>
				    <li><a href="/find-a-school/explore-your-options/asia-fairs.aspx">asia fairs</a></li>
					<li><a href="/find-a-school/explore-your-options/campus-visits.aspx">campus visits</a></li>
					<li><a href="/find-a-school/explore-your-options/school-fairs.aspx">school fairs</a></li>
					<li><a href="/find-a-school/explore-your-options/summer-programs.aspx">summer programs</a></li>
					<li><a href="/find-a-school/explore-your-options/contact-schools.aspx">contact schools</a></li>
					<li><a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">request free directory</a></li>
				</ul>
			</li>
			<li><a href="/find-a-school/find-an-expert.aspx">find an expert</a></li>
			<li><a href="/find-a-school/summer-programs.aspx">summer programs</a></li>
		</ul>
	</li>
	<li id="liApply" runat="server"><a href="/how-to-apply.aspx" class="how-to-apply">how to apply</a>
	    <ul>
	        <li><a href="/how-to-apply.aspx">overview</a></li>
	        <li><a href="/how-to-apply/application.aspx">application</a></li>
	        <li><a href="/how-to-apply/testing.aspx">testing</a></li>
	        <li><a href="/how-to-apply/expenses--aid.aspx">expenses &amp; aid</a></li>
	        <li><a href="/how-to-apply/after-you-apply.aspx">after you apply</a></li>
	        <li><a href="/how-to-apply/international-applicants.aspx" class="arrow">international applicants</a>
	            <ul>
	                <li><a href="/how-to-apply/international-applicants.aspx">overview</a></li>
	                <li><a href="/how-to-apply/international-applicants/us-visas.aspx">u.s visas</a></li>
					<li><a href="/how-to-apply/international-applicants/international-visas.aspx">international visas</a></li>
	            </ul>
	        </li>
	    </ul>
	</li>
	<li><p class="menu-div">divider</p></li>
	<li id="liSchools" runat="server"><a class="for-schools" href="/for-schools.aspx">for schools</a>
	    <ul>
	        <li><a href="/for-schools.aspx" class="arrow">overview</a>
	            <ul>
	                <li><a href="/for-schools/overview/join-tabs.aspx">join TABS</a></li>            
	            </ul>
	        </li>
	        <li><a href="/for-schools/professional-development.aspx" class="arrow">professional development</a>
	            <ul>
	                <li><a href="/for-schools/professional-development.aspx">overview</a></li>
	                <li><a href="/for-schools/professional-development/tabs-calendar-for-schools.aspx">TABS calendar</a></li>
	                <li><a href="/for-schools/professional-development/conferences.aspx">conference</a></li>
	                <li><a href="/for-schools/professional-development/workshops.aspx">workshops</a></li>
	            </ul>
	        </li>
	        <li><a href="/for-schools/marketing.aspx" class="arrow">marketing</a>
	            <ul>
	                <li><a href="/for-schools/marketing.aspx">overview</a></li>
	                <li><a href="/for-schools/marketing/asia-fairs.aspx">asia fairs</a></li>
	                <li><a href="/for-schools/marketing/whats-new.aspx">what's new</a></li>
	            </ul>
	        </li>
	        <li><a href="/for-schools/tabs-library.aspx" class="arrow">TABS library</a>
	            <ul>
	                <li><a href="/for-schools/tabs-library.aspx">overview</a></li>
	                <li><a href="/for-schools/tabs-library/research-and-stats.aspx">research and stats</a></li>
	                <li><a href="/for-schools/tabs-library/news.aspx">news</a></li>
	                <li><a href="/for-schools/tabs-library/articles-and-op-eds.aspx">articles &amp; op-eds</a></li>
	                <li><a href="/for-schools/tabs-library/enewsletter.aspx">enewsletter</a></li>
	                <li><a href="/for-schools/tabs-library/bookstore.aspx">bookstore</a></li>
	                <li><a href="/for-schools/tabs-library/helpful-links.aspx">helpful links</a></li>
	                <li><a href="/for-schools/tabs-library/directors-cut.aspx">director's cut</a></li>
	            </ul>
	        </li>
	        <li><a href="/for-schools/job-board.aspx">job board</a></li>
	        <li><a href="/for-schools/sponsors.aspx">sponsors</a></li>
	        <li><a href="/for-schools/educational-consultants.aspx">educational consultants</a></li>
	    </ul>
	</li>			    
	<li id="liTABS" runat="server"><a href="/about-tabs.aspx" class="about-tabs">about TABS</a>
	    <ul>
	        <li><a href="/about-tabs.aspx" class="arrow">about us</a>
	            <ul>
	                <li><a href="/about-tabs.aspx">overview</a></li>
	                <li><a href="/about-tabs/about-us/our-mission.aspx">our mission</a></li>
	                <li><a href="/about-tabs/about-us/board-of-trustees.aspx">board of trustees</a></li>
	                <li><a href="/about-tabs/about-us/tabs-staff.aspx">TABS staff</a></li>
	                <li><a href="/about-tabs/about-us/tabs-calendar.aspx">TABS calendar</a></li>
	                <li><a href="/about-tabs/about-us/enewsletter-tabs.aspx">enewsletter</a></li>
	                <li><a href="/about-tabs/about-us/tabs-news.aspx">TABS news</a></li>
	                <li><a href="/about-tabs/about-us/reports--finances.aspx">reports &amp; finances</a></li>
	                <li><a href="/about-tabs/about-us/careers-with-tabs.aspx">careers with TABS</a></li>
	            </ul>
	        </li>
	        <li><a href="/about-tabs/corporate-sponsors.aspx" class="arrow">corporate sponsors</a>
	            <ul>
	                <li><a href="/about-tabs/corporate-sponsors.aspx">overview</a></li>
	                <li><a href="/about-tabs/corporate-sponsors/about-sponsorship.aspx">about sponsorship</a></li>
	            </ul>
	        </li>
	        <li><a href="/about-tabs/friends-in-education.aspx" class="arrow">friends in education</a>
	            <ul>
	                <li><a href="/about-tabs/friends-in-education.aspx">overview</a></li>
	                <li><a href="/about-tabs/friends-in-education.aspx#boarding-school-networks">boarding school networks</a></li>
	                <li><a href="/about-tabs/friends-in-education.aspx#educational-partners">educational partners</a></li>
	                <li><a href="/about-tabs/friends-in-education.aspx#sister-associations">sister associations</a></li>
	            </ul>
	        </li>
	        <li><a href="/about-tabs/contact-us.aspx" class="arrow">contact us</a>
	            <ul>
	                <li><a href="/about-tabs/contact-us.aspx">overview</a></li>
	                <li><a href="/for-schools/overview/join-tabs.aspx">become a member</a></li>
	            </ul>
	        </li>
	        <li id="sendidea" runat="server">
	        <a href="/about-tabs/send-a-idea.aspx" class="arrow">send an idea</a>
	        </li>
	        
	    </ul>
	</li>
	<li id="liMEMBER" runat="server"><a href="/for-schools/overview.aspx" class="member-home">member home</a></li>	
</ul>