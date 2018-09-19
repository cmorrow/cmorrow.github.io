<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="job_title.ascx.cs" Inherits="TABS_UserControls.usercontrols.job_title" %>
<div class="bg">
    <div id="edit-school-pro" class="container-box zero">
        <div class="bt">&nbsp;</div>
        <div class="bm left">
            <div class="pad-bread left">
                <div class="left">
                    <ul class="breadcrumb addjob-bread">
                        <li><h2 class="red"><asp:Literal runat="server" ID="litJobTitle" /></h2></li>
                    </ul>
                </div>
                <a href="/for-schools/job-board.aspx?results=1" class="right">&lt;Return to Previous Page</a>
            </div>
            <div class="left18">
                
                <div>
					<p>
                    	<strong>Employer:</strong> <asp:Literal runat="server" ID="litEmployer" /><br />
                    	<strong>Type:</strong> <asp:Literal runat="server" ID="litJobAndCalendarTypes" /><br />
                    	<strong>Salary:</strong> <asp:Literal runat="server" ID="litSalary" /><br />
                    	<strong>Estimated Start Date:</strong> <asp:Literal runat="server" ID="litStartDate" /><br />
                    	<strong>Location:</strong> <asp:Literal runat="server" ID="litLocation" /><br />
                    	<strong>Category:</strong> <asp:Literal runat="server" ID="litCategory" /><br />
                    	<strong>Benefits:</strong> <asp:Literal runat="server" ID="litBenefits" />
					</p>
                </div>
                
                <div>
                    <strong>Job Description:</strong><br/>
                    <asp:Literal runat="server" ID="litJobDescription" />
					<br/><br/>
                </div>
                
                <div>
                    <strong>Requirements:</strong><br />
                    <asp:Literal runat="server" ID="litRequirements" />
					<br/><br/>
                </div>
                
                <div>
                    <strong>How to Apply:</strong><br />
                    <asp:Panel runat="server" ID="pnlSpecificInstructions" Visible="false">
                        <strong>Specific Instructions</strong><br />
                        <asp:Literal runat="server" id="litSpecificInstructions" />
						<br/><br/>
                    </asp:Panel>
                    
                    
                    <p><strong>Applications Accepted Via:</strong><p>
                    
                    <div runat="server" id="divRegularMail" visible="false">
                        Regular Mail<br />
                        <asp:Literal runat="server" ID="litRegularMailAttn" /><br />
                        <asp:Literal runat="server" ID="litRegularMailAddress1" /><br />
                        <asp:Literal runat="server" ID="litRegularMailAddress2" />
                        <asp:Literal runat="server" ID="litRegularMailCity" />, <asp:Literal runat="server" ID="litRegularMailState" /> <asp:Literal runat="server" ID="litRegularMailZip" />, <asp:Literal runat="server" ID="litRegularMailCountry" />
						<br/><br/>
                    </div>
                    
                    <div runat="server" id="divFax" Visible="false">
                        Fax<br />
                        <asp:Literal runat="server" ID="litFaxAttn" /><br />
                        <asp:Literal runat="server" ID="litFaxNum" />
						<br/><br/>
                    </div>
                    
                    <div runat="server" id="divEmail" Visible="false">
                        Email<br />
                        <asp:Literal runat="server" ID="litEmailContact" /><br />
                        <a href='mailto:<asp:Literal runat="server" ID="litEmailEmail" />'><asp:Literal runat="server" ID="litEmailEmailText" /></a>
                    	<br/><br/>
					</div>
                    
                    <div runat="server" id="divOnline" Visible="false">
                        Online<br />
                        <a href='<asp:Literal runat="server" ID="litURL" />'><asp:Literal runat="server" ID="litURLText" /></a>
                    	<br/><br/>
					</div>
                </div>
                
                <div runat="server" id="divContactInformation">
                    <h4>Contact Information:</h4>
                    <asp:Literal runat="server" ID="litContactName" Text="Contact Person: " /><br />
                    <asp:Literal runat="server" ID="litContactEmail" Text="Contact Email: " />
                </div>
                
                <div runat="server" id="divEmployerInformation">
                    <h4>Employer Information:</h4>
                    <%--<asp:Image runat="server" ID="imgLogo" /><br />--%>
					<div>
	                    <asp:Literal runat="server" ID="litSchoolName" /><br />
	                    <asp:Literal runat="server" id="litSchoolAddress1" /> <br />
	                    <asp:Literal runat="server" ID="litSchoolAddress2" />
	                    <asp:Literal runat="server" ID="litSchoolCity" />, <asp:Literal runat="server" ID="litSchoolState" /> <asp:Literal runat="server" ID="litSchoolZip" />, <asp:Literal runat="server" ID="litSchoolCountry" /><br />			
                    	<asp:Literal runat="server" ID="litSchoolURL" />
						<br/><br/>
					</div>
                </div>
                
                <div>
                    <strong>Posting Expires:</strong> <asp:Literal runat="server" ID="litPostingExpires" />
                </div>
	               
            </div>
			<div class="clear"></div>
        </div>
        <div class="bb clear">&nbsp;</div>    
    </div>
</div>