<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="schoolfairdetail.ascx.cs" Inherits="TABS_UserControls.usercontrols.schoolfairdetail" %>
<table width="100%">
<tr>
<td><h2><asp:Label ID="lblSchoolName" runat="server"></asp:Label></h2>
<asp:Label ID="lblSchoolType" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td style="padding-top:25px">
<h3><asp:Label ID="lblEventName" runat="server"></asp:Label></h3>
</td>
</tr>
<tr>
<td>
<asp:Label ID="lblTime" runat="server"></asp:Label> 
</td>
</tr>
<tr>
<td><asp:Label ID="lblLoc" runat="server"></asp:Label></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td><asp:Label ID="lblShortDesc" runat="server"></asp:Label></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><asp:Label ID="lblLongDesc" runat="server"></asp:Label></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Contact: &nbsp;<asp:Label ID="lblContact" runat="server"></asp:Label></td></tr>
<tr><td>Website: &nbsp;<asp:HyperLink ID="hlUrl" runat="server"></asp:HyperLink></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td><asp:HyperLink ID="backUrl" runat="server"></asp:HyperLink></td></tr>
</table>