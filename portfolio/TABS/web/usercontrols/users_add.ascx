<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="users_add.ascx.cs" Inherits="TABS_UserControls.usercontrols.users_add" %>
<div class="pad-bread left">
  <div class="left">
    <ul class="breadcrumb addjob-bread">
      <li class="selected" id="listAddUser" runat="server">add user /</li>
      <li id="listEditUser">
        <asp:Label ID="lbleditUser" runat="server"></asp:Label></li>
    </ul>
    <a href="/for-schools/users.aspx">Cancel and Return to Profile</a>
  </div>
</div>
<div>
  <div class="edit-event whatsThis">
    <table width="650px" cellpadding="0" class="table-auto">
      <tr>
        <td>
          <b>Title:</b><br />
          <asp:DropDownList ID="ddlTitle" DataTextField="prefix" DataValueField="prefixid"
            runat="server" AppendDataBoundItems="true">
            <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
          </asp:DropDownList>
        </td>
        <td>
          <b><span>*</span>First Name:</b><br />
          <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv1" runat="server" Display="Dynamic" ControlToValidate="txtFName" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
        </td>
        <td>
          <b>Middle Initial:</b><br />
          <asp:TextBox ID="txtMI" runat="server"></asp:TextBox>
        </td>
        <td>
          <b><span>*</span>Last Name:</b><br />
          <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv2" runat="server" Display="Dynamic" ControlToValidate="txtLName" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <b>School</b><br />
          <asp:DropDownList ID="ddlSchools" DataTextField="schoolname" DataValueField="schoolid" Enabled="false" runat="server">
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <b><span>*</span>Official Job Title:</b>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <asp:TextBox ID="txtJobTitle" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv3" runat="server" Display="Dynamic" ControlToValidate="txtJobTitle" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <b>Primary Position:</b>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <asp:DropDownList ID="ddlPrimaryPosition" DataTextField="position" AppendDataBoundItems="true"
            DataValueField="positionid" runat="server">
            <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <b><span>*</span>Primary Department/Area:</b>
        </td>
      </tr>
      <tr>
        <td colspan="4">
          <asp:DropDownList ID="ddlPrimaryDept" DataTextField="department" DataValueField="departmentid"
            AppendDataBoundItems="true" runat="server">
            <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfv4" runat="server" Display="Dynamic" InitialValue="Please Select" ControlToValidate="ddlPrimaryDept" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
        </td>
      </tr>
    </table>
    <table width="650px" class="table-auto top10">
      <tr>
        <td colspan="3">
          <p class="sm-h">
            Other Positions:</p>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <asp:CheckBoxList ID="chxOtherPosition" runat="server" DataTextField="position" DataValueField="positionid"
            RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
          </asp:CheckBoxList>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <p class="sm-h">
            Other Departments/Areas:</p>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <asp:CheckBoxList ID="chxOtherDept" runat="server" DataTextField="department" DataValueField="departmentid"
            RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
          </asp:CheckBoxList>
        </td>
      </tr>
      <tr>
        <td>
          <b><span>*</span>Email Address:</b>
        </td>
        <td>
          <b><span>*</span>Role on TABS website:</b>
        </td>
        <td>
          (<a href="#tooltip" class="showOverlay">What's This?</a>)
        </td>
      </tr>
      <tr>
        <td>
          <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv5" runat="server" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
        </td>
        <td>
          <asp:DropDownList ID="ddlRole" AppendDataBoundItems="true" DataTextField="usertype"
            DataValueField="usertypeid" runat="server">
            <asp:ListItem Text="Please Select" Value="Please Select"></asp:ListItem>
          </asp:DropDownList>
          <asp:RequiredFieldValidator ID="rfv6" runat="server" Display="Dynamic" InitialValue="Please Select" ControlToValidate="ddlRole" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <p class="sm-h">
            A person's username is his/her email address.</p>
        </td>
      </tr>
      <tr>
        <td>
          <b>Office Phone</b><br />
          <asp:TextBox ID="txtOPhone" runat="server"></asp:TextBox>
        </td>
        <td>
          <b>Ext.</b><br />
          <asp:TextBox ID="txtOExt" runat="server"></asp:TextBox>
        </td>
        <td>
          <b>Fax:</b><br />
          <asp:TextBox ID="txtFax" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <b>Alternate Phone:</b><br />
          <asp:TextBox ID="txtAltPhone" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <asp:CheckBox ID="chxSubscribe" runat="server" Text="Subscribe to the KeepingTABS eNewsletter"
            Checked="true" />
        </td>
      </tr>
      <tr>
        <td colspan="3">
          <b><span>*</span>Initial Password:</b>
        </td>
      </tr>
      <tr>
      <td colspan="3">
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv7" runat="server" Display="Dynamic" ControlToValidate="txtPassword" ErrorMessage="<br />* Required"></asp:RequiredFieldValidator>
      </td>
      </tr>
      <tr>
        <td colspan="3">
          <b>Confirm Password:</b>
        </td>
      </tr>
      <tr><td colspan="3">
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
          &nbsp;
          <asp:CompareValidator ID="compareVal1" runat="server" Display="Dynamic" ControlToCompare="txtPassword"
            ControlToValidate="txtConfirmPassword" ErrorMessage="<br/>Passwords do not match"></asp:CompareValidator>
      </td></tr>
    </table>
    <div class="edit-submit-box left">
      <asp:Button ID="submitBtn" runat="server" CssClass="edit-save" Text="Save" 
        onclick="submitBtn_Click" />
      <input type="reset" value="Cancel" class="edit-reset" />
    </div>
    <div id="tooltip">
		<p class="closeBtn"><a href="#tooltip" class="overlay-close">close</a></p>
		<div class="clear"></div>
		<h3>About TABS Roles</h3>
		<p>An <strong>Administrator</strong> can read and edit all school information.</p>
		<p>A <strong>Profile and Job Editor</strong> can edit the school profile, events, news and job board.</p>
		<p>A <strong>Job Editor</strong> can edit the job board.</p>
		<p>A <strong>Staff/User</strong> cannot edit any information, but has access to the library, forums and find-a-colleague.</p>
	</div>
  </div>
</div>
