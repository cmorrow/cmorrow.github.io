<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="schoolprofile_tabbed.ascx.cs"
  Inherits="TABS_UserControls.usercontrols.schoolprofile_tabbed" %>
<!-- Tabs -->
<ul class="idtabs">
  <li id="glaceTab" runat="server"><a class="left" href="#at-glance" id="at-glance-tab">
    at a glance</a><a href="#at-glance" class="right"></a></li>
  <li id="academicTab" runat="server"><a class="left" href="#academics" id="academics-tab">
    academics</a><a href="#academics" class="right"></a></li>
  <li id="campusTab" runat="server"><a class="left" href="#campus-life" id="campus-tab">
    campus life</a><a href="#campus-life" class="right"></a></li>
  <li id="artTab" runat="server"><a class="left" href="#arts-athletics" id="arts-tab">
    arts &amp; athletics</a><a href="#arts-athletics" class="right"></a></li>
  <li id="collegeTab" runat="server"><a class="left" href="#college-info" id="college-tab">
    college info</a><a href="#college-info" class="right"></a></li>
  <li id="summerTab" runat="server"><a class="left" href="#summer-programs" id="summer-tab">
    summer programs</a><a href="#summer-programs" class="right"></a></li>
  <li id="literalCustomTab" runat="server"><a class="left" href="#custom-tabs" id="custom-tab">
    <asp:Label ID="lblCustomName" runat="server"></asp:Label></a><a href="#custom-tabs"
      class="right"></a></li>
</ul>
<!-- Glance -->
<div id="at-glance">
  <div class="container-box zero">
    <div class="bt">
      &nbsp;</div>
    <div class="bm left both1812">
      <div class="bl left full">
        <!-- data container -->
        <asp:Repeater ID="repeatGlance" runat="server">
          <ItemTemplate>
            <div class="floatclear">
              <asp:Image ID="imageGlance" runat="server" CssClass="left" Width="300" />
              <div class="left nobull">
                <ul>
                  <li><b>Founded:</b>
                    <%#Eval("founded") %></li>
                  <li><b>Campus Size:</b>
                    <%#Eval("size") %>
                    acres</li>
                  <li><b>Grades Offered:</b>
                    <%#Eval("boardgraderange") %></li>
                  <li><b>Accredited by:</b>
                    <%#Eval("accredit1") %></li>
                </ul>
                <h5>
                  student body</h5>
                <table class="school-table" cellspacing="0" cellpadding="4px">
                  <tr>
                    <th>
                    </th>
                    <th class="tb">
                      Boarding<br />
                      <span>Grades
                        <%#Eval("boardgraderange") %></span>
                    </th>
                    <th class="tb">
                      Day<br />
                      <span>Grades
                        <%#Eval("daygraderange") %></span>
                    </th>
                    <th class="tb">
                      Total
                    </th>
                  </tr>
                  <tr>
                    <th>
                      Girls
                    </th>
                    <td class="tb">
                      <%#Eval("girlsboard") %>
                    </td>
                    <td class="tb">
                      <%#Eval("girlsday") %>
                    </td>
                    <td class="tb">
                      <asp:Literal ID="literalGirlsTotal" runat="server" />
                    </td>
                  </tr>
                  <tr>
                    <th>
                      Boys
                    </th>
                    <td class="tb">
                      <%#Eval("boysboard") %>
                    </td>
                    <td class="tb">
                      <%#Eval("boysday") %>
                    </td>
                    <td class="tb">
                      <asp:Literal ID="literalBoysTotal" runat="server" />
                    </td>
                  </tr>
                  <tr>
                    <th>
                      Total
                    </th>
                    <td>
                      <asp:Literal ID="literalBoard" runat="server" />
                    </td>
                    <td>
                      <asp:Literal ID="literalDay" runat="server" />
                    </td>
                    <td class="total-span">
                      <asp:Literal ID="literalTotal" runat="server" />
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <div class="three-col left fs-section">
              <div class="left">
                <h5>
                  admission</h5>
                <ul>
                  <li><b>Application Deadline:</b>
                    <%# DBToDate(Eval("admissiondate").ToString()) %></li>
                  <li><b>Application Fee:</b>
                    <%# DBToMoney(Eval("applicationfee").ToString())%></li>
                  <li><b>Accept TABS Admission Application:</b>
                    <asp:Literal ID="literalTABSApplication" runat="server" Text="No" /></li>
                </ul>
              </div>
              <div class="left">
                <h5>
                  tuition and financial aid</h5>
                <ul>
                  <li><b>7-Day Boarding:</b>
                    <%# DBToMoney(Eval("7daytuition").ToString()) %></li>
                  <li><b>5-Day Boarding:</b>
                    <%# DBToMoney(Eval("5daytuition").ToString())%></li>
                  <li class="li-space"><b>Day Tuition Fee:</b>
                    <%# DBToMoney(Eval("daytuition").ToString())%></li>
                  <li class="li-space"><b>Payment Plans:</b>
                    <asp:Literal ID="literalPaymentPlans" runat="server" Text="Not Offered" /></li>
                  <li><b>Need-Based Aid:</b>
                    <asp:Literal ID="literalNeedAid" runat="server" Text="Not Offered" /></li>
                  <li><b>% Students Receiving Aid:</b>
                    <%#DBToPercentage(Eval("needaidpercentage").ToString()) %>%</li>
                  <li><b>Average Awarded:</b>
                    <%# DBToMoney((Eval("needaidaverage").ToString()))%></li>
                </ul>
              </div>
              <asp:Panel ID="schoolfinancediv" runat="server" CssClass="left">
                <h5>
                  school finances</h5>
                <ul>
                  <li><b>Merit Scholarships:</b>
                    <asp:Literal ID="literalMerit" runat="server" Text="Not Available" /></li>
                  <li><b>% Students Receiving Merit Scholarships:</b>
                    <%#DBToPercentage(Eval("meritpercentage").ToString()) %>%</li>
                  <li class="li-space"><b>Average Merit Scholarship:</b>
                    <%# DBToMoney(Eval("meritaverage").ToString())%></li>
                  <li><b>Current Endowment:</b>
                    <%# DBToMoney(Eval("currentendowment").ToString())%></li>
                  <li><b>Per Student Endowment:</b>
                    <%#DBToMoney(Eval("studentendowment").ToString())%></li>
                </ul>
              </asp:Panel>
<%--              <div class="left">
              </div>
--%>            </div>
          </ItemTemplate>
        </asp:Repeater>
        <!-- call out -->
        <div class="bottom-callout fs-section left">
          <div class="callout1 left">
            <div class="callout1-btn">
              <a href="/school-browser.aspx">school explorer</a>
            </div>
            <div class="callout1-btn2">
              <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
            </div>
          </div>
          <a href="/find-a-school/explore-your-options/contact-schools.aspx">
            <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
              <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                <img src="/resources/images/howtoapply.jpg" alt="" /></a>
        </div>
      </div>
    </div>
    <div class="bb clear">
      &nbsp;</div>
  </div>
