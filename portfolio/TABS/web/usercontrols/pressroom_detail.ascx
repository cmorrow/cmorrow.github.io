<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="pressroom_detail.ascx.cs" Inherits="TABS_UserControls.usercontrols.pressroom_detail" %>

<div id="school-tabs" class="floatclear">
    <ul class="conf-tabs-ul">
        <li class="active"><a href="#library1"><span>News</span></a></li>
        <div class="clear"></div>
    </ul>  
    <div id="library1" class="w550 floatclear">
        <div>
            <a href="/about-tabs/about-us/tabs-news.aspx" class="right">&lt;Back to TABS Press Room</a>
            <h2><asp:Label ID="lblHeadline" runat="server"></asp:Label></h2>
            <p><asp:Label ID="lblDate" runat="server"></asp:Label><br /><asp:Label ID="lblSource" runat="server"></asp:Label></p>
            <!-- Source only for school and web news, if not available, should not display -->
            <p><asp:Label ID="lblSummary" runat="server"></asp:Label></p>
            <p class="top10"><asp:Label ID="lblBody" runat="server"></asp:Label></p>
        </div>
    </div>
</div>