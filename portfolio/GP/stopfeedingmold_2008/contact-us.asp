
<!-- #include virtual="/navincludes/securityinc.asp" -->
<%
On Error Resume Next
SecurityCheck() 

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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<!--#include file="includes/head.html" -->
<meta name="keywords" content="Stop Feeding Mold, DensArmor Plus mold- and moisture-resistant paperless drywall, paperless wallboard, paperless gypsum board, mold-resistant wallboard, mold-resistant drywall, moisture-resistant drywall, glass-mat facings, fiberglass mats, drywall that resists mold, wallboard that resists mold, innovative drywall manufactured by Georgia-Pacific Gypsum." />
<meta name="description" content="Ask a question about DensArmor Plus paperless interior drywall from Georgia-Pacific." />
<title>STOP FEEDING MOLD - Contact Us</title>
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
<p>1-800 BUILD GP (1-800-284-5347)<br />
Customer Service<br />
133 Peachtree Street, 8th Floor<br />
Atlanta, GA 30303
</p>
* Required Information<br />
<!-- #include file="includes/validatecontactform.html" -->
<form action="contact-thanks.asp" method="POST" name="form2">
<p><label for="email"><b>*</b>E-mail address:</label><input name="email"></p>
<!-- Contact Us Comment fields -->
<p><label for="sitecomments"><b>*</b>Questions, comments,<br/>or requests:</label><textarea name="sitecomments"></textarea></p>
<!--#include virtual="/includes/privacy_snippet.html" -->
<p class="submit"><input type="button" value="Send" onclick="sendmail()" /></p>
</form>
</div><!-- end contentLeft -->
<div id="contentRight"><p id="player1"></p><script type="text/javascript">
	var s1 = new SWFObject("flash/videoPlayer.swf","mpl","320","274","8");
	s1.addParam("allowfullscreen","true");
	s1.addParam("shownavigation","false");
	s1.addVariable("streamingServer","cp25398.edgefcs.net/ondemand");
	s1.addVariable("videoFile","videos/SFM-Commercial_Eye");
	s1.addVariable("img","videos/GPA_1326B.jpg");
	s1.write("player1");
</script></div><!-- end contentRight -->
<br class="clearBoth" />
</div><!-- end content -->
<!--#include file="includes/footer.html" -->
</div><!-- end wrapper -->
</body>
</html>

<%
If Err.number <> 0 Then Response.Redirect("http://www.gp.com/errormsg/404.html")
%>