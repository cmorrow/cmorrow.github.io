<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="corporate_sponsors.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.corporate_sponsors" %>
<div>
  <table class="search-this-list left" width="100%">
    <tr align="left">
      <td width="15%">
        <b>Search This List</b>
      </td>
      <td width="5%">
        <asp:TextBox ID="txtSearchBox" runat="server"></asp:TextBox>
      </td>
      <td width="10%">
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
      </td>
      <td width="70%">
        <asp:LinkButton ID="showBtn" runat="server" Text="Show All" OnClick="showBtn_Click"></asp:LinkButton>
      </td>
    </tr>
  </table>
</div>
<div>
  <h3 id="sighead" runat="server">
    Signature Level Sponsors</h3>
</div>
<div class="floatclear">
  <asp:Repeater ID="sigcorpsponsorRep" runat="server">
    <ItemTemplate>
      <div class="corp-box floatclear">
        <a name='<%# DataBinder.Eval(Container.DataItem, "companyname") %>'></a>
        <div class="left">
          <asp:Image ID="logoboarding" Width="125px" Height="125px" ImageUrl='<%# "~/resources/images/sponsors/" + DataBinder.Eval(Container.DataItem, "imagepath") %>'
            runat="server" />
        </div>
        <div class="right">
          <h4>
            <%# DataBinder.Eval(Container.DataItem, "companyname") %></h4>
          <a href='<%# ShowURL(DataBinder.Eval(Container.DataItem, "url").ToString()) %>' target="_blank">
            <%# DataBinder.Eval(Container.DataItem, "url") %></a>
          <p>
            <%# DataBinder.Eval(Container.DataItem, "description") %></p>
          <p>
            <b>Primary Contact:</b>
            <asp:Literal ID="name" runat="server" Text='<%# Eval("firstname","") + " " + Eval("lastname","") %>' />
            ,
            <%# DataBinder.Eval(Container.DataItem, "title") %>,
            <%# DataBinder.Eval(Container.DataItem, "officephone") %>, <a href='<%# "mailto:" + DataBinder.Eval(Container.DataItem, "email") %>'>
              <%# DataBinder.Eval(Container.DataItem, "email") %></a></p>
          <p>
            <asp:Literal ID="address" runat="server" Text='<%# Eval("address1","") + " " + Eval("address2","") %>' />,
            <asp:Literal ID="location" runat="server" Text='<%# Eval("city","") + " " + Eval("state","") + " " + Eval("zip","") %>' /></p>
          <p>
            T:
            <%# DataBinder.Eval(Container.DataItem, "officephone") + " " + IsNull(DataBinder.Eval(Container.DataItem,"ext").ToString()) %></p>
        </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>
</div>
<div>
  <h3 id="redhead" runat="server">
    Red Level Sponsors</h3>
</div>
<div class="floatclear">
  <asp:Repeater ID="redcorpsponsorRep" runat="server">
    <ItemTemplate>
      <div class="corp-box floatclear">
        <a name='<%# DataBinder.Eval(Container.DataItem, "companyname") %>'></a>
        <div class="left">
          <asp:Image ID="logoboarding" Width="125px" Height="125px" ImageUrl='<%# "~/resources/images/sponsors/" + DataBinder.Eval(Container.DataItem, "imagepath") %>'
            runat="server" />
        </div>
        <div class="right">
          <h4>
            <%# DataBinder.Eval(Container.DataItem, "companyname") %></h4>
          <a href='<%# ShowURL(DataBinder.Eval(Container.DataItem, "url").ToString()) %>' target="_blank">
            <%# DataBinder.Eval(Container.DataItem, "url") %></a>
          <p>
            <%# DataBinder.Eval(Container.DataItem, "description") %></p>
          <p>
            <b>Primary Contact:</b>
            <asp:Literal ID="name" runat="server" Text='<%# Eval("firstname","") + " " + Eval("lastname","") %>' />
            ,
            <%# DataBinder.Eval(Container.DataItem, "title") %>,
            <%# DataBinder.Eval(Container.DataItem, "officephone") %>, <a href='<%# "mailto:" + DataBinder.Eval(Container.DataItem, "email") %>'>
              <%# DataBinder.Eval(Container.DataItem, "email") %></a></p>
          <p>
            <asp:Literal ID="address" runat="server" Text='<%# Eval("address1","") + " " + Eval("address2","") %>' />,
            <asp:Literal ID="location" runat="server" Text='<%# Eval("city","") + " " + Eval("state","") + " " + Eval("zip","") %>' /></p>
          <p>
            T:
            <%# DataBinder.Eval(Container.DataItem, "officephone") + " " + IsNull(DataBinder.Eval(Container.DataItem,"ext").ToString()) %></p>
        </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>
</div>
