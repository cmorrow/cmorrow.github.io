<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="guidedsearch.ascx.cs"
    Inherits="TABS_UserControls.usercontrols.guidedsearch" %>

<style type="text/css">
    .style1
    {
        height: 16px;
    }
    .style2
    {
        height: 25px;
    }
</style>

<script type="text/javascript">
	$(function() {
		$("#slider-grades").slider({
			range: true,
			min: 0,
			max: 13,
			values: [<asp:Literal id="litGradeLowInit" runat="server" text="6" />, <asp:Literal id="litGradeHighInit" runat="server" text="12" />],
			slide: function(event, ui) {
				$("#<asp:Literal id="littbGradeLowId" runat="server" />").val(ui.values[0]);
				$("#<asp:Literal id="littbGradeHighId" runat="server" />").val(ui.values[1]);
			}
		});
		$("#slider-students").slider({
			range: true,
			min: 0,
			max: 1800,
			values: [<asp:Literal id="litStudentLowInit" runat="server" text="0" />, <asp:Literal id="litStudentHighInit" runat="server" text="1800" />],
			slide: function(event, ui) {
				$("#<asp:Literal id="littbStudentLowId" runat="server" />").val(ui.values[0]);
				$("#<asp:Literal id="littbStudentHighId" runat="server" />").val(ui.values[1]);
			}
		});
	});
</script>

