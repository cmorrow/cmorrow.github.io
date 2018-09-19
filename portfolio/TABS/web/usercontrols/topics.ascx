<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="topics.ascx.cs" Inherits="TABS_UserControls.usercontrols.topics" %>


<div id="tabs-forum" class="container-box zero">
    <div class="bt">&nbsp;</div>
    <div class="bm left">
        <div class="both1812 forum-top left">
            <div class="forum-left left forumSectionLt">
                <h3 id="forumTitle"><asp:Label ID="topicTitle" runat="server"></asp:Label></h3><a href="/for-schools/forum.aspx">Back To Forums</a><br /><br />
                <!-- new post shows only when user is logged in -->
                <div>
                    <asp:MultiView ID="multiNewTopic" runat="server" ActiveViewIndex="0">
                        <asp:View ID="viewLogIn" runat="server">
                            <div>
                                You must be logged in to post new topics. Click <a id="memberlink_sub" href='#'>here</a> to login.
                            </div>
                        </asp:View>
                        <asp:View ID="viewNew" runat="server">
                            <div>
                                New Topic: <asp:TextBox ID="textTopic" runat="server" /> &nbsp;&nbsp;Sticky: <asp:CheckBox ID="checkSticky" runat="server" /> &nbsp;&nbsp;<!-- may require admin rights -->
                                <asp:Button ID="buttonAddTopic" runat="server" Text="Add" />
                                <asp:RequiredFieldValidator runat="server" 
                                    ControlToValidate="textTopic" 
                                    ErrorMessage="* Please enter a title for your new topic" Display="Dynamic" Font-Names="Arial" Font-Size="10pt"></asp:RequiredFieldValidator>
                            </div>        
                        </asp:View>
                    </asp:MultiView>
                </div>
        
            </div>
            <div class="forum-right right forumSectionRt">
                               <a id="adLink" target="_blank" runat="server"><asp:Image ID="adImg" Visible="false" runat="server" Height="93px" Width="296px"/></a>

<%--                <div class="clear-ad left">
                    <div class="clear-box-t">&nbsp;</div>
                    <div class="clear-box-m">
                   <a id="adLink" target="_blank" runat="server"><asp:Image ID="adImg" runat="server" Height="93px" Width="296px"/></a>
                    </div>
                    <div class="clear-box-b">&nbsp;</div>
               </div>
                --%> 
            </div>
        </div>
        
        <!-- topics -->
        <div>
            <table cellpadding="5" cellspacing="0" border="0" class="forum-table left">
                <tr class="forum-name forum-border">
                    <td colspan="2" width="516px" class="forum-indent t-left">Subject</td>
                    <td>Posted By</td>
                    <td>Replies</td>
                    <td>Last Updated</td>
                </tr>
                <!-- topics repeater -->
                <asp:Repeater ID="repeatTopics" runat="server">
                <ItemTemplate>
                    <tr>
                        <td width="43px"><asp:Image ID="imageSticky" runat="server" Visible="false" ImageUrl="~/resources/images/doc.gif" /></td>
                        <td width="492px"><h5><a href="posts.aspx?topicid=<%#Eval("topicid") %>"><%#Eval("topic") %></a></h5>[<asp:LinkButton ID="buttonSubscribe" runat="server" Text="subscribe" OnCommand="subscribePost" /><asp:Literal ID="textLiteralSubscribed" runat="server" Text="currently subscribing to this topic" />]
                        </td>
                        <td><asp:Literal id="literalUser" runat="server"><p>N/A</p></asp:Literal></td>
                        <td align="center"><asp:Literal ID="literalPostCount" runat="server" Text="0" /></td>
                        <td><asp:Literal ID="literalPostUpdate" runat="server">N/A</asp:Literal></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
                
                
            </table>
            
            <!-- page navigation -->
            <table cellpadding="20" cellspacing="0" border="0" class="forum-table left">
                <tr>
                    <td width="100px"><asp:Literal ID="literalPage" runat="server" /></td>
                    <td class="result-num"><asp:Literal ID="literalPageNavigation" runat="server" /></td>
                </tr>
            </table>
        </div>

    </div>
    <div class="bb clear">&nbsp;</div>    
</div>