<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="printprofile.ascx.cs" Inherits="TABS_UserControls.usercontrols.printprofile" %>

<div id="container" class="print"> 
    <asp:Repeater runat="server" ID="rptPrintSchoolProfile" 
        onitemdatabound="rptPrintSchoolProfile_ItemDataBound1">
        <ItemTemplate>
                <asp:Image ID="imgLogo" width="168" height="128" runat="server" CssClass="left" />
	            <div class="school-detail"> 
		            <h1><%# Eval("schoolname") %></h1> 
		            <p><strong><%# Eval("city") %>, <%# Eval("state") %>, <%# Eval("country") %><br /> 
		            <asp:Literal runat="server" ID="litSchoolType" /></strong></p> 
		            <p><%# Eval("shortdescription") %></p> 
	            </div> 
	            <div class="clear"></div> 
            	
	            <!-- photo / school info --> 
	            <div class="section"> 
		            <asp:Image ID="imgGlance"  width="280" height="159" runat="server" CssClass="left" /> 
		            <ul class="contact-info"> 
			            <li><strong>Director of Admission: </strong><%# Eval("directorfirstname") %> <%# Eval("directorlastname") %></li> 
			            <li><strong>Admissions Phone: </strong><%# Eval("admissionphone") %></li> 
			            <li><strong>Toll-Free Admissions: </strong><%# Eval("admission800") %></li> 
		            </ul> 
		            <ul class="contact-info"> 
			            <li><strong><%# Eval("address1") %></strong></li> 
			            <li><strong><%# Eval("address2") %></strong></li> 
			            <li><strong><%# Eval("city") %>, <%# Eval("state") %>, <%# Eval("country") %>, <%# Eval("zip") %></strong></li> 
			            <li><strong>Website: </strong><a href="<%# Eval("web") %>" target="_blank"><%# Eval("web") %></a></li> 
			            <li><strong>Email: </strong><a href="<%# Eval("email") %>"><%# Eval("email") %></a></li> 
			            <li><strong>Fax: </strong><%# Eval("fax") %></li> 
		            </ul> 
		            <div class="clear"></div> 
		            <!-- end section -->
	            </div> 
	    </ItemTemplate>
	</asp:Repeater>
	
	<asp:Repeater runat="server" ID="rptAtAGlance">
	    <ItemTemplate>
	        <div class="section"> 
	            <h2>At A Glance</h2> 
	            <table class="school-table" cellspacing="0" cellpadding="4px"> 
	                <tr> 
	                    <th></th> 
	                    <th class="tb">Boarding<br /><span>Grades <%# Eval("boardgraderange") %></span></th> 
	                    <th class="tb">Day<br /><span>Grades <%# Eval("daygraderange") %></span></th> 
	                    <th class="tb">Total</th> 
	                </tr> 
	                <tr> 
	                    <th>Girls</th> 
	                    <td class="tb"><%# Eval("girlsboard") %></td> 
	                    <td class="tb"><%# Eval("girlsday") %></td> 
	                    <td class="tb"><%# int.Parse(Eval("girlsboard").ToString()) + int.Parse(Eval("girlsday").ToString()) %></td> 
	                </tr> 
	                <tr> 
	                    <th>Boys</th> 
	                    <td class="tb"><%# Eval("boysboard") %></td> 
	                    <td class="tb"><%# Eval("boysday") %></td> 
	                    <td class="tb"><%# int.Parse(Eval("boysboard").ToString()) + int.Parse(Eval("boysday").ToString())%></td> 
	                </tr> 
	                <tr> 
	                    <th>Total</th> 
	                    <td><%# int.Parse(Eval("girlsboard").ToString()) + int.Parse(Eval("boysboard").ToString())%></td> 
	                    <td><%# int.Parse(Eval("girlsday").ToString()) + int.Parse(Eval("girlsday").ToString())%></td> 
	                    <td class="total-span"><%# int.Parse(Eval("girlsboard").ToString()) + int.Parse(Eval("girlsday").ToString()) + int.Parse(Eval("boysboard").ToString()) + int.Parse(Eval("boysday").ToString()) %></td> 
	                </tr> 
	            </table> 
	            <ul class="rightCol"> 
	                <li><strong>Campus Size: </strong><%# Eval("size") %> acres</li> 
		            <li><strong>Year Founded: </strong><%# Eval("founded") %></li> 
	                <li><strong>Religious Affiliation: </strong><%# Eval("religion") %></li> 
	            </ul> 
	            <div class="clear"></div> 
            </div> 
        </ItemTemplate>
	</asp:Repeater>
	
        <div class="two-col"> 
            <ul class="leftCol"> 
	            <li><strong>Average Class Size: </strong><asp:Literal runat="server" ID="litClassSize" /></li> 
	            <li><strong>Student/Teacher Ratio: </strong><asp:Literal runat="server" ID="litStudentTeacherRatio" /></li> 
	            <li><strong>Dress Code: </strong><asp:Literal runat="server" ID="litDressCode" /></li> 
	            <li><strong>7-Day Boarding Tuition: </strong><asp:Literal runat="server" ID="lit7DayTuition" /></li> 
                <li><strong>5-Day Boarding Tuition: </strong><asp:Literal runat="server" ID="lit5DayTuition" /></li> 
                <li><strong>Day Tuition: </strong><asp:Literal runat="server" ID="litDayTuition" /></li> 
                <li><strong>Admission Deadline: </strong><asp:Literal runat="server" ID="litAdmissionDeadline" /></li> 
                <li><strong>Headmaster: </strong><asp:Literal runat="server" ID="litHeadmaster" /></li> 
                <li><strong>Accreditations: </strong><asp:Literal runat="server" ID="litAccreditations" /></li> 
            </ul> 
            <ul class="rightCol"> 
                <li><strong>ESL: </strong><asp:Literal runat="server" ID="litESL" /></li> 
                <li><strong>Advanced Placement: </strong><asp:Literal runat="server" ID="litAdvancedPlacement" /></li> 
                <li><strong>International Baccalureate: </strong><asp:Literal runat="server" ID="litInternationalBaccalureate" /></li> 
                <li><strong>Post Graduate Study: </strong><asp:Literal runat="server" ID="litPostGraduateStudy" /></li> 
                <li><strong>Summer Programs: </strong><asp:Literal runat="server" ID="litSummerPrograms" /></li> 
	            <li><strong>Accepts TABS Admission Application: </strong><asp:Literal runat="server" ID="litAcceptsTabsAdmission" /></li> 
	            <li><strong>Payment Plans: </strong><asp:Literal runat="server" ID="litPaymentsPlans" /></li> 
	            <li><strong>Need-Based Aid: </strong><asp:Literal runat="server" ID="litNeedBasedAid" /></li> 
	            <li><strong>Merit Scholarships: </strong><asp:Literal runat="server" ID="litMeritScholarships" /></li> 
            </ul> 
            <div class="clear"></div> 
        </div> 
                
        <!-- end three-col --> 
        <p>&#169; 2009 The Association of Boarding Schools </p> 

	   
</div> 
<!-- end container --> 