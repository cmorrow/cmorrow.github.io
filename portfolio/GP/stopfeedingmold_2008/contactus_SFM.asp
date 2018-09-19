<!-- #include virtual="/navincludes/securityinc.asp" --><% Option Explicit 

On Error Resume Next

Dim SectionName
Dim SectionTitle
Dim ContactUsContent
Dim redirect
dim dpk
dim dpm
Dim ArrContactUsList
Dim ArrContactUs
Dim ContactID
Dim M_Menu2
Dim rid
M_SecurityOverRide = "N" %>


<!-- #include virtual="/navincludes/context_SFM.html" -->
<td valign="middle" align="left" class="required">
* Required Information
</td>
</tr>
</TABLE>

<!-- Begin Content Table -->
<table cellpadding="0" border="0" width="100%" cellspacing="0">
<tr><td valign="top" align="left" class="bc1">
<form action="thanks_SFM.asp" method="POST" id="form2" name="form2">
<% 
	ContactUsContent = Replace( ContactUsContent, "$productkey", ProductKey)
	ContactUsContent = Replace( ContactUsContent, "$menukey", MenuKey)
	ContactUsContent = Replace( ContactUsContent, "$menuoption", MenuOption)
	Response.Write(ContactUsContent) 
	
%>
<table cellpadding="2" border="0" width="500" cellspacing="0" bgcolor="#666666">

<!-- Contact Us general fields -->
<!-- #include virtual="/includes/contactus-fields_SFM.html" -->
<!-- Contact Us Comment fields -->
<!-- #include virtual="/includes/contactus-comments_SFM.html" -->
<!-- #include virtual="/includes/contactus-optin_SFM.html" -->
<input type="hidden" name="id" value="<%=SecurityTextReplace(Request("id"))%>">
<input type="hidden" name="pk" value="<%=ProductKey%>">
<input type="hidden" name="mk" value="<%=MenuKey%>">
<input type="hidden" name="mo" value="<%=MenuOption%>">
<tr>
<td>&nbsp;</td>


<td colspan="2" align="middle"><input class="button" type="button" onclick="sendmail()" value="SEND">
</td></tr>
</table>
</form>
</tr></td></table>
<!-- End Content Table -->

</td>
</tr>
</table>

<table cellpadding="0" cellspacing="0" width="96%" border="0" align="center">
<tr>
<td valign="top" align="middle" width="100%"  class="footer"><!-- #include virtual="/navincludes/sfm_footer.html" --><br><br></td></tr>
</table>

<!-- Google Analytics -->
<!-- #include virtual="/navincludes/googleanalytics.html" -->
<!-- Google Analytics -->

</body>
</html>

<%
If Err.number <> 0 Then Response.Redirect("http://www.gp.com/errormsg/404.html")
%>