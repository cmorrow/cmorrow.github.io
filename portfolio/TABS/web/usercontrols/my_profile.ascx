<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="my_profile.ascx.cs" Inherits="TABS_UserControls.usercontrols.my_profile" %>

<div class="both1812">
    <h1 class="user-temp">my profile</h1>
    <div class="floatclear whatsThis">
        <table width="800" class="auto-m">
            <tr>
                <td><b>Title:</b></td>
                <td><span><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" EnableClientScript="true" Display="dynamic" ControlToValidate="textFirstName" ValidationGroup="groupSave" /></span><b>First Name:</b></td>
                <td><b>Middle Initial:</b></td>
                <td><span><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ErrorMessage="*" EnableClientScript="true" Display="dynamic" ControlToValidate="textLastName" ValidationGroup="groupSave" /></span><b>Last Name:</b></td>
                <td></td>
            </tr>
            <tr>    
                <td>
                    <asp:DropDownList ID="dropPrefix" runat="server" DataTextField="prefix" DataValueField="prefixid" AppendDataBoundItems="true">
                        <asp:ListItem Text="--" Value="0" />
                    </asp:DropDownList>
                </td>
                <td><asp:TextBox ID="textFirstName" runat="server" /></td>
                <td><asp:TextBox ID="textMiddleName" runat="server" /></td>
                <td><asp:TextBox ID="textLastName" runat="server" /></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><span>*</span><b>School:</b></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:DropDownList ID="dropSchool" runat="server" DataTextField="schoolname" DataValueField="schoolid" Enabled="false" />
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><span><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="dynamic" EnableClientScript="true" ControlToValidate="textJobTitle" ValidationGroup="groupSave" /></span><b>Job Title:</b></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><asp:TextBox ID="textJobTitle" runat="server" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><span>*</span><b>Department/Area:</b></td>
                <td></td>
                <td><b>TABS Role:</b></td>
                <td></td>
            </tr>
            <tr>    
                <td colspan="3">
                    <asp:DropDownList ID="dropDepartment" runat="server" 
                      DataValueField="departmentid" DataTextField="department" 
                      AppendDataBoundItems="true" Enabled="False">
                        <asp:ListItem Text="--" Value="0" />
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="dropRole" runat="server" DataValueField="usertypeid" 
                      DataTextField="usertype" AppendDataBoundItems="true" Enabled="False">
                        <asp:ListItem Text="--" Value="0" />
                    </asp:DropDownList>
                </td>
                <td>(<a href="#tooltip2" class="showOverlay">What's This?</a>)</td>
            </tr>
            <tr>
                <td colspan="3"><span>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" EnableClientScript="true" Display="dynamic" ControlToValidate="textEmail" ValidationGroup="groupSave" /></span><b>Email Address:</b></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><asp:TextBox ID="textEmail" runat="server" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><b>A person's username is his/her email address.</b></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td><b>Office Phone</b></td>
                <td></td>
                <td><b>Ext.</b></td>
                <td><b>Fax:</b></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><asp:TextBox ID="textPhone" runat="server" /></td>
                <td><asp:TextBox ID="textExtension" runat="server" /></td>
                <td colspan="2"><asp:TextBox ID="textFax" runat="server" /></td>
            </tr>
            <tr>
                <td><b>Alternate Phone:</b></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><asp:TextBox ID="textAltPhone" runat="server" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><asp:CheckBox ID="checkSubscribe" runat="server" Text="Subscribe to the KeepingTABS eNewsletter." TextAlign="right" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">Optional. Use this section only if you want to change your password.</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><b>Change Password:</b></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><asp:TextBox ID="textPassword" runat="server" TextMode="Password" /><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ControlToCompare="textPasswordConfirm" ControlToValidate="textPassword" EnableClientScript="True" ValidationGroup="groupSave" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><b>Confirm New Password:</b></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3"><asp:TextBox ID="textPasswordConfirm" runat="server" TextMode="Password" /></td>
                <td></td>
                <td></td>
            </tr>
        </table>


        <!-- my subscriptions -->
        <h1 class="user-temp">my subscriptions</h1>
            <div class="floatclear">
                <table cellpadding="0" cellspacing="5" border="0">
                    <tr>
                        <td><b>Forum Name</b></td>
                        <td>&nbsp;</td>
                        <td><b>Post Name</b></td>
                        <td></td>
                    </tr>
                    <asp:Repeater ID="repeatSubscriptions" runat="server">
                       <ItemTemplate>
                        <tr>
                            <td><asp:Literal ID="literalForumName" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td><asp:Literal ID="literalPost" runat="server" /></td>
                            <td><asp:LinkButton ID="buttonRemove" runat="server" Text="remove subscription" OnCommand="removeSubscription" /></td>
                        </tr>
                       </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>


        <div class="edit-submit-box left bot8">
            <asp:Button ID="buttonSave" runat="server" CssClass="edit-save" Text="Save" ValidationGroup="groupSave" />
            <input type="reset" value="Cancel" class="edit-reset" />
        </div>
    	<div id="tooltip2">
    		<p class="closeBtn"><a href="#tooltip2" class="overlay-close">close</a></p>
    		<div class="clear"></div>
    		<h3>About TABS Roles</h3>
    		<p>An <strong>Administrator</strong> can read and edit all school information.</p>
    		<p>A <strong>Profile and Job Editor</strong> can edit the school profile, events, news and job board.</p>
    		<p>A <strong>Job Editor</strong> can edit the job board.</p>
    		<p>A <strong>Staff/User</strong> cannot edit any information, but has access to the library, forums and find-a-colleague.</p>
    	</div>
    </div>
</div>