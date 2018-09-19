<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tabs_news.ascx.cs" Inherits="TABS_UserControls.usercontrols.tabs_news" %>

<div id="school-tabs" class="floatclear join-tabs-mar">
    
    <ul id="join-tabs-ul">
        <li><a id="tab0" onserverclick="tab0_Click" runat=server href="/about-tabs/about-us/press-room.aspx?id=0">TABS news</a></li>
        <li><a id="tab1" onserverclick="tab1_Click" runat=server  href="/about-tabs/about-us/press-room.aspx?id=1">school news</a></li>
        <li><a id="tab2" onserverclick="tab2_Click" runat=server  href="/about-tabs/about-us/press-room.aspx?id=2">web news</a></li>
    </ul> 
      <asp:MultiView id="mvTabs" ActiveViewIndex=0 runat="server">
            <asp:View ID="tabsNews1" runat="server">
                      <div id="library1a" class="w550 floatclear">
                    <asp:Repeater ID="repeatTABSNews1" runat="server">
                        <ItemTemplate>
                            <div>
                                <p><%#Eval("publishdate") %></p>
                                <h3><a href="/about-tabs/about-us/press-room/articles.aspx?section=tabs&id=<%#Eval("tabsnewsid") %>"><%#Eval("headline") %></a></h3>
                                <p><%#Eval("summary") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </asp:View>
            <asp:View ID="schoolNews1" runat="server">
                  
                  <div id="library2a" class="w550 floatclear">
                    <table>
                        <tr>
                            <td><b>Date</b></td>
                            <td><b>Article</b></td>
                            <td><b>Source</b></td>
                        </tr>
                        <asp:Repeater ID="repeatSchoolNews1" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("publishdate") %></td>
                                    <td><a href="/about-tabs/about-us/press-room/articles.aspx?section=school&id=<%#Eval("schoolnewsid") %>"><%#Eval("headline") %></a></td>
                                    <td><%#Eval("source") %></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><%#Eval("summary") %></td>
                                    <td></td>
                                </tr>        
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                
            </asp:View>
            <asp:View ID="webNews" runat="server">
                   <div id="library3a" class="w550 floatclear">
                          <table>
                              <tr>
                                  <td><b>Date</b></td>
                                  <td><b>Article</b></td>
                                  <td><b>Source</b></td>
                              </tr>
                              <asp:Repeater ID="repeatWebNews1" runat="server">
                                  <ItemTemplate>
                                      <tr>
                                          <td><%#Eval("publishdate") %></td>
                                          <td><a href="/about-tabs/about-us/press-room/articles.aspx?section=web&id=<%#Eval("webnewsid") %>"><%#Eval("headline") %></a></td>
                                          <td><%#Eval("source") %></td>
                                      </tr>
                                      <tr>
                                          <td></td>
                                          <td><%#Eval("summary") %></td>
                                          <td></td>
                                      </tr>        
                                  </ItemTemplate>
                              </asp:Repeater>
                          </table>
                      </div>
            </asp:View>
      </asp:MultiView>
</div>