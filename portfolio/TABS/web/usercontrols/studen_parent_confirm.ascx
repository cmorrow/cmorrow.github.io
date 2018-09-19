<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="studen_parent_confirm.ascx.cs" Inherits="TABS_UserControls.usercontrols.studen_parent_confirm" %>
<!-- Start Control -->
<div class="both1812 auto-m confirmation">
      <div class="asia-header both1812 floatclear">
          <img class="left" src="/resources/images/asiafair_h.gif" alt="" />
          <img src="/resources/images/asia-banner.gif" alt="" class="conf-img right" />
      </div>
      <div>
          <p>Please print this confirmation, and bring it with you to the fair. Families with confirmation letters will gain quicker entry into the fair. We advise making at least 20 copies of the confirmation letter to leave with each school representative you visit. Be sure to bring plenty of business cards.</p>
          <h5>Fair Information</h5>
          <table border="0" style="color:Black;">
              <tr>
                  <td><b>Confirmation Number</b></td>
                  <td colspan="3">
                  <asp:Label ID="lbConfirmNumber" runat="server" Text=""></asp:Label>
                  <asp:Label ID="lblMsg" runat="server" ForeColor="Red" Text=""></asp:Label>
                  </td>
              </tr>
              <tr>
                  <td colspan="4">You have registered for the fair:</td>
              </tr>
              <tr>
                   <td colspan="4"><asp:Label ID="lbFairDay" runat="server" Text=""></asp:Label>,
                        <asp:Label ID="lbFairDate" runat="server" Text=""></asp:Label>,
                        <asp:Label ID="lbStartTime" runat="server" Text=""></asp:Label>&nbsp;-&nbsp;
                        <asp:Label ID="lbEndTime" runat="server" Text=""></asp:Label>
                   </td>
              </tr>
              <tr>
                  <td colspan="4"><asp:Label ID="lbFairCity" runat="server" Text="" />,&nbsp;
                  <asp:Label ID="lbFairCountry" runat="server" Text="" />
                  </td>
            </tr>
              <tr>
                  <td colspan="4">
                        <asp:Label ID="lbFairHotel" runat="server" Text=""></asp:Label>
                  </td>
            </tr>
              <tr>
                  <td colspan="4">
                        <table>
                              <tr>
                                    <td colspan="5"><b>Student Information</b></td>
                              </tr>
                              <tr>
                                    <td></td>
                                    <td>Family Name</td>
                                    <td>Given Name</td>
                                    <td>Age</td>
                                    <td>Gender</td>
                              </tr>
                              <tr>
                                    <td>1</td>
                                    <td><asp:Label ID="lbStudFamilyName1" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudGivenName1" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudAge1" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudGender1" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                    <td>2</td>
                                    <td><asp:Label ID="lbStudFamilyName2" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudGivenName2" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudAge2" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudGender2" runat="server" Text=""></asp:Label></td>
                              </tr>
                              <tr>
                                    <td>3</td>
                                    <td><asp:Label ID="lbStudFamilyName3" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudGivenName3" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudAge3" runat="server" Text=""></asp:Label></td>
                                    <td><asp:Label ID="lbStudGender3" runat="server" Text=""></asp:Label></td>
                              </tr>
                       </table>
                  </td>
              </tr>
              <tr>
                  <td colspan="4"><b>Parent Information</b></td>
              </tr>
              <tr>
                  <td colspan=4><asp:Label ID="lbTitle" runat="server" Text=""></asp:Label>&nbsp;
                      <asp:Label ID="lbFamilyName" runat="server" Text=""></asp:Label>&nbsp;
                      <asp:Label ID="lbGivenName" runat="server" Text=""></asp:Label></td>
              </tr>

              <tr>
                  <td colspan="4"><asp:Label ID="lbAddress1" runat="server" Text=""></asp:Label></td>
              </tr>
               <tr>
                  <td colspan="4"><asp:Label ID="lbAddress2" runat="server" Text=""></asp:Label></td>
              </tr>
              <tr>
                  <td colspan="4"><asp:Label ID="lbCity" runat="server" Text=""></asp:Label>, &nbsp;
                     <asp:Label ID="lbState" runat="server" Text=""></asp:Label>&nbsp;
                     <asp:Label ID="lbZip" runat="server" Text=""></asp:Label></td>
              </tr>
              <tr>
                  <td colspan="4"><asp:Label ID="lbCountry" runat="server" Text=""></asp:Label></td>
              </tr>
              <tr>
                  <td colspan="4"><asp:Label ID="lbPhone" runat="server" Text=""></asp:Label></td>
              </tr>
              <tr>
                  <td colspan="4"><asp:Label ID="lbEmail" runat="server" Text=""></asp:Label></td>
              </tr>
          </table>
          <p>* Attach Business Card Here<br/><br/><br/><br/><br/><br/><br/><br/><br/></p>
          <p>Return to <a href="/find-a-school/explore-your-options/asian-fairs/asia-fairs.aspx">Asia Fairs</a>

      </div>
</div>
<!-- End Control -->