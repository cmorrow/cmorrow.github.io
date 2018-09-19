<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="freedirectory.ascx.cs"
    Inherits="TABS_UserControls.usercontrols.freedirectory" %>
<asp:UpdatePanel ID="upFreeDirectory" runat="server">
    <ContentTemplate>
        <table width="540px" class="top10">
            <tr>
                <td>
                    <strong>Which best describes you</strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="504px">
                        <tr>
                            <td>
                                <asp:RadioButton runat="server" Text="I'm a student under the age of 13" ID="rbUnder13"
                                    GroupName="grpDescribes" OnCheckedChanged="rbDescribes_CheckedChanged" AutoPostBack="true" />
                            </td>
                            <td>
                                <asp:RadioButton runat="server" Text="I'm an educational consultant" ID="rbConsultant"
                                    GroupName="grpDescribes" OnCheckedChanged="rbDescribes_CheckedChanged" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton runat="server" Text="I'm a student and I'm 13 or older" ID="rbOver13"
                                    GroupName="grpDescribes" OnCheckedChanged="rbDescribes_CheckedChanged" AutoPostBack="true" />
                            </td>
                            <td>
                                <asp:RadioButton runat="server" Text="I'm a business employee" ID="rbBusiness" GroupName="grpDescribes"
                                    OnCheckedChanged="rbDescribes_CheckedChanged" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton runat="server" Text="I'm the parent or guardian of a student" ID="rbParent"
                                    GroupName="grpDescribes" OnCheckedChanged="rbDescribes_CheckedChanged" AutoPostBack="true" />
                            </td>
                            <td>
                                <asp:RadioButton runat="server" Text="None of these describe me" ID="rbNone" GroupName="grpDescribes"
                                    OnCheckedChanged="rbDescribes_CheckedChanged" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton runat="server" Text="I'm a school, library or non-profit staff member"
                                    ID="rbStaff" GroupName="grpDescribes" OnCheckedChanged="rbDescribes_CheckedChanged"
                                    AutoPostBack="true" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <asp:Panel runat="server" ID="pnlMain" Visible="false">
        
            <asp:Panel runat="server" ID="pnlParentInfo" Visible="false">
                <table class="table-form" width="504px">
                    <tr>
                        <td colspan="2" class="header">
                            Parent/Guardian Information
                        </td>
                    </tr>
                    <tr>
                        <td>Parent/Guardian First Name:</td>
                        <td>Parent/Guardian Last Name:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="tbParentFirstName" MaxLength="128" /><asp:RequiredFieldValidator
                                runat="server" ID="rfvParentFirstName" ControlToValidate="tbParentFirstName"
                                Display="Dynamic" ErrorMessage="*" />
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tbParentLastName" MaxLength="128" /><asp:RequiredFieldValidator
                                runat="server" ID="rfvParentLastName" ControlToValidate="tbParentLastName" Display="Dynamic"
                                ErrorMessage="*" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            Parent/Guardian E-Mail Address:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:TextBox runat="server" ID="tbParentEmail" MaxLength="254" /><asp:RequiredFieldValidator
                                runat="server" ID="rfvParentEmail" ControlToValidate="tbParentEmail" Display="Dynamic"
                                ErrorMessage="*" />
                            <asp:RegularExpressionValidator ID="revParentEmail" runat="server" ErrorMessage="*"
                                ControlToValidate="tbParentEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            
            <asp:Panel runat="server" ID="pnlTabsSchool">
                
                <table class="table-form" width="504px">
                    <tr>
                        <td class="header">Contact Information</td>
                    </tr>
                    <tr>
                        <td>Is your school a TABS member? <asp:RadioButtonList runat="server" 
                                ID="rblTabsMember" onselectedindexchanged="rblTabsMember_SelectedIndexChanged" AutoPostBack="true" 
                                RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" />
                            <asp:ListItem Text="No" />
                        </asp:RadioButtonList><asp:RequiredFieldValidator ID="rfvTabsMember" runat="server" ErrorMessage="*" ControlToValidate="rblTabsMember" Display="Dynamic"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <asp:Panel runat="server" ID="pnlTabsYes" Visible="false">
                            <td>School/Organization: <asp:DropDownList runat="server" ID="ddlTabsSchools" DataTextField="schoolname" DataValueField="schoolid" /></td>
                        </asp:Panel>
                        
                        <asp:Panel runat="server" ID="pnlTabsNo" Visible="false">
                            <td>School/Library/Non-Profit: <asp:TextBox runat="server" ID="tbSchool" /></td>
                        </asp:Panel>
                    </tr>
                </table>
                
            </asp:Panel>
            
            <table class="table-form" width="504px">
                <tr>
                    <td colspan="2" class="header">
                        <asp:Literal runat="server" ID="litContactSectionTitle" />
                    </td>
                </tr>
                <tr>
                    <td>
                        First Name:
                    </td>
                    <td>
                        Last Name:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbFirstName" MaxLength="128" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvFirstName" ControlToValidate="tbFirstName"
                            Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbLastName" MaxLength="128" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvLastName" ControlToValidate="tbLastName"
                            Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        E-Mail Address:
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="tbEmail" MaxLength="254" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvEmail" ControlToValidate="tbEmail" Display="Dynamic"
                            ErrorMessage="*" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid E-Mail address."
                            ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                    </td>
                </tr>
                <asp:Panel runat="server" ID="pnlCompanyAndTitle" Visible="false">
                    <tr>
                        <td>
                            Company Name:
                        </td>
                        <td>
                            Title/Position:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="tbCompanyName" MaxLength="254" />
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tbTitlePosition" MaxLength="128" />
                        </td>
                    </tr>
                </asp:Panel>
                <tr>
                    <td>
                        Street Address 1:
                    </td>
                    <td>
                        Street Address 2:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbStreetAddress1" MaxLength="254" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvAddress1" ControlToValidate="tbStreetAddress1" Display="Dynamic"
                            ErrorMessage="*" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbStreetAddress2" MaxLength="254" />
                    </td>
                </tr>
                <tr>
                    <td>
                        City:
                    </td>
                    <td>
                        Country:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbCity" MaxLength="128" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvCity" ControlToValidate="tbCity" Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="true" AutoPostBack="true" DataTextField="country" DataValueField="countryid"
                         OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
                        <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlCountry" Display="Dynamic" InitialValue="0" />
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Zip Code:
                    </td>
                    <td>
                        State/Province:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbZip" MaxLength="15" />
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbZip" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="true" Enabled="false" DataTextField="state" DataValueField="stateid" />
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlState" Display="Dynamic" InitialValue="0" />
                    </td>
                </tr>
            </table>
            
            <asp:Panel runat="server" ID="pnlMoreStudentInfo" Visible="false">
                <table class="table-form" width="504px">
                    <asp:Panel runat="server" ID="pnlAboutTheStudent" Visible="false">
                        <tr>
                            <td colspan="2" class="header">
                                About the Student
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Relationship to the student:</td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:DropDownList runat="server" ID="ddlRelationship" DataTextField="description" 
                            DataValueField="relationshiptostudentid" /><asp:RequiredFieldValidator ID="rfvRelationship" runat="server" 
                            ErrorMessage="*" 
                            ControlToValidate="ddlRelationship" Display="Dynamic" InitialValue="0" /></td>
                        </tr>
                    </asp:Panel>
                    <tr>
                        <td colspan="2">
                            <asp:Literal runat="server" ID="litIam" />:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:RadioButton runat="server" ID="rbMale" Text="Male" GroupName="grpGender" Checked="true" />
                            <asp:RadioButton runat="server" ID="rbFemale" Text="Female" GroupName="grpGender" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Literal runat="server" ID="litStudentCitizenship" />:
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:DropDownList runat="server" ID="ddlCitizenship" DataTextField="country" DataValueField="countryid"
                                AppendDataBoundItems="true" /><asp:RequiredFieldValidator ID="rfvCitizenship" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlCitizenship" Display="Dynamic" InitialValue="0" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Literal runat="server" ID="litCurrentGrade" />:
                        </td>
                        <td>
                            <asp:Literal runat="server" ID="litConsideringGrade" />:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="tbCurrentGrade" MaxLength="3" Width="35px" /><asp:RequiredFieldValidator
                                runat="server" ID="rfvCurrentGrade" ControlToValidate="tbCurrentGrade" Display="Dynamic"
                                ErrorMessage="*" />
                            <asp:RangeValidator ID="rvCurrentGrade" runat="server" ErrorMessage="Please enter a valid grade between 1 and 12 for the current grade."
                                MaximumValue="12" MinimumValue="1" Type="Integer" ControlToValidate="tbCurrentGrade"
                                Display="Dynamic"></asp:RangeValidator>
                        </td>
                        <td>
                            <asp:TextBox runat="server" ID="tbApplyForGrade" MaxLength="3" Width="35px" />
                            <asp:RangeValidator ID="rvApplyForGrade" runat="server" ErrorMessage="Please enter a valid grade between 1 and 12 for the grade being applied for."
                                MaximumValue="12" MinimumValue="1" Type="Integer" ControlToValidate="tbApplyForGrade"
                                Display="Dynamic"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Literal runat="server" ID="litCurrentlyAttending" />:
                        </td>
                        <td>
                            <asp:Literal runat="server" ID="litInterest" />:
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlCurrentSchoolType" DataTextField="description" DataValueField="schooltypeid" />
                        </td>
                        <td>
                            <asp:DropDownList runat="server" ID="ddlInterestLevel" DataTextField="description" DataValueField="interestlevelid" />
                        </td>
                    </tr>
                    <asp:Panel runat="server" ID="pnlParentInterestLevel" Visible="false">
                        <tr>
                            <td></td>
                            <td>My interest level is:</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><asp:DropDownList runat="server" ID="ddlParentInterestLevel" DataTextField="description" DataValueField="interestlevelid"/></td>
                        </tr>
                    </asp:Panel>
                </table>
            </asp:Panel>
            
            <table class="table-form" width="504px">
                <tr>
                    <td colspan="2" class="header">
                        Number of Directories Requested
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table border="1">
                            <tr runat="server" id="trNormalRates" visible="false">
                                <td align="center">
                                    <strong>US and Canada Rates</strong><br />
                                    1 Catalog - FREE<br />
                                    2-25 Catalogs - $5 each<br />
                                    26-50 Catalogs - $3 each<br />
                                    50+ Catalogs: Please call us at (828)258-5354<br />
                                    or email tabs@tabs.org
                                </td>
                                <td align="center">
                                    <strong>Rates for Other Countries</strong><br />
                                    1 Catalog - FREE + $30 S/H<br />
                                    2-25 Catalogs - $25 each<br />
                                    26-50 Catalogs - $20 each<br />
                                    50+ Catalogs: Please call us at (828)258-5354<br />
                                    or email tabs@tabs.org
                                </td>
                            </tr>
                            <tr runat="server" id="trSchoolRates" visible="false">
                                <td align="center" valign="top">
                                    <strong>US and Canada Rates</strong><br />
                                    1-50 Catalogs - FREE<br />
                                    50+ Catalogs: Please call us at (828)258-5354<br />
                                    or email tabs@tabs.org
                                </td>
                                <td align="center">
                                    <strong>Rates for Other Countries</strong><br />
                                    1 Catalog - FREE + $15 S/H<br />
                                    2-25 Catalogs - $25 each<br />
                                    26-50 Catalogs - $20 each<br />
                                    50+ Catalogs: Please call us at (828)258-5354<br />
                                    or email tabs@tabs.org
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        Number of Catalogs Requested:
                    </td>
                    <td>
                        Total Cost:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbNumberofCatalogs" OnTextChanged="tbNumberofCatalogs_TextChanged" AutoPostBack="true" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvNumberOfCatalogs" ControlToValidate="tbNumberofCatalogs"
                            Display="Dynamic" ErrorMessage="*" />
                        <asp:CompareValidator ID="cvNumberOfCatalogs" runat="server" 
                            ErrorMessage="Please enter a valid number for the number of catalogs being requested." 
                            ControlToValidate="tbNumberofCatalogs" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbTotalCost" Enabled="false" Width="175px" />
                    </td>
                </tr>
            </table>
            
            <asp:Panel runat="server" ID="pnlCreditCard" Visible="false">
            
            <table class="table-form" width="504px">
                <tr>
                    <td colspan="2" class="header">
                        Credit Card Information
                    </td>
                </tr>
                <tr>
                    <td colspan="2">Card:</td>
                </tr>
                <tr>
                    <td colspan="2"><asp:RadioButton runat="server" ID="rbVisa" Text="Visa" GroupName="grpCreditCard" Checked="true" />
                    <asp:RadioButton runat="server" ID="rbMasterCard" Text="Master Card" GroupName="grpCreditCard" />
                    <asp:RadioButton runat="server" ID="rbAmericanExpress" Text="American Express" GroupName="grpCreditCard" /></td>
                </tr>
                <tr>
                    <td>First Name on Card:</td>
                    <td>Last Name on Card:</td>
                </tr>
                <tr>
                    <td><asp:TextBox runat="server" ID="tbFirstNameOnCard" MaxLength="128" />
                        <asp:RequiredFieldValidator ID="rfvFirstNameOnCard" runat="server" 
                            ErrorMessage="*" Display="Dynamic" ControlToValidate="tbFirstNameOnCard" />
                    </td>
                    <td><asp:TextBox runat="server" ID="tbLastNameOnCard" MaxLength="128" />
                        <asp:RequiredFieldValidator ID="rfvLastNameOnCard" runat="server" 
                            ErrorMessage="*" Display="Dynamic" ControlToValidate="tbLastNameOnCard" />
                    </td>
                </tr>
                <tr>
                    <td>Credit Card Number:</td>
                    <td>CVV Number:</td>
                </tr>
                <tr>
                    <td><asp:TextBox runat="server" ID="tbCreditCardNumber" MaxLength="254" /><asp:RequiredFieldValidator
                            ID="rfvCreditCardNumber" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbCreditCardNumber" />
                            </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbCVV" MaxLength="4" Width="35px" /><asp:RequiredFieldValidator ID="rfvCVV" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbCVV" /><asp:CompareValidator ID="cvCVV" runat="server" 
                            ErrorMessage="Please enter a valid CVV number." 
                            ControlToValidate="tbCVV" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" /></td>
                </tr>
                <tr>
                    <td colspan="2">Expiration Date:</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <table width="105px">
                            <tr>
                                <td width="45px"><asp:TextBox runat="server" ID="tbExpirationMonth" MaxLength="2" Width="20px" />
                    <asp:RequiredFieldValidator ID="rfvExpirationMonth" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbExpirationMonth" /><asp:CompareValidator ID="cvExpirationMonth" runat="server" 
                            ErrorMessage="Please enter a valid expiration month." 
                            ControlToValidate="tbExpirationMonth" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" /> / 
                                </td>
                                <td width="60px"><asp:TextBox runat="server" ID="tbExpirationYear" MaxLength="4" Width="35px" />
                                <asp:RequiredFieldValidator ID="rfvExpirationYear" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbExpirationYear" /><asp:CompareValidator ID="cvExpirationYear" runat="server" 
                            ErrorMessage="Please enter a valid expiration year." 
                            ControlToValidate="tbExpirationYear" Operator="DataTypeCheck" Type="Integer" Display="Dynamic" /></td>
                            </tr>
                            <tr>
                                <td>mm</td>
                                <td>yyyy</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>  
            
            <table class="table-form" width="504px">
                <tr>
                    <td colspan="2" class="header">
                        Billing Address
                    </td>
                </tr>
                <tr>
                    <td><asp:CheckBox runat="server" ID="cbSameAsMailingAddress" 
                            Text="Same as mailing address" 
                            oncheckedchanged="cbSameAsMailingAddress_CheckedChanged" AutoPostBack="true" CausesValidation="false" /></td>
                </tr>
                <tr>
                    <td>
                        First Name:
                    </td>
                    <td>
                        Last Name:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbBillingFirstName" MaxLength="128" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvBillingFirstName" ControlToValidate="tbBillingFirstName"
                            Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbBillingLastName" MaxLength="128" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvBillingLastName" ControlToValidate="tbBillingLastName"
                            Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Street Address 1:
                    </td>
                    <td>
                        Street Address 2:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbBillingStreetAddress1" MaxLength="254" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvBillingStreetAddress1" ControlToValidate="tbBillingStreetAddress1" Display="Dynamic"
                            ErrorMessage="*" />
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbBillingStreetAddress2" MaxLength="254" />
                    </td>
                </tr>
                <tr>
                    <td>
                        City:
                    </td>
                    <td>
                        Country:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbBillingCity" MaxLength="128" /><asp:RequiredFieldValidator
                            runat="server" ID="rfvBillingCity" ControlToValidate="tbBillingCity" Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBillingCountry" runat="server" AppendDataBoundItems="true" AutoPostBack="true" DataTextField="country" DataValueField="countryid"
                         OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
                         <asp:RequiredFieldValidator ID="rfvBillingCountry" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlBillingCountry" Display="Dynamic" InitialValue="0" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Zip Code:
                    </td>
                    <td>
                        State/Province:
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="tbBillingZip" MaxLength="15" />
                        <asp:RequiredFieldValidator ID="rfvBillingZip" runat="server" ErrorMessage="*" Display="Dynamic" 
                        ControlToValidate="tbZip" />
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlBillingState" runat="server" AppendDataBoundItems="true" Enabled="false" 
                        DataTextField="state" DataValueField="stateid" />
                        <asp:RequiredFieldValidator ID="rfvBillingState" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlBillingState" Display="Dynamic" InitialValue="0" />
                    </td>
                </tr>
                
            </table>    
            
            </asp:Panel> 
            
            <asp:Panel runat="server" ID="pnlOtherPreferences" Visible="false">
            
                <table class="table-form" width="504px">
                    <tr>    
                        <td class="header">
                            Other Preferences
                        </td>
                    </tr>
                    <tr>
                        <td><asp:CheckBox runat="server" id="cbEmailUpdates" Text="I would like to receive email updates from TABS." /><br />
                            <asp:CheckBox runat="server" ID="cbMailingList" Text="I would like to be placed on the TABS mailing list for additional information." />
                        </td>
                    </tr>
                </table>
                      
            </asp:Panel>
            
            <br /><br />
            
            <table class="table-form" width="504px">
                <tr>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="edit-save" 
                            onclick="btnSubmit_Click" /><asp:Button runat="server" ID="btnCancel" 
                            Text="Cancel" CssClass="edit-reset" onclick="btnCancel_Click" CausesValidation="false" /></td>
                </tr>
            </table>   
            
        </asp:Panel>
        
    </ContentTemplate>
</asp:UpdatePanel>