</div>
<!-- Academics -->
<div id="academics">
  <div class="container-box zero">
    <div class="bt">
      &nbsp;</div>
    <div class="bm left both1812">
      <div class="bl left full">
        <!-- data container -->
        <asp:Repeater ID="repeatAcademics" runat="server">
          <ItemTemplate>
            <asp:Image ID="imageAcademics" runat="server" CssClass="left" Width="300" />
            <div class="left nobull">
              <p>
                <%#Eval("summary") %></p>
              <div class="school-pro-val">
                <p>
                  Department Director: <span>
                    <%#CheckEmptyString(Eval("directorfirstname").ToString() + " " + Eval("directorlastname").ToString())%>
                  </span>
                </p>
                <p>
                  Average Class Size: <span>
                    <%#CheckEmptyString(Eval("classsize").ToString())%></span></p>
                <p>
                  Full Time Teachers: <span>
                    <%#CheckEmptyString(Eval("fulltimeteacher").ToString()) %></span></p>
                <!--
                                <p>Full Time Teachers: <span>[field not defined]%</span></p>
                                -->
                <p>
                  Student/Teacher Ratio: <span>
                    <%#CheckEmptyString(Eval("studentteacherratio").ToString()) %></span></p>
                <p>
                  Saturday Classes: <span>
                    <%#DetermineYesorNo(Eval("saturday").ToString())%></span></p>
                <p>
                  Summer Programs Offered: <span>
                    <%#DetermineStatus(Eval("summer").ToString())%></span></p>
                <p>
                  Number of AP Courses Offered: <span>
                    <%#CheckEmptyString(Eval("apcourses").ToString()) %></span></p>
                <p>
                  Notable Achievements: <span>
                    <%#CheckEmptyString(Eval("noteworthy").ToString()) %></span></p>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <!-- static links -->
        <div class="three-col left fs-section">
          <div class="left">
            <h5>
              Advanced/Enrichment Programs</h5>
            <ul>
              <asp:Label ID="achead0" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalAV_5Day" runat="server" Visible="false"><li>5-Day Boarding</li></asp:Literal>
              <asp:Literal ID="literalAV_AP" runat="server" Visible="false"><li>AP Courses</li></asp:Literal>
              <asp:Literal ID="literalAV_BCC" runat="server" Visible="false"><li>Baccalaureate</li></asp:Literal>
              <asp:Literal ID="literalAV_DL" runat="server" Visible="false"><li>Distance Learning</li></asp:Literal>
              <asp:Literal ID="literalAV_IN" runat="server" Visible="false"><li>International</li></asp:Literal>
              <asp:Literal ID="literalav_PGY" runat="server" Visible="false"><li>Post Graduate Year</li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <h5>
              Support Programs</h5>
            <ul>
              <asp:Label ID="achead1" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalSP_ADS" runat="server" Visible="false"><li>ADD/ADHD Support</li></asp:Literal>
              <asp:Literal ID="literalSP_AS" runat="server" Visible="false"><li>Assitance</li></asp:Literal>
              <asp:Literal ID="literalSP_CC" runat="server" Visible="false"><li>College Consulting</li></asp:Literal>
              <asp:Literal ID="literalSP_ESLB" runat="server" Visible="false"><li>ESL: Beginning</li></asp:Literal>
              <asp:Literal ID="literalSP_ESLI" runat="server" Visible="false"><li>ESL: Intermediate</li></asp:Literal>
              <asp:Literal ID="literalSP_ESLA" runat="server" Visible="false"><li>ESL: Advanced</li></asp:Literal>
              <asp:Literal ID="literalSP_ES" runat="server" Visible="false"><li>Evening Study</li></asp:Literal>
              <asp:Literal ID="literalSP_LC" runat="server" Visible="false"><li>Learning Center</li></asp:Literal>
              <asp:Literal ID="literalSP_LD" runat="server" Visible="false"><li>Learning Differences</li></asp:Literal>
              <asp:Literal ID="literalSP_PT" runat="server" Visible="false"><li>Peer Tutoring</li></asp:Literal>
              <asp:Literal ID="literalSP_SSA" runat="server" Visible="false"><li>Study Skills Assistance</li></asp:Literal>
              <asp:Literal ID="literalSP_ST" runat="server" Visible="false"><li>Subject Tutoring</li></asp:Literal>
              <asp:Literal ID="literalSP_SPT" runat="server" Visible="false"><li>Support</li></asp:Literal>
              <asp:Literal ID="literalSP_TC" runat="server" Visible="false"><li>Technology Center</li></asp:Literal>
              <asp:Literal ID="literalSP_WC" runat="server" Visible="false"><li>Writing Center</li></asp:Literal>
            </ul>
          </div>
        </div>
        <div class="three-col left fs-section">
          <div class="left">
            <h5>
              English:</h5>
            <ul>
              <asp:Label ID="achead2" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalAPE_CLS" runat="server" Visible="false"><li>Classics </li></asp:Literal>
              <asp:Literal ID="literalAPE_CW" runat="server" Visible="false"><li>Creative Writing </li></asp:Literal>
              <asp:Literal ID="literalAPE_HN" runat="server" Visible="false"><li>Honors </li></asp:Literal>
              <asp:Literal ID="literalAPE_LT" runat="server" Visible="false"><li>Literature </li></asp:Literal>
              <asp:Literal ID="literalAPE_PW" runat="server" Visible="false"><li>Playwriting </li></asp:Literal>
              <asp:Literal ID="literalAPE_PET" runat="server" Visible="false"><li>Poetry </li></asp:Literal>
            </ul>
            <h5>
              History:</h5>
            <ul>
              <asp:Label ID="achead3" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalHST_AH" runat="server" Visible="false"><li>Asian History </li></asp:Literal>
              <asp:Literal ID="literalHST_CH" runat="server" Visible="false"><li>Classical History </li></asp:Literal>
              <asp:Literal ID="literalHST_EH" runat="server" Visible="false"><li>European History </li></asp:Literal>
              <asp:Literal ID="literalHST_HNS" runat="server" Visible="false"><li>Honors </li></asp:Literal>
              <asp:Literal ID="literalHST_MH" runat="server" Visible="false"><li>Medieval History </li></asp:Literal>
              <asp:Literal ID="literalHST_USH" runat="server" Visible="false"><li>United States History </li></asp:Literal>
              <asp:Literal ID="literalHST_WH" runat="server" Visible="false"><li>World History </li></asp:Literal>
            </ul>
            <h5>
              Foreign Languages:</h5>
            <ul>
              <asp:Label ID="achead4" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalFR_CM" runat="server" Visible="false"><li>Chinese-Mandarin </li></asp:Literal>
              <asp:Literal ID="literalFR_CC" runat="server" Visible="false"><li>Chinese-Cantonese </li></asp:Literal>
              <asp:Literal ID="literalFR_FR" runat="server" Visible="false"><li>French </li></asp:Literal>
              <asp:Literal ID="literalFR_GM" runat="server" Visible="false"><li>German </li></asp:Literal>
              <asp:Literal ID="literalFR_IT" runat="server" Visible="false"><li>Italian </li></asp:Literal>
              <asp:Literal ID="literalFR_JP" runat="server" Visible="false"><li>Japanese </li></asp:Literal>
              <asp:Literal ID="literalFR_RS" runat="server" Visible="false"><li>Russian </li></asp:Literal>
              <asp:Literal ID="literalFR_SP" runat="server" Visible="false"><li>Spanish </li></asp:Literal>
              <asp:Literal ID="literalFR_GR" runat="server" Visible="false"><li>Greek </li></asp:Literal>
              <asp:Literal ID="literalFR_LT" runat="server" Visible="false"><li>Latin </li></asp:Literal>
            </ul>
            <h5>
              Religion/Philosophy:</h5>
            <ul>
              <asp:Label ID="achead5" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalRP_TB" runat="server" Visible="false"><li>The Bible </li></asp:Literal>
              <asp:Literal ID="literalRP_ET" runat="server" Visible="false"><li>Ethics </li></asp:Literal>
              <asp:Literal ID="literalRP_FT" runat="server" Visible="false"><li>Faith </li></asp:Literal>
              <asp:Literal ID="literalRP_MP" runat="server" Visible="false"><li>Moral Philosophy </li></asp:Literal>
              <asp:Literal ID="literalRP_MT" runat="server" Visible="false"><li>Mythology </li></asp:Literal>
              <asp:Literal ID="literalRP_PS" runat="server" Visible="false"><li>Philosophy </li></asp:Literal>
              <asp:Literal ID="literalRP_RS" runat="server" Visible="false"><li>Religious Studies </li></asp:Literal>
              <asp:Literal ID="literalRP_SJ" runat="server" Visible="false"><li>Social Justice </li></asp:Literal>
              <asp:Literal ID="literalRP_TE" runat="server" Visible="false"><li>Theology </li></asp:Literal>
              <asp:Literal ID="literalRP_WR" runat="server" Visible="false"><li>World Religions </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <h5>
              Humanities/Social Sciences:</h5>
            <ul>
              <asp:Label ID="achead6" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalHSS_AT" runat="server" Visible="false"><li>Anthropology </li></asp:Literal>
              <asp:Literal ID="literalHSS_ECN" runat="server" Visible="false"><li>Economics </li></asp:Literal>
              <asp:Literal ID="literalHSS_PC" runat="server" Visible="false"><li>Psychology </li></asp:Literal>
              <asp:Literal ID="literalHSS_SC" runat="server" Visible="false"><li>Sociology </li></asp:Literal>
            </ul>
            <h5>
              Sciences:</h5>
            <ul>
              <asp:Label ID="achead7" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalSCI_ANT" runat="server" Visible="false"><li>Anatomy </li></asp:Literal>
              <asp:Literal ID="literalSCI_AB" runat="server" Visible="false"><li>Animal Behavior </li></asp:Literal>
              <asp:Literal ID="literalSCI_AST" runat="server" Visible="false"><li>Astronomy </li></asp:Literal>
              <asp:Literal ID="literalSCI_ASTP" runat="server" Visible="false"><li>Astrophysics </li></asp:Literal>
              <asp:Literal ID="literalSCI_BIO" runat="server" Visible="false"><li>Biology </li></asp:Literal>
              <asp:Literal ID="literalSCI_BIOTEC" runat="server" Visible="false"><li>Biotechnology </li></asp:Literal>
              <asp:Literal ID="literalSCI_BOT" runat="server" Visible="false"><li>Botany </li></asp:Literal>
              <asp:Literal ID="literalSCI_CHM" runat="server" Visible="false"><li>Chemistry </li></asp:Literal>
              <asp:Literal ID="literalSCI_ES" runat="server" Visible="false"><li>Earth Science </li></asp:Literal>
              <asp:Literal ID="literalSCI_EC" runat="server" Visible="false"><li>Ecology </li></asp:Literal>
              <asp:Literal ID="literalSCI_ELT" runat="server" Visible="false"><li>Electronics </li></asp:Literal>
              <asp:Literal ID="literalSCI_ETM" runat="server" Visible="false"><li>Entomology </li></asp:Literal>
              <asp:Literal ID="literalSCI_EVS" runat="server" Visible="false"><li>Environmental Science </li></asp:Literal>
              <asp:Literal ID="literalSCI_EM" runat="server" Visible="false"><li>Epidemiology </li></asp:Literal>
              <asp:Literal ID="literalSCI_GNT" runat="server" Visible="false"><li>Genetics </li></asp:Literal>
              <asp:Literal ID="literalSCI_GOG" runat="server" Visible="false"><li>Geology </li></asp:Literal>
              <asp:Literal ID="literalSCI_HET" runat="server" Visible="false"><li>Health </li></asp:Literal>
              <asp:Literal ID="literalSCI_MB" runat="server" Visible="false"><li>Marine Biology </li></asp:Literal>
              <asp:Literal ID="literalSCI_MTR" runat="server" Visible="false"><li>Meteorology </li></asp:Literal>
              <asp:Literal ID="literalSCI_MBO" runat="server" Visible="false"><li>Microbiology </li></asp:Literal>
              <asp:Literal ID="literalSCI_OG" runat="server" Visible="false"><li>Oceanography </li></asp:Literal>
              <asp:Literal ID="literalSCI_ORTH" runat="server" Visible="false"><li>Ornithology </li></asp:Literal>
              <asp:Literal ID="literalSCI_PET" runat="server" Visible="false"><li>Paleontology </li></asp:Literal>
              <asp:Literal ID="literalSCI_PS" runat="server" Visible="false"><li>Physical Science </li></asp:Literal>
              <asp:Literal ID="literalSCI_PYS" runat="server" Visible="false"><li>Physics </li></asp:Literal>
              <asp:Literal ID="literalSCI_PSOG" runat="server" Visible="false"><li>Physiology </li></asp:Literal>
              <asp:Literal ID="literalSCI_SM" runat="server" Visible="false"><li>Sports Medicine </li></asp:Literal>
              <asp:Literal ID="literalSCI_ZO" runat="server" Visible="false"><li>Zoology </li></asp:Literal>
            </ul>
            <h5>
              Math:</h5>
            <ul>
              <asp:Label ID="achead8" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalMT_ALGE" runat="server" Visible="false"><li>Algebra </li></asp:Literal>
              <asp:Literal ID="literalMT_CAL" runat="server" Visible="false"><li>Calculus </li></asp:Literal>
              <asp:Literal ID="literalMT_FUNC" runat="server" Visible="false"><li>Functions </li></asp:Literal>
              <asp:Literal ID="literalMT_HONOR" runat="server" Visible="false"><li>Honors Math </li></asp:Literal>
              <asp:Literal ID="literalMT_GEO" runat="server" Visible="false"><li>Geometry </li></asp:Literal>
              <asp:Literal ID="literalMT_PROB" runat="server" Visible="false"><li>Probability </li></asp:Literal>
              <asp:Literal ID="literalMT_STAT" runat="server" Visible="false"><li>Statistics </li></asp:Literal>
              <asp:Literal ID="literalMT_TRIG" runat="server" Visible="false"><li>Trigonometry </li></asp:Literal>
            </ul>
            <h5>
              Computer Studies:</h5>
            <ul>
              <asp:Label ID="achead9" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalCOMS_CAPP" runat="server" Visible="false"><li>Computer Applications </li></asp:Literal>
              <asp:Literal ID="literalCOMS_CPRO" runat="server" Visible="false"><li>Computer Programming </li></asp:Literal>
              <asp:Literal ID="literalCOMS_CSC" runat="server" Visible="false"><li>Computer Science </li></asp:Literal>
              <asp:Literal ID="literalCOMS_MULT" runat="server" Visible="false"><li>Multimedia </li></asp:Literal>
              <asp:Literal ID="literalCOMS_WEBD" runat="server" Visible="false"><li>Web Design </li></asp:Literal>
            </ul>
            <h5>
              Music:</h5>
            <ul>
              <asp:Label ID="achead10" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalMUSIC_BAND" runat="server" Visible="false"><li>Band </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_CHORAL" runat="server" Visible="false"><li>Choral Music </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_COMPO" runat="server" Visible="false"><li>Composition </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_ELECT" runat="server" Visible="false"><li>Electronic Music </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_HISTOJZZ" runat="server" Visible="false"><li>History of Jazz </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_HISTOMUS" runat="server" Visible="false"><li>History of Music </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_INDIVI" runat="server" Visible="false"><li>Individual Instructions </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_MUSICAPP" runat="server" Visible="false"><li>Music Appreciation </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_MUSICHIS" runat="server" Visible="false"><li>Music History</li></asp:Literal>
              <asp:Literal ID="literalMUSIC_MUSICTHE" runat="server" Visible="false"><li>Music Theory </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_OPERA" runat="server" Visible="false"><li>Opera </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_ORCHE" runat="server" Visible="false"><li>Orchestra </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_PRINCI" runat="server" Visible="false"><li>Principles of Arranging </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_RECORD" runat="server" Visible="false"><li>Recording </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_SOLFE" runat="server" Visible="false"><li>Solfege/Ear Training </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_SONGWR" runat="server" Visible="false"><li>Songwriting </li></asp:Literal>
              <asp:Literal ID="literalMUSIC_VOICE" runat="server" Visible="false"><li>Voice </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <h5>
              Performing/Visual Arts:</h5>
            <ul>
              <asp:Label ID="achead11" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalPEFVA_3D" runat="server" Visible="false"><li>3-D Design </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_ACT" runat="server" Visible="false"><li>Acting </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_ANIMA" runat="server" Visible="false"><li>Animation </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_ARCH" runat="server" Visible="false"><li>Architecture </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_ART" runat="server" Visible="false"><li>Art </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_ARTHI" runat="server" Visible="false"><li>Art History </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_BALL" runat="server" Visible="false"><li>Ballet </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_CER" runat="server" Visible="false"><li>Ceramics </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_CHOR" runat="server" Visible="false"><li>Choreography </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_DANCE" runat="server" Visible="false"><li>Dance </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_DEB" runat="server" Visible="false"><li>Debate </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_DESI" runat="server" Visible="false"><li>Design </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_DIREC" runat="server" Visible="false"><li>Directing </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_DRA" runat="server" Visible="false"><li>Drama </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_DRAW" runat="server" Visible="false"><li>Drawing </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_FASH" runat="server" Visible="false"><li>Fashion Design </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_FIBER" runat="server" Visible="false"><li>Fiber Arts </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_FILM" runat="server" Visible="false"><li>Film and Video </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_GRAP" runat="server" Visible="false"><li>Graphic Design </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_HISTO" runat="server" Visible="false"><li>History of Theater </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_JOUR" runat="server" Visible="false"><li>Journalism </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_LIGHT" runat="server" Visible="false"><li>Lighting Design </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_METAL" runat="server" Visible="false"><li>Metal </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_MODERN" runat="server" Visible="false"><li>Modern Dance </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PAINT" runat="server" Visible="false"><li>Painting </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PHO" runat="server" Visible="false"><li>Photography </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PORTF" runat="server" Visible="false"><li>Portfolio </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_POTT" runat="server" Visible="false"><li>Pottery </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PRINT" runat="server" Visible="false"><li>Printmaking </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PROD" runat="server" Visible="false"><li>Production </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PUBSP" runat="server" Visible="false"><li>Public Speaking </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_PUBLICC" runat="server" Visible="false"><li>Publications </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_SCPRI" runat="server" Visible="false"><li>Screen-printing </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_SCWR" runat="server" Visible="false"><li>Screenwriting </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_SCUL" runat="server" Visible="false"><li>Sculpture </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_SILK" runat="server" Visible="false"><li>Silkscreen </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_STAG" runat="server" Visible="false"><li>Stagecraft </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_STUDIO" runat="server" Visible="false"><li>Studio Art </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_TELE" runat="server" Visible="false"><li>Television Production </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_TEX" runat="server" Visible="false"><li>Textiles </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_THEAA" runat="server" Visible="false"><li>Theater Arts </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_THEDE" runat="server" Visible="false"><li>Theater Design </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_WEAV" runat="server" Visible="false"><li>Weaving </li></asp:Literal>
              <asp:Literal ID="literalPEFVA_WOOD" runat="server" Visible="false"><li>Woodworking </li></asp:Literal>
            </ul>
            <h5>
              Special Programs:</h5>
            <ul>
              <asp:Label ID="achead12" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalSPCPRO_COMM" runat="server" Visible="false"><li>Community Service </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_EXCH" runat="server" Visible="false"><li>Exchange Programs </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_INDE" runat="server" Visible="false"><li>Independent Study </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_INTER" runat="server" Visible="false"><li>Internships </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_JROT" runat="server" Visible="false"><li>JROTC </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_LEADER" runat="server" Visible="false"><li>Leadership </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_LEARN" runat="server" Visible="false"><li>Learning at Sea Programs </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_OUTDOOR" runat="server" Visible="false"><li>Outdoor Education </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_PERSON" runat="server" Visible="false"><li>Personal Finance </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_RIFILE" runat="server" Visible="false"><li>Rifle Team </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_SEME" runat="server" Visible="false"><li>Semester/Year Off-Campus </li></asp:Literal>
              <asp:Literal ID="literalSPCPRO_STUD" runat="server" Visible="false"><li>Study Abroad: enter value </li></asp:Literal>
            </ul>
            <h5>
              Distinctive or New Programs:</h5>
            <ul>
              <asp:Label ID="achead13" Visible="false" runat="server">N/A</asp:Label>
              <li>
                <asp:Literal ID="literDP1" runat="server"></asp:Literal></li>
              <%--              <li>
                <asp:Literal ID="literDP2" runat="server"></asp:Literal></li>
              <li>
                <asp:Literal ID="literDP3" runat="server"></asp:Literal></li>
              <li>
                <asp:Literal ID="literDP4" runat="server"></asp:Literal></li>
