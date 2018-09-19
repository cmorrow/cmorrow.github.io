<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="callout_sharethis.ascx.cs" Inherits="TABS_UserControls.usercontrols.callout_sharethis" %>
<script type="text/javascript" src="http://w.sharethis.com/button/sharethis.js#publisher=a6113a91-8e7e-4035-9f1a-e9416bb5d8d4&button=false;type=website"></script>  
<script language="javascript" type="text/javascript">
//Create your sharelet with desired properties and set button element to false
var object = SHARETHIS.addEntry({title:'Share',summary: 'temp'},{button:false});
//Output your customized button
document.write('<span id="share"><a href="javascript:void(0);"><img src="/resources/images/template/share.gif" class="right" /></a></span>');
//Tie customized button to ShareThis button functionality.
var element = document.getElementById("share");
object.attachButton(element);
</script>

<%--  <a href=""><img src="/resources/images/template/share.gif" alt="" class="right" /></a>
--%>