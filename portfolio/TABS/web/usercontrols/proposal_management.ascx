<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="proposal_management.ascx.cs" Inherits="TABS_UserControls.usercontrols.proposal_management" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>

<asp:MultiView runat="server" ID="mvProposalManagement">
    
    <asp:View runat="server" ID="vLogin">
        <div>
            Log in to manage your proposals.<br />
            Email Address: <asp:TextBox runat="server" ID="tbEmailAddress" /><asp:RequiredFieldValidator
                ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbEmailAddress" /><br />
            Password: <asp:TextBox runat="server" ID="tbPassword" TextMode="Password" /><asp:RequiredFieldValidator
                ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbPassword" /><br />
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" 
                onclick="btnSubmit_Click" />
        </div>
    </asp:View>
    
    <asp:View runat="server" ID="vProposals">
    
        <div>
            Manage Your Proposals
        </div>
        
        <div>Select a proposal to edit:
            <obout:Grid ID="gridProposals" runat="server" 
                    onrowdatabound="gridProposals_RowDataBound" AutoGenerateColumns="false">
                    <Columns>
                        <obout:Column DataField="ConferenceProposalId" TemplateId="tmpProposalTitle" HeaderText="Conference Proposal Title" />
                    </Columns>
                    <Templates>
                        <obout:GridTemplate runat="server" id="tmpProposalTitle">
                            <Template>
                                <asp:HyperLink runat="server" id="hlProposalTitle" NavigateUrl='/for-schools/professional-development/conferences/proposal-conference.aspx?mode=e&cid=' />
                            </Template>
                        </obout:GridTemplate>
                    </Templates>
            </obout:Grid>
            
            or...
        
            <a href="">Submit a New Proposal</a>    
        </div>    
        
        <div>
            <asp:LinkButton runat="server" ID="lbLogOut" Text="Log Out" 
                onclick="lbLogOut_Click"  />
        </div>
        
        
    </asp:View>

</asp:MultiView>

