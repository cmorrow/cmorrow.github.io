<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="add_school_news.ascx.cs" Inherits="TABS_UserControls.usercontrols.add_school_news" %>

<div class="pad-bread left">
                        <div class="left">
                            <ul class="breadcrumb addjob-bread">
                                <li>add news listing /</li>
                                <li class="selected">&lt;news title&gt;</li>
                            </ul>
                        </div>
                        <a href="/for-schools/edit-school-profile.aspx" class="right">Cancel and Return to Profile</a>
                    </div>
                    <div>
                        <div class="edit-event">
                            <table width="650px" class="event-news auto-m">
                            <tr>
                                <td><h5>Headline:</h5><span>*</span></td>
                                <td class="edit-400"><asp:TextBox ID="txtHeadline" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><h5>Source:</h5></td>
                                <td class="edit-400"><asp:TextBox ID="txtSource" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><h5>URL:</h5><span>*</span></td>
                                <td class="edit-400"><asp:TextBox ID="txtUrl" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td><h5>Pub. Date:</h5><span>*</span></td>
                                <td class="edit-400"><asp:TextBox ID="txtDate" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td><h5>Summary:</h5><span>*</span></td>
                                        </tr>
                                        <tr>
                                            <td><p>Enter a summary that is<br />100 characters max</p></td>
                                        </tr>
                                    </table>
                                </td>
                                <td><asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" 
                                    Width="300px" Height="150px" MaxLength="100"></asp:TextBox></td>
                            </tr>
                        </table>
                        
                        <div class="edit-submit-box left">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="edit-save" 
                              onclick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="edit-reset" 
                              onclick="btnCancel_Click" />
                        </div>
                        </div>
                    </div>