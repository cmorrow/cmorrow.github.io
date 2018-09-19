<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="recentlyviewed.ascx.cs" Inherits="TABS_UserControls.usercontrols.recentlyviewed" %>

<img src="/resources/images/recently-viewed.gif" alt="" class="bot8" />
<div class="bot5 left">
	<ul class="recentList">
    <li><asp:CheckBox ID="check_1" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_2" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_3" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_4" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_5" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
	</ul>
</div>
<div class="clear">
    <asp:ImageButton ID="buttonCompare" runat="server" ImageUrl="/resources/images/compare-recent.gif" />
</div>
