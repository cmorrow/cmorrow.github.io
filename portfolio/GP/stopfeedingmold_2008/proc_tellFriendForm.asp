<!-- #include virtual="/navincludes/securityinc.asp" -->
<%
'Response.Expires = -10000 

'Dim strResultXML
Dim strlink

On Error Resume Next
if Request.QueryString("page")="whatis" then
strlink = "http://www.stopfeedingmold.com/what-is-paperless-drywall.html"
End If
if Request.QueryString("page")="where" then
strlink = "http://www.stopfeedingmold.com/wheretobuy.html"
End If
if Request.QueryString("page")="questions" then
strlink = "http://www.stopfeedingmold.com/qa.html"
End If

tName  = SecurityTextReplace(Request("firstname")) & " " & SecurityTextReplace(Request("surname"))
tEmail = SecurityTextReplace(Request("fromemail"))    
tFriendName = "My Friend"
tFriendEmail = SecurityTextReplace(Request("emailto"))
tSubject = "Stop Feeding Mold(tm)"    
tMessage = SecurityTextReplace(Request("message"))
tHeader = VbCrLf
tPrefix = tName & " would like you to know about revolutionary DensArmor Plus(r) paperless drywall, which can help to reduce the chances for mold." & VbCrLf & "Check it out at: " & strlink & VbCrLf & VbCrLf
tSuffix = VbCrLf
tFooter= "Copyright (c) 2006 G-P Gypsum, a Georgia-Pacific Company. All rights reserved. Stop Feeding Mold is a trademark and DensArmor Plus(r) is a registered trademark of G-P Gypsum Corporation."

'  Create Microsoft email object
Set objMsg = Server.CreateObject ("CDONTS.NewMail")
	'  Populate and send Microsoft email object
	objMsg.From = tEmail
	objMsg.To = replace(tFriendEmail, ",", ";")
	objMsg.Subject = tSubject 
	objMsg.Body = tHeader & tPrefix & tSuffix & tFooter
	objMsg.Send 
Set objMsg = Nothing
Response.Redirect "friendThanks.html"
    ' Flash string written to confirm form submitted
	'strResultXML = "<?xml version=""1.0"" encoding=""utf-8"" ?><result success=""1"" />"
		
	'Response.Write("&xml=" & strResultXML & "&")
	

%>

<%
If Err.number <> 0 Then Response.Redirect("http://www.gp.com/errormsg/404.html")
%>