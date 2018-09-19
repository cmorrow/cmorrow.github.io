<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="tabs_news.ascx.cs" Inherits="TABS_UserControls.usercontrols.tabs_news" %>

<script type="text/javascript" charset="utf-8">
	$(document).ready(function(){
		tabsQueryCheck();
	});
</script>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>
<div id="school-tabs" class="floatclear">
    <ul class="conf-tabs-ul news">
        <li class="active"><a href="#library1"><span>TABS news</span></a></li>
        <li><a href="#library2"><span>school news</span></a></li>
        <li><a href="#library3"><span>web news</span></a></li>
        <div class="clear"></div>
    </ul>  
    <div id="library1" class="w550 floatclear">
        <asp:Repeater ID="repeatTABSNews" runat="server">
            <ItemTemplate>
                <div>
                    <%#ReturnFormattedDate(Eval("publishdate").ToString())%><br />
                    <h3><a href="/about-tabs/about-us/tabs-news/articles.aspx?section=tabs&id=<%#Eval("tabsnewsid") %>"><%#Eval("headline") %></a></h3>
                    <p><%#Eval("summary") %></p><br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div id="library2" class="w550 floatclear">
        <table>
            <tr>
                <td><b>Date</b></td>
                <td><b>Article</b></td>
                <td><b>Source</b></td>
            </tr>
            <asp:Repeater ID="repeatSchoolNews" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%#ReturnFormattedDate(Eval("publishdate").ToString())%></td>
                        <td><a href="<%#Eval("url") %>" target="_blank"><%#Eval("headline") %></a></td>
                        <td><%#Eval("source") %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><%#Eval("summary") %></td>
                        <td></td>
                    </tr>
                    <tr><td colspan="3">&nbsp;</td></tr>        
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
    <div id="library3" class="w550 floatclear">
        <table>
            <tr>
                <td><b>Date</b></td>
                <td><b>Article</b></td>
                <td><b>Source</b></td>
            </tr>
            <asp:Repeater ID="repeatWebNews" runat="server">
                <ItemTemplate>
                    <tr>
                        <td><%# ReturnFormattedDate(Eval("publishdate").ToString())%></td>
                        <td><a href="<%#Eval("url") %>" target="_blank"><%#Eval("headline") %></a></td>
                        <td><%#Eval("source") %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><%#Eval("summary") %></td>
                        <td></td>
                    </tr>        
                    <tr><td colspan="3">&nbsp;</td></tr>        
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
</ContentTemplate>
</asp:UpdatePanel>

