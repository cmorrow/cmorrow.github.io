
<!-- #include virtual="/navincludes/securityinc.asp" -->
<% 

On Error Resume Next


dim emailSubject
Dim thanksmessage
Dim strToEmail
Dim ArrContactUsList
Dim ArrContactUs
Dim ContactID
Dim M_MENU2
Dim rid
Dim SectionTitle
M_SecurityOverRide = "N" %>
<%
strToEmail = "gpcomfeedback@GAPAC.COM" 
'strToEmail = "cmorrow@GAPAC.COM"
first_name = SecurityTextReplace(Request("first_name"))
last_name = SecurityTextReplace(Request("last_name"))
Company = SecurityTextReplace(Request("Company"))
Title = SecurityTextReplace(Request("Title"))
Address = SecurityTextReplace(Request("Address"))
Address2 = SecurityTextReplace(Request("Address2"))
City = SecurityTextReplace(Request("City"))
State = SecurityTextReplace(Request("State"))
Zip = SecurityTextReplace(Request("Zip"))
phone = SecurityTextReplace(Request("phone"))
Country = SecurityTextReplace(Request("Country"))
EMail = SecurityTextReplace(Request("EMail"))
optin = SecurityTextReplace(Request("optin"))
How = SecurityTextReplace(Request("How"))

private function GetZuluTime(xT,xHr,xMin,xSec)
	if Ucase(xT)="AM" then
		if xHr = 12 then
			xHr = "00"
		end if
	else
		if xHr < 12 then
			xHr = xHr + 12
		end if
	end if
	GetZuluTime = xHr & ":" & xMin & ":" & xSec 
end function

xdate = date()
xtime = now
xyear = Year(now)
xmonth = monthname(Month(now),true)
xday = Day(now)
xhour = Hour(now)
xmins = Minute(now)
xsecs = Second(now)
xampm = right(now,2)
xdayname = weekdayname(weekday(xdate),true,vbsunday)

submittime = xdayname & "  " & xmonth & "  " & xday & "  " & GetZuluTime(xampm,xhour,xmins,xsecs) & "   " & "EST  " & xyear

' Build E-mail General greating
	
Text = Text & "      formID: 1001" & chr(9)& chr(13)
Text = Text & "  first_name: " & first_name & chr(9)& chr(13)
Text = Text & "   last_name: " & last_name & chr(9)& chr(13)
Text = Text & "     company: " & Trim(Company) & chr(9)& chr(13)
Text = Text & "       title: " & Trim(Title) & chr(9)& chr(13)
Text = Text & "    address1: " & Trim(Address) & chr(9)& chr(13)
Text = Text & "    address2: " & Trim(Address2) & chr(9)& chr(13)
Text = Text & "        city: " & Trim(City) & chr(9)& chr(13)		
Text = Text & "       state: " & Trim(State) & chr(9)& chr(13)	
Text = Text & "         zip: " & Trim(Zip) & chr(9)& chr(13)
Text = Text & "     country: " & Trim(Country) & chr(9)& chr(13)
Text = Text & "       phone: " & Trim(Phone) & chr(9)& chr(13)			
Text = Text & "       email:  " & Trim(EMail) & chr(9)& chr(13)
Text = Text & "         how:  " & Trim(How) & chr(9)& chr(13)


viewertype = SecurityTextReplace(Request("viewertype"))
learnaboutsite = SecurityTextReplace(Request("learnaboutsite"))
IF learnaboutsite = "Other" Then
	otherlearnaboutsite = SecurityTextReplace(Request("otherlearnaboutsite"))
	learnaboutsite = learnaboutsite & " - " & Trim(otherlearnaboutsite)
End if

usefultoyou = SecurityTextReplace(Request("usefultoyou"))
additionalinfo = SecurityTextReplace(Request("additionalinfo"))
sitecomments = SecurityTextReplace(Request("sitecomments"))

Text = Text & "        type: " & Trim(viewertype) & chr(9)& chr(13)	
Text = Text & "      source: " & Trim(learnaboutsite) & chr(9)& chr(13)	
Text = Text & "       optin: " & Trim(optin) & chr(9)& chr(13)
Text = Text & "     subject: " & Trim(sitecomments) & chr(9)& chr(13)
Text = Text & "  submitTime: " & submittime


Set objMsg = Server.CreateObject ("CDONTS.NewMail")
	objMsg.From = email
	objMsg.To = strToEmail
	objMsg.Subject = "Georgia-Pacific Building Products - Stop Feeding Mold Reply"
	objMsg.BodyFormat = 1
	objMsg.Body = Text
	objMsg.Send 
	Set objMsg = Nothing
	
' Company Information
if (rid = 2) then
	Set objMsg = Server.CreateObject ("CDONTS.NewMail")
	objMsg.From = email
	objMsg.To = "CorpCommunications@gapac.com"
	objMsg.Subject = "Contact us E-mail from Company Info Section"
	objMsg.BodyFormat = 1
	objMsg.Body = Text
	objMsg.Send 
	Set objMsg = Nothing
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<!--#include file="includes/head.html" -->
</head>
<body>
<div id="wrapper">
<div id="mainNav">
<a href="default.html"><img src="images/sfmLogo.gif" alt="Stop Feeding Mold" /></a>
<a class="nav1" href="what-is-paperless-drywall.html"><i>What is Paperless Drywall</i></a>
<a class="nav2" href="questions-and-answers.html"><i>Questions &amp; Answers</i></a>
<a class="nav3" href="where-to-buy.html"><i>Where to Buy</i></a>
<a class="nav4" href="contact-us.html"><i>Contact Us</i></a>
<a href="/build" target="_blank"><img src="images/gpTop.gif" alt="Georgia-Pacific" /></a>
<br class="clearLeft" />
</div><!-- end mainNav -->
<div id="content">
<div id="contentLeft" class="contact">
<img src="images/hdrContactUs.gif" class="header" alt="Contact Us" />
<p>Thank you for visiting stopfeedingmold.com. We have received your comments and will do our best to respond to any questions you may have.
</p>

</div><!-- end contentLeft -->
<div id="contentRight"><img src="images/photoContact.jpg" class="photo" alt="" /></div><!-- end contentRight -->
</div><!-- end content -->
<!--#include file="includes/footer.html" -->
</div><!-- end wrapper -->
</body>
</html>

<%
If Err.number <> 0 Then Response.Redirect("http://www.gp.com/errormsg/404.html")
%>