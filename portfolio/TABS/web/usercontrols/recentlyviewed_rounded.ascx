<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="recentlyviewed_rounded.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.recentlyviewed_rounded" %>
<div class="orange-btRound">
  &nbsp;</div>
<div class="orange-bmRound recently">
  <img src="/resources/images/recently-viewed.gif" alt="" class="bot8" />
  <div class="bot5 left">
	<ul class="recentListRound">
    <li><asp:CheckBox ID="check_1" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_2" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_3" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_4" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
    <li><asp:CheckBox ID="check_5" runat="server" Text="" TextAlign="right" Visible="false" /><div class="clear"></div></li>
	</ul>
  </div>
  <div class="clear">
    <asp:ImageButton ID="buttonCompare" runat="server" ImageUrl="/resources/images/compare-recent.gif" />
  </div><div class="clear"></div>
</div>
<div class="orange-bbRound">
  &nbsp;</div>
