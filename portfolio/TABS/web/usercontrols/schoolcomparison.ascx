<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="schoolcomparison.ascx.cs" Inherits="TABS_UserControls.usercontrols.schoolcomparison" %>

<!-- school -->
<asp:Repeater ID="repeatSchool1" runat="server">
    <ItemTemplate>
        <div class="school-compare left">
            <div class="comp-min">
                <ul>
                    <li><h5><%#Eval("schoolname") %></h5></li>
                    <li><b><%#Eval("city") %>, <%#Eval("state") %>, <%#Eval("country") %></b></li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">View Profile</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%#Eval("shortdescription").ToString().Substring(0, 100) %>...</li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">Read More</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Founded: </b><%#Eval("founded") %></li>
                    <li><%#Eval("size") %> Acres</li>
                    <li><%#Eval("religion") %></li>
                    <li><%#Eval("dresscode") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Boarding Gr. </b><%#Eval("boardgraderange") %></li>
                    <li><b>Day Gr. </b><%#Eval("daygraderange") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Total Boarding: </b><%#Eval("totalboard") %></li>
                    <li><b>Total Day: </b><%#Eval("totalday") %></li>
                    <li><b>Total Enrollment: </b><%#Eval("totalenrollment") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%# CalculatePercentage(Eval("boystotal").ToString(),1) %> Boys</li>
                    <li><%# CalculatePercentage(Eval("girlstotal").ToString(),1) %> Girls</li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Summer Programs: </b><%#DetermineStatus(Eval("summer").ToString())%></li>
                </ul>
            </div>
            <div class="noborder">
                <ul>
                    <li><b>7-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("7daytuition").ToString())%></li>
                    <li><b>5-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("5daytuition").ToString())%></li>
                    <li><b>Day Tuition: </b><%#ConvertToDollar(Eval("daytuition").ToString())%></li>
                    <li><b>Need-Based Aid: </b><%#DetermineStatus(Eval("needaid").ToString()) %></li>
                    <li><b>Merit Scholarship: </b><%#DetermineStatus(Eval("merit").ToString()) %></li>
                    <li><b>Payment Plans: </b><%#DetermineStatus(Eval("paymentplan").ToString())%></li>
                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

<!-- school 2 -->
<asp:Repeater ID="repeatSchool2" runat="server">
    <ItemTemplate>
        <div class="school-compare left">
            <div class="comp-min">
                <ul>
                    <li><h5><%#Eval("schoolname") %></h5></li>
                    <li><b><%#Eval("city") %>, <%#Eval("state") %>, <%#Eval("country") %></b></li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">View Profile</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%#Eval("shortdescription").ToString().Substring(0, 100) %>...</li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">Read More</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Founded: </b><%#Eval("founded") %></li>
                    <li><%#Eval("size") %> Acres</li>
                    <li><%#Eval("religion") %></li>
                    <li><%#Eval("dresscode") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Boarding Gr. </b><%#Eval("boardgraderange") %></li>
                    <li><b>Day Gr. </b><%#Eval("daygraderange") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Total Boarding: </b><%#Eval("totalboard") %></li>
                    <li><b>Total Day: </b><%#Eval("totalday") %></li>
                    <li><b>Total Enrollment: </b><%#Eval("totalenrollment") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%# CalculatePercentage(Eval("boystotal").ToString(),2) %> Boys</li>
                    <li><%# CalculatePercentage(Eval("girlstotal").ToString(),2) %> Girls</li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Summer Programs: </b><%#DetermineStatus(Eval("summer").ToString())%></li>
                </ul>
            </div>
            <div class="noborder">
                <ul>
                    <li><b>7-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("7daytuition").ToString())%></li>
                    <li><b>5-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("5daytuition").ToString())%></li>
                    <li><b>Day Tuition: </b><%#ConvertToDollar(Eval("daytuition").ToString())%></li>
                    <li><b>Need-Based Aid: </b><%#DetermineStatus(Eval("needaid").ToString()) %></li>
                    <li><b>Merit Scholarship: </b><%#DetermineStatus(Eval("merit").ToString()) %></li>
                    <li><b>Payment Plans: </b><%#DetermineStatus(Eval("paymentplan").ToString())%></li>
                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

<!-- school 3 -->
<asp:Repeater ID="repeatSchool3" runat="server">
    <ItemTemplate>
        <div class="school-compare left">
            <div class="comp-min">
                <ul>
                    <li><h5><%#Eval("schoolname") %></h5></li>
                    <li><b><%#Eval("city") %>, <%#Eval("state") %>, <%#Eval("country") %></b></li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">View Profile</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%#Eval("shortdescription").ToString().Substring(0, 100) %>...</li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">Read More</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Founded: </b><%#Eval("founded") %></li>
                    <li><%#Eval("size") %> Acres</li>
                    <li><%#Eval("religion") %></li>
                    <li><%#Eval("dresscode") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Boarding Gr. </b><%#Eval("boardgraderange") %></li>
                    <li><b>Day Gr. </b><%#Eval("daygraderange") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Total Boarding: </b><%#Eval("totalboard") %></li>
                    <li><b>Total Day: </b><%#Eval("totalday") %></li>
                    <li><b>Total Enrollment: </b><%#Eval("totalenrollment") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%# CalculatePercentage(Eval("boystotal").ToString(),3) %> Boys</li>
                    <li><%# CalculatePercentage(Eval("girlstotal").ToString(),3) %> Girls</li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Summer Programs: </b><%#DetermineStatus(Eval("summer").ToString())%></li>
                </ul>
            </div>
            <div class="noborder">
                <ul>
                    <li><b>7-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("7daytuition").ToString())%></li>
                    <li><b>5-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("5daytuition").ToString())%></li>
                    <li><b>Day Tuition: </b><%#ConvertToDollar(Eval("daytuition").ToString())%></li>
                    <li><b>Need-Based Aid: </b><%#DetermineStatus(Eval("needaid").ToString()) %></li>
                    <li><b>Merit Scholarship: </b><%#DetermineStatus(Eval("merit").ToString()) %></li>
                    <li><b>Payment Plans: </b><%#DetermineStatus(Eval("paymentplan").ToString())%></li>
                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