--%>
            </ul>
            <h5>
              AP Courses Available:</h5>
            <ul>
              <asp:Label ID="achead14" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalAPCSAVA_ARH" runat="server" Visible="false"><li>Art History </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_BIO" runat="server" Visible="false"><li>Biology </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_CALAB" runat="server" Visible="false"><li>Calculus AB </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_CALBC" runat="server" Visible="false"><li>Calculus BC </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_CHEM" runat="server" Visible="false"><li>Chemistry </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_COMA" runat="server" Visible="false"><li>Computer Science A </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_COMAB" runat="server" Visible="false"><li>Computer Science AB </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_MACRO" runat="server" Visible="false"><li>Macroeconomics </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_MICRO" runat="server" Visible="false"><li>Microeconomics </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_ELANG" runat="server" Visible="false"><li>English Language </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_ELITER" runat="server" Visible="false"><li>English Literature </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_ENVS" runat="server" Visible="false"><li>Environmental Science </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_EUROH" runat="server" Visible="false"><li>European History </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_FRLANG" runat="server" Visible="false"><li>French Language </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_FRELIT" runat="server" Visible="false"><li>French Literature </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_GERMLANG" runat="server" Visible="false"><li>German Language </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_COMPAGP" runat="server" Visible="false"><li>Comparative Government & Politics </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_USCO" runat="server" Visible="false"><li>US Government & Politics </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_HUMAN" runat="server" Visible="false"><li>Human Geography </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_LALITER" runat="server" Visible="false"><li>Latin Literature </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_LAVER" runat="server" Visible="false"><li>Latin: Vergil </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_MUT" runat="server" Visible="false"><li>Music Theory </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_PHB" runat="server" Visible="false"><li>Physics B </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_PHC" runat="server" Visible="false"><li>Physics C </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_PSY" runat="server" Visible="false"><li>Psychology </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_SPLANG" runat="server" Visible="false"><li>Spanish Language </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_SPLITER" runat="server" Visible="false"><li>Spanish Literature </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_STAT" runat="server" Visible="false"><li>Statistics </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_STUART" runat="server" Visible="false"><li>Studio Art </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_USHIST" runat="server" Visible="false"><li>US History </li></asp:Literal>
              <asp:Literal ID="literalAPCSAVA_WORLD" runat="server" Visible="false"><li>World History </li></asp:Literal>
            </ul>
          </div>
        </div>
        <!-- call out -->
        <div class="bottom-callout fs-section left">
          <div class="callout1 left">
            <div class="callout1-btn">
              <a href="/school-browser.aspx">school explorer</a>
            </div>
            <div class="callout1-btn2">
              <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
            </div>
          </div>
          <!--
                    <div class="callout2 left">
                        <div class="callout2-btn">
                            <a href="">select schools</a>
                        </div>
                    </div>
                    -->
          <a href="/find-a-school/explore-your-options/contact-schools.aspx">
            <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
              <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                <img src="/resources/images/howtoapply.jpg" alt="" /></a>
        </div>
      </div>
    </div>
    <div class="bb clear">
      &nbsp;</div>
  </div>
