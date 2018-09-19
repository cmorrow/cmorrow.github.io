<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="become_member.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.become_member" %>
<p>
  
<div class="formBox">
	<div class="top"><div class="left"></div><div class="right"></div></div>
	<div class="middle">
		<span class="ast">*</span> = required fields</p>
<table width="540px" cellpadding="2" class="just-table">
  <tr>
    <td colspan="3">
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="textSchool" Display="Dynamic" />School/Organization:<br />
      <asp:TextBox ID="textSchool" runat="server" />
    </td>
  </tr>
  <tr>
    <td colspan="3">
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="textCity" Display="Dynamic" />City:<br />
      <asp:TextBox ID="textCity" runat="server" />
    </td>
  </tr>
  <tr>
    <td colspan="3">
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="dropCountry" Display="Dynamic" InitialValue="0" />Country:<br />
      <asp:DropDownList ID="dropCountry" runat="server" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="country"
        DataValueField="countryid" OnSelectedIndexChanged="dropCountry_SelectedIndexChanged">
        <asp:ListItem Text="--" Value="0" />
      </asp:DropDownList>
    </td>
  </tr>
  <tr>
    <td colspan="3">
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="dropState" Display="Dynamic" InitialValue="0" />State/Province:<br />
      <asp:DropDownList ID="dropState" runat="server" AppendDataBoundItems="false" DataTextField="state"
        DataValueField="stateid" Enabled="False">
        <asp:ListItem Text="--" Value="0" />
      </asp:DropDownList>
    </td>
  </tr>
  <tr>
    <td>
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="textContact" Display="Dynamic" />Contact
      Person:<br />
      <asp:TextBox ID="textContact" runat="server" />
    </td>
    <td>
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="textPhone" Display="Dynamic" />Office
      Phone:<br />
      <asp:TextBox ID="textPhone" runat="server" />
    </td>
    <td>
   Ext.:<br />
      <asp:TextBox ID="textExt" runat="server" />
    </td>
  </tr>
  <tr>
    <td>
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="textTitle" Display="Dynamic" />Title:<br />
      <asp:TextBox ID="textTitle" runat="server" />
    </td>
    <td>
     <span>*</span>
      <asp:RegularExpressionValidator Font-Names="Arial" Font-Size="9pt" Display="Dynamic" ID="RegExValidator1" runat="server"
        ErrorMessage="Please Enter a Valid Email address" ControlToValidate="textEmail"
        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"> 
      </asp:RegularExpressionValidator><asp:RequiredFieldValidator ID="RequiredFieldValidator7"
        runat="server" ErrorMessage="" EnableClientScript="true" ControlToValidate="textEmail"
        Display="Dynamic" />Email:<br />
      <asp:TextBox ID="textEmail" runat="server" />
    </td>
    <td>
    </td>
  </tr>
  <tr>
    <td colspan="3">
     <span>*</span>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage=""
        EnableClientScript="true" ControlToValidate="dropInquiryTypes" Display="Dynamic"
        InitialValue="0" />Inquiring for:<br />
      <asp:DropDownList ID="dropInquiryTypes" runat="server" AppendDataBoundItems="true"
        DataTextField="inquirytype" DataValueField="inquirytypeid">
        <asp:ListItem Text="--" Value="0" />
      </asp:DropDownList>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      If in the US, is your school an independent, non-profit, tax exempt, 501©(3) organization?
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <asp:RadioButtonList ID="radioNonProfit" runat="server">
        <asp:ListItem Text="Yes" Value="1" />
        <asp:ListItem Text="No" Value="2" />
        <asp:ListItem Text="N/A" Value="0" />
      </asp:RadioButtonList>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      By mission and by practice, is your school a college-preparatory organization?
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <asp:RadioButtonList ID="radioPrep" runat="server">
        <asp:ListItem Text="Yes" Value="1" />
        <asp:ListItem Text="No" Value="2" />
        <asp:ListItem Text="N/A" Value="0" />
      </asp:RadioButtonList>
    </td>
  </tr>
  <tr>
    <td colspan="3">
      Comments (max 300 characters)
    </td>
  </tr>
  <tr>
    <td colspan="3">
      <asp:TextBox ID="textComment" Width="300" Height="150" runat="server" TextMode="multiLine"
        MaxLength="300" />
    </td>
  </tr>
</table>
<asp:Button ID="buttonSave" runat="server" Text="Submit" CssClass="edit-save" />
<input type="reset" value="Reset" class="edit-reset" />
</div>
<!-- end middle -->
<div class="bottom"><div class="left"></div><div class="right"></div></div>
</div>