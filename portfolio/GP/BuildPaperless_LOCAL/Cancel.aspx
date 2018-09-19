<%@ page language="VB" autoeventwireup="false" enableeventvalidation="false" inherits="build.paperless_cancel, App_Web_vnn5jxu-" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Georgia-Pacific Paperless Cancel Subscription</title>
        <!--#include file="includes/head.html"-->
    </head>
    <body>  
        <!-- WRAPPER DIV -->                
        <div id="wrapper">
            <!-- HEADER DIV -->                
            <!--#include file="includes/header.html"-->
            <!--#include file="includes/nav.html"-->
            <div id="contentWrapper">
                <form id="form1" runat="server">
                    <div id="content" runat="server">
                        <h1>Cancel Subscription of:</h1>
                        <!-- CONTACT INFO DIV -->
                        <div id="formsLeft">
                            <ul><li><label for="TxtEmail">E-mail</label><asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox></li></ul>
                            <ul class="radios"><li><asp:Button ID="BtnSubmit" runat="server" Text="Unsubscribe" CssClass="unsubscribe" /></li></ul>
                            <ul style="display:none;">
                            <li><asp:ValidationSummary ID="VSMain" runat="server" Width="300px" Visible="False" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" HeaderText="The following errors occured:" /></li>
                            <li><asp:CustomValidator ID="CVErrorhandler" runat="server" Visible="False"></asp:CustomValidator></li>
                            </ul>
                        </div><!-- end formsLeft -->
                        <div class="clearLeft"></div>
                    </div><!-- END CONTENT DIV -->
                    <asp:Literal ID="litThankYou" runat="server" Visible="false">
                    <div id="content2">
                        <div id="thanksBox"><h2>Your subscription to buildpaperless.com<br />has been successfully cancelled</h2><img src="images/thanksFooter.gif" alt="BuildPaperless" /></div>
                    </div>
                    </asp:Literal>  
                    <!-- SIDEBAR DIV -->
                    <div id="sidebar">
                        <h2>Need Immediate Assistance?</h2> 
                        <p>For general inquiries, call <span style="white-space: nowrap;">1-800-BUILD GP</span></p>
                        <p>For technical assistance with Gypsum Products, call our Technical Hotline at <span style="white-space: nowrap;">1-800-225-6119</span></p>
                        <h2>Need Samples For Your Project?</h2>
                        <p>Call 1-800 BUILD GP and we'll ship them to you at no charge. Samples measure approximately 3.5" x 7".</p>
                        <p>Need more information on any of Georgia-Pacific Gypsum products? Visit <a href="/build/productgroup.aspx?pid=1064&amp;bpl" target="_blank">www.gpgypsum.com</a></p>
                    </div><!-- END SIDEBAR DIV -->
                    <div class="clearBoth"></div>
                </form>
            </div><!-- end contentWrapper -->
            <!--#include file="includes/footer.html"-->
        </div><!-- end wrapper -->
    </body>
</html>