<div class="gs-container left">
    <div class="gs left">
        <div class="gs-pad">
            <asp:Button ID="btnSearchTop" runat="server" Text="Search" CssClass="gs-search" 
                CausesValidation="False" />
            <asp:Button ID="btnResetTop" runat="server" Text="Reset" CssClass="gs-reset" />
            
            <h5><span>gender</span></h5>
            <asp:Label runat="server" ID="lblError" Text="* Please check at least one Gender Type." Visible="false" CssClass="error" />
            <div style="padding-left:24px">
                <asp:CheckBox ID="cbCoed" runat="server" Text="Coed" TextAlign="right" Checked="true" />
                <asp:CheckBox ID="cbAllBoys" runat="server" Text="All Boys" TextAlign="right" Checked="true" />
                <asp:CheckBox ID="cbAllGirls" runat="server" Text="All Girls" TextAlign="right" Checked="true" />
                
            </div>
            
            <h5><span>speciality</span></h5>
            <div style="padding-left:24px">
                <asp:RadioButton runat="server" ID="rbAnySpeciality" Text="Any" Checked="true" GroupName="grpSpeciality" />
                <asp:RadioButton runat="server" ID="rbMilitarySpeciality" Text="Military" GroupName="grpSpeciality" />
                <asp:RadioButton runat="server" ID="rbProfessionalSpeciality" Text="Pre-Professional Arts" GroupName="grpSpeciality" />
            </div>
                   
            <div id="sliderWrapper">
                <div style="display:none">
                    Grade Low:
                    <asp:TextBox ID="tbGradeLow" runat="server" Text="6" />
                    Grade High:
                    <asp:TextBox ID="tbGradeHigh" runat="server" Text="12" />
                </div>
                <h2 id="titleGradesOffered" class="sliderTitle">
                </h2>
                <div id="sliderGrades">
                    <div id="slider-grades">
                    </div>
                </div>
                <h2 id="titleTotalStudents" class="sliderTitle">
                </h2>
                <div id="sliderStudents">
                    <div id="slider-students">
                    </div>
                </div>
                <div style="display:none">
                    Students Low:
                    <asp:TextBox ID="tbStudentLow" runat="server" Text="0" />
                    Students High:
                    <asp:TextBox ID="tbStudentHigh" runat="server" Text="1800" />
                </div>
            </div>
            <!-- location -->
            <h5>
                <span>location</span></h5>
            <div class="gs-location">
                <div class="location-t">
                    <p>
                        Enter ZIP (US & Canada only)</p>
                </div>
                <div class="location-b left">
                    <asp:DropDownList ID="dropDistance" runat="server" CssClass="miles-km left">
                        <asp:ListItem Value="100" Text="100 (161)" />
                        <asp:ListItem Value="200" Text="200 (322)" />
                        <asp:ListItem Value="400" Text="400 (644)" />
                        <asp:ListItem Value="600" Text="600 (966)" />
                        <asp:ListItem Value="1000" Text="1000 (1609)" />
                    </asp:DropDownList>
                    <p>
                        miles (km)</p>
                    <p>
                        <span>from</span></p>
                    <asp:TextBox ID="textZip" runat="server" />
                    <asp:Button ID="buttonSearch2" runat="server" CssClass="location-submit" />
                    <asp:RegularExpressionValidator ID="revZip" runat="server" 
                        ValidationExpression="^\d{5}-\d{4}|\d{5}|[A-Z]\d[A-Z] \d[A-Z]\d$" 
                        ControlToValidate="textZip" />
                </div>
            </div>
            <h5 class="gs-m">
                Add more options</h5>
            <div id="gs-more" class="left">
                <div id="school-tabs" class="left">
                    <ul class="left">
                        <li><a class="search-more" href="#search-support">Support Programs</a></li>
                        <li><a class="search-more" href="#search-language">Languages &amp; Humanities Courses</a></li>
                        <li><a class="search-more" href="#search-advanced">Advanced/Enrichment Programs</a></li>
                        <li><a class="search-more" href="#search-math">Math,Science &amp; Computer Studies</a></li>
                        <li><a class="search-more" href="#search-drama">Drama,Visual Art &amp; Music Courses</a></li>
                        <li><a class="search-more" href="#search-ap">AP Courses</a></li>
                        <li><a class="search-more" href="#search-special">Special Programs</a></li>
                        <li><a class="search-more" href="#search-inter">Interscholastic Sports</a></li>
                        <li><a class="search-more" href="#search-art">Art and Music</a></li>
                        <li><a class="search-more" href="#search-recreat">Recreational Sports</a></li>
                        <li><a class="search-more" href="#search-clubs">Clubs and Organizations</a></li>
                    </ul>
                    <div id="search-support">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbESLBeginning" Text="ESL: Beginning" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCollegeCounseling" 
                                        Text="College Counseling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTechnologyCenter" Text="Technology Center" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbESLIntermediate" Text="ESL: Intermediate" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEveningStudyAssistance" Text="Evening Study Assistance" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSubjectTutoring" Text="Subject Tutoring" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbESLAdvanced" Text="ESL: Advanced" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLearningCenter" Text="Learning Center" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWritingCenter" Text="Writing Center" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbADDADHDSupport" Text="ADD/ADHD Support" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPeerTutoringSupport" Text="Peer Tutoring" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLearningDifferencesSupport" Text="Learning Differences Support" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudySkillsAssistance" Text="Study Skills Assistance" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-language">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>English</b>
                                </td>
                                <td>
                                    <b>Religion &amp; Philosophy</b>
                                </td>
                                <td>
                                    <b>Foreign Language</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbClassics" Text="Classics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTheBible" Text="The Bible" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChineseMandarin" Text="Chinese-Mandarin" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCreativeWriting" Text="Creative Writing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEthics" Text="Ethics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChineseCantonese" Text="Chinese-Cantonese" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHonors" Text="Honors" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFaith" Text="Faith" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFrench" Text="French" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLiterature" Text="Literature" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMoralPhilosophy" Text="Moral Philosophy" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGerman" Text="German" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPlaywriting" Text="Playwriting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMythology" Text="Mythology" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbItalian" Text="Italian" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPoetry" Text="Poetry" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhilosophy" Text="Philosophy" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbJapanese" Text="Japanese" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbReligious" Text="Religious" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRussian" Text="Russian" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>History</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSocialJustice" Text="Social Justice" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSpanish" Text="Spanish" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAsianHistory" Text="Asian History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTheology" Text="Theology" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGreek" Text="Greek" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbClassicalHistory" Text="Classical History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWorldReligions" Text="World Religions" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLatin" Text="Latin" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEuropeanHistoryLanguage" Text="European History" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMedievalHistory" Text="Medieval History" />
                                </td>
                                <td>
                                    <b>Humanities&nbsp; &amp; Social Sciences</b></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbUnitedStatesHistory" Text="United States History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAnthropology" Text="Anthropology" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWorldHistoryLanguage" Text="World History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEconomics" Text="Economics" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPsychologyLanguage" Text="Psychology" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSociology" Text="Sociology" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-advanced">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cb5DayBoarding" Text="5-Day Boarding" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbInternationalBaccalaureate" Text="International Baccalaureate" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDistanceLearning" Text="Distance Learing" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPostgraduateYear" Text="Postgraduate Year" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAPCourses" Text="AP Courses" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-math">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>Science</b>
                                </td>
                                <td>
                                    <b>Math</b>
                                </td>
                                <td>
                                    <b>Computer Studies</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAnatomy" Text="Anatomy" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAlgebra" Text="Algebra" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComputerApplications" Text="Computer Applications" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAnimalBehavior" Text="Animal Behavior" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCalculus" Text="Calculus" />
                                </td>
                                <td>
                                    <asp:CheckBox ID="cbComputerProgramming" runat="server" 
                                        Text="Computer Programming" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAstronomy" Text="Astronomy" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFunctions" Text="Functions" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComputerScience" Text="Computer Science" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAstrophysics" Text="Astrophysics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHonorsMath" Text="Honors Math" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMultimedia" Text="Multimedia" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBiologyMath" Text="Biology" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGeometry" Text="Geometry" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWebDesign" Text="Web Design" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBiotechnology" Text="Biotechnology" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbProbability" Text="Probability" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBotany" Text="Botany" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStatisticsMath" Text="Statistics" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChemistryMath" Text="Chemistry" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTrigonometry" Text="Trigonometry" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEarthScience" Text="Earth Science" />
                                </td>
                                <td>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEcology" Text="Ecology" />
                                </td>
                                <td>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbElectronics" Text="Electronics" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEntomology" Text="Entomology" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEnvironmentalScienceMath" Text="Environmental Science" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEpidemiology" Text="Epidemiology" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGenetics" Text="Genetics" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGeology" Text="Geology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHealth" Text="Health" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMarineBiology" Text="Marine Biology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMicrobiology" Text="Microbiology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOceanography" Text="Oceanography" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOrnithology" Text="Ornithology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPaleontology" Text="Paleontology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhysicalScience" Text="Physical Science" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhysics" Text="Physics" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhysiology" Text="Physiology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSportsMedicine" Text="Sports Medicine" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbZoology" Text="Zoology" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-drama">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>Performing Arts</b>
                                </td>
                                <td>
                                    <b>Visual Arts</b>
                                </td>
                                <td>
                                    <b>Music</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbActing" Text="Acting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cb3DDesign" Text="3-D Design" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBand" Text="Band" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBallet" Text="Ballet" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAnimation" Text="Animation" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChoralMusicDrama" Text="Choral Music" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChoreography" Text="Choreography" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbArchitecture" Text="Architecture" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComposition" Text="Composition" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDanceDrama" Text="Dance" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbArt" Text="Art" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbElectronicMusic" Text="Electronic Music" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDebate" Text="Debate" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbArtHistoryDrama" Text="Art History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHistoryofJazz" Text="History of Jazz" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDirecting" Text="Directing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCeramics" Text="Ceramics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHistoryofMusic" Text="History of Music" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDrama" Text="Drama" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDesign" Text="Design" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIndividualInstructions" Text="Individual Instructions" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFilmandVideo" Text="Film and Video" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDrawing" Text="Drawing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMusicAppreciation" Text="Music Appreciation" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHistoryofTheater" Text="History of Theater" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFashionDesign" Text="Fashion Design" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMusicHistory" Text="Music History" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLightingDesign" Text="Lighting Design" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFiberArts" Text="Fiber Arts" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMusicTheoryDrama" Text="Music Theory" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbModernDance" Text="Modern Dance" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGraphicDesign" Text="Graphic Design" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOpera" Text="Opera" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbProduction" Text="Production" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMetal" Text="Metal" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOrchestra" Text="Orchestra" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPublicSpeaking" Text="Public Speaking" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPainting" Text="Painting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPrinciplesofArranging" Text="Principles of Arranging" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStagecraft" Text="Stagecraft" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhotographyDrama" Text="Photography" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRecording" Text="Recording" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTelevisionProducion" Text="Television Production" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPortfolio" Text="Portfolio" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSolfegeEarTraining" Text="Solfege/Ear Training" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTheaterArts" Text="Theater Arts" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPottery" Text="Pottery" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSongwriting" Text="Songwriting" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTheaterDesign" Text="Theater Design" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPrintmaking" Text="Printmaking" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbVoice" Text="Voice" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbScreenprinting" Text="Screen-printing" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Writing</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbScreenwriting" Text="Screenwriting" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbJournalism" Text="Journalism" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSculpture" Text="Sculpture" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPublications" Text="Publications" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSilkscreen" Text="Silkscreen" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudioArtDrama" Text="Studio Art" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTextiles" Text="Textiles" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWeaving" Text="Weaving" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWoodworking" Text="Woodworking" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-ap">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbArtHistoryAP" Text="Art History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEnglishLiterature" Text="English Literature" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhysicsB" Text="Physics B" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBiologyAP" Text="Biology" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEnvironmentalScienceAP" Text="Environmental Science" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhysicsC" Text="Physics C" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCalculusAB" Text="Calculus AB" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEuropeanHistoryAP" Text="European History" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPsychologyAP" Text="Psychology" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCalculusBC" Text="Calculus BC" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFrenchLanguage" Text="French Language" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSpanishLanguage" Text="Spanish Language" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChemistryAP" Text="Chemistry" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFrenchLiterature" Text="French Literature" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSpanishLiterature" Text="Spanish Literature" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComparativeGovernmentPolitics" Text="Comparative Government & Politics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGermanLanguage" Text="German Language" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStatisticsAP" Text="Statistics" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComputerScienceA" Text="Computer Science A" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHumanGeography" Text="Human Geography" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudioArtAP" Text="Studio Art" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComputerScienceAB" Text="Computer Science AB" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLatinLiterature" Text="Latin Literature" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbUSGovernmentPolitics" Text="US Government &amp; Politics" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMacroeconomics" Text="Macroeconomics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLatinVirgil" Text="Latin: Virgil" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbUSHistory" Text="US History" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMicroeconomics" Text="Microeconomics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMusicTheoryAP" Text="Music Theory" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWorldHistoryAP" Text="World History" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEnglishLanguage" Text="English Language" />
                                </td>
                                <td>
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-special">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCommunityServiceSpecial" Text="Community Service" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbJROTC" Text="JROTC" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPersonalFinance" Text="Personal Finance" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbExchangePrograms" Text="Exchange Programs" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLeadership" Text="Leadership" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRifleTeamSpecial" Text="Rifle Team" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIndependentStudy" Text="Independent Study" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLearningatSeaPrograms" Text="Learning at Sea Programs" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSemesterYearOffCampus" Text="Semester/Year Off-Campus" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbInternships" Text="Internships" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOutdoorEducationSpecial" Text="Outdoor Education" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudyAbroad" Text="Study Abroad" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-inter">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>Winter Sports</b>
                                </td>
                                <td>
                                    <b>Indoor Sports</b>
                                </td>
                                <td>
                                    <b>Ball Games</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAlpineSkiRacingInter" Text="Alpine Ski Racing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAerobicsInter" Text="Aerobics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBaseballInter" Text="Baseball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAlpineSkiingInter" Text="Alpine Skiing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBowlingInter" Text="Bowling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBasketballInter" Text="Basketball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFigureSkatingInter" Text="Figure Skating" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCheerleadingInter" Text="Cheerleading" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCricketInter" Text="Cricket" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFreeStyleSkiingInter" Text="Free Style Skiing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDanceInter" Text="Dance" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFieldHockeyInter" Text="Field Hockey" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIceClimbingInter" Text="Ice Climbing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFencingInter" Text="Fencing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFootballInter" Text="Football" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIceHockeyInter" Text="Ice Hockey" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGymnasticsInter" Text="Gymnastics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGolfInter" Text="Golf" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIceSkatingInter" Text="Ice Skating" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbKickboxingInter" Text="Kickboxing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHandballInter" Text="Handball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLugeInter" Text="Luge" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMartialArtsInter" Text="Martial Arts" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbKickballInter" Text="Kickball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbNordicSkiRacingInter" Text="Nordic Ski Racing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPowerLiftingInter" Text="Power Lifting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLarcrosseInter" Text="Larcrosse" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbNordicSkiingInter" Text="Nordic Skiing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWeightLiftingInter" Text="Weight Lifting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRugbyInter" Text="Rugby" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSkiJumpingInter" Text="Ski Jumping" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWrestlingInter" Text="Wrestling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSoccerInter" Text="Soccer" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSnowboardingInter" Text="Snowboarding" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSoftballInter" Text="Softball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <b>Other Sports</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbVolleyballInter" Text="Volleyball" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style1">
                                    <b>Racquet Sports</b></td>
                                <td class="style1">
                                    <asp:CheckBox runat="server" ID="cbCampingInter" Text="Camping" />
                                </td>
                                <td class="style1">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBadmintonInter" Text="Badminton" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCrossCountryRunningInter" Text="Cross-Country Running" />
                                </td>
                                <td>
                                    <b>Water Sports</b></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPaddleTennisInter" Text="Paddle Tennis" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCurlingInter" Text="Curling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCanoeingInter" Text="Canoeing" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRacquetBallInter" Text="Racquet Ball" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDrillTeamInter" Text="Drill Team" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCrewInter" Text="Crew" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSquashInter" Text="Squash" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEquesrianInter" Text="Equestrian" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDivingInter" Text="Diving" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTableTennisInter" Text="Table Tennis" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHikingInter" Text="Hiking" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbKayakingInter" Text="Kayaking" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTennisInter" Text="Tennis" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHorsebackRidingInter" Text="Horseback Riding" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRaftingInter" Text="Rafting" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMountainBikingInter" Text="Mountain Biking" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSailingInter" Text="Sailing" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOutdoorEducationInter" Text="Outdoor Education" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSurfingInter" Text="Surfing" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPoloInter" Text="Polo" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSwimmingInter" Text="Swimming" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRifleTeamInter" Text="Rifle Team" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWaterPoloInter" Text="Water Polo" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRockClimbingInter" Text="Rock Climbing" />
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSkateboardingInter" Text="Skateboarding" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTrackandFieldInter" Text="Track and Field" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbUltimateFrisbeeInter" Text="Ultimate Frisbee" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            </table>
                    </div>
                    <div id="search-art">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>Music-Vocal</b>
                                </td>
                                <td>
                                    <b>Music-Instrumental</b>
                                </td>
                                <td>
                                    <b>Theater, Dance &amp; Visual Art</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbACappellaGroup" Text="A Cappella Group" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBrassEnsemble" Text="Brass Ensemble" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAudiovisualClub" Text="Audiovisual Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChamberChoir" Text="Chamber Choir" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChamberEnsemble" Text="Chamber Ensemble" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbArtClub" Text="Art Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChoralMusicArt" Text="Choral Music" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChamberOrchestra" Text="Chamber Orchestra" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDanceArt" Text="Dance" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGleeClub" Text="Glee Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFolkMusicClub" Text="Folk Music Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDramaClubArt" Text="Drama Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGospelChoir" Text="Gospel Choir" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGuitarEnsemble" Text="Guitar Ensemble" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTechCrew" Text="Tech Crew" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbImprovisationGroup" Text="Improvisation Group" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTheaterorDrama" Text="Theater or Drama" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbJazzEnsemble" Text="Jazz Ensemble" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPepBand" Text="Pep Band" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRockBand" Text="Rock Band" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStageBand" Text="Stage Band" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStringEnsemble" Text="String Ensemble" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-recreat">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>Winter Sports</b>
                                </td>
                                <td>
                                    <b>Indoor Sports</b>
                                </td>
                                <td>
                                    <b>Ball Games</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAlpineSkiRacingRecreat" Text="Alpine Ski Racing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAerobicsRecreat" Text="Aerobics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBaseballRecreat" Text="Baseball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAlpineSkiingRecreat" Text="Alpine Skiing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBowlingRecreat" Text="Bowling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBasketballRecreat" Text="Basketball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFigureSkatingRecreat" Text="Figure Skating" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCheerleadingRecreat" Text="Cheerleading" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCricketRecreat" Text="Cricket" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFreeStyleSkiingRecreat" Text="Free Style Skiing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDanceRecreat" Text="Dance" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFieldHockeyRecreat" Text="Field Hockey" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIceClimbingRecreat" Text="Ice Climbing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFencingRecreat" Text="Fencing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFootballRecreat" Text="Football" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIceHockeyRecreat" Text="Ice Hockey" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGymnasticsRecreat" Text="Gymnastics" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGolfRecreat" Text="Golf" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbIceSkatingRecreat" Text="Ice Skating" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbKickboxingRecreat" Text="Kickboxing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHandballRecreat" Text="Handball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLugeRecreat" Text="Luge" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMartialArtsRecreat" Text="Martial Arts" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbKickballRecreat" Text="Kickball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbNordicSkiRacingRecreat" Text="Nordic Ski Racing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPowerLiftingRecreat" Text="Power Lifting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLarcrosseRecreat" Text="Larcrosse" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbNordicSkiingRecreat" Text="Nordic Skiing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWeightLiftingRecreat" Text="Weight Lifting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRugbyRecreat" Text="Rugby" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSkiJumpingRecreat" Text="Ski Jumping" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWrestlingRecreat" Text="Wrestling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSoccerRecreat" Text="Soccer" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSnowboardingRecreat" Text="Snowboarding" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSoftballRecreat" Text="Softball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <b>Other Sports</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbVolleyballRecreat" Text="Volleyball" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Racquet Sports</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCampingRecreat" Text="Camping" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbBadmintonRecreat" Text="Badminton" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCrossCountryRunningRecreat" Text="Cross-Country Running" />
                                </td>
                                <td>
                                    <b>Water Sports</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPaddleTennisRecreat" Text="Paddle Tennis" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCurlingRecreat" Text="Curling" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCanoeingRecreat" Text="Canoeing" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRacquetBallRecreat" Text="Racquet Ball" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDrillTeamRecreat" Text="Drill Team" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCrewRecreat" Text="Crew" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSquashRecreat" Text="Squash" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEquesrianRecreat" Text="Equestrian" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDivingRecreat" Text="Diving" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTableTennisRecreat" Text="Table Tennis" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHikingRecreat" Text="Hiking" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbKayakingRecreat" Text="Kayaking" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTennisRecreat" Text="Tennis" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHorsebackRidingRecreat" Text="Horseback Riding" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRaftingRecreat" Text="Rafting" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMountainBikingRecreat" Text="Mountain Biking" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSailingRecreat" Text="Sailing" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOutdoorEducationRecreat" Text="Outdoor Education" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSurfingRecreat" Text="Surfing" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPoloRecreat" Text="Polo" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSwimmingRecreat" Text="Swimming" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRifleTeamRecreat" Text="Rifle Team" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWaterPoloRecreat" Text="Water Polo" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbRockClimbingRecreat" Text="Rock Climbing" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSkateboardingRecreat" Text="Skateboarding" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTrackandFieldRecreat" Text="Track and Field" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbUltimateFrisbeeRecreat" Text="Ultimate Frisbee" />
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="search-clubs">
                        <table class="more-check left">
                            <tr>
                                <td>
                                    <b>Political Organizations</b>
                                </td>
                                <td>
                                    <b>Academic</b>
                                </td>
                                <td>
                                    <b>Media</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAmnestyInternational" Text="Amnesty International" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbArchaeologyClub" Text="Archaeology Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbLiteraryMagazine" Text="Literary Magazine" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAnimalRightsClub" Text="Animal Rights Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAstronomyClub" Text="Astronomy Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbNewspaper" Text="Newspaper" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDiversityClub" Text="Diversity Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbClassicsClub" Text="Classics Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPhotographyClubs" Text="Photography" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbEnvironmentClub" Text="Environmental Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDebateClub" Text="Debate Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudentPublications" Text="Student Publications" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFreeTibet" Text="Free Tibet" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbForeignLanguageClubs" Text="Foreign Language Clubs" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudentRadioStation" Text="Student Radio Station" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbYoungDemocrats" Text="Young Democrats" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMathClub" Text="Math Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTVStation" Text="TV Station" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbYoungRepublicans" Text="Young Republicans" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbNationalHonorSociety" Text="National Honor Society" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbYearbook" Text="Yearbook" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPeerTutoringClubs" Text="Peer Tutoring" />
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Government</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbQuizBowl" Text="Quiz Bowl" />
                                </td>
                                <td>
                                    <b>Other</b>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDormProctors" Text="Dorm Proctors" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbScienceBowl" Text="Science Bowl" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbChessClub" Text="Chess Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHonorCouncil" Text="Honor Council" />
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbComputerClub" Text="Computer Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbModelUN" Text="Model UN" />
                                </td>
                                <td>
                                    <b>Athletics and Sports</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbDramaClubClub" Text="Drama Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbMockTrial" Text="Mock Trial" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFencing" Text="Fencing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFoodCouncil" Text="Food Council" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudentGovernment" Text="Student Government" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHorsebackRiding" Text="Horseback Riding" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFutureBusinessLeaders" 
                                        Text="Future Business Leaders of America" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSkateboardingClubs" Text="Skateboarding Clubs" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbGardening" Text="Gardening" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Religious &amp; Cultural Organizations</b>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSnowboarding" Text="Snowboarding" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbInvestmentClub" Text="Investment Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbAsianClub" Text="Asian Club" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSurfing" Text="Surfing" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbOutingClub" Text="Outing Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbFCA" Text="FCA" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWeightlifting" Text="Weightlifting" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPeerCounseling" Text="Peer Counseling" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbInternationalClubs" Text="International Clubs" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbYoga" Text="Yoga" />
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbPepClub" Text="Pep Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbJewishStudentOrganization" Text="Jewish Student Organization" />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSailingClub" Text="Sailing Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbScienceFictionClub" Text="Science Fiction Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <b>Service</b></td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbScouting" Text="Scouting" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbCommunityServiceClubs" Text="Community Service" />
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSexualitiesClubs" Text="Sexualities Clubs" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbHabitatforHumanity" Text="Habitat for Humanity" />
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbSolarCarClub" Text="Solar Car Club" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudentsAgainstDrunkDriving" Text="Students Against Drunk Driving" />
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbStudentActivities" Text="Student Activities" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbTheater" Text="Theater" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:CheckBox runat="server" ID="cbWoodworkingClub" Text="Woodworking Club" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <asp:Button ID="buttonSearch" runat="server" Text="Search" CssClass="gs-search" 
                CausesValidation="False" />
            <asp:Button ID="buttonReset" runat="server" Text="Reset" CssClass="gs-reset" />
        </div>
    </div>
    <div class="gr left">

                <asp:MultiView ID="multiResult" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewHow" runat="server">
                <div class="gs-pad">
                    <h5>
                        how it works</h5>
                    <img src="/resources/images/gr-1.gif" alt="" />
                    <img src="/resources/images/gr-2.gif" alt="" />
                    <img src="/resources/images/gr-3.gif" alt="" />
                </div>
            </asp:View>
            <asp:View ID="viewResult" runat="server">
                <div class="toggle-map">
                </div>
                <div class="clear">
                    &nbsp;</div>
                <div class="gs-pad gr-r">
                    <!-- map goes here -->
                    <div id="gs-map" style="width: 410px; height: 250px">
                    </div>

                    <%-- tabs.lbiatlanta.com --%>
                    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxGadj6Fh_VvfMCGL05R0bRS7HrGvPQAJV2INZNEnSU2yvmt7pxRDsN4VDxvD9mSJ7LAhJqFZS3AJLg"
                        type="text/javascript"></script>
                        
                    <%-- tabsbeta.lbiatlanta.com --%>
                    <%--<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxGadj6Fh_VvfMCGL05R0bRSxpEthv2AWJORagPruXvs5IUuomBRyVu2-KiCXF7IXMuvMVcoxK2xAEg"
                        type="text/javascript"></script>  --%>  
                    
                    <%--<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=ABQIAAAAxGadj6Fh_VvfMCGL05R0bRT2ELIiPtIjKWc6PsVoK6XPLV-tZhSsbeiW36_UOW2XPSHAGbJcE7lq-g"
                        type="text/javascript"></script>--%>
                        

                    <script type="text/javascript">                            
                            function initialize() {
                              if (GBrowserIsCompatible()) {
                                var map = new GMap2(document.getElementById("gs-map"));
                                map.addControl(new GSmallMapControl());
                                map.addControl(new GMapTypeControl());
                                map.setCenter(new GLatLng(<asp:Literal id="literalLat" runat="server"/>, <asp:Literal id="literalLong" runat="server"/>), 10);
                                map.setZoom(6);
                                
                                // customize each icon
                                var baseIcon = new GIcon(G_DEFAULT_ICON);
                                baseIcon.shadow = "http://www.google.com/mapfiles/shadow50.png";
                                baseIcon.iconSize = new GSize(20, 34);
                                baseIcon.shadowSize = new GSize(37, 34);
                                baseIcon.iconAnchor = new GPoint(9, 34);
                                baseIcon.infoWindowAnchor = new GPoint(9, 2);
                                
                                // create custom marker
                                function createMarker(point, index, text) {
                                    // Create a lettered icon for this point using our icon class
                                    var letter = index;
                                    var letteredIcon = new GIcon(baseIcon);
                                    letteredIcon.image = "http://www.google.com/mapfiles/marker" + letter + ".png";
                                    // Set up our GMarkerOptions object
                                    markerOptions = { icon:letteredIcon };
                                    var marker = new GMarker(point, markerOptions);
                                    
                                    GEvent.addListener(marker, "click", function() {
                                        marker.openInfoWindowHtml(text);
                                      });
                                    return marker;
                                }
                                
                                // Add 10 markers to the map
                                <asp:Literal id="literalMarkers" runat="server"/>
                              }
                            }

                    </script>

                    <script language="javascript">                        initialize();</script>


                        <div class="map-under floatclear">
                            <!-- ============ begin results pagination =================== -->
                            <a class="btnCompare left" href="javascript:void(0);" onclick="javascript:compareSchools();"><img src="/resources/images/compare.gif" /></a>
                            <div class="result-num right">
                                <h3 class="resultsTotal">Results:<asp:Literal runat="server" ID="litNumberofResults" /></h3>
                                <ul class="result-pages">
                                    <li id="liPrevious" runat="server" visible="false">
                                        <asp:LinkButton ID="linkPrevious" runat="server" Text="Previous" onclick="linkPrevious_Click" /></li>
                                    
                                    <asp:Repeater runat="server" ID="rptPageNumbers" 
                                        onitemdatabound="rptPageNumbers_ItemDataBound" 
                                        onitemcommand="rptPageNumbers_ItemCommand">
                                        <ItemTemplate>
                                            <li runat="server" id="liPageNumber"><asp:Label runat="server" ID="lblPageSelected" /><asp:LinkButton runat="server" id="lbPageNumber" /></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    
                                    <li id="liNext" runat="server" visible="false"><asp:LinkButton ID="linkNext" 
                                            runat="server" Text="Next" onclick="linkNext_Click" /></li>
                                    <%--<li class="noborder"><asp:LinkButton ID="linkViewAll" runat="server" Text="View All" /></li>--%>
                                </ul>                                 
                            </div>
                            <div class="clear"></div>
                            <!-- ============ begin results pagination =================== -->
                        </div>
                        <!-- end map-under div --> 
                </div>
                <table id="result-table" class="left" cellpadding="6" cellspacing="0" border="0">
                    <tr>
                        <td width="18px">
                        </td>
                        <td width="17px">
                        </td>
                        <td width="225px">
                            School Name
                        </td>
                        <td width="150px" class="loc-pad">
                            Location
                        </td>
                    </tr>
                    
                    <!-- repeat here -->
                    <asp:Repeater ID="repeatResult" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <asp:Literal ID="literalAlphabet" runat="server" />
                                </td>
                                <td>
                                    <input value="<%#Eval("schoolid") %>" name="schoolid" type="checkbox" />
                                </td>
                                <td>
                                    <%#Eval("schoolname") %>
                                </td>
                                <td class="gs-table-div">
                                    <%#Eval("city") %>,
                                    <%#Eval("state") %>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </asp:View>
            
            <asp:View runat="server" ID="vNoResults">
                <div>
                    <h5><span style="color:Red">There were no results for your search.  Please try to broaden your search criteria.</span></h5>
                </div>
            </asp:View>
            
        </asp:MultiView>

        <script language="javascript">
            var param;

            function compareSchools() {
                if (checkLimit() > 0 && checkLimit() < 6) {
                    window.location.href = '/find-a-school/search-tools/school-comparison.aspx?' + param;
                }
                else {
                    alert('Please select minimum of 1 check to maximum of 5 checkbox');
                }
            }

            function checkLimit() {
                val = 0;
                param = "";

                for (var i = 0; i < document.forms[0].schoolid.length; i++) {
                    if (document.forms[0].schoolid[i].checked) {
                        val += 1;
                        param += "sc" + val + "=" + document.forms[0].schoolid[i].value + "&";
                    }
                }

                return val;
            }
        
        </script>


    </div>
</div>