</div>
<!-- Campus -->
<div id="campus-life">
  <div class="container-box zero">
    <div class="bt">
      &nbsp;</div>
    <div class="bm left both1812">
      <div class="bl left full">
        <!-- data container -->
        <asp:Repeater ID="repeatCampusLife" runat="server">
          <ItemTemplate>
            <asp:Image ID="imageCampus" runat="server" CssClass="left" Width="300" />
            <div class="left nobull">
              <p>
                <%#Eval("summary") %></p>
              <div class="school-pro-val">
                <p>
                  Department Director: <span>
                    <%#CheckEmptyString(Eval("directorfirstname").ToString() + " " + Eval("directorlastname").ToString())%></span></p>
                <!--
                                <p>Full Time Teachers: <span></span></p>
                                <p>Teachers With Advanced Degrees: <span>value goes here %</span></p>
                                <p>Student/Teacher Ratio: <span>value goes here</span></p>
                                <p>Saturday Classes: <span>value goes here</span></p>
                                <p>Summer Programs Offered: <span>value goes here</span></p>
                                -->
              </div>
            </div>
            <div class="left fs-section">
              <div class="school-out-val nobull mar0">
                <h5>
                  Dorm Life</h5>
                <p>
                  Number of Dorms: <span>
                    <%# (Convert.ToInt16(Eval("dormgirls").ToString()) + Convert.ToInt16(Eval("dormboys").ToString())).ToString()  %></span></p>
                <p>
                  Average Students Per Dorm: <span>
                    <%#Eval("dormstudentaverage") %></span></p>
                <p>
                  No. of Girls Dorms: <span>
                    <%#Eval("dormgirls") %></span></p>
                <p>
                  No. of Boys Dorms: <span>
                    <%#Eval("dormboys") %></span></p>
                <p>
                  Dorm Amenities:
                  <asp:Literal ID="chead1" Visible="false" runat="server">N/A</asp:Literal>
                  <span>
                    <asp:Literal ID="literalDorm_GameRoom" runat="server" Visible="false">Game Room</asp:Literal></span>&nbsp;
                  <span>
                    <asp:Literal ID="literalDorm_Laundry" runat="server" Visible="false">Laundry</asp:Literal></span>&nbsp;
                  <span>
                    <asp:Literal ID="literalDorm_Lounge" runat="server" Visible="false">Lounge</asp:Literal></span>&nbsp;
                  <span>
                    <asp:Literal ID="literalDorm_WiFi" runat="server" Visible="false">Wi-Fi</asp:Literal></span>&nbsp;
                  <span>
                    <asp:Literal ID="literalDorm_Vending" runat="server" Visible="false">Vending</asp:Literal></span>&nbsp;
                  <p>
                    Dress Code: <span>
                      <%#Eval("dresscode") %></span></p>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <div class="three-col left fs-section">
          <h5>
            Student Life</h5>
          <p class="sm-h">
            Facilites</p>
          <div class="left">
            <ul>
              <asp:Label ID="chead2" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalFAC_ALL" runat="server" Visible="false"><li>All-weather track </li></asp:Literal>
              <asp:Literal ID="literalFAC_BASE" runat="server" Visible="false"><li>Baseball field(s) </li></asp:Literal>
              <asp:Literal ID="literalFAC_BASKET" runat="server" Visible="false"><li>Basketball court(s) </li></asp:Literal>
              <asp:Literal ID="literalFAC_FITEN" runat="server" Visible="false"><li>Fitness Center </li></asp:Literal>
              <asp:Literal ID="literalFAC_TECH" runat="server" Visible="false"><li>Technology Center </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <ul>
              <asp:Literal ID="literalFAC_VOLL" runat="server" Visible="false"><li>Volleyball court(s) </li></asp:Literal>
              <asp:Literal ID="literalFAC_SAND" runat="server" Visible="false"><li>Sand volleyball court(s) </li></asp:Literal>
              <asp:Literal ID="literalFAC_FOOT" runat="server" Visible="false"><li>Football field </li></asp:Literal>
              <asp:Literal ID="literalFAC_INDOBK" runat="server" Visible="false"><li>Indoor basketball court(s) </li></asp:Literal>
              <asp:Literal ID="literalFAC_REC" runat="server" Visible="false"><li>Racquetball court(s) </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <ul>
              <asp:Literal ID="literalFAC_POOL" runat="server" Visible="false"><li>Pool </li></asp:Literal>
              <asp:Literal ID="literalFAC_INDOP" runat="server" Visible="false"><li>Indoor pool </li></asp:Literal>
              <asp:Literal ID="literalFAC_INDOCW" runat="server" Visible="false"><li>Indoor climbing wall </li></asp:Literal>
              <asp:Literal ID="literal2" runat="server" Visible="false"><li></li></asp:Literal>
              <asp:Literal ID="literal3" runat="server" Visible="false"><li></li></asp:Literal>
            </ul>
          </div>
        </div>
        <div class="three-col left top10">
          <p class="sm-h">
            Clubs and Organizations</p>
          <div class="left">
            <ul>
              <asp:Label ID="chead3" Visible="false" runat="server">N/A</asp:Label>
              <asp:Literal ID="literalCLUBNOG_AMNINTER" runat="server" Visible="false"><li>Amnesty International </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_ANIMAL" runat="server" Visible="false"><li>Animal Rights Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_ARCHA" runat="server" Visible="false"><li>Archaeology Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_ASIAN" runat="server" Visible="false"><li>Asian Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_ASTRO" runat="server" Visible="false"><li>Astronomy Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_CHESS" runat="server" Visible="false"><li>Chess Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_CLASS" runat="server" Visible="false"><li>Classics Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_COMMUNI" runat="server" Visible="false"><li>Community Service </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_COMPUTER" runat="server" Visible="false"><li>Computer Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_DEBATECL" runat="server" Visible="false"><li>Debate Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_DIVER" runat="server" Visible="false"><li>Diversity Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_DORMPRO" runat="server" Visible="false"><li>Dorm Proctors </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_DRAMA" runat="server" Visible="false"><li>Drama Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_EVRCL" runat="server" Visible="false"><li>Environmental Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_FCA" runat="server" Visible="false"><li>FCA </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_FENCING" runat="server" Visible="false"><li>Fencing </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_FOODCOUN" runat="server" Visible="false"><li>Food Council </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_FORELC" runat="server" Visible="false"><li>Foreign Language Clubs </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_FREE" runat="server" Visible="false"><li>Free Tibet </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_FUTURE" runat="server" Visible="false"><li>Future Bus. Leaders of Am. </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_GARD" runat="server" Visible="false"><li>Gardening </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <ul>
              <asp:Literal ID="literalCLUBNOG_HAFH" runat="server" Visible="false"><li>Habitat for Humanity </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_HONOR" runat="server" Visible="false"><li>Honor Council </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_HORRI" runat="server" Visible="false"><li>Horseback Riding </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_INTCL" runat="server" Visible="false"><li>International Clubs </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_INVECL" runat="server" Visible="false"><li>Investment Club</li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_JSO" runat="server" Visible="false"><li>Jewish Student Org </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_LITMGZ" runat="server" Visible="false"><li>Literary Magazine </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_MATHCB" runat="server" Visible="false"><li>Math Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_MODELUN" runat="server" Visible="false"><li>Model UN </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_MOCKTRI" runat="server" Visible="false"><li>Mock Trial </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_NATIONAL" runat="server" Visible="false"><li>National Honor Society </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_NEWSPP" runat="server" Visible="false"><li>Newspaper </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_OUTING" runat="server" Visible="false"><li>Outing Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_PEERCOS" runat="server" Visible="false"><li>Peer Counseling </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_PEERTUT" runat="server" Visible="false"><li>Peer Tutoring </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_PEPCLUB" runat="server" Visible="false"><li>Pep Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_PHOTO" runat="server" Visible="false"><li> Photography </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_QUIZ" runat="server" Visible="false"><li>Quiz Bowl </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SAILING" runat="server" Visible="false"><li>Sailing Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SCIBOW" runat="server" Visible="false"><li>Science Bowl</li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SCIFIC" runat="server" Visible="false"><li>Science Fiction Club </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <ul>
              <asp:Literal ID="literalCLUBNOG_SCOUT" runat="server" Visible="false"><li>Scouting </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SEXUALCB" runat="server" Visible="false"><li>Sexualities Club</li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SKATE" runat="server" Visible="false"><li>Skateboarding Clubs </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SNOW" runat="server" Visible="false"><li>Snowboarding </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SOLAR" runat="server" Visible="false"><li>Solar Car Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_STUACT" runat="server" Visible="false"><li>Student Activities  </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_STUGOV" runat="server" Visible="false"><li>Student Government</li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_STUPUB" runat="server" Visible="false"><li>Student Publications </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_STURAS" runat="server" Visible="false"><li>Student Radio Station </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SADD" runat="server" Visible="false"><li>SADD </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_SURFING" runat="server" Visible="false"><li>Surfing </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_THEATER" runat="server" Visible="false"><li>Theater </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_TVST" runat="server" Visible="false"><li>TV Station</li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_WEIGHT" runat="server" Visible="false"><li>Weightlifting </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_WOOD" runat="server" Visible="false"><li>Woodworking Club </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_YEARB" runat="server" Visible="false"><li>Yearbook </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_YOGA" runat="server" Visible="false"><li>Yoga </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_YOUNGDE" runat="server" Visible="false"><li>Young Democrats </li></asp:Literal>
              <asp:Literal ID="literalCLUBNOG_YOUNGREPUB" runat="server" Visible="false"><li>Young Republicans</li></asp:Literal>
              <asp:Literal ID="literal17" runat="server" Visible="false"><li></li></asp:Literal>
              <asp:Literal ID="literal18" runat="server" Visible="false"><li></li></asp:Literal>
            </ul>
          </div>
        </div>
        <div class="bottom-callout fs-section left">
          <div class="callout1 left">
            <div class="callout1-btn">
              <a href="/school-browser.aspx">school explorer</a>
            </div>
            <div class="callout1-btn2">
              <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
            </div>
          </div>
          <a href="/find-a-school/explore-your-options/contact-schools.aspx">
            <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
              <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                <img src="/resources/images/howtoapply.jpg" alt="" /></a>
        </div>
      </div>
    </div>
    <div class="bb clear">
      &nbsp;</div>
  </div>
