<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="languageselector.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.languageselector" %>
<div id="language-frame">
 <ul class="left">
  <asp:Repeater ID="languageRepeater" runat="server" OnItemCommand="languageRepeater_ItemCommand">
    <ItemTemplate>
      <li>
        <asp:LinkButton ID="lnkTrigger" runat="server" Text='<%# Eval("language") %>' CommandName="languageClick"></asp:LinkButton>
      </li>
    </ItemTemplate>
  </asp:Repeater>
</ul>
<div class="clear"></div>
</div>


