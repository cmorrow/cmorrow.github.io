<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="send_idea.ascx.cs" Inherits="TABS_UserControls.usercontrols.send_idea" %>
<div class="formBox">
	<div class="top"><div class="left"></div><div class="right"></div></div>
	<div class="middle">
	  <table class="contact-us" cellpadding="3">
	    <tr>
	      <td class="bold">Institution</td>
	      <td>
	        <asp:Label ID="lblSchoolName" runat="server"></asp:Label>
	      </td>
	    </tr>
	    <tr>
	      <td class="bold">
	        Full Name
	      </td>
	      <td>
	        <asp:Label ID="lblFullName" runat="server"></asp:Label>
	      </td>
	    </tr>
	    <tr>
	      <td class="bold">
	        Job Title
	      </td>
	      <td>
	        <asp:Label ID="lblJob" runat="server"></asp:Label>
	      </td>
	    </tr>
	    <tr>
	      <td class="bold">
	        Email Address
	      </td>
	      <td>
	        <asp:Label ID="lblEmail" runat="server"></asp:Label>
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2" class="bold">
	        *Idea/Comment
	      </td>
	    </tr>
	    <tr>
	      <td colspan="2">
	        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="207px" Width="502px"></asp:TextBox>
	      </td>
	    </tr>
	    <tr>
	      <td>
	        <asp:Button ID="btnSubmit" runat="server" class="btn" Text="Submit" OnClick="btnSubmit_Click" />
	      </td>
	      <td colspan="2">
	      </td>
	    </tr>
	  </table>
	</div>
	<!-- end middle -->
	<div class="bottom"><div class="left"></div><div class="right"></div></div>
</div>
<!-- end formBox -->