</div>
<!-- Arts -->
<div id="arts-athletics">
  <div class="container-box zero">
    <div class="bt">
      &nbsp;</div>
    <div class="bm left both1812">
      <div class="bl left full">
        <!-- data container -->
        <asp:Repeater ID="repeatArts" runat="server">
          <ItemTemplate>
            <asp:Image ID="imageArts" runat="server" CssClass="left" Width="300" />
            <div class="left nobull">
              <!--
                            <p>Summary Here</p>
                            -->
              <div class="school-pro-val">
                <p>
                  Arts Department Director: <span>
                    <%#CheckEmptyString(Eval("artdirectorfirstname").ToString() + " " + Eval("artdirectorlastname").ToString())%></span></p>
                <p>
                  Athletics Department Director: <span>
                    <%#CheckEmptyString(Eval("athleticdirectorfirstname").ToString() + " " + Eval("athleticdirectorlastname").ToString())%></span></p>
                <p>
                  Notable Achievements: <span>
                    <%#CheckEmptyString(Eval("achievements").ToString()) %></span></p>
              </div>
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <div class="three-col left fs-section">
          <h5>
            Arts</h5>
          <div class="left">
            <ul>
              <asp:Label ID="aahead1" runat="server" Visible="false">N/A</asp:Label>
              <asp:Literal ID="literalARTS_ACG" runat="server" Visible="false"><li>A Cappella Group </li></asp:Literal>
              <asp:Literal ID="literalARTS_ARTCB" runat="server" Visible="false"><li>Art Club</li></asp:Literal>
              <asp:Literal ID="literalARTS_AUDI" runat="server" Visible="false"><li>Audiovisual Club </li></asp:Literal>
              <asp:Literal ID="literalARTS_BRASS" runat="server" Visible="false"><li>Brass Ensemble</li></asp:Literal>
              <asp:Literal ID="literalARTS_CHAMCH" runat="server" Visible="false"><li>Chamber Choir </li></asp:Literal>
              <asp:Literal ID="literalARTS_CHAMEN" runat="server" Visible="false"><li>Chamber Ensemble </li></asp:Literal>
              <asp:Literal ID="literalARTS_CHAMOR" runat="server" Visible="false"><li>Chamber Orchestra </li></asp:Literal>
              <asp:Literal ID="literalARTS_CHOR" runat="server" Visible="false"><li>Choral Music </li></asp:Literal>
              <asp:Literal ID="literalARTS_DANCE" runat="server" Visible="false"><li>Dance </li></asp:Literal>
              <asp:Literal ID="literalARTS_DRAMA" runat="server" Visible="false"><li>Drama Club </li></asp:Literal>
              <asp:Literal ID="literalARTS_FMC" runat="server" Visible="false"><li>Folk Music Club </li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <ul>
              <asp:Literal ID="literalARTS_GLC" runat="server" Visible="false"><li>Glee Club</li></asp:Literal>
              <asp:Literal ID="literalARTS_GOCH" runat="server" Visible="false"><li>Gospel Choir </li></asp:Literal>
              <asp:Literal ID="literalARTS_GU" runat="server" Visible="false"><li>Guitar Ensemble </li></asp:Literal>
              <asp:Literal ID="literalARTS_IMPRO" runat="server" Visible="false"><li>Improvisation Group </li></asp:Literal>
              <asp:Literal ID="literalARTS_JAZZ" runat="server" Visible="false"><li>Jazz Ensemble </li></asp:Literal>
              <asp:Literal ID="literalARTS_PEPBAND" runat="server" Visible="false"><li>Pep Band</li></asp:Literal>
              <asp:Literal ID="literalARTS_ROCK" runat="server" Visible="false"><li>Rock Band</li></asp:Literal>
              <asp:Literal ID="literalARTS_STAGE" runat="server" Visible="false"><li>Stage Band </li></asp:Literal>
              <asp:Literal ID="literalARTS_STRING" runat="server" Visible="false"><li>String Ensemble </li></asp:Literal>
              <asp:Literal ID="literalARTS_TECH" runat="server" Visible="false"><li>Tech Crew </li></asp:Literal>
              <asp:Literal ID="literalARTS_THEATER" runat="server" Visible="false"><li>Theater</li></asp:Literal>
            </ul>
          </div>
        </div>
        <div class="three-col left fs-section">
          <div class="left">
            <h5>
              Interscholastic Sports</h5>
            <ul>
              <asp:Label ID="aahead2" runat="server" Visible="false">N/A</asp:Label>
              <asp:Literal ID="literalINTSP_AERO" runat="server" Visible="false"><li>Aerobics </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ALPI" runat="server" Visible="false"><li>Alpine Ski Racing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ALPINE" runat="server" Visible="false"><li>Alpine Skiing</li></asp:Literal>
              <asp:Literal ID="literalINTSP_BADMIN" runat="server" Visible="false"><li>Badminton </li></asp:Literal>
              <asp:Literal ID="literalINTSP_BASEB" runat="server" Visible="false"><li>Baseball</li></asp:Literal>
              <asp:Literal ID="literalINTSP_BASK" runat="server" Visible="false"><li>Basketball </li></asp:Literal>
              <asp:Literal ID="literalINTSP_BOW" runat="server" Visible="false"><li>Bowling </li></asp:Literal>
              <asp:Literal ID="literalINTSP_CAMP" runat="server" Visible="false"><li>Camping</li></asp:Literal>
              <asp:Literal ID="literalINTSP_CANOE" runat="server" Visible="false"><li>Canoeing</li></asp:Literal>
              <asp:Literal ID="literalINTSP_CHEER" runat="server" Visible="false"><li>Cheerleading </li></asp:Literal>
              <asp:Literal ID="literalINTSP_CREW" runat="server" Visible="false"><li>Crew</li></asp:Literal>
              <asp:Literal ID="literalINTSP_CRICK" runat="server" Visible="false"><li>Cricket</li></asp:Literal>
              <asp:Literal ID="literalINTSP_CROSS" runat="server" Visible="false"><li>Cross-Country Running</li></asp:Literal>
              <asp:Literal ID="literalINTSP_CURL" runat="server" Visible="false"><li>Curling </li></asp:Literal>
              <asp:Literal ID="literalINTSP_DANCE" runat="server" Visible="false"><li>Dance </li></asp:Literal>
              <asp:Literal ID="literalINTSP_DIVI" runat="server" Visible="false"><li>Diving </li></asp:Literal>
              <asp:Literal ID="literalINTSP_DRILL" runat="server" Visible="false"><li>Drill Team</li></asp:Literal>
              <asp:Literal ID="literalINTSP_EQUE" runat="server" Visible="false"><li>Equestrian </li></asp:Literal>
              <asp:Literal ID="literalINTSP_FENC" runat="server" Visible="false"><li>Fencing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_FIELD" runat="server" Visible="false"><li>Field Hockey </li></asp:Literal>
              <asp:Literal ID="literalINTSP_FOOT" runat="server" Visible="false"><li>Football </li></asp:Literal>
              <asp:Literal ID="literalINTSP_FREE" runat="server" Visible="false"><li>Free Style Skiing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_GOLF" runat="server" Visible="false"><li>Golf </li></asp:Literal>
              <asp:Literal ID="literalINTSP_GYMN" runat="server" Visible="false"><li>Gymnastics </li></asp:Literal>
              <asp:Literal ID="literalINTSP_HAND" runat="server" Visible="false"><li>Handball </li></asp:Literal>
              <asp:Literal ID="literalINTSP_HIKING" runat="server" Visible="false"><li>Hiking </li></asp:Literal>
              <asp:Literal ID="literalINTSP_HORSE" runat="server" Visible="false"><li>Horseback Riding </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ICECLB" runat="server" Visible="false"><li>Ice Climbing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ICEHO" runat="server" Visible="false"><li>Ice Hockey </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ICESK" runat="server" Visible="false"><li>Ice Skating </li></asp:Literal>
              <asp:Literal ID="literalINTSP_KAYA" runat="server" Visible="false"><li>Kayaking </li></asp:Literal>
              <asp:Literal ID="literalINTSP_KICKBA" runat="server" Visible="false"><li>Kickball </li></asp:Literal>
              <asp:Literal ID="literalINTSP_KICKBO" runat="server" Visible="false"><li>Kickboxing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_LACRO" runat="server" Visible="false"><li>Lacrosse</li></asp:Literal>
              <asp:Literal ID="literalINTSP_LUGE" runat="server" Visible="false"><li>Luge </li></asp:Literal>
              <asp:Literal ID="literalINTSP_MART" runat="server" Visible="false"><li>Martial Arts </li></asp:Literal>
              <asp:Literal ID="literalINTSP_MOUNT" runat="server" Visible="false"><li>Mountain Biking </li></asp:Literal>
              <asp:Literal ID="literalINTSP_NORDIC" runat="server" Visible="false"><li>Nordic Ski Racing</li></asp:Literal>
              <asp:Literal ID="literalINTSP_NORSK" runat="server" Visible="false"><li>Nordic Skiing</li></asp:Literal>
              <asp:Literal ID="literalINTSP_OUTDOOR" runat="server" Visible="false"><li>Outdoor Education</li></asp:Literal>
              <asp:Literal ID="literalINTSP_PADD" runat="server" Visible="false"><li>Paddle Tennis </li></asp:Literal>
              <asp:Literal ID="literalINTSP_POLO" runat="server" Visible="false"><li>Polo </li></asp:Literal>
              <asp:Literal ID="literalINTSP_POWER" runat="server" Visible="false"><li>Power Lifting </li></asp:Literal>
              <asp:Literal ID="literalINTSP_RACQ" runat="server" Visible="false"><li>Racquet Ball </li></asp:Literal>
              <asp:Literal ID="literalINTSP_RAFT" runat="server" Visible="false"><li>Rafting </li></asp:Literal>
              <asp:Literal ID="literalINTSP_RIFLE" runat="server" Visible="false"><li>Rifle Team </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ROCK" runat="server" Visible="false"><li>Rock Climbing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_RUGB" runat="server" Visible="false"><li>Rugby </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SAIL" runat="server" Visible="false"><li>Sailing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SKATE" runat="server" Visible="false"><li>Skateboarding </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SKI" runat="server" Visible="false"><li>Ski Jumping </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SNOW" runat="server" Visible="false"><li>Snowboarding </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SOCCER" runat="server" Visible="false"><li>Soccer </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SOFT" runat="server" Visible="false"><li>Softball</li></asp:Literal>
              <asp:Literal ID="literalINTSP_SQUASH" runat="server" Visible="false"><li>Squash </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SURF" runat="server" Visible="false"><li>Surfing </li></asp:Literal>
              <asp:Literal ID="literalINTSP_SWI" runat="server" Visible="false"><li>Swimming </li></asp:Literal>
              <asp:Literal ID="literalINTSP_TABLE" runat="server" Visible="false"><li>Table Tennis </li></asp:Literal>
              <asp:Literal ID="literalINTSP_TENN" runat="server" Visible="false"><li>Tennis </li></asp:Literal>
              <asp:Literal ID="literalINTSP_TRACK" runat="server" Visible="false"><li>Track and Field </li></asp:Literal>
              <asp:Literal ID="literalINTSP_ULTI" runat="server" Visible="false"><li>Ultimate Frisbee </li></asp:Literal>
              <asp:Literal ID="literalINTSP_VOLLE" runat="server" Visible="false"><li>Volleyball </li></asp:Literal>
              <asp:Literal ID="literalINTSP_WATER" runat="server" Visible="false"><li>Water Polo </li></asp:Literal>
              <asp:Literal ID="literalINTSP_WEIGHT" runat="server" Visible="false"><li>Weight Lifting </li></asp:Literal>
              <asp:Literal ID="literalINTSP_WREST" runat="server" Visible="false"><li>Wrestling</li></asp:Literal>
            </ul>
          </div>
          <div class="left">
            <h5>
              Recreational Sports</h5>
            <ul>
              <asp:Label ID="aahead3" runat="server" Visible="false">N/A</asp:Label>
              <asp:Literal ID="literalRECRESP_AERO" runat="server" Visible="false"><li>Aerobics </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_ALSKR" runat="server" Visible="false"><li>Alpine Ski Racing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_ALSKS" runat="server" Visible="false"><li>Alpine Skiing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_BADMIN" runat="server" Visible="false"><li>Badminton </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_BASEB" runat="server" Visible="false"><li>Baseball </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_BASK" runat="server" Visible="false"><li>Basketball</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_BOW" runat="server" Visible="false"><li>Bowling</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CAMP" runat="server" Visible="false"><li>Camping </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CANOE" runat="server" Visible="false"><li>Canoeing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CHEER" runat="server" Visible="false"><li>Cheerleading </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CREW" runat="server" Visible="false"><li>Crew </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CRICK" runat="server" Visible="false"><li>Cricket</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CROSS" runat="server" Visible="false"><li>Cross-Country Running </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_CURL" runat="server" Visible="false"><li>Curling </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_DANCE" runat="server" Visible="false"><li>Dance </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_DIVING" runat="server" Visible="false"><li>Diving </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_DRILL" runat="server" Visible="false"><li>Drill Team </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_EQUES" runat="server" Visible="false"><li>Equestrian </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_FENC" runat="server" Visible="false"><li>Fencing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_FIELD" runat="server" Visible="false"><li>Field Hockey</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_FIGURE" runat="server" Visible="false"><li>Figure Skating</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_FOOT" runat="server" Visible="false"><li>Football </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_FREE" runat="server" Visible="false"><li>Free Style Skiing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_GOLF" runat="server" Visible="false"><li>Golf </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_GYMN" runat="server" Visible="false"><li>Gymnastics </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_HAND" runat="server" Visible="false"><li>Handball</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_HIKI" runat="server" Visible="false"><li>Hiking </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_HORSE" runat="server" Visible="false"><li>Horseback Riding </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_ICECLB" runat="server" Visible="false"><li>Ice Climbing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_ICEHOC" runat="server" Visible="false"><li>Ice Hockey </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_KAYAK" runat="server" Visible="false"><li>Kayaking </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_LACRO" runat="server" Visible="false"><li>Lacrosse </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_LUGE" runat="server" Visible="false"><li>Luge </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_MARTI" runat="server" Visible="false"><li>Martial Arts </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_MOUNT" runat="server" Visible="false"><li>Mountain Biking</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_NORSA" runat="server" Visible="false"><li>Nordic Ski Racing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_NORSK" runat="server" Visible="false"><li>Nordic Skiing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_OUT" runat="server" Visible="false"><li>Outdoor Education </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_PADD" runat="server" Visible="false"><li>Paddle Tennis </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_POLO" runat="server" Visible="false"><li>Polo </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_POWER" runat="server" Visible="false"><li>Power Lifting </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_RACQ" runat="server" Visible="false"><li>Racquet Ball </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_RAFT" runat="server" Visible="false"><li>Rafting </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_RIFLE" runat="server" Visible="false"><li>Rifle Team </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_ROCK" runat="server" Visible="false"><li>Rock Climbing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_RUG" runat="server" Visible="false"><li>Rugby </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SAIL" runat="server" Visible="false"><li>Sailing</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SKATE" runat="server" Visible="false"><li>Skateboarding </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SKI" runat="server" Visible="false"><li>Ski Jumping </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SNOW" runat="server" Visible="false"><li>Snowboarding </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SOCC" runat="server" Visible="false"><li>Soccer </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SOFT" runat="server" Visible="false"><li>Softball </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SQUA" runat="server" Visible="false"><li>Squash </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SURF" runat="server" Visible="false"><li>Surfing </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_SWIM" runat="server" Visible="false"><li>Swimming </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_TABLE" runat="server" Visible="false"><li>Table Tennis</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_TENNI" runat="server" Visible="false"><li>Tennis </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_TRACK" runat="server" Visible="false"><li>Track and Field </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_ULTI" runat="server" Visible="false"><li>Ultimate Frisbee </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_VOLL" runat="server" Visible="false"><li>Volleyball </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_WATERP" runat="server" Visible="false"><li>Water Polo</li></asp:Literal>
              <asp:Literal ID="literalRECRESP_WEIG" runat="server" Visible="false"><li>Weight Lifting </li></asp:Literal>
              <asp:Literal ID="literalRECRESP_WRES" runat="server" Visible="false"><li>Wrestling </li></asp:Literal>
            </ul>
          </div>
        </div>
        <div class="bottom-callout fs-section left">
          <div class="callout1 left">
            <div class="callout1-btn">
              <a href="/school-browser.aspx">school explorer</a>
            </div>
            <div class="callout1-btn2">
              <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
            </div>
          </div>
          <a href="/find-a-school/explore-your-options/contact-schools.aspx">
            <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
              <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                <img src="/resources/images/howtoapply.jpg" alt="" /></a>
        </div>
      </div>
    </div>
    <div class="bb clear">
      &nbsp;</div>
  </div>
