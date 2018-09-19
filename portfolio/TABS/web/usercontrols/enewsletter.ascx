<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="enewsletter.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.enewsletter" %>
<asp:MultiView ID="newsletterView" runat="server" ActiveViewIndex="0">
  <asp:View ID="currentView" runat="server">
    <asp:Repeater ID="newsletterRep" runat="server">
      <ItemTemplate>
        <h3>
          <asp:Label ID="lblTitle" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>'
            runat="server"></asp:Label></h3>
        <b>Latest Issue:
          <asp:Label ID="lblDate" Text='<%# DataBinder.Eval(Container.DataItem, "createddate") %>'
            runat="server"></asp:Label></b>
        <p>
          <asp:Literal ID="literalBody" Text='<%# DataBinder.Eval(Container.DataItem, "body") %>'
            runat="server"></asp:Literal></p>
      </ItemTemplate>
    </asp:Repeater>
  </asp:View>
  <asp:View ID="archiveView" runat="server">
    <asp:Repeater ID="newsletterRep2" runat="server">
      <ItemTemplate>
        <h3>
          <asp:Label ID="lblTitle" Text='<%# DataBinder.Eval(Container.DataItem, "title") %>'
            runat="server"></asp:Label></h3>
        <b>Archived Issue:
          <asp:Label ID="lblDate" Text='<%# DataBinder.Eval(Container.DataItem, "createddate") %>'
            runat="server"></asp:Label></b>
        <p>
          <asp:Literal ID="literalBody" Text='<%# DataBinder.Eval(Container.DataItem, "body") %>'
            runat="server"></asp:Literal></p>
      </ItemTemplate>
    </asp:Repeater>
            <p>
          <asp:LinkButton ID="viewCurrent" runat="server" Text="See Latest Issue" 
                onclick="viewCurrent_Click"></asp:LinkButton></p>

  </asp:View>
</asp:MultiView>
