<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="postedit_jobs.ascx.cs" Inherits="TABS_UserControls.usercontrols.postedit_jobs" %>

<%@ Register assembly="obout_Calendar2_Net" namespace="OboutInc.Calendar2" tagprefix="obout" %>

<div class="pad-bread left">
    <div class="left">
        <ul class="breadcrumb addjob-bread">
          <li class="selected"><asp:Label ID="lblPageTitle" Text="Add Job Listing" runat="server"></asp:Label></li>
        </ul>
    </div>
    <a href="/for-schools/post-edit-jobs.aspx" class="right">Cancel and Return to Profile</a>
</div>
<div>
<asp:UpdatePanel ID="upPanel" runat="server">
<ContentTemplate>
    <div class="edit-event">
        <table>
            <tr>
                <td><b><span>*</span>Posting Date</b></td>
                <td><asp:TextBox ID="postDate" runat="server"></asp:TextBox>
                  <obout:Calendar DatePickerMode="true" StyleFolder="/resources/obout/default" DatePickerImagePath="/resources/obout/style10/icon2.gif" DatePickerSynchronize="true" ID="postCal" TextBoxId="postDate" runat="server">
                  </obout:Calendar>
                </td>
            </tr>
            <tr>
                <td><b><span>*</span>Expiration Date:</b></td>
                <td><asp:TextBox ID="expireDate" runat="server"></asp:TextBox>
                  <obout:Calendar DatePickerMode="true" StyleFolder="/resources/obout/default" DatePickerImagePath="/resources/obout/style10/icon2.gif" DatePickerSynchronize="true" ID="expCal" TextBoxId="expireDate" runat="server">
                  </obout:Calendar>
                </td>
            </tr>
            <tr>
                <td>&#160;</td>
                <td><asp:CheckBox ID="chxHideSchool" runat="server" Text="Hide this in job posting" /></td>
            </tr>
            <tr>
                <td><b><span>*</span>Job Title:</b></td>
                <td><asp:TextBox ID="jobtitle" runat="server"></asp:TextBox></td>
           </tr>
           <tr>
                <td><b><span>*</span>Employer:</b></td>
                <td>
                  <asp:DropDownList ID="ddlSchool" runat="server" DataTextField="schoolname" DataValueField="schoolid" Enabled="false"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><b><span>*</span>Contact Person:</b></td>
                <td><asp:TextBox ID="txtPerson" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                  <asp:CheckBox ID="chxHidePerson" runat="server" 
                    Text="Hide this in job posting" />
                </td>
                <tr>
                  <td>
                    <b><span>*</span>Contact Email:</b></td>
                  <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td>
                    &nbsp;</td>
                  <td>
                    <asp:CheckBox ID="chxHideEmail" runat="server" 
                      Text="Hide this in job posting" />
                  </td>
                </tr>
                <tr>
                  <td>
                    <b><span>*</span>Job Type:</b></td>
                  <td>
                    <asp:CheckBoxList ID="chxListJob" runat="server" DataTextField="JobType" 
                      DataValueField="jobtypeid" CSSClass="noBullets">
                    </asp:CheckBoxList>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b><span>*</span>Calendar Year:</b></td>
                  <td>
                    <asp:RadioButtonList CssClass="radioList" ID="rdoCalendar" runat="server" 
                      DataTextField="calendaryeartype" DataValueField="calendaryeartypeid">
                    </asp:RadioButtonList>
                    <br />
                    <asp:TextBox ID="txtCalOther" runat="server" Visible="false"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b><span>*</span>Job Category:</b></td>
                  <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="true" DataTextField="jobcategory" 
                      DataValueField="jobcategoryid">
                       <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b>Estimated Start Date:</b></td>
                  <td>
                    <asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                    <obout:Calendar ID="startCal" runat="server" 
                      DatePickerImagePath="/resources/obout/style10/icon2.gif" DatePickerMode="true" 
                      DatePickerSynchronize="true" StyleFolder="/resources/obout/default" 
                      TextBoxId="txtStartDate">
                    </obout:Calendar>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b>Estimated Salary:</b></td>
                  <td>
                    <asp:DropDownList ID="ddlSalary" AppendDataBoundItems="true" runat="server" DataTextField="jobsalary" 
                      DataValueField="jobsalaryid">
                       <asp:ListItem Text="" Value="1"></asp:ListItem>
                    </asp:DropDownList>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b><span>*</span>Job Description:</b></td>
                  <td colspan="3">
                    <asp:TextBox ID="txtDesc" runat="server" Height="100px" TextMode="MultiLine" 
                      Width="450px"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b>Requirements:</b></td>
                  <td colspan="3">
                    <asp:TextBox ID="txtReq" runat="server" Height="100px" TextMode="MultiLine" 
                      Width="450px"></asp:TextBox>
                  </td>
                </tr>
                <tr>
                  <td>
                    <b>Benefits:</b></td>
                  <td colspan="3">
                    <asp:CheckBoxList ID="chxBenefits" runat="server" DataTextField="Description" 
                      DataValueField="JobBenefitId" CSSClass="noBullets">
                    </asp:CheckBoxList>
                  </td>
                </tr>
            </tr>
            
        </table>
        <table>
            <tr>
                <td><b><span>*</span>Applications Accepted By</b></td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="chxRegular" runat="server" Text="Regular Mail" 
                    AutoPostBack="True" oncheckedchanged="chxRegular_CheckedChanged" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining1" visible="false" runat="server">*</span>Attn:</b></td>
                <td><asp:TextBox ID="txtAttnReg" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining2" visible="false" runat="server">*</span>Address 1:</b></td>
                <td><asp:TextBox ID="txtAdd1" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td><b>Address 2:</b></td>
                <td><asp:TextBox ID="txtAdd2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining3" visible="false" runat="server">*</span>City:</b></td>
                <td><asp:TextBox ID="txtCity" runat="server"></asp:TextBox></td>
            </tr>
             <tr>
                 <td></td>
                <td><b><span id="warining4" visible="false" runat="server">*</span>Country:</b></td>
                <td><asp:DropDownList ID="ddlCountry" DataTextField="country" 
                    DataValueField="countryid" AutoPostBack="true" runat="server" 
                    onselectedindexchanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining5" visible="false" runat="server">*</span>State:</b></td>
                <td><asp:DropDownList ID="ddlState" DataTextField="state" DataValueField="stateid" runat="server"></asp:DropDownList></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining6" visible="false" runat="server">*</span>Zip:</b></td>
                <td><asp:TextBox ID="txtZip" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&#160;</td>
                <td>&#160;</td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="chxFax"  Text="Fax" runat="server" AutoPostBack="True" 
                    oncheckedchanged="chxFax_CheckedChanged" /></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining7" visible="false" runat="server">*</span>Attn:</b></td>
                <td><asp:TextBox ID="txtAttnFax" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining8" visible="false" runat="server">*</span>Fax:</b></td>
                <td><asp:TextBox ID="txtFaxNumber" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&#160;</td>
                <td>&#160;</td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="chxEmail" runat="server" Text="Email" AutoPostBack="True" 
                    oncheckedchanged="chxEmail_CheckedChanged" /></td>
                    <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining9" visible="false" runat="server">*</span>Contact Name:</b></td>
                <td><asp:TextBox ID="txtContactName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining10" visible="false" runat="server">*</span>Email:</b></td>
                <td><asp:TextBox ID="txtEmail2" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&#160;</td>
                <td>&#160;</td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="chxOnline" Text="Online" runat="server" AutoPostBack="True" 
                    oncheckedchanged="chxOnline_CheckedChanged" /></td>
                <td></td>
                    <td></td>
            </tr>
            <tr>
                <td></td>
                <td><b><span id="warining11" visible="false" runat="server">*</span>URL:</b></td>
                <td><asp:TextBox ID="txtUrl" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>&#160;</td>
                <td>&#160;</td>
            </tr>
            <tr>
                <td><b>Specific Instructions:</b></td>
                <td colspan="2"><asp:TextBox ID="txtInstructions"  Width="450px" Height="100px" TextMode="MultiLine" runat="server"></asp:TextBox></td>
            </tr>
        </table>
        

        <div class="edit-submit-box left">
            <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="edit-save" 
              onclick="btnSubmit_Click" />
            <input type="reset" value="Cancel" class="edit-reset" />
        </div>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
</div>