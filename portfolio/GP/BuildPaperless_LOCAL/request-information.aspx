<%@ page language="VB" autoeventwireup="false" enableeventvalidation="false" inherits="build.paperless_requestinformation, App_Web_vnn5jxu-" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>BuildPaperless - Request Information</title>
        <!--#include file="includes/head.html"-->
        <script type="text/javascript">
            function hideDrops()
            {
                document.getElementById('<%=CmbStates.ClientID%>').style.display = "none";
                document.getElementById('<%=CmbCountry.ClientID%>').style.display = "none";
            }
            
            function showDrops()
            {
                document.getElementById('<%=CmbStates.ClientID%>').style.display = "inline";
                document.getElementById('<%=CmbCountry.ClientID%>').style.display = "inline";
            }
        </script>
    </head>
    <body>
        <!-- WRAPPER DIV -->                
        <div id="wrapper">
            <!-- HEADER DIV -->                
            <!--#include file="includes/header.html"-->
            <!--#include file="includes/nav.html"-->
            <div id="contentWrapper">
                <form id="form1" runat="server">
                    <div id="content">
                        <h1>Request Information</h1>
                        <p>Would you like to learn more about building with paperless fiberglass mat gypsum panels?  Contact us to meet with a representative or to schedule an onsite AIA or CSI accredited course. Find out <a href="/build/Dealerlocator.aspx?bpl" target="_blank">where to buy</a>.</p>
                        <!-- CONTACT INFO DIV -->
                        <div id="formsLeft">
                            <h2>Contact Information<span class="txtBlue" style="font-size: 80%;"> ( <span class="required">*</span> Required Fields )</span></h2>
                            <ul>
                                <li>
                                    <label for="TxtFirstName">
                                        <asp:Label ID="LblFirstName" runat="server" Text="* First Name" />
                                    </label>
                                    <asp:TextBox ID="TxtFirstName" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtLastName">
                                        <asp:Label ID="LblLastName" runat="server" Text="* Last Name" />
                                    </label>
                                    <asp:TextBox ID="TxtLastName" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtOccupation">Occupation</label>
                                    <asp:TextBox ID="TxtOccupation" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtCompany">Company</label>
                                    <asp:TextBox ID="TxtCompany" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtPhone">
                                        <asp:Label ID="LblPhone" runat="server" Text="* Phone" />
                                    </label>
                                    <asp:TextBox ID="TxtPhone" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtEmail">
                                        <asp:Label ID="LblEmail" runat="server" Text="* E-mail" />
                                    </label>
                                    <asp:TextBox ID="TxtEmail" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtAddress">Address 1</label>
                                    <asp:TextBox ID="TxtAddress" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtAddress2">Address 2</label>
                                    <asp:TextBox ID="TxtAddress2" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtCity">City</label>
                                    <asp:TextBox ID="TxtCity" runat="server" />
                                </li>
                                <li>
                                    <label for="CmbStates">State/Prov.</label>
                                    <asp:DropDownList ID="CmbStates" runat="server" />
                                </li>
                                <li>
                                    <label for="TxtZip">Zip</label>
                                    <asp:TextBox ID="TxtZip" runat="server" />
                                </li>
                                <li>
                                    <label for="CmbCountry">Country</label>
                                    <asp:DropDownList ID="CmbCountry" width="250px" runat="server" />
                                </li>
                            </ul>
                            <!-- VALIDATION DIV -->
                            <ul style="display:none;">
                                <li><asp:ValidationSummary ID="VSMain" runat="server" Width="300px" Visible="False" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" HeaderText="The following errors occured:" /></li>
                                <li><asp:CustomValidator ID="CVErrorhandler" runat="server" Visible="False" /></li>
                            </ul>
                            <!-- END VALIDATION DIV -->
                        </div><!-- end formsLeft -->
                        <!-- QUESTIONS/COMMENTS DIV -->
                        <div id="formsRight">
                            <h2>Questions, Comments &amp; Requests</h2>
                            <ul>
                                <li><asp:TextBox ID="TxtComments" Rows="5" TextMode="multiLine" runat="server" /></li>
                            </ul>
                            <ul class="checkboxes">
                                <li>
                                    <asp:CheckBox ID="ChkOnSite" runat="server" Text="Request an on-site accredited presentation." />
                                    <div class="clearLeft"></div>
                                </li>
                                <li>
                                    <asp:CheckBox ID="ChkSalesRep" runat="server" Text="Have a sales representitive contact me about Georgia-Pacific Gypsum products." />
                                    <div class="clearLeft"></div>
                                </li>
                                <li>
                                    <asp:CheckBox ID="ChkSubscribe" runat="server" Text="Please add me to your subscription list for case studies, ideas and best practices on site." />
                                </li>
                                <li>
                                    <div class="clearLeft"></div>
                                </li>
                                <li>
                                    <div class="clearLeft">
                                        <p><label><!-- #include file="../../includes/privacy_snippet.html" --></label></p>
                                    </div>
                                </li>
                            </ul>
                            <ul class="radios">
                                <li><asp:Button ID="BtnSubmit" runat="server" Text="Submit" /></li>
                            </ul>
                        </div><!-- end formsRight -->
                        <div class="clearLeft"></div>
                    </div><!-- END CONTENT DIV -->  
                    <!-- SIDEBAR DIV -->
                    <div id="sidebar">
                        <h2>Need Immediate Assistance?</h2> 
                        <p>For general inquiries, 
                        call <span style="white-space: nowrap;">1-800-BUILD GP</span></p>
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
