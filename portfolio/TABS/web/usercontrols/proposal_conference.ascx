<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="proposal_conference.ascx.cs" Inherits="TABS_UserControls.usercontrols.proposal_conference" %>

        <asp:Literal runat="server" ID="litConferenceProposalId" Visible="false"/>
        <asp:Literal runat="server" ID="litConferenceProposalSpeaker1Id" Visible="false"/>
        <asp:Literal runat="server" ID="litConferenceProposalSpeaker2Id" Visible="false"/>
        <asp:Literal runat="server" ID="litConferenceProposalSpeaker3Id" Visible="false"/>
        <asp:Literal runat="server" ID="litConferenceProposalSubmitterId" Visible="false"/>
        
        <div class="edit-event">
            <table class="auto-m" width="730px">
                <tr>
                    <td colspan="2" class="type-of-pre">
                        1. Type of Presentation:
                    </td>
                </tr>
                <tr>
                    <td class="proposal">
                        <asp:Repeater runat="server" ID="rptProposalTypesLeft">
                            <ItemTemplate>
                                <input type="radio" name="radioproposalType" value='<%# Eval("ConferenceProposalTypeId") %>' checked="checked" /><%# Eval("ProposalType") %><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                    <td class="proposal">
                        <asp:Repeater runat="server" ID="rptProposalTypesRight">
                            <ItemTemplate>
                                <input type="radio" name="radioproposalType" value='<%# Eval("ConferenceProposalTypeId") %>' /><%# Eval("ProposalType") %><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="type-of-pre">
                        2. Topic Area: <em>The Primary focus for my presentation is.</em>
                    </td>
                </tr>
                <tr>
                    <td class="proposal">
                        <asp:Repeater runat="server" ID="rptTopicAreaLeft">
                            <ItemTemplate>
                                <input type="radio" name="radioTopicArea" value='<%# Eval("ConferenceTopicAreaId") %>' checked="checked" /><%# Eval("TopicArea") %><br />
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                    <td class="proposal">
                        <asp:Repeater runat="server" ID="rptTopicAreaRight">
                            <ItemTemplate>
                                <input type="radio" name="radioTopicArea" value='<%# Eval("ConferenceTopicAreaId") %>' /><%# Eval("TopicArea") %><br />
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:TextBox runat="server" ID="tbOtherTopicArea" MaxLength="128" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="type-of-pre">
                        <b>3. Title of Presentation <em>(60 character limit, including spaces and punctuation):</em></b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="tbTitle" CssClass="title-of-pre" MaxLength="60" 
                            Width="300px" /><asp:RequiredFieldValidator
                                        runat="server" ID="rfvTitle" ControlToValidate="tbTitle"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="type-of-pre">
                        <b>4. Description of Presentation:</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <em>(400 character maximum. Please provide an accurate description. If your presentation is
                            accepted by the Conference Planning Committee, this description will be published
                            in the conference preview and program.)</em>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="tbDescription" TextMode="MultiLine" Width="75%" 
                            Rows="10" MaxLength="400" /><asp:RequiredFieldValidator
                                        runat="server" ID="rfvDescription" ControlToValidate="tbDescription"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
            </table>
            <table class="auto-m" width="730px">
                <tr>
                    <td colspan="6" class="type-of-pre">
                        <b>5. Speaker 1:</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <em>(Please thoroughly review the <a href="">Call for Proposal Guide</a> before completing.)</em>
                    </td>
                </tr>
                <tr>
                    <td width="10%">
                        First Name
                    </td>
                    <td width="20%" class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker1FirstName" MaxLength="128" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator1" ControlToValidate="tbSpeaker1FirstName"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td width="3%">
                        MI
                    </td>
                    <td width="20%">
                        <asp:TextBox runat="server" ID="tbSpeaker1MiddleInitial" CssClass="mi" MaxLength="1" />
                    </td>
                    <td width="27%">
                        Last Name
                    </td>
                    <td width="20%" class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker1LastName" MaxLength="128" />
                        <asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator2" ControlToValidate="tbSpeaker1LastName"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Title
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker1Title" CssClass="organi" MaxLength="128" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator3" ControlToValidate="tbSpeaker1Title"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Organization
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker1Organization" CssClass="organi" MaxLength="128" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator4" ControlToValidate="tbSpeaker1Organization"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker1Address1" CssClass="organi" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator5" ControlToValidate="tbSpeaker1Address1"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address 2
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker1Address2" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        City
                    </td>
                    <td class="edit-180">
                       <asp:TextBox runat="server" ID="tbSpeaker1City"/>
                    </td>
                    <asp:UpdatePanel ID="upConferenceProposal1" runat="server">
                    <ContentTemplate>
                    <td>
                        Country
                    </td>
                    <td>    
                        <asp:DropDownList ID="ddlSpeaker1Country" runat="server" 
                            AppendDataBoundItems="true" 
                            AutoPostBack="true" 
                            DataTextField="country" 
                            DataValueField="countryid" 
                            CssClass="stt-prv" 
                            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
                        <asp:RequiredFieldValidator ID="rfvCountry" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlSpeaker1Country" Display="Dynamic" InitialValue="0" />
                    </td>
                    <td>
                        State
                        </td>
                        <td>
                        <asp:DropDownList ID="ddlSpeaker1State" 
                            runat="server" 
                            AppendDataBoundItems="true" 
                            DataTextField="state" 
                            DataValueField="stateid" 
                            CssClass="stt-prv" 
                            Enabled="false" />
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="*" 
                            ControlToValidate="ddlSpeaker1State" Display="Dynamic" InitialValue="0" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Zip/PC
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker1Zip"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbSpeaker1Phone" CssClass="number" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator6" ControlToValidate="tbSpeaker1Phone"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td>
                        Fax
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbSpeaker1Fax" CssClass="number" />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker1EmailAddress" CssClass="organi" MaxLength="254" /><asp:RequiredFieldValidator
                                    runat="server" ID="rfvSpeaker1Email" ControlToValidate="tbSpeaker1EmailAddress" Display="Dynamic"
                                    ErrorMessage="*" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter a valid email address for speaker 1."
                                    ControlToValidate="tbSpeaker1EmailAddress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="5">
                        Create a password that you would like to use for future access to this proposal.
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        Password
                    </td>
                    <td colspan="2">
                        <asp:TextBox runat="server" id="tbPassword1" TextMode="Password" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator7" ControlToValidate="tbPassword1"
                                        Display="Dynamic" ErrorMessage="*" />
                    </td>
                    <td>
                        Re-enter Password
                    </td>
                    <td>
                        <asp:TextBox runat="server" id="tbPassword2" TextMode="Password" /><asp:RequiredFieldValidator
                                        runat="server" ID="RequiredFieldValidator8" ControlToValidate="tbPassword2"
                                        Display="Dynamic" ErrorMessage="*" />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                            
                            ErrorMessage="Please make sure that your password is identical in both boxes." 
                            Display="Dynamic" ControlToCompare="tbPassword1" 
                            ControlToValidate="tbPassword2"  />
                    </td>
                </tr>
                
                <tr>
                    <td colspan="6" class="proposal">
                        I have presented at other conferences.  If yes, please specify below:
                        <asp:RadioButtonList runat="server" ID="rblHavePresentedBefore" 
                            onselectedindexchanged="rblHavePresentedBefore_SelectedIndexChanged" 
                            AutoPostBack="true">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        Other conferences: <asp:TextBox runat="server" 
                            ID="tbSpeaker1OtherConferences" class="specify" MaxLength="254" Width="300px" Enabled="false" />
                    </td>
                </tr>
                
                    </ContentTemplate>
                </asp:UpdatePanel>
                <tr>
                    <td colspan="6" class="proposal">
                    I accept that I am responsible for my own conference registration, trabel fees and accommodations.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker1ResponsibleForFees">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        I know that presenters for discussion groups and concurrent
                        sesssions must be paid registrants for the conference.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker1MustBePaidRegistrant">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        If this presentation has been or will be presented at another conference, please
                        indicate the name of conference(s) below.
                    </td>
                </tr>
                <tr>
                    <td>
                        Conf. 1
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbConference1" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Conf. 2
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbConference2" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        &nbsp;
                    </td>
                </tr>
                
                
                
                
                <!-- BEGIN SPEAKER 2 -->
                
                
                
                
                
                
                <tr>
                    <td colspan="6" class="type-of-pre">
                        <b>6. Speaker 2:</b>(if applicable)
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <em>(Please thoroughly review the <a href="">Call for Proposal Guide</a> before completing.)</em>
                    </td>
                </tr>
                <tr>
                    <td width="10%">
                        First Name
                    </td>
                    <td width="20%" class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker2FirstName" />
                    </td>
                    <td width="3%">
                        MI
                    </td>
                    <td width="10%">
                        <asp:TextBox runat="server" ID="tbSpeaker2MiddleInitial" CssClass="mi" />
                    </td>
                    <td width="22%">
                        Last Name
                    </td>
                    <td width="35%" class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker2LastName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Title
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker2Title" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Organization
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker2Organization" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker2Address1" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address 2
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker2Address2" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        City
                    </td>
                    <td class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker2City" />
                    </td>
                    <asp:UpdatePanel ID="upConferenceProposal2" runat="server">
                    <ContentTemplate>
                    <td>
                        Country</td>
                        <td><asp:DropDownList ID="ddlSpeaker2Country" runat="server" 
                            AppendDataBoundItems="true" 
                            AutoPostBack="true" 
                            DataTextField="country" 
                            DataValueField="countryid" 
                            CssClass="stt-prv" 
                            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
                    </td>
                    <td>
                        State</td>
                        <td><asp:DropDownList ID="ddlSpeaker2State" 
                            runat="server" 
                            AppendDataBoundItems="true" 
                            DataTextField="state" 
                            DataValueField="stateid" 
                            CssClass="stt-prv" EnableViewState="false" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Zip/PC
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker2Zip" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbSpeaker2Phone" CssClass="number" />
                    </td>
                    <td>
                        Fax
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbSpeaker2Fax" CssClass="number" />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker2EmailAddress" CssClass="organi" />
                        <asp:RegularExpressionValidator ID="revSpeaker2Email" runat="server" ErrorMessage="Please enter a valid email address for speaker 2."
                                    ControlToValidate="tbSpeaker2EmailAddress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 2 is aware that his/her name is being submitted as a presenter.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker2SpeakerIsAware" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 2 has obtained the financial support of his/her school or organization.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker2ResponsibleForFees" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 2 knows that presenters for discussion groups and concurrent sessions must be paid registrants for the conference.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker2MustBePaidRegistrant" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 2 has presented at other conferences.  If yes, please specify:
                        <asp:RadioButtonList runat="server" ID="rblSpeaker2HasPresented" 
                            RepeatDirection="Horizontal" AutoPostBack="True" 
                            onselectedindexchanged="rblSpeaker2HasPresented_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        Other conferences: <asp:TextBox runat="server" ID="tbSpeaker2OtherConferences" class="specify" 
                            MaxLength="254" Width="300px" enabled="false" />
                    </td>
                </tr>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <tr>
                    <td colspan="6">
                        &nbsp;
                    </td>
                </tr>
                
                
                
                
                <!-- BEGIN SPEAKER 3 -->
                
                
                
                
                
                <tr>
                    <td colspan="6" class="type-of-pre">
                        <b>7. Speaker 3:</b>(if applicable)
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <em>(Please thoroughly review the <a href="">Call for Proposal Guide</a> before completing.)</em>
                    </td>
                </tr>
                <tr>
                    <td width="10%">
                        First Name
                    </td>
                    <td width="20%" class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker3FirstName" />
                    </td>
                    <td width="3%">
                        MI
                    </td>
                    <td width="10%">
                        <asp:TextBox runat="server" ID="tbSpeaker3MiddleInitial" CssClass="mi" />
                    </td>
                    <td width="22%">
                        Last Name
                    </td>
                    <td width="35%" class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker3LastName" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Title
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker3Title" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Organization
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker3Organization" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker3Address1" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Address 2
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker3Address2" CssClass="organi" />
                    </td>
                </tr>
                <tr>
                    <td>
                        City
                    </td>
                    <td class="edit-180">
                        <asp:TextBox runat="server" ID="tbSpeaker3City" />
                    </td>
                    <asp:UpdatePanel ID="upConferenceProposal3" runat="server">
                    <ContentTemplate>
                    <td>
                       Country</td>
                       <td><asp:DropDownList ID="ddlSpeaker3Country" runat="server" 
                            AppendDataBoundItems="true" 
                            AutoPostBack="true" 
                            DataTextField="country" 
                            DataValueField="countryid" 
                            CssClass="stt-prv" 
                            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" />
                    </td>
                    <td>
                       State</td>
                       <td><asp:DropDownList ID="ddlSpeaker3State" 
                            runat="server" 
                            AppendDataBoundItems="true" 
                            DataTextField="state" 
                            DataValueField="stateid" 
                            CssClass="stt-prv" EnableViewState="false" />
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        Zip/PC
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker3Zip" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Phone
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbSpeaker3Phone" CssClass="number" />
                    </td>
                    <td>
                        Fax
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbSpeaker3Fax" CssClass="number" />
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td colspan="5">
                        <asp:TextBox runat="server" ID="tbSpeaker3EmailAddress" CssClass="organi" />
                        <asp:RegularExpressionValidator ID="revSpeaker3EmailAddress" runat="server" ErrorMessage="Please enter a valid email address for speaker 3."
                                    ControlToValidate="tbSpeaker3EmailAddress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 3 is aware that his/her name is being submitted as a presenter.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker3SpeakerIsAware" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 3 has obtained the financial support of his/her school or organization.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker3ResponsibleForFees" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 3 knows that presenters for discussion groups and concurrent sessions must be paid registrants for the conference.
                        <asp:RadioButtonList runat="server" ID="rblSpeaker3MustBePaidRegistrant" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="6" class="proposal">
                        Speaker 3 has presented at other conferences.  If yes, please specify below:
                        <asp:RadioButtonList runat="server" ID="rblSpeaker3HasPresented" 
                            RepeatDirection="Horizontal" AutoPostBack="True" 
                            onselectedindexchanged="rblSpeaker3HasPresented_SelectedIndexChanged">
                            <asp:ListItem Text="Yes" Value="1" />
                            <asp:ListItem Text="No" Selected="True" Value="0" />
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        Other conferences: <asp:TextBox runat="server" 
                            ID="tbSpeaker3OtherConferences" class="specify" MaxLength="254" Width="300px" Enabled="false" />
                    </td>
                </tr>
                    </ContentTemplate>
                </asp:UpdatePanel>    
                <tr>
                    <td colspan="6">
                        &nbsp;
                    </td>
                </tr>
                
                
                
                
                
            </table>
            <table class="auto-m" width="730px">
                <tr>
                    <td colspan="2" class="type-of-pre">
                        <b>8. Audiovisual Request</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Each breakout room will be equipped for a normal PowerPoint slide presentation with an LCD projector and screen. 
                        <strong>Speakers must provide their own computers and be able to operate their software programs.</strong> Onsite tech support will 
                        be limited to projector assistance only.
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox runat="server" ID="cbFlipChart" Text="Flipchart" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox runat="server" ID="cbOther" Text="Other (Desctibe below. Special requests will be determined on a case by case basis.)" />
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="tbAudioVisualOther" CssClass="specify" MaxLength="254"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="type-of-pre">
                        <b>9. Final Agreement</b>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        Please Thoroughly rebview the <a href="">Call for Proposal Guide.</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox runat="server" ID="cbAgreement1" Text="I and my co-speakers understand all of the arrangements and procedures for submitting
                            a proposal to present at the 2009 TABS Conference." />
                            <asp:CustomValidator id="cvAgreement1" 
                                 runat="server" ErrorMessage="*" 
                                 OnServerValidate="cvAgreement1_ServerValidate" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CheckBox runat="server" ID="cbAgreement2" Text="I understand that I am responsible for forwarding information from TABS to any co-speaker(s)
                            I may have." />
                            <asp:CustomValidator id="cvAgreement2" 
                                 runat="server" ErrorMessage="*" 
                                 OnServerValidate="cvAgreement2_ServerValidate" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        If selected to present at the main conference, all concurrent session speakers (primary
                        and co-speakers) are responsible for paying their own conference registration fees,
                        travel expenses and room accommodations.
                    </td>
                </tr>
            </table>
            <div class="edit-submit-box left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="edit-save" 
                    onclick="btnSubmit_Click" />
            </div>
        </div>