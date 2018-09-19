<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="account_info.ascx.cs" Inherits="TABS_UserControls.usercontrols.account_info" %>

<div class="both1812">
    <h1 class="user-temp">account info</h1>
    <asp:Repeater ID="repAccountInfo" runat="server">
    <ItemTemplate>
        <table class="bot8">
        <tr>    
            <td><b>Primary Account Contact:</b></td>
            <td><asp:Label ID="lblAdmin" Text='<%# Eval("firstname","") + " " + Eval("lastname","") %>' runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td><b>Primary Account Address:</b></td>
            <td><asp:Label ID="lblAddress1" Text='<%# Eval("address1","")%>'  runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label ID="lblAddress2" Text='<%# Eval("address2","")%>'  runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label ID="lblLoc" Text='<%# Eval("city","") + ", " + Eval("state","") + ", " + Eval("country","") %>'  runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td><b>Is Account Active:</b></td>
            <td><asp:Label ID="lblActive" Text='<%# GetActive(Convert.ToBoolean(Eval("isactive",""))) %>'  runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td><b>Renewal Status:</b></td>
            <td><asp:Label ID="lblStatus" Text='<%#GetStatus(Eval("renewaltype",""))  %>' runat="server"></asp:Label></td>
        </tr>
    </table>

    </ItemTemplate>
    </asp:Repeater>
</div>