</div>
<!-- College Info -->
<div id="college-info">
  <div class="container-box zero">
    <div class="bt">
      &nbsp;</div>
    <div class="bm left both1812">
      <div class="bl left full">
        <!-- data container -->
        <asp:Repeater ID="repeatCollegeInfo" runat="server" OnItemDataBound="repeatCollegeInfo_ItemDataBound">
          <ItemTemplate>
            <asp:Image ID="imageCollege" runat="server" CssClass="left" Width="300" />
            <div class="left nobull">
              <p>
                <%#Eval("summary") %></p>
              <div class="school-pro-val">
                <p>
                  Department Director: <span>
                    <%#CheckEmptyString(Eval("directorfirstname").ToString() + " " + Eval("directorlastname").ToString())%>
                  </span>
                </p>
              </div>
            </div>
            <div class="left fs-section">
              <div class="school-out-val nobull mar0">
                <h5>
                  College Information</h5>
                <p>
                  Percentage of Graduates Who Attend College: <span>
                    <%#Eval("collegepercentage").ToString()%></span></p>
                <p>
                  College attended in the past 5 years:</p>
                <table cellpadding="5" cellspacing="0" border="0">
                  <tr>
                    <td>
                      <%#Eval("college1") %>
                    </td>
                    <td>
                      <%#Eval("college1no") %>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <%#Eval("college2") %>
                    </td>
                    <td>
                      <%#Eval("college2no") %>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <%#Eval("college3") %>
                    </td>
                    <td>
                      <%#Eval("college3no") %>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <%#Eval("college4") %>
                    </td>
                    <td>
                      <%#Eval("college4no") %>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <%#Eval("college5") %>
                    </td>
                    <td>
                      <%#Eval("college5no") %>
                    </td>
                  </tr>
                </table>
                
                                <p>Middle Percentile of SAT Scores</p>
                                <table cellpadding="5" cellspacing="0" border="0">
                                    <tr>
                                        <td></td>
                                        <td class="tb">25th percentile</td>
                                        <td class="tb">75th percentile</td>
                                    </tr>
                                    <tr>
                                        <td>Critical Reading</td>
                                        <td class="tb"><%# ShowSAT(Eval("SATCriticalReading25").ToString()) %></td>
                                        <td class="tb"><%# ShowSAT(Eval("SATCriticalReading75").ToString()) %></td>
                                    </tr>
                                    <tr>
                                        <td>Mathematics</td>
                                        <td class="tb"><%# ShowSAT(Eval("SATMathematics25").ToString()) %></td>
                                        <td class="tb"><%# ShowSAT(Eval("SATMathematics75").ToString()) %></td>
                                    </tr>
                                    <tr>
                                        <td>Writing</td>
                                        <td><%# ShowSAT(Eval("SATWriting25").ToString()) %></td>
                                        <td><%# ShowSAT(Eval("SATWriting75").ToString())%></td>
                                    </tr>
                                </table>
                                
                <h5>
                  Alumni</h5>
                <%#GetAlumni() %>
              </div>
              <div>
                <h5>
                  Quotes:</h5>
                <asp:Label ID="cchead1" runat="server" Visible="false">N/A</asp:Label>
                <asp:Repeater ID="quoteRep" runat="server">
                  <ItemTemplate>
                    <p><%#Eval("quote").ToString() %></p>
                    <p>
                       - <%#Eval("alumniname").ToString() %>, Class of (<%#Eval("classyear").ToString() %>)</p>
                       
                    <p>&nbsp;</p>
                  </ItemTemplate>
                </asp:Repeater>
              </div>
              <!--
                            <div>
                                <p class="sm-h">Quotes:</p>
                                <p>QUOTE uote Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim</p>
                                <p>ALUM NAME, Class of (YEAR)</p>
                            </div>
                            <div>
                                <p class="sm-h">Quotes:</p>
                                <p>QUOTE uote Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim</p>
                                <p>ALUM NAME, Class of (YEAR)</p>
                            </div>
                            <div>
                                <p class="sm-h">Quotes:</p>
                                <p>QUOTE uote Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim</p>
                                <p>ALUM NAME, Class of (YEAR)</p>
                            </div>
                            -->
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <div class="bottom-callout fs-section left">
          <div class="callout1 left">
            <div class="callout1-btn">
              <a href="/school-browser.aspx">school explorer</a>
            </div>
            <div class="callout1-btn2">
              <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
            </div>
          </div>
          <a href="/find-a-school/explore-your-options/contact-schools.aspx">
            <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
              <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                <img src="/resources/images/howtoapply.jpg" alt="" /></a>
        </div>
      </div>
    </div>
    <div class="bb clear">
      &nbsp;</div>
  </div>
