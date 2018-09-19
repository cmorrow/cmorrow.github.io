<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="schoolprofile.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.schoolprofile" %>
<asp:Repeater ID="repeatSchoolProfile" runat="server">
  <ItemTemplate>
    <asp:Image ID="profileimage" runat="server" AlternateText="" CssClass="left" Width="170" />
    <div class="school-detail no-width">
      <h1>
        <%#Eval("schoolname") %></h1>
      <p>
        <b>
          <%#Eval("city") %>,
          <%#Eval("state") %>,
          <%#Eval("country") %></b> <a href="http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=<%#Eval("address1") %>,<%#Eval("city") %>,<%#Eval("state") %>,<%#Eval("zip") %>,<%#Eval("country") %>"
            target="_blank">view map</a><br />
        <b>
        <asp:Label ID="lblSchoolTypes" runat="server"></asp:Label>
        </b></p>
      <p>
        <%#Eval("shortdescription") %></p>
    </div>
    <div class="profile-photo">

      <script language="JavaScript" type="text/javascript">
        AC_FL_RunContent(
		            'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0',
		            'width', '625',
		            'height', '407',
		            'src', 'school_profile',
		            'quality', 'high',
		            'pluginspage', 'http://www.adobe.com/go/getflashplayer',
		            'align', 'middle',
		            'play', 'true',
		            'loop', 'true',
		            'scale', 'showall',
		            'wmode', 'opaque',
		            'devicefont', 'false',
		            'id', 'school_profile',
		            'bgcolor', '#000000',
		            'name', 'school_profile',
		            'menu', 'true',
		            'allowFullScreen', 'true',
		            'allowScriptAccess', 'sameDomain',
		            'movie', '/resources/flash/school_profile',
		            'salign', '',
		            'FlashVars', 'schoolid=<%#Eval("schoolid")%>'
		            ); //end AC code
      </script>

      <noscript>
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=10,0,0,0"
          width="625" height="407" id="school_profile" align="middle">
          <param name="allowScriptAccess" value="sameDomain" />
          <param name="allowFullScreen" value="false" />
          <param name="movie" value="/resources/flash/school_profile.swf" />
          <param name="quality" value="high" />
          <param name="bgcolor" value="#000000" />
          <embed src="/resources/flash/school_profile.swf" quality="high" bgcolor="#000000"
            width="625" height="407" name="flash/school_profile" align="middle" allowscriptaccess="sameDomain"
            allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
        </object>
      </noscript>
    </div>
    <div class="left no-width">
      <p>
        <b>
          <%#Eval("address1") %>
          <%#Eval("address2") %><br />
          <%#Eval("city") %>,
          <%#Eval("state") %>,
          <%#Eval("country") %>,
          <%#Eval("zip") %><br />
          <%#Eval("phone") %></b></p>
    </div>
    <a id="contactschoollink" runat="server" href="" class="right">
      <img src="/resources/images/contact-school.gif" alt="" /></a>
    <div class="contact-phone left">
      <p class="left">
        <b>Director of Admission:</b>
        <%#Eval("directorfirstname") %>
        <%#Eval("directorlastname") %><br />
        <b>Admissions Phone:</b>
        <%#Eval("admissionphone") %>
        <b class="left5">Toll-Free Admissions:</b>
        <%#Eval("admission800") %>
        <b class="left5">Fax:</b>
        <%#Eval("fax") %><br />
        <b>Email:</b>
        <asp:HyperLink ID="schoolemail" runat="server" NavigateUrl='<%# "mailto:" + Eval("email") %>'
          Text='<%#Eval("email") %>'></asp:HyperLink>
        <b class="left5">Website:</b>
        <asp:HyperLink ID="schoolweb" runat="server" NavigateUrl='<%#Eval("web") %>' Target="_blank"
          Text='<%#Eval("web") %>'></asp:HyperLink>
      </p>
    </div>
  </ItemTemplate>
</asp:Repeater>
