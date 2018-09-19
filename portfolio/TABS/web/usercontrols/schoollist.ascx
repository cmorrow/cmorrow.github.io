<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="schoollist.ascx.cs" Inherits="TABS_UserControls.usercontrols.schoollist" %>

<img src="/resources/images/alpha_h.gif" alt="" />
<h2>Search by alphabet</h2>
<p>Choose a letter below to generate a list of schools beginning with that letter.</p>
<ul class="az-list">
    <li class="first-az"><a href="#A">A</a></li>
    <li><a href="#B">B</a></li>
    <li><a href="#C">C</a></li>
    <li><a href="#D">D</a></li>
    <li><a href="#E">E</a></li>
    <li><a href="#F">F</a></li>
    <li><a href="#G">G</a></li>
    <li><a href="#H">H</a></li>
    <li><a href="#I">I</a></li>
    <li><a href="#J">J</a></li>
    <li><a href="#K">K</a></li>
    <li><a href="#L">L</a></li>
    <li><a href="#M">M</a></li>
    <li><a href="#N">N</a></li>
    <li><a href="#O">O</a></li>
    <li><a href="#P">P</a></li>
    <li><a href="#Q">Q</a></li>
    <li><a href="#R">R</a></li>
    <li><a href="#S">S</a></li>
    <li><a href="#T">T</a></li>
    <li><a href="#U">U</a></li>
    <li><a href="#V">V</a></li>
    <li><a href="#W">W</a></li>
    <li><a href="#X">X</a></li>
    <li><a href="#Y">Y</a></li>
    <li><a href="#Z">Z</a></li>
</ul>
<div id="schoollist-left-col">
    <asp:Repeater ID="repeatColLeft" runat="server">
        <ItemTemplate>
        <div class="az-school">
            <b id="<%# Container.DataItem %>"><%# Container.DataItem %></b>
            <ul>
                <asp:Repeater ID="repeatSchoolList" runat="server">
                    <ItemTemplate>
                        <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>"><%#Eval("schoolname") %></a>, <%#Eval("state") %>, <%#Eval("country") %></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>        
        </ItemTemplate>
    </asp:Repeater>

</div>
<div id="schoollist-right-col">
    <asp:Repeater ID="repeatColRight" runat="server">
        <ItemTemplate>
        <div class="az-school">
            <b id="<%# Container.DataItem %>"><%# Container.DataItem %></b>
            <ul>
                <asp:Repeater ID="repeatSchoolList" runat="server">
                    <ItemTemplate>
                        <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>"><%#Eval("schoolname") %></a>, <%#Eval("state") %>, <%#Eval("country") %></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>        
        </ItemTemplate>
    </asp:Repeater>
</div>