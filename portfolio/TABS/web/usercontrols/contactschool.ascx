<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="contactschool.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.contactschool" %>
<asp:UpdatePanel ID="contactPanel" runat="server">
  <ContentTemplate>
    <div>
      <h4>
        Select up to five schools</h4>
      <table class="table-form">
        <tr>
          <td>
            Schools 1:
          </td>
          <td>
            <asp:DropDownList ID="dropSchool1" runat="server" AppendDataBoundItems="true" DataTextField="schoolname"
              DataValueField="schoolid">
              <asp:ListItem Text="" Value="0" />
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>
            Schools 2:
          </td>
          <td>
            <asp:DropDownList ID="dropSchool2" runat="server" AppendDataBoundItems="true" DataTextField="schoolname"
              DataValueField="schoolid">
              <asp:ListItem Text="" Value="0" />
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>
            Schools 3:
          </td>
          <td>
            <asp:DropDownList ID="dropSchool3" runat="server" AppendDataBoundItems="true" DataTextField="schoolname"
              DataValueField="schoolid">
              <asp:ListItem Text="" Value="0" />
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>
            Schools 4:
          </td>
          <td>
            <asp:DropDownList ID="dropSchool4" runat="server" AppendDataBoundItems="true" DataTextField="schoolname"
              DataValueField="schoolid">
              <asp:ListItem Text="" Value="0" />
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>
            Schools 5:
          </td>
          <td>
            <asp:DropDownList ID="dropSchool5" runat="server" AppendDataBoundItems="true" DataTextField="schoolname"
              DataValueField="schoolid">
              <asp:ListItem Text="" Value="0" />
            </asp:DropDownList>
          </td>
        </tr>
      </table>
      <h4>
        Which best describes you</h4>
      <asp:RadioButtonList ID="rdoUserType" runat="server" RepeatColumns="2" RepeatLayout="Table"
        RepeatDirection="Horizontal" OnSelectedIndexChanged="rdoUserType_SelectedIndexChanged"
        AutoPostBack="True" CSSClass="noBullets">
        <asp:ListItem Value="under13" Text="I'm a student under the age of 13"></asp:ListItem>
        <asp:ListItem Value="over13" Text="I'm a student and I'm 13 or older"></asp:ListItem>
        <asp:ListItem Value="mother" Text="I'm the mother/guardian of a student"></asp:ListItem>
        <asp:ListItem Value="father" Text="I'm the father/guardian of a student"></asp:ListItem>
        <asp:ListItem Value="staff" Text="I'm a school staff member"></asp:ListItem>
        <asp:ListItem Value="consultant" Text="I'm an educational consultant"></asp:ListItem>
        <asp:ListItem Value="none" Text="None of these describe me"></asp:ListItem>
      </asp:RadioButtonList>
      <h4>
        &nbsp;</h4>
      <asp:MultiView ID="contactView" runat="server" ActiveViewIndex="0">
        <asp:View ID="studentView" runat="server">
		<div class="formBox">
			<div class="top"><div class="left"></div><div class="right"></div></div>
			<div class="middle">
          <table class="table-form">
            <tr runat="server" id="parentInfo1">
              <td>
                <span>*</span>Parent/Guardian First Name:
              </td>
              <td>
                <span>*</span>Parent/Guardian Last Name:
              </td>
            </tr>
            <tr runat="server" id="parentInfo2">
              <td>
                <asp:TextBox ID="txtPFName1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtPLName1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr runat="server" id="parentInfo3">
              <td>
                <span>*</span>Parent/Guardian Email Address:
              </td>
              <td>
              </td>
            </tr>
            <tr runat="server" id="parentInfo4">
              <td>
                <asp:TextBox ID="txtPEmail1" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Your First Name:
              </td>
              <td>
                <span>*</span>Your Last Name:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtSFName1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtSLName1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Email Address:
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtSEmail1" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Street Address 1:
              </td>
              <td>
                Street Address 2:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtSAdd1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtSAdd2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>City:
              </td>
              <td>
                <span>*</span>Country:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtSCity1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:DropDownList ID="ddlStudentCountry1" runat="server" DataTextField="country"
                  DataValueField="countryid" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlStudentCountry1_SelectedIndexChanged"
                  AutoPostBack="True">
                  <asp:ListItem Text="--" Value="0" />
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td>
               <span>*</span>Zip Code:
              </td>
              <td>
                <span>*</span>State/Province:
              </td>
            </tr>
            <tr>
              <td>
              <asp:TextBox ID="txtSZip1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:DropDownList ID="ddlStudentState1" Enabled="false" runat="server" DataTextField="state" DataValueField="stateid"
                  AppendDataBoundItems="false">
                  <asp:ListItem Text="--" Value="0" />
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td>
                Phone:
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtSPhone1" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>I am:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:RadioButtonList ID="rdoGender1" RepeatDirection="Horizontal" runat="server">
                  <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                  <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:RadioButtonList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>Citizenship:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtSCitizen1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>I am interested in applying for:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:RadioButtonList ID="rdoApply1" runat="server" RepeatDirection="Horizontal">
                  <asp:ListItem Text="Boarding" Value="Boarding"></asp:ListItem>
                  <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                </asp:RadioButtonList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>I am currently in grade:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtSGrade1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                I am applying for grade:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtSApplyingFor" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                I'd like to start in:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:DropDownList ID="ddlStudentStart" runat="server"></asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                My current school is
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtCurrentSchool1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                Top 3 Academic Interests:
              </td>
              <td>
                <asp:TextBox ID="txtSAcademic1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSAcademic2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSAcademic3" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                Top 3 Extracurricular Interests
              </td>
              <td>
                <asp:TextBox ID="txtSExtra1" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSExtra2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSExtra3" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                Other Interests:
              </td>
              <td>
                <asp:CheckBox ID="chxSummer1" runat="server" Text="Summer Programs" />
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:CheckBox ID="chxESL1" runat="server" Text="ESL" />
              </td>
            </tr>
            <tr>
              <td>
                Additional Information:
              </td>
              <td>
                <asp:TextBox ID="txtAddInfo" TextMode="MultiLine" Width="350px" runat="server" Height="150px"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Button ID="btnSaveStudent" runat="server" Text="Submit" CssClass="edit-save"
                  OnClick="btnSaveStudent_Click" />
                <input type="reset" value="Cancel" class="edit-reset" />
              </td>
            </tr>
          </table>
	</div>
	<!-- end middle -->
	<div class="bottom"><div class="left"></div><div class="right"></div></div>
	</div>
	<!-- end formBox -->
        </asp:View>
        <asp:View ID="staffView" runat="server">
		<div class="formBox">
			<div class="top"><div class="left"></div><div class="right"></div></div>
			<div class="middle">
          <table class="table-form">
            <tr>
              <td>
                <span>*</span>First Name:
              </td>
              <td>
                <span>*</span>Last Name:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtStaffFName" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtStaffLName" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Email Address:
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtStaffEmail" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Street Address 1:
              </td>
              <td>
                Street Address 2:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtStaffAdd1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtStaffAdd2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>City:
              </td>
              <td>
                <span>*</span>Country:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtStaffCity" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:DropDownList ID="ddlStaffCountry" runat="server" DataTextField="country" DataValueField="countryid"
                  AppendDataBoundItems="true" OnSelectedIndexChanged="ddlStaffCountry_SelectedIndexChanged"
                  AutoPostBack="True">
                  <asp:ListItem Text="--" Value="0" />
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td>
              <span>*</span>Zip Code:
              </td>
              <td>
                <span>*</span>State/Province:
              </td>
            </tr>
            <tr>
              <td>
              <asp:TextBox ID="txtStaffZip" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:DropDownList ID="ddlStaffState" Enabled="false" runat="server" DataTextField="state" DataValueField="stateid"
                  AppendDataBoundItems="false">
                  <asp:ListItem Text="--" Value="0" />
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td>
                Phone:
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtStaffPhone" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                Additional Information:
              </td>
              <td>
                <asp:TextBox ID="txtStaffInfo" TextMode="MultiLine" Width="350px" runat="server"
                  Height="150px"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Button ID="btnSaveStaff" runat="server" Text="Submit" CssClass="edit-save" OnClick="btnSaveStaff_Click" />
                <input type="reset" value="Cancel" class="edit-reset" />
              </td>
            </tr>
          </table>
	</div>
	<!-- end middle -->
	<div class="bottom"><div class="left"></div><div class="right"></div></div>
	</div>
        </asp:View>
        <asp:View ID="parentView" runat="server">
		<div class="formBox">
			<div class="top"><div class="left"></div><div class="right"></div></div>
			<div class="middle">
          <table class="table-form">
            <tr>
              <td>
                <span>*</span>Your First Name:
              </td>
              <td>
                <span>*</span>Your Last Name:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtParentFName" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtParentLName" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Email Address:
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtParentEmail" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Street Address 1:
              </td>
              <td>
                Street Address 2:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtParentAdd1" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtParentAdd2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>City:
              </td>
              <td>
                <span>*</span>Country:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtParentCity" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:DropDownList ID="ddlParentCountry" runat="server" DataTextField="country" DataValueField="countryid"
                  AppendDataBoundItems="true" OnSelectedIndexChanged="ddlParentCountry_SelectedIndexChanged"
                  AutoPostBack="True">
                  <asp:ListItem Text="--" Value="0" />
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td>
              <span>*</span>Zip Code:
              </td>
              <td>
                <span>*</span>State/Province:
              </td>
            </tr>
            <tr>
              <td>
              <asp:TextBox ID="txtParentZip" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:DropDownList ID="ddlParentState" Enabled="false" runat="server" DataTextField="state" DataValueField="stateid"
                  AppendDataBoundItems="false">
                  <asp:ListItem Text="--" Value="0" />
                </asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td>
                Phone:
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtParentPhone" runat="server"></asp:TextBox>
              </td>
              <td>
              </td>
            </tr>
            <tr>
              <td>
                <span>*</span>Student First Name:
              </td>
              <td>
                <span>*</span>Student Last Name:
              </td>
            </tr>
            <tr>
              <td>
                <asp:TextBox ID="txtParentSFName" runat="server"></asp:TextBox>
              </td>
              <td>
                <asp:TextBox ID="txtParentSLName" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>Student Gender:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:RadioButtonList ID="rdoGender2" RepeatDirection="Horizontal" runat="server">
                  <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                  <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:RadioButtonList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>Student Citizenship:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtSCitizen2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>Student interested in applying for:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:RadioButtonList ID="rdoApply2" runat="server" RepeatDirection="Horizontal">
                  <asp:ListItem Text="Boarding" Value="Boarding"></asp:ListItem>
                  <asp:ListItem Text="Day" Value="Day"></asp:ListItem>
                </asp:RadioButtonList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <span>*</span>Student's current grade:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtSGrade2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                Student's applying for grade:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtApplyingGrade2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                Student start date:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:DropDownList ID="ddlPStart" runat="server"></asp:DropDownList>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                Student's current school:
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:TextBox ID="txtSchool2" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                Top 3 Academic Interests:
              </td>
              <td>
                <asp:TextBox ID="txtSAcademic4" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSAcademic5" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSAcademic6" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                Top 3 Extracurricular Interests
              </td>
              <td>
                <asp:TextBox ID="txtSExtra4" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSExtra5" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:TextBox ID="txtSExtra6" runat="server"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td>
                Other Interests:
              </td>
              <td>
                <asp:CheckBox ID="chxSummer2" runat="server" Text="Summer Programs" />
              </td>
            </tr>
            <tr>
              <td>
              </td>
              <td>
                <asp:CheckBox ID="chxESL2" runat="server" Text="ESL" />
              </td>
            </tr>
            <tr>
              <td>
                Additional Information:
              </td>
              <td>
                <asp:TextBox ID="txtAddInfo2" TextMode="MultiLine" Width="350px" runat="server" Height="150px"></asp:TextBox>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <asp:Button ID="btnSaveParent" runat="server" Text="Submit" CssClass="edit-save"
                  OnClick="btnSaveParent_Click" />
                <input type="reset" value="Cancel" class="edit-reset" />
              </td>
            </tr>
          </table>
	</div>
	<!-- end middle -->
	<div class="bottom"><div class="left"></div><div class="right"></div></div>
	</div>
	<!-- end formBox -->
        </asp:View>
      </asp:MultiView>
    </div>
  </ContentTemplate>
</asp:UpdatePanel>