</div>
<!-- Summer Progams -->
<div id="summer-programs">
  <div class="container-box zero">
    <div class="bt">
      &nbsp;</div>
    <div class="bm left both1812">
      <div class="bl left full">
        <asp:Repeater ID="repeatSummerPrograms" runat="server">
          <ItemTemplate>
            <asp:Image ID="imageSummer" runat="server" CssClass="left" Width="300" />
            <div class="left nobull">
              <p>
                <%#Eval("summarprogram") %></p>
            </div>
          </ItemTemplate>
        </asp:Repeater>
        <div class="left fs-section school-program school-out-val">
          <asp:Repeater ID="repeatSummerProgramList" runat="server">
            <ItemTemplate>
              <div>
                <h5>
                  <%#Eval("name") %></h5>
                <p class="sm-h">
                  <%#DBToDate(Eval("starts").ToString()) %>
                  to
                  <%#DBToDate(Eval("ends").ToString()) %></p>
                <p>
                  <%#Eval("description") %></p>
                <div class="top10">
                  <p>
                    Registration Deadline:&nbsp;<%#DBToDate(Eval("deadline").ToString()) %><br />
                    Tuition: &nbsp;
                    <%#DBToMoney(Eval("tuition").ToString()) %><br />
                    Financial Aid Available: &nbsp;<%#Eval("aid") %><br />
                    <a href="http://<%#Eval("url") %>">
                      <%#Eval("url") %></a>
                  </p>
                </div>
              </div>
            </ItemTemplate>
          </asp:Repeater>
        </div>
        <div class="bottom-callout fs-section left">
          <div class="callout1 left">
            <div class="callout1-btn">
              <a href="/school-browser.aspx">school explorer</a>
            </div>
            <div class="callout1-btn2">
              <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
            </div>
          </div>
          <a href="/find-a-school/explore-your-options/contact-schools.aspx">
            <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
              <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                <img src="/resources/images/howtoapply.jpg" alt="" /></a>
        </div>
      </div>
    </div>
    <div class="bb clear">
      &nbsp;</div>
  </div>
