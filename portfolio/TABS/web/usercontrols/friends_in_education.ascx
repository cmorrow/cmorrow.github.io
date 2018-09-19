<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="friends_in_education.ascx.cs" Inherits="TABS_UserControls.usercontrols.friends_in_education" %>
<div class="floatclear">
    <div>
        <h3 id="boarding-school-networks">Boarding School Networks </h3>
        <p>Browse various boarding school associations throughout the United States, Canada, and abroad.</p>
    </div>                      
    <div>
    <table border="0" cellpadding="0" cellspacing="0" class="friendsInEdu">
    <asp:Repeater ID="boardingRep" runat="server">
    <ItemTemplate>
    <tr>
    <td valign="top">
    <asp:Image ID="logoboarding" Width="100px" ImageUrl='<%# "~/resources/images/friendsineducation/" + DataBinder.Eval(Container.DataItem, "image") %>' runat="server" />
    </td>
    <td class="rightTD">
    <a name='<%# DataBinder.Eval(Container.DataItem, "abbreviation") %>'></a>
    <asp:Label ID="titleboarding" CSSClass="bold" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' runat="server"></asp:Label><br />
    <asp:HyperLink ID="urlboarding" Target="_blank" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "url") %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "url") %>'></asp:HyperLink><br />
    <asp:Label ID="descboarding" Text='<%# DataBinder.Eval(Container.DataItem, "description") %>' runat="server"></asp:Label>
    </td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    </table>
    </div>
    
    <div>
        <h3 id="educational-partners">Partner Organizations</h3>
        <p>A short list of professional organizations engaged in the support and advancement of the boarding school community.</p>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" class="friendsInEdu">
    <asp:Repeater ID="educationalRep" runat="server">
    <ItemTemplate>
    <tr>
    <td valign="top">
    <asp:Image ID="logoboarding" Width="100px" ImageUrl='<%# "~/resources/images/friendsineducation/" + DataBinder.Eval(Container.DataItem, "image") %>' runat="server" />
    </td>
    <td class="rightTD">
        <a name='<%# DataBinder.Eval(Container.DataItem, "abbreviation") %>'></a>
    <asp:Label ID="titleboarding" CSSClass="bold" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' runat="server"></asp:Label><br />
    <asp:HyperLink ID="urlboarding" Target="_blank" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "url") %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "url") %>'></asp:HyperLink><br />
    <asp:Label ID="descboarding" Text='<%# DataBinder.Eval(Container.DataItem, "description") %>' runat="server"></asp:Label>
    </td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    </table>

    <div>
        <h3 id="sister-associations">Sister Associations</h3>
        <p>A collection of leading national and international advocates of boarding education.</p>
    </div>
        <table border="0" cellpadding="0" cellspacing="0" class="friendsInEdu">
    <asp:Repeater ID="sisterRep" runat="server">
    <ItemTemplate>
    <tr>
    <td valign="top">
    <asp:Image ID="logoboarding" Width="100px" ImageUrl='<%# "~/resources/images/friendsineducation/" + DataBinder.Eval(Container.DataItem, "image") %>' runat="server" />
    </td>
    <td class="rightTD">
        <a name='<%# DataBinder.Eval(Container.DataItem, "abbreviation") %>'></a>
    <asp:Label ID="titleboarding" CSSClass="bold" Text='<%# DataBinder.Eval(Container.DataItem, "name") %>' runat="server"></asp:Label><br />
    <asp:HyperLink ID="urlboarding" Target="_blank" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "url") %>' NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "url") %>'></asp:HyperLink><br />
    <asp:Label ID="descboarding" Text='<%# DataBinder.Eval(Container.DataItem, "description") %>' runat="server"></asp:Label>
    </td>
    </tr>
    </ItemTemplate>
    </asp:Repeater>
    </table>
</div>