<!-- school 4 -->
<asp:Repeater ID="repeatSchool4" runat="server">
    <ItemTemplate>
        <div class="school-compare left">
            <div class="comp-min">
                <ul>
                    <li><h5><%#Eval("schoolname") %></h5></li>
                    <li><b><%#Eval("city") %>, <%#Eval("state") %>, <%#Eval("country") %></b></li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">View Profile</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%#Eval("shortdescription").ToString().Substring(0, 100) %>...</li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">Read More</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Founded: </b><%#Eval("founded") %></li>
                    <li><%#Eval("size") %> Acres</li>
                    <li><%#Eval("religion") %></li>
                    <li><%#Eval("dresscode") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Boarding Gr. </b><%#Eval("boardgraderange") %></li>
                    <li><b>Day Gr. </b><%#Eval("daygraderange") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Total Boarding: </b><%#Eval("totalboard") %></li>
                    <li><b>Total Day: </b><%#Eval("totalday") %></li>
                    <li><b>Total Enrollment: </b><%#Eval("totalenrollment") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%# CalculatePercentage(Eval("boystotal").ToString(),4) %> Boys</li>
                    <li><%# CalculatePercentage(Eval("girlstotal").ToString(),4) %> Girls</li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Summer Programs: </b><%#DetermineStatus(Eval("summer").ToString())%></li>
                </ul>
            </div>
            <div class="noborder">
                <ul>
                    <li><b>7-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("7daytuition").ToString())%></li>
                    <li><b>5-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("5daytuition").ToString())%></li>
                    <li><b>Day Tuition: </b><%#ConvertToDollar(Eval("daytuition").ToString())%></li>
                    <li><b>Need-Based Aid: </b><%#DetermineStatus(Eval("needaid").ToString()) %></li>
                    <li><b>Merit Scholarship: </b><%#DetermineStatus(Eval("merit").ToString()) %></li>
                    <li><b>Payment Plans: </b><%#DetermineStatus(Eval("paymentplan").ToString())%></li>
                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>

<!-- school 5 -->
<asp:Repeater ID="repeatSchool5" runat="server">
    <ItemTemplate>
        <div class="school-compare left">
            <div class="comp-min">
                <ul>
                    <li><h5><%#Eval("schoolname") %></h5></li>
                    <li><b><%#Eval("city") %>, <%#Eval("state") %>, <%#Eval("country") %></b></li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">View Profile</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%#Eval("shortdescription").ToString().Substring(0, 100) %>...</li>
                    <li><a href="/school-profile.aspx?schoolid=<%#Eval("schoolid") %>">Read More</a></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Founded: </b><%#Eval("founded") %></li>
                    <li><%#Eval("size") %> Acres</li>
                    <li><%#Eval("religion") %></li>
                    <li><%#Eval("dresscode") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Boarding Gr. </b><%#Eval("boardgraderange") %></li>
                    <li><b>Day Gr. </b><%#Eval("daygraderange") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Total Boarding: </b><%#Eval("totalboard") %></li>
                    <li><b>Total Day: </b><%#Eval("totalday") %></li>
                    <li><b>Total Enrollment: </b><%#Eval("totalenrollment") %></li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><%# CalculatePercentage(Eval("boystotal").ToString(),5) %> Boys</li>
                    <li><%# CalculatePercentage(Eval("girlstotal").ToString(),5) %> Girls</li>
                </ul>
            </div>
            <div class="comp-min">
                <ul>
                    <li><b>Summer Programs: </b><%#DetermineStatus(Eval("summer").ToString())%></li>
                </ul>
            </div>
            <div class="noborder">
                <ul>
                    <li><b>7-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("7daytuition").ToString())%></li>
                    <li><b>5-Day Boarding Tuition: </b><%#ConvertToDollar(Eval("5daytuition").ToString())%></li>
                    <li><b>Day Tuition: </b><%#ConvertToDollar(Eval("daytuition").ToString())%></li>
                    <li><b>Need-Based Aid: </b><%#DetermineStatus(Eval("needaid").ToString()) %></li>
                    <li><b>Merit Scholarship: </b><%#DetermineStatus(Eval("merit").ToString()) %></li>
                    <li><b>Payment Plans: </b><%#DetermineStatus(Eval("paymentplan").ToString())%></li>
                </ul>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>