<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admission_app_form.ascx.cs" Inherits="TABS_UserControls.usercontrols.admission_app_form" %>

<table class="top10 zibra" width="530px" cellpadding="0" cellspacing="0">
    <tr>
        <td><b>School</b></td>
        <td><b>Application Fees</b></td>
    </tr>
    <asp:Repeater ID="repAppFee" runat="server">
    <ItemTemplate>
    <tr>
        <td><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>"><%#Eval("schoolname") %></a>, <%#Eval("state") %>, <%#Eval("country") %></td>
        <td><%#Eval("applicationfee") %></td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
</table>