</div>
<!-- Custom -->
<asp:Repeater ID="repeatCustom" runat="server">
  <ItemTemplate>
    <div id="custom-tabs">
      <div class="container-box zero">
        <div class="bt">
          &nbsp;</div>
        <div class="bm left both1812">
          <div class="bl left full">
            <h5>
              <%#Eval("customname") %></h5>
            <p>
              <%#Eval("custom") %></p>
            <div class="bottom-callout fs-section left">
              <div class="callout1 left">
                <div class="callout1-btn">
                  <a href="/school-browser.aspx">school explorer</a>
                </div>
                <div class="callout1-btn2">
                  <a href="/find-a-school/search-tools/guided-search.aspx">guided search</a>
                </div>
              </div>
              <a href="/find-a-school/explore-your-options/contact-schools.aspx">
                <img src="/resources/images/callout2b.gif" alt="" class="callout2" /></a> <a href="/find-a-school/explore-your-options/request-a-free-directory.aspx">
                  <img src="/resources/images/callout3.jpg" alt="" class="callout3" /></a> <a href="/how-to-apply.aspx">
                    <img src="/resources/images/howtoapply.jpg" alt="" /></a>
            </div>
          </div>
        </div>
        <div class="bb clear">
          &nbsp;</div>
      </div>
    </div>
  </ItemTemplate>
</asp:Repeater>
