<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="forums.ascx.cs" Inherits="TABS_UserControls.usercontrols.forums" %>
<div id="tabs-forum" class="container-box zero">
  <div class="bt">
    &nbsp;</div>
  <div class="bm left">
    <div class="both1812 forum-top left">
      <div class="forum-left left">
        <h1 class="user-temp">
          forums home</h1>
        <p>
         Welcome to TABS Forums! Please browse topics and threads by Administrative Area, School Type, and Region.</p>
      </div>
      <div class="forum-right right">
      </div>
    </div>
    <table cellspacing="0" cellpadding="5" class="forum-table left">
      <tr class="forum-name">.
        <td colspan="6" class="forum-indent">
          <div>
            <p class="left">
              <asp:Label ID="lblUserName" runat="server"></asp:Label></p>
            <p class="right">
              <asp:Label ID="lblCurrentDate" runat="server"></asp:Label></p>
          </div>
        </td>
      </tr>
      <tr class="new-replies">
        <td colspan="6" class="forum-indent">
          <table class="reply-table">
            <tr>
              <td width="415px">
                <h4>
                  New replies to your recent posts.</h4>
              </td>
              <td class="nonew-icon" width="30px">
              </td>
              <td width="150px">
                <p>
                  Forum contains New Posts</p>
              </td>
              <td class="new-icon" width="30px">
              </td>
              <td width="180px">
                <p>
                  Forum contains No New Posts</p>
              </td>
            </tr>
          </table>
        </td>
      </tr>
      <asp:Repeater ID="repeatRecentPost" runat="server">
        <ItemTemplate>
          <tr>
            <td class="doc-icon" width="6%">
            </td>
            <td>
              <div>
                <h5>
                  <%#Eval("post") %></h5>
                <span>
                  <asp:Literal ID="literalPostTime" runat="server" /></span>
                <p>
                  in <a href="forum/posts.aspx?topicid=<%#Eval("topicid") %>">
                    <asp:Literal ID="literalTopic" runat="server" /></a></p>
              </div>
            </td>
          </tr>
        </ItemTemplate>
      </asp:Repeater>
      <!--
            <tr>
                <td class="doc-icon"></td>
                <td>
                    <div>
                        <h5>Re: Title of Post Lorem ipsum dolor sit amet, consectetur adipisicing elit</h5>
                        <span>Today <i>06:42PM</i></span>
                        <p>in <a href="">Catholic Schools</a></p>
                    </div>
                </td>
            </tr>
            -->
    </table>
    <table cellspacing="0" cellpadding="5" class="forum-table left">
      <tr class="forum-name forum-border">
        <td class="forum-indent t-left" width="510px">
          Forum Name
        </td>
        <td width="200px">
          Most Recent Post
        </td>
        <td width="55px">
          Topics
        </td>
        <td width="55px">
          Posts
        </td>
      </tr>
    </table>
    <div class="forum-tabs left">
      <table cellspacing="0" cellpadding="5" class="forum-table">
        <tr class="adminarea-tr">
          <td width="756px" class="forum-indent">
            <div>
              <span>Administrative Area</span>
            </div>
          </td>
          <td colspan="1">
            <div class="admin-post">
              &nbsp;
            </div>
          </td>
        </tr>
      </table>
      <div>
        <table cellspacing="0" cellpadding="5" class="forum-table">
          <!-- repeat -->
          <asp:Repeater ID="repeatForumAdmins" runat="server">
            <ItemTemplate>
              <tr>
                <td width="6%" class="new-icon">
                </td>
                <td width="55%">
                  <div>
                    <h5>
                      <a href="forum/topics.aspx?forumid=<%#Eval("forumid") %>">
                        <%#Eval("forum") %></a></h5>
                    <p>
                      <%#Eval("description") %></p>
                    <p id="subforum" runat="server" visible="false">
                      <b>Sub forums:</b>
                      <asp:Literal ID="subforumlinks" runat="server" /></p>
                  </div>
                </td>
                <td width="6%" class="doc-icon">
                </td>
                <td width="19%">
                  <div>
                    <asp:Literal ID="literalUser" runat="server"><p>N/A</p></asp:Literal>
                  </div>
                </td>
                <td width="7%">
                  <asp:Literal ID="literalTopicCount" runat="server" Text="0" />
                </td>
                <td width="7%">
                  <asp:Literal ID="literalPostCount" runat="server" Text="0" />
                </td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
      </div>
    </div>
    <div class="forum-tabs">
      <table cellspacing="0" cellpadding="5" class="forum-table">
        <tr class="schooltype-tr">
          <td width="756px" class="forum-indent">
            <div>
              <span>School Type</span>
            </div>
          </td>
          <td colspan="1">
            <div class="school-post">
              &nbsp;
            </div>
          </td>
        </tr>
      </table>
      <div>
        <table cellspacing="0" cellpadding="5" class="forum-table">
          <asp:Repeater ID="repeatForumSchools" runat="server">
            <ItemTemplate>
              <!-- repeat -->
              <tr>
                <td width="6%" class="new-icon">
                </td>
                <td width="55%">
                  <div>
                    <h5>
                      <a href="forum/topics.aspx?forumid=<%#Eval("forumid") %>">
                        <%#Eval("forum") %></a></h5>
                    <p>
                      <%#Eval("description") %></p>
                  </div>
                </td>
                <td width="6%" class="doc-icon">
                </td>
                <td width="19%">
                  <div>
                    <asp:Literal ID="literalUser" runat="server"><p>N/A</p></asp:Literal>
                  </div>
                </td>
                <td width="7%">
                  <asp:Literal ID="literalTopicCount" runat="server" Text="0" />
                </td>
                <td width="7%">
                  <asp:Literal ID="literalPostCount" runat="server" Text="0" />
                </td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
      </div>
    </div>
    <div class="forum-tabs">
      <table cellspacing="0" cellpadding="5" class="forum-table">
        <tr class="region-tr">
          <td width="756" class="forum-indent">
            <div>
              <span>Region</span>
            </div>
          </td>
          <td colspan="1">
            <div class="region-post">
              &nbsp;
            </div>
          </td>
        </tr>
      </table>
      <div>
        <table cellspacing="0" cellpadding="5" class="forum-table">
          <asp:Repeater ID="repeatForumRegions" runat="server">
            <ItemTemplate>
              <tr>
                <td width="6%" class="new-icon">
                </td>
                <td width="55%">
                  <div>
                    <h5>
                      <a href="forum/topics.aspx?forumid=<%#Eval("forumid") %>">
                        <%#Eval("forum") %></a></h5>
                    <p>
                      <%#Eval("description") %></p>
                  </div>
                </td>
                <td width="6%" class="doc-icon">
                </td>
                <td width="19%">
                  <div>
                    <asp:Literal ID="literalUser" runat="server"><p>N/A</p></asp:Literal>
                  </div>
                </td>
                <td width="7%">
                  <asp:Literal ID="literalTopicCount" runat="server" Text="0" />
                </td>
                <td width="7%">
                  <asp:Literal ID="literalPostCount" runat="server" Text="0" />
                </td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        </table>
      </div>
    </div>
  </div>
  <div class="bb clear">
    &nbsp;</div>
</div>
