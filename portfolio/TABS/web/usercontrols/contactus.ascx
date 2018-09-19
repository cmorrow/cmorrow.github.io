<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="contactus.ascx.cs" Inherits="TABS_UserControls.usercontrols.contactus" %>
<div class="formBox">
	<div class="top"><div class="left"></div><div class="right"></div></div>
	<div class="middle">
      <table class="contact-us" cellpadding="3">
        <tr>
          <td class="label">*First Name</td>
          <td>
            <asp:TextBox Width="140px" ID="txtFName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv1" runat="server" Text="Required Field" Display="Dynamic" ControlToValidate="txtFName"></asp:RequiredFieldValidator>
          </td>
          <td class="label2">*Last Name</td>
          <td class="inputRight">
            <asp:TextBox ID="txtLName" Width="140px" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv2" runat="server" Text="Required Field" Display="Dynamic" ControlToValidate="txtLName"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td class="label">*Email Address</td>
          <td colspan="3">
            <asp:TextBox Width="140px" ID="txtEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv3" runat="server" Text="Required Field" Display="Dynamic" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rev1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Incorrect Format" ValidationExpression="^[\n &lt;&quot;']*([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+)"></asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td class="label">Institution</td>
          <td colspan="3">
            <asp:TextBox Width="140px" ID="txtSchool" runat="server"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td class="label">Job Title</td>
          <td colspan="3">
            <asp:TextBox ID="txtJob" Width="140px" runat="server"></asp:TextBox>
          </td>
        </tr>
        <tr>
          <td colspan="4"><strong>*Message</strong></td>
        </tr>
        <tr>
          <td colspan="4">
            <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="207px" Width="502px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfv6" runat="server" Text="Required Field" Display="Dynamic" ControlToValidate="txtComment"></asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <asp:Button class="btn" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
          </td>
        </tr>
      </table>
</div>
<!-- end middle -->
<div class="bottom"><div class="left"></div><div class="right"></div></div>
</div>

