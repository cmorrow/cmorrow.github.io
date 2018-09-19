<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="workshop.ascx.cs" Inherits="TABS_UserControls.usercontrols.workshop" %>

<asp:Label runat="server" id="lblError" Visible="false" />
<h1 id="conf-head" style="cursor:default"><asp:Literal runat="server" ID="litWorkshopTitle" /></h1>
                    
    <div id="tabs-conference" class="left">
        <div class="tc-container left">
            <div class="tc floatclear" runat="server" id="divMainContainer">
               <ul class="cf-menu left" runat="server" id="ulTabs">
                   <li runat="server" id="liOverview" visible="false"><a href="#conference1"><asp:Literal runat="server" ID="litOverviewTabTitle" /></a></li>
                   <li runat="server" id="liRegistration" visible="false"><a href="#conference2"><asp:Literal runat="server" ID="litRegistrationTabTitle" /></a></li>
                   <li runat="server" id="liAgenda" visible="false"><a href="#conference3"><asp:Literal runat="server" ID="litAgendaTabTitle" /></a></li>
                   <li runat="server" id="liFacultyStaff" visible="false"><a href="#conference4"><asp:Literal runat="server" ID="litFacultyStaffTabTitle" /></a></li>
                   <li runat="server" id="liHotelInformation" visible="false"><a href="#conference5" class="cf-menu-green"><asp:Literal runat="server" ID="litHotelInformationTabTitle" /></a></li>
                   <li runat="server" id="liGroundTransportation" visible="false"><a href="#conference6" class="cf-menu-green"><asp:Literal runat="server" ID="litGroundTransportationTabTitle" /></a></li>  
                </ul>
            
                <div id="conference1" class="tr left">
                    <h3><asp:Literal runat="server" ID="litOverviewContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litOverviewContent" /></p>
                </div>
                
                <div id="conference2" class="tr left">
                    <h3><asp:Literal runat="server" ID="litRegistrationContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litRegistrationContent" /></p>
                </div>
                
                <div id="conference3" class="tr left">
                    <h3><asp:Literal runat="server" ID="litAgendaContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litAgendaContent" /></p>
                </div>
                
                <div id="conference4" class="tr left">
                    <h3><asp:Literal runat="server" ID="litFacultyStaffContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litFacultyStaffContent" /></p>
                </div>
                
                <div id="conference5" class="tr left">
                    <h3><asp:Literal runat="server" ID="litHotelInformationContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litHotelInformationContent" /></p>
                </div>
                
                <div id="conference6" class="tr left">
                    <h3><asp:Literal runat="server" ID="litGroundTransportationContentTitle" /></h3>
                    <p><asp:Literal runat="server" ID="litGroundTransportationContent" /></p>
                </div>
            </div>
        </div>
        <div class="tc-close clear">&nbsp;</div>
    </div>