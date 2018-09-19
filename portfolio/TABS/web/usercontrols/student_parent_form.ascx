<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="student_parent_form.ascx.cs" Inherits="TABS_UserControls.usercontrols.student_parent_form" %>
<div id="asia-fair-registration-form-container">
<table border="0">
    <tr>
        <td class="first"><h1><asp:Label ID="lbCityCountry" runat="server" Text=""></asp:Label></h1></td>
        <td colspan="4"><img src="/resources/images/asia-banner.gif" alt=""/></td>
    </tr>
    <tr>
      <td colspan="5"><asp:Label ID="lbErrMsg" runat="server" ForeColor=Red Font-Size=Large Visible=false Text="We're Sorry! - There has been an error, please try again later."></asp:Label></td>
    </tr>
    <tr>
          <td>&nbsp;
          </td>
          <td colspan="4">
                <asp:Label ID="labLocalInst" runat="server" Text=""></asp:Label>
          </td>
    </tr>
    <tr>
        <td class="first"><b>Student &amp; Family Registration Form</b></td>
        <td colspan="4"><p>Please complete this form, print the confirmation, and bring it with you to the 
        fair. Families with confirmation letters will gain quicker entry into the fair. We advise making 
        at least 20 copies of the confirmation letter to leave with each school representative you visit. 
        Be sure to bring plenty of business cards.</p>
        <p><sup style="color:Red">*</sup>Required</p>
        </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4"><b><sup style="color:Red">*</sup>Fair Information</b></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4">
            <asp:RadioButtonList ID="rlFairInformation" runat="server" 
                    ondatabound="rlFairInformation_DataBound">
            </asp:RadioButtonList>
        </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4"><b>Student Information</b></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4"><b>Student 1</b></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Family Name:</td>
        <td><asp:TextBox ID="tbFamilyName1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="<br />Required" ControlToValidate="tbFamilyName1" Display="Dynamic"></asp:RequiredFieldValidator></td>
        <td class="label2"><sup style="color:Red">*</sup>Age:</td>
        <td><asp:TextBox ID="tbAge1" runat="server" MaxLength="3"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br />Required" ControlToValidate="tbAge1" Display="Dynamic"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="<br />Must be a number" ControlToValidate="tbAge1" 
                ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Given Name:</td>
        <td><asp:TextBox ID="tbGivenName1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="<br />Required" ControlToValidate="tbGivenName1" Display="Dynamic"></asp:RequiredFieldValidator></td>
        <td class="label2"><sup style="color:Red">*</sup>Gender:</td>
        <td>
              <asp:RadioButtonList ID="rlGender1" runat="server" RepeatDirection=Horizontal>
                  <asp:ListItem Text="M" Value="M" ></asp:ListItem>
                  <asp:ListItem Text="F" Value="F" ></asp:ListItem>
              </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="<br />Required" ControlToValidate="rlGender1" Display="Dynamic"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4"><b>Student 2</b></td>
    </tr>
     <tr>
        <td class="first"></td>
        <td>Family Name:</td>
        <td><asp:TextBox ID="tbFamilyName2" runat="server"></asp:TextBox></td>
        <td class="label2">Age:</td>
        <td><asp:TextBox ID="tbAge2" runat="server"></asp:TextBox>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="<br />Must be a number" ControlToValidate="tbAge2" 
                ValidationExpression="^\d+$" Display="Dynamic"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td>Given Name:</td>
        <td><asp:TextBox ID="tbGivenName2" runat="server"></asp:TextBox></td>
        <td class="label2">Gender:</td>
        <td>
              <asp:RadioButtonList ID="rlGender2" runat="server" RepeatDirection=Horizontal>
                  <asp:ListItem Text="M" Value="M" ></asp:ListItem>
                  <asp:ListItem Text="F" Value="F" ></asp:ListItem>
              </asp:RadioButtonList>
       </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4"><b>Student 3</b></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td>Family Name:</td>
        <td><asp:TextBox ID="tbFamilyName3" runat="server"></asp:TextBox></td>
        <td class="label2">Age:</td>
        <td><asp:TextBox ID="tbAge3" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ErrorMessage="<br />Must be a number" ControlToValidate="tbAge3" 
                ValidationExpression="^\d+$"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td>Given Name:</td>
        <td><asp:TextBox ID="tbGivenName3" runat="server"></asp:TextBox></td>
        <td class="label2">Gender:</td>
         <td>
              <asp:RadioButtonList ID="rlGender3" runat="server" RepeatDirection=Horizontal>
                  <asp:ListItem Text="M" Value="M" ></asp:ListItem>
                  <asp:ListItem Text="F" Value="F" ></asp:ListItem>
              </asp:RadioButtonList>
       </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td colspan="4"><b>Parent Information</b></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><b>Title:</b></td>
        <td colspan="3">
            <asp:DropDownList ID="parentDlTitle" runat="server">
                  <asp:ListItem Text="Select" Value="" ></asp:ListItem>
                  <asp:ListItem Text="Mr." Value="Mr." ></asp:ListItem>
                  <asp:ListItem Text="Mrs." Value="Mrs." ></asp:ListItem>
                  <asp:ListItem Text="Ms." Value="Ms." ></asp:ListItem>
                  <asp:ListItem Text="Miss" Value="Miss" ></asp:ListItem>
                  <asp:ListItem Text="Dr." Value="Dr." ></asp:ListItem>
                  <asp:ListItem Text="Br." Value="Br." ></asp:ListItem>
                  <asp:ListItem Text="Fr." Value="Fr." ></asp:ListItem>
                  <asp:ListItem Text="Pastor" Value="Pastor" ></asp:ListItem>
                  <asp:ListItem Text="Rev." Value="Rev." ></asp:ListItem>
                  <asp:ListItem Text="Rev. Dr." Value="Rev. Dr." ></asp:ListItem>
                  <asp:ListItem Text="Sr." Value="Sr." ></asp:ListItem>
                  <asp:ListItem Text="The Rev." Value="The Rev." ></asp:ListItem>
                  <asp:ListItem Text="The Rt. Rev." Value="The Rt. Rev." ></asp:ListItem>
                  <asp:ListItem Text="BG" Value="BG" ></asp:ListItem>
                  <asp:ListItem Text="CPT" Value="CPT" ></asp:ListItem>
                  <asp:ListItem Text="COL" Value="COL" ></asp:ListItem>
                  <asp:ListItem Text="COL(R)" Value="COL(R)" ></asp:ListItem>
                  <asp:ListItem Text="CDR" Value="CDR" ></asp:ListItem>
                  <asp:ListItem Text="LTC" Value="LTC" ></asp:ListItem>
                  <asp:ListItem Text="LTC(R)" Value="LTC(R)" ></asp:ListItem>
                  <asp:ListItem Text="1LT" Value="1LT" ></asp:ListItem>
                  <asp:ListItem Text="MAJ" Value="MAJ" ></asp:ListItem>
                  <asp:ListItem Text="MAJ. GEN." Value="MAJ. GEN." ></asp:ListItem>
                  <asp:ListItem Text="SGC" Value="SGC" ></asp:ListItem>
                  <asp:ListItem Text="SGM" Value="SGM" ></asp:ListItem>
                  <asp:ListItem Text="SGT" Value="SGT" ></asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Family Name:</td>
        <td><asp:TextBox ID="parentTbFamilyName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbFamilyName" Display="Dynamic"></asp:RequiredFieldValidator></td>
        <td class="label2"><sup style="color:Red">*</sup>Given Name:</td>
        <td><asp:TextBox ID="parentTbGivenName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbGivenName" Display="Dynamic"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Address 1:</td>
        <td colspan="3"><asp:TextBox ID="parentTbAddress1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbAddress1" Display="Dynamic"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td>Address 2:</td>
        <td colspan="3"><asp:TextBox ID="parentTbAddress2" runat="server"></asp:TextBox></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>City:</td>
        <td><asp:TextBox ID="parentTbCity" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbCity" Display="Dynamic"></asp:RequiredFieldValidator></td>
      </tr>
      <tr>
        <td class="first"></td>
        <td valign=top><sup style="color:Red">*</sup>Country</td>
        <td><asp:DropDownList ID="parentDlCountry" runat="server" AutoPostBack=true
                         Width=150  onselectedindexchanged="parentDlCountry_SelectedIndexChanged"> </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentDlCountry" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
        <td class="label2">State</td>
        <td>
              <asp:DropDownList ID="parentDlState" runat="server"></asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentDlState" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Postal Code:</td>
        <td colspan="3"><asp:TextBox ID="parentTbZip" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbZip" Display="Dynamic"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Phone:</td>
        <td colspan="3"><asp:TextBox ID="parentTbPhone" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbPhone" Display="Dynamic"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                    ErrorMessage="<br />Valid Phone Number" ControlToValidate="parentTbPhone" 
                    Display="Dynamic" ValidationExpression="^(\(?\+?[0-9]*\)?)?[0-9_\- \(\)]*$"></asp:RegularExpressionValidator>
         </td>
    </tr>
    <tr>
        <td class="first"></td>
        <td><sup style="color:Red">*</sup>Email:</td>
        <td colspan="3"><asp:TextBox ID="parentTbEmail" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="<br />Required" ControlToValidate="parentTbEmail" Display="Dynamic"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ErrorMessage="<br />Please enter a valid email address" 
                    ControlToValidate="parentTbEmail" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td colspan="5" class="align-m">
              <asp:Button ID="btnSubmit" runat="server" Text="Submit Registration" CssClass="btn"
                    onclick="btnSubmit_Click" /></td>
    </tr>
</table>
</div>
