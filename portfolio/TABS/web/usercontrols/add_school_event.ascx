<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="add_school_event.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.add_school_event" %>
<%@ Register Assembly="obout_Calendar2_Net" Namespace="OboutInc.Calendar2" TagPrefix="obout" %>
<div class="pad-bread left">
  <div class="left">
    <ul class="breadcrumb addjob-bread">
      <li>add event /</li>
      <li class="selected">&lt;event name&gt;</li>
    </ul>
  </div>
  <a href="/for-schools/edit-school-profile.aspx" class="right">Cancel and Return to
    Profile</a>
</div>
<div>
  <div class="edit-event">
    <table width="810px" class="event-news">
      <tr>
        <td width="190">
          <h5>
            Event Name:</h5>
          <span>*</span>
        </td>
        <td width="220">
          <asp:TextBox ID="txtEventName" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtEventName" ErrorMessage="" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td width="180">
          <h5>
            Type:</h5>
          <span>*</span>
        </td>
        <td width="220">
          <asp:DropDownList ID="ddlEventType" runat="server">
            <asp:ListItem Text="--select--" Value="0"></asp:ListItem>
            <asp:ListItem Text="Feature Event" Value="1"></asp:ListItem>
            <asp:ListItem Text="Open House" Value="2"></asp:ListItem>
            <asp:ListItem Text="School Fair" Value="3"></asp:ListItem>
            <asp:ListItem Text="Admission Deadline" Value="4"></asp:ListItem>
            <asp:ListItem Text="Financial Aid/Scholarship Deadline" Value="5"></asp:ListItem>
            <asp:ListItem Text="Test Date" Value="6"></asp:ListItem>
            <asp:ListItem Text="Summer Program" Value="7"></asp:ListItem>
            <asp:ListItem Text="Other" Value="8"></asp:ListItem>
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            Start Date and Time:</h5>
          <span>*</span>
        </td>
        <td>
          <asp:TextBox ID="txtStart" runat="server"></asp:TextBox>&nbsp;
          <obout:Calendar DatePickerMode="true" TimeSelectorType="DropDownList" StyleFolder="/resources/obout/default" DatePickerImagePath="/resources/obout/style10/icon2.gif" DatePickerSynchronize="true" ID="startCal" TextBoxId="txtStart" runat="server">
          </obout:Calendar>
          <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtStart" ErrorMessage="" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td>
          <h5>
            End Date and Time:</h5>
        </td>
        <td>
          <asp:TextBox ID="txtEnd" runat="server"></asp:TextBox>
          <obout:Calendar DatePickerMode="true" TimeSelectorType="DropDownList" StyleFolder="/resources/obout/default" DatePickerImagePath="/resources/obout/style10/icon2.gif" DatePickerSynchronize="true" ID="endCal" TextBoxId="txtEnd" runat="server">
          </obout:Calendar>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            Location Name:</h5>
          <span>*</span>
        </td>
        <td>
          <asp:TextBox ID="txtLoc" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtLoc" ErrorMessage="" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            Address 1:
          </h5>
        </td>
        <td>
          <asp:TextBox ID="txtAdd1" runat="server"></asp:TextBox>
        </td>
        <td>
          <h5>
            Address 2:</h5>
        </td>
        <td>
          <asp:TextBox ID="txtAdd2" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            City:</h5>
        </td>
        <td>
          <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </td>
        <td>
        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            Country :</h5>
        </td>
        <td>
          <asp:DropDownList ID="ddlCountry" AutoPostBack="true" runat="server" DataTextField="country"
            DataValueField="countryid" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
          </asp:DropDownList>
        </td>
        <td>
          <h5>
            State/Province</h5>
        </td>
        <td>
          <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="true" DataTextField="state"
            DataValueField="stateid">
            <asp:ListItem Text="--" Value="0" />
          </asp:DropDownList>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            Contact Person:</h5>
        </td>
        <td>
          <asp:TextBox ID="txtPerson" runat="server"></asp:TextBox>
        </td>
        <td>
          <h5>
            Phone:</h5>
        </td>
        <td>
          <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
          <h5>
            URL:</h5>
        </td>
        <td colspan="3">
          <asp:TextBox ID="txtUrl" runat="server"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr>
              <td>
                <h5>
                  Short Description:</h5>
                <span>*</span>
              </td>
            </tr>
            <tr>
              <td>
                <p>
                  Enter a description that is<br />
                  300 characters max</p>
              </td>
            </tr>
          </table>
        </td>
        <td colspan="3">
          <asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Width="500px" Height="150px"
            MaxLength="300"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtSummary" ErrorMessage="" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td>
          <table>
            <tr>
              <td>
                <h5>
                  Long Description:</h5>
              </td>
            </tr>
            <tr>
              <td>
                <p>
                  Enter a description that is 2000 characters or fewer.</p>
              </td>
            </tr>
          </table>
        </td>
        <td colspan="3">
          <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Width="500px" Height="150px"
            MaxLength="2000"></asp:TextBox>
        </td>
      </tr>
    </table>
    <div class="edit-submit-box left">
      <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="edit-save" OnClick="btnSave_Click" />
      <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="edit-reset" OnClick="btnCancel_Click" />
    </div>
  </div>
</div>
