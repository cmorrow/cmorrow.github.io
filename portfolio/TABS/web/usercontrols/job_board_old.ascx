<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="job_board.ascx.cs" Inherits="TABS_UserControls.usercontrols.job_board" %>
<%@ Register Assembly="obout_Grid_NET" Namespace="Obout.Grid" TagPrefix="obout" %>

<div style="padding:0 0 10px 0">
    <img src="/media/899/jobboard_h.gif" />
</div>

Use the fields below to search for teacher, coach, administrator and staff openings at schools that are members of The Association of Boarding Schools. 
<br />
To select multiple options from the boxes, hold down the CTRL key while clicking with your mouse (Command key on Macs). Also learn about the <a href="/about-tabs/about-us/careers-with-tabs.aspx">career opportunities</a> available at TABS in beautiful Asheville, North Carolina. 
<p>&nbsp;</p>


<asp:Panel runat="server" ID="pnlSearch">

    <div class="job-board">
        <div class="top">
            <div class="left">
            </div>
            <div class="right">
            </div>
        </div>
        <div class="middle">
            <div class="job-menu">
                <div class="col1 left">
                    <h2>
                        Search Jobs</h2>
                    <div class="leftCol left">
                        <h4>Categories</h4>
                        <asp:CheckBoxList runat="server" ID="cblJobCategories" 
                        DataTextField="JobCategory" 
                        DataValueField="JobCategoryId" />
                    </div>
                    <%--<div class="rightCol left">
                        
                    </div>--%>
                </div>
                <div class="col2 right">
                    <div class="leftCol left">
                        <h4>Keywords</h4>
                        <asp:TextBox runat="server" ID="tbKeywords" />
                        <div class="horizInputs">
                            <h4>Type</h4>
                            <asp:CheckBoxList runat="server" ID="cblJobTypes" DataTextField="JobType" DataValueField="JobTypeId" />
                        </div>
                        <div class="horizInputs">
                            <h4>Calendar year</h4>
                                <asp:CheckBoxList runat="server" ID="cblCalendarYear" DataTextField="CalendarYearType" DataValueField="CalendarYearTypeId" />
                        </div>
                        <h4>Salary: (in USD)</h4>
                        <asp:DropDownList runat="server" ID="ddlSalary" DataTextField="JobSalary" DataValueField="JobSalaryId" />             
                        <ul>
                            <li>
                                <asp:CheckBox runat="server" ID="cbSalaryUnspecified" Text="Include jobs with salary unspecified" /></li>
                        </ul>
                    </div>
                    <div class="rightCol left">
                        <h4>Location</h4>
                       <asp:ListBox runat="server" ID="lbStates" DataTextField="state" DataValueField="stateId" SelectionMode="Multiple" />    
                        <sup><em>Hold CTRL and click to select more than one.</em></sup>
                    </div>
                </div>
                <!-- end col2 -->
                <div class="job-board-btn floatclear">
                    <asp:Button runat="server" ID="btnSearch" CssClass="edit-save" Text="Search" 
                            onclick="btnSearch_Click" /> <asp:Button runat="server" ID="btnReset" 
                            CssClass="edit-reset" Text="Reset" onclick="btnReset_Click" />
                </div>
            </div>
            <!-- end job-menu -->
        </div>
        <!-- end middle -->
        <div class="bottom">
            <div class="left">
            </div>
            <div class="right">
            </div>
        </div>
    </div>
    <!-- end job-board -->
</asp:Panel>

<asp:Panel runat="server" ID="pnlResults" Visible="false">
    <asp:Button runat="server" ID="btnBackToSearch" 
            Text="Modify Search" 
            OnClick="btnBackToSearch_Click" 
            CssClass="edit-save"  />

    <obout:Grid ID="gridResults" runat="server" AutoGenerateColumns="false" AllowAddingRecords="false">
        <columns>
            <obout:Column DataField="PostingDate" HeaderText="Posted" DataFormatString="{0:MM/dd/yyyy}" Width="150px" />
            <obout:Column DataField="ExpirationDate" HeaderText="Expires" DataFormatString="{0:MM/dd/yyyy}" Width="150px" />
            <obout:Column HeaderText="Tile and Description" TemplateId="tmpTitle" />
            <obout:Column DataField="schoolname" HeaderText="School/Organization" />
            <obout:Column HeaderText="Location" TemplateId="tmpLocation" />
        </columns>
        <templates>
            <obout:GridTemplate runat="server" ID="tmpTitle">
                <Template>
                    <a href='/for-schools/job-board/job-listing.aspx?jobId=<%# Container.DataItem["JobId"] %>' target="_blank"><%# Container.DataItem["JobTitle"] %></a><br />
                    <%# Container.DataItem["JobDescription"] %>
                </Template>
            </obout:GridTemplate>
            <obout:GridTemplate runat="server" ID="tmpLocation">
                <Template>	
                      <%# Container.DataItem["city"] + ", " + Container.DataItem["state"] + ", " + Container.DataItem["country"] %> 
                </Template>
            </obout:GridTemplate>  
        </templates>
    </obout:Grid>
</asp:Panel>
