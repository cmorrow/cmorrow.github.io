<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="callout_quicklinks.ascx.cs" Inherits="TABS_UserControls.usercontrols.callout_quicklinks" %>

<div class="callout-box right">
    <div class="orange-bt">&nbsp;</div>
    <div class="orange-bm left">
        <img src="/resources/images/quick-links.gif" alt="" class="bot8" />
        <ul>
            <li><a href="/for-schools/job-board.aspx">Job Board</a></li>
            <li><a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">Free Boarding School Directory</a></li>
            <li class="floatclear">
                <asp:MultiView ID="multiLink" runat="server" ActiveViewIndex="0">
                    <asp:View ID="viewLogin" runat="server">
                        <a href="javascript:void(0);" class="left" onclick='javascript:alert("This page is only available to members. If you&#146;re a member please click login in the top right. If you&#146;re not a member visit the Join TABS page.");'>Find a Colleague<img src="/resources/images/orange-lock.gif" alt="" /></a>
                    </asp:View>
                    <asp:View ID="viewGo" runat="server">
                        <a href="/for-schools/find-a-colleague.aspx">Find a Colleague<img src="/resources/images/orange-lock.gif" alt="" /></a>
                    </asp:View>
                </asp:MultiView>
            </li>
            <li><a href="/about-tabs/corporate-sponsors.aspx">Corporate Sponsors</a></li>
        </ul>
    </div>
    <div class="orange-bb clear">&nbsp;</div>
</div>