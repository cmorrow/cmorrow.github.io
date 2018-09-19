<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="bugForm.ascx.cs" Inherits="TABS_UserControls.usercontrols.bugForm" %>

<div>
    <asp:PlaceHolder ID="phError" runat="server">
        <h3 style="color:Red;"><asp:Literal ID="ltlErrorMsg" runat="server" /></h3>
    </asp:PlaceHolder>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td><asp:Label ID="lblBrowserName" Text="Browser Name:" runat="server" /></td>
            <td><asp:TextBox ID="tbBrowserName" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblBrowserVersion" Text="Browser Version:" runat="server" /></td>
            <td><asp:TextBox ID="tbBrowserVersion" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblOperatingSystem" Text="Operating System:" runat="server" /></td>
            <td><asp:TextBox ID="tbOperatingSystem" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblDescription" Text="Description:" runat="server" /></td>
            <td><asp:TextBox ID="tbDescription" runat="server" TextMode="MultiLine" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblName" Text="Name:" runat="server" /></td>
            <td><asp:TextBox ID="tbName" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblEmailAddress" Text="Email Address:" runat="server" /></td>
            <td><asp:TextBox ID="tbEmailAddress" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblExpectedResults" Text="Expected Results:" runat="server" /></td>
            <td><asp:TextBox ID="tbExpectedResults" runat="server" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPageURL" Text="Page URL:" runat="server" /></td>
            <td><asp:TextBox ID="tbPageURL" runat="server" /></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                    onclick="btnSubmit_Click" /></td>
        </tr>
    </table>
</div>