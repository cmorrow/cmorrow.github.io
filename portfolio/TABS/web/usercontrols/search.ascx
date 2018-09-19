<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="search.ascx.cs" Inherits="TABS_UserControls.usercontrols.search" %>
<input id="searchstring" runat="server" type="text" class="search-txt" name="q" onfocus="if(this.value == 'search') this.value = ''" onblur="if(this.value == '') this.value = 'search'" value="search"/>
<asp:Button ID="btnSearch" runat="server" CausesValidation="false" CssClass="search-btn" 
  onclick="btnSearch_Click" />