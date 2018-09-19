<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="authorize_checkout.ascx.cs" Inherits="TABS_UserControls.usercontrols.authorize_checkout" %>

<h1>ATTEMPING TO RUN SAMPLE PAYMENT - RESULTS BELOW:</h1>

<div>
Using Login: <asp:Literal ID="literalLogin" runat="server" /><br />
Using Transaction Key: <asp:Literal ID="literalTransaction" runat="server" /><br />
</div>

<span runat="server" id="resultSpan"></span>