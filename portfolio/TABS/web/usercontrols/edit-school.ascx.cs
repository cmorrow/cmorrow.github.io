using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using TABS_UserControls.resources.code.BAL;
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols {
    public partial class edit_school : System.Web.UI.UserControl {
        // initiate class
        private int userid;
        private int schoolid;
        private string totalRenewal;
        private TABS_UserControls.resources.code.BAL.tabs_admin adminlogic = new TABS_UserControls.resources.code.BAL.tabs_admin();
        private TABS_UserControls.resources.code.BAL.UserClass userlogic = new TABS_UserControls.resources.code.BAL.UserClass();
        private SchoolManagerClass manage = new SchoolManagerClass();
        private SchoolClass schoologic = new SchoolClass();
        private EventClass eventlogic = new EventClass();
        private NewsClass newslogic = new NewsClass();
        private ActivityClass activitylogic = new ActivityClass();

        string rootDirectory, imageDirectory, videoDirectory, audioDirectory;


        protected void Page_Init(object sender, EventArgs e) {
            userid = Convert.ToInt16(Session["userid"]);
            // debug
            //userid = 1;

            schoolid = userlogic.getUserByUserID(userid)[0].schoolid;
            rootDirectory = @ConfigurationManager.AppSettings["SchoolDirectory"].ToString() + schoolid.ToString() + @"\";
            imageDirectory = rootDirectory + @"images\";
            audioDirectory = rootDirectory + @"audio\";
            videoDirectory = rootDirectory + @"video\";
        }

        protected void Page_Load(object sender, EventArgs e) {
            // server-side binding
            buttonUpdate.Click += new EventHandler(buttonUpdate_Click);

            // pre-load info
            if (!Page.IsPostBack) {
                loadList();
                bindPage();
                GetRenewalInfo();
            }
            lblLastUpdated.Text = schoologic.getLastUpdatedTimeBySchoolId(schoolid)[0].lastupdated.ToString();

            DropDownList ddlCountry = (DropDownList)gridStudentCountry.Templates[0].Container.FindControl("ddlDiversityCountry");
            ddlCountry.DataSource = manage.getCountries();
            ddlCountry.DataBind();
        }

        void loadList() {
            // load list
            dropState.DataSource = adminlogic.getStates();
            dropState.DataBind();

            dropCountry.DataSource = adminlogic.getCountry();
            dropCountry.DataBind();

            dropPrefix.DataSource = adminlogic.getPrefix();
            dropPrefix.DataBind();

            dropGlanceAccredit1.DataSource = adminlogic.getAccredits();
            dropGlanceAccredit1.DataBind();

            dropGlanceAccredit2.DataSource = adminlogic.getAccredits();
            dropGlanceAccredit2.DataBind();

            dropGlanceCurrencies.DataSource = adminlogic.getCurrencies();
            dropGlanceCurrencies.DataBind();

            radioReligions.DataSource = adminlogic.getReligions();
            radioReligions.DataBind();

            dropGlanceAdmissionType.DataSource = adminlogic.getAdmissionTypes();
            dropGlanceAdmissionType.DataBind();

            dropCampusDressCode.DataSource = adminlogic.getDressCodes();
            dropCampusDressCode.DataBind();
        }

        void GetRenewalInfo() {
            bool active = manage.getRenewalStatusByYear(DateTime.Now.Year.ToString());
            if (active) {
                renewDiv.Visible = true;
                DataTable dueTable = manage.getSchoolDues(schoolid, DateTime.Now.Year.ToString());
                lblRenewalYr.Text = DateTime.Now.Year.ToString() + "-" + DateTime.Now.AddYears(1).Year.ToString();
                lblDue.Text = "$" + Convert.ToDecimal(dueTable.Rows[0]["totaldue"].ToString()).ToString();
                totalRenewal = dueTable.Rows[0]["totaldue"].ToString();
                lblDueDate.Text = "July 31, " + DateTime.Now.Year.ToString();
                DataTable schoolrenewalDT = manage.getCurrentYearSchoolRenewalStatus(schoolid);
                if (schoolrenewalDT.Rows.Count > 0) {
                    if (active) {
                        if (schoolrenewalDT.Rows[0]["renewaltype"].ToString() == "1") // Not Renewed Yet
                {
                            membershipLink.Enabled = true;
                        } else { membershipLink.Enabled = false; }
                    }
                }
            } 
            else {
                renewDiv.Visible = false;
            }

            ddlCountry.DataSource = manage.getCountries();
            ddlCountry.DataBind();
            ddlCountry.Items.FindByText("USA").Selected = true;

            ddlState.DataSource = manage.getStatesByCountryId(Convert.ToInt16(ddlCountry.SelectedValue));
            ddlState.DataBind();
        }

        void buttonUpdate_Click(object sender, EventArgs e) {
            // check imgages before continuing
            bool imgPassed = this.checkImages();
            if (imgPassed == true) 
            {
                // update
                updatePage();
                bindPage();
                schoologic.UpdateSchoolUpdatedTime(schoolid);
                //activitylogic.addSchoolAdminActivity(schoologic.getSchoolBySchoolID(schoolid)[0].schoolname + " updated profile", DateTime.Now);
            }
        }

        #region "Populate Page"

        void bindPage() {
            // populate content
            populateOverview();
            populatePhoto();
            populateHeadmaster();
            populateDiversity();
            populateGlance();
            populateAcademics();
            populateCampusLife();
            populateAA();
            populateCollegeInfo();
            populateAlumniQuotes();
            populateSummerProgram();
            populateCustom();
        }

        void populateAlumniQuotes() {
            DataTable dt = schoologic.getSchoolAlumniQuotes(schoolid);
            if (dt.Rows.Count > 0) 
            {
                foreach (DataRow row in dt.Rows) {
                    if (row["alumniranking"].ToString() == "1") 
                    {
                        txtQuote1.Text = row["quote"].ToString();
                        txtQuoteBio1.Text = row["bionotes"].ToString();
                        txtQuoteName1.Text = row["alumniname"].ToString();
                        txtQuoteYear1.Text = row["classyear"].ToString();
                    }
                    if (row["alumniranking"].ToString() == "2") {
                        txtQuote2.Text = row["quote"].ToString();
                        txtQuoteBio2.Text = row["bionotes"].ToString();
                        txtQuoteName2.Text = row["alumniname"].ToString();
                        txtQuoteYear2.Text = row["classyear"].ToString();
                    }
                    if (row["alumniranking"].ToString() == "3") {
                        txtQuote3.Text = row["quote"].ToString();
                        txtQuoteBio3.Text = row["bionotes"].ToString();
                        txtQuoteName3.Text = row["alumniname"].ToString();
                        txtQuoteYear3.Text = row["classyear"].ToString();
                    }
                }
            }
        }

        void populateOverview() {
            TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_schoolsRow row = adminlogic.getSchoolByID(schoolid)[0];

            // minimum required field
            textSchoolName.Text = row.schoolname;

            // extended fields
            if (row.IscoedNull() == false) {
                checkCoed.Checked = row.coed;
                checkAllBoys.Checked = row.allboys;
                checkAllGirls.Checked = row.allgirls;
                checkMilitary.Checked = row.military;
                checkElementary.Checked = row.elementary;
                checkJunior.Checked = row.junior;
                checkSecondary.Checked = row.secondary;
                checkPrePro.Checked = row.preprofessionalarts;
                textShortDescription.Text = row.shortdescription;
                textAddress1.Text = row.address1;
                textAddress2.Text = row.address2;
                textCity.Text = row.city;
                dropState.SelectedValue = row.stateid.ToString();
                textZip.Text = row.zip;
                dropCountry.SelectedValue = row.countryid.ToString();
                textMainPhone.Text = row.phone;
                textDirLastName.Text = row.directorlastname;
                textDirFirstName.Text = row.directorfirstname;
                textAdmPhone.Text = row.admissionphone;
                textAdmFree.Text = row.admission800;
                textFax.Text = row.fax;
                textEmail.Text = row.email;
                textWeb.Text = row.web;
                checkPreK.Checked = row._pre_k;
                checkKingdergarten.Checked = row.kindergarten;
                checkGrade1.Checked = row._1st;
                checkGrade2.Checked = row._2nd;
                checkGrade3.Checked = row._3rd;
                checkGrade4.Checked = row._4th;
                checkGrade5.Checked = row._5th;
                checkGrade6.Checked = row._6th;
                checkGrade7.Checked = row._7th;
                checkGrade8.Checked = row._8th;
                checkGrade9.Checked = row._9th;
                checkGrade10.Checked = row._10th;
                checkGrade11.Checked = row._11th;
                checkGrade12.Checked = row._12th;
                checkPostGrad.Checked = row._post_grad;

                linkSchool.NavigateUrl = "/school-profile.aspx?schoolid=" + row.schoolid.ToString();
            }

            eventGrid.DataSource = eventlogic.getCurrentProfileEvents(row.schoolid);
            eventGrid.DataBind();
            newsGrid.DataSource = newslogic.getCurrentProfileNews(row.schoolid);
            newsGrid.DataBind();
        }

        void populatePhoto() {
            if (adminlogic.getPhotoBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_photosRow row = adminlogic.getPhotoBySchoolID(schoolid)[0];

                if (!row.IslogoNull()) { imgPhotoLogo.Visible = true; }
                imgPhotoLogo.ImageUrl = "~/binary-image.aspx?section=logo&schoolid=" + schoolid.ToString();

                if (!row.Isimage1Null()) { imgPhotoImage1.Visible = true; }
                imgPhotoImage1.ImageUrl = "~/binary-image.aspx?section=frontcard&schoolid=" + schoolid.ToString();

                if (!row.Isimage2Null()) { imgPhotoImage2.Visible = true; }
                imgPhotoImage2.ImageUrl = "~/binary-image.aspx?section=backcard&schoolid=" + schoolid.ToString();

                //if (!row.Isimage3Null()) { imgPhotoImage3.Visible = true; }
                //imgPhotoImage3.ImageUrl = "~/resources/images/image.aspx?section=image3";
            }
        }

        void populateHeadmaster() {
            if (adminlogic.getHeadmasterBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_headmastersRow row = adminlogic.getHeadmasterBySchoolID(schoolid)[0];

                dropPrefix.SelectedValue = row.prefixid.ToString();
                textHeadmasterLastName.Text = row.lastname;
                textHeadmasterFirstName.Text = row.firstname;
                textHeadmasterTitle.Text = row.title;
                textHeadmasterCurrentYear.Text = row.currentschool.ToString();
                textHeadmasterBoardYear.Text = row.boardingschool.ToString();
                try { radioHeadmasterHiatus.SelectedValue = row.hiatus.ToString(); } catch { }
                textHeadmasterHiatusYear.Text = row.hiatusyears.ToString();
                try { radioHeadmasterRetiring.SelectedValue = row.retiring.ToString(); } catch { }
            }
        }

        void populateDiversity() {
            if (adminlogic.getDiversityBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_diversityRow row = adminlogic.getDiversityBySchoolID(schoolid)[0];

                textDivInternationalColor.Text = row.internationalcolor.ToString();
                textDivInternational.Text = row.international.ToString();
                textDivDomestic.Text = row.domesticcolor.ToString();
            }

            gridStudentCountry.DataSource = manage.getCountryDiversityBySchoolId(schoolid);
            gridStudentCountry.DataBind();
        }

        protected void BindDiversityGrid() {
            gridStudentCountry.DataSource = manage.getCountryDiversityBySchoolId(schoolid);
            gridStudentCountry.DataBind();
        }

        void populateGlance() {
            if (adminlogic.getGlanceBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_glanceRow row = adminlogic.getGlanceBySchoolID(schoolid)[0];

                if (!row.IsimageNull()) { imgGlance.Visible = true; }
                imgGlance.ImageUrl = "/binary-image.aspx?section=glance&schoolid=" + schoolid;

                textGlanceFounded.Text = row.founded.ToString();
                textGlanceCampusSize.Text = row.size.ToString();
                radioReligions.SelectedValue = row.religionid.ToString();
                textGlanceAccredited.Text = row.accredit.ToString();
                dropGlanceAccredit1.SelectedValue = row.accredit1id.ToString();
                dropGlanceAccredit2.SelectedValue = row.accredit2id.ToString();
                textGlanceGirlsBoarding.Text = row.girlsboard.ToString();
                textGlanceGirlsDay.Text = row.girlsday.ToString();
                textGlanceBoysBoarding.Text = row.boysboard.ToString();
                textGlanceBoysDay.Text = row.boysday.ToString();
                textGradeRangeBoard.Text = row.boardgraderange;
                textGradeRangeDay.Text = row.daygraderange;
                dropGlanceCurrencies.SelectedValue = row.currencyid.ToString();
                dropGlanceAdmissionType.SelectedValue = row.admissiontypeid.ToString();
                dropMonth.SelectedValue = row.admissiondate.Month.ToString();
                dropDay.SelectedValue = row.admissiondate.Day.ToString();
                textGlanceApplicationFee.Text = row.applicationfee;
                try { radioGlanceAcceptTabsApplication.SelectedValue = row.tabapplication.ToString(); } catch { }
                textGlance7DayTuition.Text = row._7daytuition.ToString();
                textGlance5DayTuition.Text = row._5daytuition.ToString();
                textGlanceDayTuition.Text = row.daytuition.ToString();
                try { radioGlancePaymentPlans.SelectedValue = row.paymentplan.ToString(); } catch { }
                try { radioGlanceNeedBasedAid.SelectedValue = row.needaid.ToString(); } catch { }
                textGlanceNeedAirPercentage.Text = row.needaidpercentage.ToString();
                textGlanceNeedAirAverage.Text = row.needaidaverage.ToString();
                try { radioGlanceMerit.SelectedValue = row.merit.ToString(); } catch { }
                textGlanceMeritPercentage.Text = row.meritpercentage.ToString();
                textGlanceMeritAverage.Text = row.meritaverage.ToString();
                textGlanceCurrentEndowment.Text = row.currentendowment;
                textGlanceStudentEndowment.Text = row.studentendowment;
                radioGlanceShowFinance.SelectedValue = row.showfinance.ToString();
            } else {
                radioReligions.SelectedValue = "12";
                dropGlanceCurrencies.SelectedValue = "1";
            }
        }

        void populateAcademics() {
            if (adminlogic.getAcademicBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_academicsRow row = adminlogic.getAcademicBySchoolID(schoolid)[0];

                if (!row.IsimageNull()) { imgAcademic.Visible = true; }
                imgAcademic.ImageUrl = "/binary-image.aspx?section=academics&schoolid=" + schoolid;


                textAcademicSummary.Text = row.summary;
                textAcademicDirLastName.Text = row.directorlastname;
                textAcademicDirFirstName.Text = row.directorfirstname;
                textAcademicDirTitle.Text = row.directortitle;
                textAcademicAvgClassSize.Text = row.classsize.ToString();
                textAcademicFullTimeTeachers.Text = row.fulltimeteacher.ToString();
                textAcademicApClassesOffered.Text = row.apcourses.ToString();
                textAcademictTeacherWithAdvDegree.Text = row.advancedteacher.ToString();
                textAcademicStudentAndTeacherRatio.Text = row.studentteacherratio.ToString();
                try { radioAcademicSatClasses.SelectedValue = row.saturday.ToString(); } catch { }
                try { radioAcademicSummerPrograms.SelectedValue = row.summer.ToString(); } catch { }
                textAcademicNoteworthy.Text = row.noteworthy.ToString();
                checkAcademic5Day.Checked = row.adv_5day;
                checkAcademicAP.Checked = row.adv_ap;
                checkAcademicBaccalaureate.Checked = row.adv_bacca;
                checkAcademicDistanceLearning.Checked = row.adv_distance;
                checkAcademicInternational.Checked = row.adv_int;
                checkAcademicPostGrad.Checked = row.adv_postgrad;
                textAcademicEnrichmentOther.Text = row.enrichmentother;
                textAcademicSupportOther.Text = row.supportother;
                checkSPAdd.Checked = row.sp_add;
                checkSPAssistance.Checked = row.sp_ast;
                checkSPCollege.Checked = row.sp_college;
                checkSPESLA.Checked = row.sp_esla;
                checkSPESLB.Checked = row.sp_eslb;
                checkSPESLC.Checked = row.sp_eslc;
                checkSPEve.Checked = row.sp_eve;
                checkSPLearningCenter.Checked = row.sp_learningcenter;
                checkSPLearningDiff.Checked = row.sp_learningdiff;
                checkSPPeer.Checked = row.sp_peer;
                checkSPSkills.Checked = row.sp_skills;
                checkSPSubj.Checked = row.sp_subj;
                //checkSPSupp.Checked = row.sp_supp;
                checkSPTech.Checked = row.sp_tech;
                checkSPWrite.Checked = row.sp_write;

                // english
                checkAcademicclassics.Checked = row.english_classic;
                checkAcademiccreativeWriting.Checked = row.english_creative;
                checkAcademichonors.Checked = row.english_honors;
                checkAcademicliterature.Checked = row.english_literature;
                checkAcademicplaywriting.Checked = row.english_playwriting;
                checkAcademicpoetry.Checked = row.english_poetry;
                textAcademicEnglishOther.Text = row.english_other;

                // foreign
                checkAcademicmandarin.Checked = row.foreign_mandarin;
                checkAcademiccantonese.Checked = row.foreign_cantonese;
                checkAcademicfrench.Checked = row.foreign_french;
                checkAcademicgerman.Checked = row.foreign_german;
                checkAcademicitalian.Checked = row.foreign_italian;
                checkAcademicjapanese.Checked = row.foreign_japanese;
                checkAcademicrussian.Checked = row.foreign_russian;
                checkAcademicspanish.Checked = row.foreign_spanish;
                checkAcademicgreek.Checked = row.foreign_greek;
                checkAcademiclatin.Checked = row.foreign_latin;
                textAcademicForeign.Text = row.foreign_other;

                // history
                checkAcademicasianHistory.Checked = row.history_asian;
                checkAcademicclassicalHistory.Checked = row.history_classical;
                checkAcademiceuropeHistory.Checked = row.history_european;
                checkAcademichistoryHonors.Checked = row.history_honors;
                checkAcademicmedievalHistory.Checked = row.history_medieval;
                checkAcademicusHistory.Checked = row.history_us;
                checkAcademicworldHistory.Checked = row.history_world;
                textAcademicHistoryOther.Text = row.history_other;

                // humanities/social science
                checkAcademicantropology.Checked = row.social_anthropology;
                checkAcademiceconomics.Checked = row.social_economics;
                checkAcademicpsychology.Checked = row.social_psychology;
                checkAcademicsociology.Checked = row.social_sociology;
                textAcademicSocialOther.Text = row.social_other;

                // religion
                checkAcademicbible.Checked = row.religion_bible;
                checkAcademicethics.Checked = row.religion_ethics;
                checkAcademicfaith.Checked = row.religion_faith;
                checkAcademicmoralPhilosophy.Checked = row.religion_moral;
                checkAcademicmythology.Checked = row.religion_mythology;
                checkAcademicphilosophy.Checked = row.religion_philosophy;
                checkAcademicreligiousStudy.Checked = row.religion_religious;
                checkAcademicsocialJustice.Checked = row.religion_social;
                checkAcademictheology.Checked = row.religion_thology;
                checkAcademicworldReligion.Checked = row.religion_world;
                textAcademicReligionOther.Text = row.religion_other;

                // science
                checkAcademicanatomy.Checked = row.science_anatomy;
                checkAcademicanimalBehavior.Checked = row.science_animal;
                checkAcademicastronomy.Checked = row.science_astronomy;
                checkAcademicastrophysics.Checked = row.science_astrophysics;
                checkAcademicbiology.Checked = row.science_biology;
                checkAcademicbiotech.Checked = row.science_biotechnology;
                checkAcademicbotany.Checked = row.science_botany;
                checkAcademicchemistry.Checked = row.science_chemistry;
                checkAcademicearthScience.Checked = row.science_earth;
                checkAcademicecology.Checked = row.science_ecology;
                checkAcademicelectronics.Checked = row.science_electronics;
                checkAcademicentomology.Checked = row.science_entomology;
                checkAcademicenvironmentalScience.Checked = row.science_enviromental;
                checkAcademicepidemiology.Checked = row.science_eidemiology;
                checkAcademicgenetics.Checked = row.science_genetics;
                checkAcademicgeology.Checked = row.science_geology;
                checkAcademichealth.Checked = row.science_health;
                checkAcademicmarineBiology.Checked = row.science_marine;
                checkAcademicmeteorology.Checked = row.science_meteorology;
                checkAcademicmicrobiology.Checked = row.science_microbiology;
                checkAcademicoceanography.Checked = row.science_oceanography;
                checkAcademicornithology.Checked = row.science_ornithology;
                checkAcademicpaleontology.Checked = row.science_paleontology;
                checkAcademicphysicalScience.Checked = row.science_physical;
                checkAcademicphysics.Checked = row.science_physics;
                checkAcademicphysiology.Checked = row.science_physilogy;
                checkAcademicsportsMedicine.Checked = row.science_sports;
                checkAcademiczoology.Checked = row.science_zoology;
                textAcademicScienceOther.Text = row.science_other;

                // math
                checkAcademicalgebra.Checked = row.math_algebra;
                checkAcademiccalculus.Checked = row.math_calculus;
                checkAcademicfunctions.Checked = row.math_functions;
                checkAcademichonorsMath.Checked = row.math_honors;
                checkAcademicgeometry.Checked = row.math_geometry;
                checkAcademicprobability.Checked = row.math_probability;
                checkAcademicstatistics.Checked = row.math_statistics;
                checkAcademictrig.Checked = row.math_trigonometry;
                textAcademicMathOther.Text = row.math_other;

                // computer studies
                checkAcademiccomApp.Checked = row.computer_applications;
                checkAcademiccomProgramming.Checked = row.computer_programming;
                checkAcademiccomScience.Checked = row.computer_science;
                checkAcademicmultimedia.Checked = row.computer_multimedia;
                checkAcademicwebDesign.Checked = row.computer_web;
                textAcademicComputerOther.Text = row.computer_other;

                // visual arts
                checkAcademicdesign3d.Checked = row.visual_3d;
                checkAcademicacting.Checked = row.visual_acting;
                checkAcademicanimation.Checked = row.visual_animation;
                checkAcademicarchitecture.Checked = row.visual_architecture;
                checkAcademicart.Checked = row.visual_art;
                checkAcademicartHistory.Checked = row.visual_arthistory;
                checkAcademicballet.Checked = row.visual_ballet;
                checkAcademicceramics.Checked = row.visual_ceramics;
                checkAcademicchoreography.Checked = row.visual_choreography;
                checkAcademicdance.Checked = row.visual_dance;
                checkAcademicdebate.Checked = row.visual_debate;
                checkAcademicdesign.Checked = row.visual_design;
                checkAcademicdirecting.Checked = row.visual_directing;
                checkAcademicdrama.Checked = row.visual_drama;
                checkAcademicdrawing.Checked = row.visual_drawing;
                checkAcademicfashionDesign.Checked = row.visual_fashion;
                checkAcademicfiberArts.Checked = row.visual_fiber;
                checkAcademicfilmVideo.Checked = row.visual_film;
                checkAcademicgraphicDesign.Checked = row.visual_graphic;
                checkAcademichistoryTheater.Checked = row.visual_theaterhistory;
                checkAcademicjournalism.Checked = row.visual_journalism;
                checkAcademiclightingDesign.Checked = row.visual_lighting;
                checkAcademicmetal.Checked = row.visual_metal;
                checkAcademicmodernDance.Checked = row.visual_moderndance;
                checkAcademicpainting.Checked = row.visual_painting;
                checkAcademicphotography.Checked = row.visual_photography;
                checkAcademicportfolio.Checked = row.visual_portfolio;
                checkAcademicpottery.Checked = row.visual_pottery;
                checkAcademicprintmaking.Checked = row.visual_printmaking;
                checkAcademicproduction.Checked = row.visual_production;
                checkAcademicpublications.Checked = row.visual_publications;
                checkAcademicpublicSpeaking.Checked = row.visual_publicspeaking;
                checkAcademicscreenPrinting.Checked = row.visual_screenpriting;
                checkAcademicscreenwriting.Checked = row.visual_screenwriting;
                checkAcademicsculpture.Checked = row.visual_sculpture;
                checkAcademicsilkscreen.Checked = row.visual_silkscreen;
                checkAcademicstagecraft.Checked = row.visual_stagecraft;
                checkAcademicstudioart.Checked = row.visual_studioart;
                checkAcademictvProduction.Checked = row.visual_televisionproduction;
                checkAcademictextiles.Checked = row.visual_textiles;
                checkAcademictheaterArt.Checked = row.visual_theaterarts;
                checkAcademictheaterDesign.Checked = row.visual_design;
                checkAcademicweaving.Checked = row.visual_weaving;
                checkAcademicwoodworking.Checked = row.visual_woodworking;
                textAcademicVisualOther.Text = row.visual_other;

                // music
                checkAcademicband.Checked = row.music_band;
                checkAcademicchoralMusic.Checked = row.music_choral;
                checkAcademiccomposition.Checked = row.music_composition;
                checkAcademicelectronicMusic.Checked = row.music_electronic;
                checkAcademichistoryJazz.Checked = row.music_jazzhistory;
                checkAcademichistoryOfMusic.Checked = row.music_musichistory;
                checkAcademicindividualInstructions.Checked = row.music_individual;
                checkAcademicmusicAppreciation.Checked = row.music_appreciation;
                checkAcademicmusicHistory.Checked = row.music_history;
                checkAcademicmusicTheory.Checked = row.music_theory;
                checkAcademicopera.Checked = row.music_opera;
                checkAcademicorchestra.Checked = row.music_orchestra;
                checkAcademicprincipleOfArranging.Checked = row.music_arranging;
                checkAcademicrecording.Checked = row.music_recording;
                checkAcademicsolfegeEarTraining.Checked = row.music_solfege;
                checkAcademicsongwriting.Checked = row.music_songwriting;
                checkAcademicvoice.Checked = row.music_voice;
                textAcademicMusicOther.Text = row.music_other;

                // special programs
                checkAcademiccommunityService.Checked = row.special_community;
                checkAcademicexchangePrograms.Checked = row.special_exchange;
                checkAcademicindependentStudy.Checked = row.special_independent;
                checkAcademicinternships.Checked = row.special_internship;
                checkAcademicjrotc.Checked = row.special_jrotc;
                checkAcademicleadership.Checked = row.special_leadership;
                checkAcademiclearningSeaPrograms.Checked = row.special_learningatsea;
                checkAcademicoutdoorEducation.Checked = row.special_outdoor;
                checkAcademicpersonalFinance.Checked = row.special_finance;
                checkAcademicrifleTeam.Checked = row.special_rifle;
                checkAcademicsemesterYearOffCampus.Checked = row.special_semester;
                checkAcademicstudyAbroad.Checked = row.special_abroad;
                textAcademicSpecialOther.Text = row.special_other;

                // ap courses
                checkAcademicartHistoryAP.Checked = row.ap_arthistory;
                checkAcademicbiologyAP.Checked = row.ap_biology;
                checkAcademiccalculusAB.Checked = row.ap_calculusab;
                checkAcademiccalculusBC.Checked = row.ap_calculuscd;
                checkAcademicchemistryAP.Checked = row.ap_chemistry;
                checkAcademiccompScienceA.Checked = row.ap_computera;
                checkAcademiccompScienceAB.Checked = row.ap_computerab;
                checkAcademicmacroeconomicsAP.Checked = row.ap_macroeconomics;
                checkAcademicmicroeconomicsAP.Checked = row.ap_microeconomics;
                checkAcademicenglishLanguageAP.Checked = row.ap_english;
                checkAcademicenglishLitAP.Checked = row.ap_englishliterature;
                checkAcademicenvironmentalScienceAP.Checked = row.ap_environmental;
                checkAcademiceuropeanHistoryAP.Checked = row.ap_europeanhistory;
                checkAcademicfrenchLanguageAP.Checked = row.ap_french;
                checkAcademicfrenchLitAP.Checked = row.ap_frenchliterature;
                checkAcademicgermanLanguageAP.Checked = row.ap_german;
                checkAcademiccompGovtPoliticsAP.Checked = row.ap_comparativegov;
                checkAcademicusGovAndPoliticsAP.Checked = row.ap_usgov;
                checkAcademichumanGeographyAP.Checked = row.ap_humangeography;
                checkAcademiclatinLitAP.Checked = row.ap_latinliterature;
                checkAcademiclatinVergilAP.Checked = row.ap_latinvergil;
                checkAcademicmusicTheoryAP.Checked = row.ap_musictheory;
                checkAcademicphysicsB.Checked = row.ap_physicsb;
                checkAcademicphysicsC.Checked = row.ap_physicsc;
                checkAcademicpsychologyAP.Checked = row.ap_psychology;
                checkAcademicspanishLanguageAP.Checked = row.ap_spanish;
                checkAcademicspanishLitAP.Checked = row.ap_spanishliterature;
                checkAcademicstatisticsAP.Checked = row.ap_statistics;
                checkAcademicstudioArtAP.Checked = row.ap_studioart;
                checkAcademicusHistoryAP.Checked = row.ap_ushistory;
                checkAcademicworldHistoryAP.Checked = row.ap_worldhistory;
                textAcademicAPOther.Text = row.ap_other;

                // distinctive
                textAcademicDistinctiveOther.Text = row.distinctive_other;
            }
        }

        void populateCampusLife() {
            if (adminlogic.getCampusLifeBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_campuslifesRow row = adminlogic.getCampusLifeBySchoolID(schoolid)[0];

                if (!row.IsimageNull()) { imgCampusLife.Visible = true; }
                imgCampusLife.ImageUrl = "/binary-image.aspx?section=campus&schoolid=" + schoolid;


                textCampusSummary.Text = row.summary;
                textcampusDirLastName.Text = row.directorlastname;
                textcampusDirFirstName.Text = row.directorfirstname;
                textcampusDirTitle.Text = row.directortitle;
                textavgStudentsDorm.Text = row.dormstudentaverage.ToString();
                textgirlsDorms.Text = row.dormgirls.ToString();
                textboysDorms.Text = row.dormboys.ToString();
                checkboxGameRoom.Checked = row.dorm_gameroom;
                checkboxLaundry.Checked = row.dorm_laundry;
                checkboxLounge.Checked = row.dorm_lounge;
                checkboxWIFI.Checked = row.dorm_wifi;
                checkboxVending.Checked = row.dorm_vending;
                textCampusDormOther.Text = row.dorm_other;
                dropCampusDressCode.SelectedValue = row.dresscodeid.ToString();
                textCampusStudentLife.Text = row.studentlife;

                // student life
                checkboxallWeatherTrack.Checked = row.facility_track;
                checkboxbaseballField.Checked = row.facility_baseball;
                checkboxbasketballCourt.Checked = row.facility_basketball;
                checkboxfitnessCenter.Checked = row.facility_fitness;
                checkboxtechCenterFacility.Checked = row.facility_technology;
                checkboxvolleyballCourt.Checked = row.facility_volleyball;
                checkboxsandVolleyballCourt.Checked = row.facility_sandvolleyball;
                checkboxfootballField.Checked = row.facility_football;
                checkboxindoorBasketballCourt.Checked = row.facility_basketballindoor;
                checkboxracquetballCourt.Checked = row.facility_racquetball;
                checkboxpool.Checked = row.facility_pool;
                checkboxindoorPool.Checked = row.facility_poolindoor;
                checkboxindoorClimbingWall.Checked = row.facility_wall;
                textCampusFacilitiesOther.Text = row.facility_other;

                // clubs
                checkboxamnestyIntl.Checked = row.club_amnesty;
                checkboxanimalRights.Checked = row.club_animal;
                checkboxarchaeologyClub.Checked = row.club_archaeology;
                checkboxasianClub.Checked = row.club_asian;
                checkboxastronomyClub.Checked = row.club_chess;
                checkboxchessClub.Checked = row.club_chess;
                checkboxclassicsClub.Checked = row.club_classics;
                checkboxcommunityServiceClub.Checked = row.club_community;
                checkboxcomputerClub.Checked = row.club_computer;
                checkboxdebateClub.Checked = row.club_debate;
                checkboxdiversityClub.Checked = row.club_diversity;
                checkboxdormProctors.Checked = row.club_dorm;
                checkboxdramaClub.Checked = row.club_drama;
                checkboxenvironmentalClub.Checked = row.club_environmental;
                checkboxFCA.Checked = row.club_fca;
                checkboxfencingClub.Checked = row.club_fencing;
                checkboxfoodCouncil.Checked = row.club_foodcouncil;
                checkboxforeignLanguageClub.Checked = row.club_foreignlanguage;
                checkboxfreeTibet.Checked = row.club_freetibet;
                checkboxfutureBizLeader.Checked = row.club_futureleaders;
                checkboxgardeningClub.Checked = row.club_gardening;
                checkboxhabitatForHumanity.Checked = row.club_habitat;
                checkboxhonorCouncil.Checked = row.club_honor;
                checkboxhorsebackRiding.Checked = row.club_horseback;
                checkboxinternationalClub.Checked = row.club_international;
                checkboxinvestmentClub.Checked = row.club_investment;
                checkboxjewishStudentOrg.Checked = row.club_jewish;
                checkboxliteraryMagazine.Checked = row.club_literary;
                checkboxmathClub.Checked = row.club_math;
                checkboxmockTrial.Checked = row.club_mocktrial;
                checkboxmodelUN.Checked = row.club_modelun;
                checkboxnewspaperClub.Checked = row.club_newspaper;
                checkboxoutingClub.Checked = row.club_outing;
                checkboxpeerCounseling.Checked = row.club_peercounseling;
                checkboxpeerTutoring.Checked = row.club_peertutoring;
                checkboxpepClub.Checked = row.club_pepclub;
                checkboxphotographyClub.Checked = row.club_photography;
                checkboxquizBowl.Checked = row.club_quizbowl;
                checkboxsailingClub.Checked = row.club_sailing;
                checkboxscienceBowl.Checked = row.club_sciencebowl;
                checkboxscienceFictionClub.Checked = row.club_sciencefiction;
                checkboxscoutingClub.Checked = row.club_scouting;
                checkboxsexualitiesClub.Checked = row.club_sexualities;
                checkboxskateboardClub.Checked = row.club_skateboarding;
                checkboxsnowboardClub.Checked = row.club_snowboarding;
                checkboxsolarCarClub.Checked = row.club_solarcar;
                checkboxstudentActiviyClub.Checked = row.club_studentactivities;
                checkboxstudentGovtClub.Checked = row.club_studentgov;
                checkboxstudentPublicationClub.Checked = row.club_publications;
                checkboxstudentRadioStation.Checked = row.club_radiostation;
                checkboxSADD.Checked = row.club_sadd;
                checkboxsurfingClub.Checked = row.club_surfing;
                checkboxtheaterClub.Checked = row.club_theater;
                checkboxtvStation.Checked = row.club_tvstation;
                checkboxweightliftingClub.Checked = row.club_weighlifting;
                checkboxwoodworkClub.Checked = row.club_woodworking;
                checkboxyearbook.Checked = row.club_yearbook;
                checkboxyogaClub.Checked = row.club_yoga;
                checkboxyoungDemocrats.Checked = row.club_youngdemocrats;
                checkboxyoungRepublicans.Checked = row.club_youngrepublicans;
                textCampusClubOther.Text = row.club_other;
                checkboxnationalHonorSociety.Checked = row.club_nhs;
            }
        }

        void populateAA() {
            if (adminlogic.getAABySChoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_artsandathleticsRow row = adminlogic.getAABySChoolID(schoolid)[0];

                if (!row.IsimageNull()) { imgAA.Visible = true; }
                imgAA.ImageUrl = "/binary-image.aspx?section=arts&schoolid=" + schoolid;

                artDirFirstName.Text = row.artdirectorfirstname;
                artDirLastName.Text = row.artdirectorlastname;
                artDirTitle.Text = row.artdirectortitle;
                athDirFirstName.Text = row.athleticdirectorfirstname;
                athDirLastName.Text = row.athleticdirectorlastname;
                athDirTitle.Text = row.athleticdirectortitle;
                artNote.Text = row.achievements;

                // art
                acapella.Checked = row.arts_acappella;
                artClub.Checked = row.arts_artclub;
                audioVisualClub.Checked = row.arts_audiovisual;
                brassEnsemble.Checked = row.arts_brass;
                chamberChoir.Checked = row.arts_chamberchoir;
                chamberEnsemble.Checked = row.arts_chamberensemble;
                chamberOrchestra.Checked = row.arts_chamberorchestra;
                choralMusicArt.Checked = row.arts_choral;
                artDance.Checked = row.arts_dance;
                dramaClubArt.Checked = row.arts_dramaclub;
                folkMusicClub.Checked = row.arts_folkmusic;
                gleeClub.Checked = row.arts_gleeclub;
                gospelChoir.Checked = row.arts_gospel;
                guitarEnsemble.Checked = row.arts_guitar;
                improvGroup.Checked = row.arts_improvisation;
                jazzEnsemble.Checked = row.arts_jazz;
                pepBand.Checked = row.arts_pep;
                rockBand.Checked = row.arts_rock;
                stageBand.Checked = row.arts_stage;
                stringEnsemble.Checked = row.arts_string;
                techCrew.Checked = row.arts_techcrew;
                theater.Checked = row.arts_theater;
                textArtsOther.Text = row.arts_other;

                // sports
                interAerobics.Checked = row.sports_aerobics;
                interAlpineRacing.Checked = row.sports_alpineskiing;
                interAlpineSkiing.Checked = row.sports_alpineskiracing;
                interBadminton.Checked = row.sports_badminton;
                interBaseball.Checked = row.sports_baseball;
                interBasketball.Checked = row.sports_basketball;
                interBowling.Checked = row.sports_bowling;
                interCamping.Checked = row.sports_camping;
                interCanoeing.Checked = row.sports_canoeing;
                interCheerleading.Checked = row.sports_cheerleading;
                interCrew.Checked = row.sports_crew;
                interCricket.Checked = row.sports_cricket;
                interCrossCountry.Checked = row.sports_crosscountry;
                interCurling.Checked = row.sports_curling;
                interDance.Checked = row.sports_dance;
                interDiving.Checked = row.sports_diving;
                interDrillTeam.Checked = row.sports_drillteam;
                interEquestrian.Checked = row.sports_equestrian;
                interFencing.Checked = row.sports_fencing;
                interFigureSkating.Checked = row.sports_figureskating;
                interFieldHockey.Checked = row.sports_fieldhockey;
                interFootball.Checked = row.sports_football;
                interFreestyleSki.Checked = row.sports_freestyleski;
                interGolf.Checked = row.sports_golf;
                interGymnastics.Checked = row.sports_gymnastics;
                interHandball.Checked = row.sports_handball;
                interHiking.Checked = row.sports_hiking;
                interHorseback.Checked = row.sports_horseback;
                interIceClimbing.Checked = row.sports_iceclimbing;
                interIceHockey.Checked = row.sports_icehockey;
                interIceSkating.Checked = row.sports_iceskating;
                interKayaking.Checked = row.sports_kayaking;
                interKickball.Checked = row.sports_kickball;
                interKickboxing.Checked = row.sports_kickboxing;
                interLacrosse.Checked = row.sports_lacrosse;
                interLuge.Checked = row.sports_luge;
                interMartialArt.Checked = row.sports_martialarts;
                interMtBike.Checked = row.sports_mountainbike;
                interNordicSkiRacing.Checked = row.sports_nordicskiing;
                interNordicSki.Checked = row.sports_nordicskiracing;
                interOutdoorEdu.Checked = row.sports_outdooreducation;
                interPaddleTennis.Checked = row.sports_paddletennis;
                interPolo.Checked = row.sports_polo;
                interPowerLifting.Checked = row.sports_powerlifting;
                interRacquet.Checked = row.sports_racquetball;
                interRafting.Checked = row.sports_rafting;
                interRifle.Checked = row.sports_rifleteam;
                interRockClimbing.Checked = row.sports_rockclimbing;
                interRugby.Checked = row.sports_rugby;
                interSailing.Checked = row.sports_sailing;
                interSkateboard.Checked = row.sports_skateboarding;
                interSkiJump.Checked = row.sports_skijumping;
                interSnowboard.Checked = row.sports_snowboarding;
                interSoccer.Checked = row.sports_soccer;
                interSoftball.Checked = row.sports_softball;
                interSquash.Checked = row.sports_squash;
                interSurfing.Checked = row.sports_surfing;
                interSwimming.Checked = row.sports_swimming;
                interTableTennis.Checked = row.sports_tabletennis;
                interTennis.Checked = row.sports_tennis;
                interTrackField.Checked = row.sports_trackandfield;
                interUltFrisbee.Checked = row.sports_ultimatefrisbee;
                interVolleyball.Checked = row.sports_volleyball;
                interWaterPolo.Checked = row.sports_waterpolo;
                interWeightLifting.Checked = row.sports_weightlifting;
                interWrestling.Checked = row.sports_wrestling;
                textSportsOther.Text = row.sports_other;

                // rec
                reAerobics.Checked = row.rec_aerobics;
                recAlpineSkiRacing.Checked = row.rec_alpineskiing;
                recAlpineSki.Checked = row.rec_alpineskiracing;
                recBadminton.Checked = row.rec_badminton;
                recBaseball.Checked = row.rec_baseball;
                recBasketball.Checked = row.rec_basketball;
                recBowling.Checked = row.rec_bowling;
                recCamping.Checked = row.rec_camping;
                recCanoeing.Checked = row.rec_canoeing;
                recCheerleading.Checked = row.rec_cheerleading;
                recCrew.Checked = row.rec_crew;
                recCricket.Checked = row.rec_cricket;
                recCrossCountry.Checked = row.rec_crosscountry;
                recCurling.Checked = row.rec_curling;
                recDance.Checked = row.rec_dance;
                recDiving.Checked = row.rec_diving;
                recDrillTeam.Checked = row.rec_drillteam;
                recEquestrian.Checked = row.rec_equestrian;
                recFencing.Checked = row.rec_fencing;
                recFieldHockey.Checked = row.rec_fieldhockey;
                recFigureSkating.Checked = row.rec_figureskating;
                recFootball.Checked = row.rec_football;
                recFreeStyleSki.Checked = row.rec_freestyleskiing;
                recGolf.Checked = row.rec_golf;
                recGymnastics.Checked = row.rec_gymnastics;
                recHandball.Checked = row.rec_handball;
                recHiking.Checked = row.rec_hiking;
                recHorseback.Checked = row.rec_horsebackriding;
                recIceClimbing.Checked = row.rec_iceclimbing;
                recIceHockey.Checked = row.rec_icehockey;
                recKayaking.Checked = row.rec_kayaking;
                recLacrosse.Checked = row.rec_lacrosse;
                recLuge.Checked = row.rec_luge;
                recMartialArts.Checked = row.rec_martialarts;
                recMtBike.Checked = row.rec_mountainbiking;
                recNordicSkiRacing.Checked = row.rec_nordicskiiing;
                recNordicSkiing.Checked = row.rec_nordicskiracing;
                recOutdoorEdu.Checked = row.rec_outdooreducation;
                recPaddleTennis.Checked = row.rec_paddletennis;
                recPolo.Checked = row.rec_polo;
                recPowerLifting.Checked = row.rec_powerlifting;
                recRacquet.Checked = row.rec_racquetball;
                recRafting.Checked = row.rec_rafting;
                recRifilTeam.Checked = row.rec_rifleteam;
                recRockCilmbing.Checked = row.rec_rockclimbing;
                recRugby.Checked = row.rec_rugby;
                recSailing.Checked = row.rec_sailing;
                recSkateboarding.Checked = row.rec_skateboarding;
                recSkiJumping.Checked = row.rec_skijumping;
                recSnowboarding.Checked = row.rec_snowboarding;
                recSoccer.Checked = row.rec_soccer;
                recSoftball.Checked = row.rec_softball;
                recSquash.Checked = row.rec_squash;
                recSurfing.Checked = row.rec_surfing;
                recSwimming.Checked = row.rec_swimming;
                recTableTennis.Checked = row.rec_tabletennis;
                recTennis.Checked = row.rec_tennis;
                recTrackField.Checked = row.rec_trackandfield;
                recUltFrisbee.Checked = row.rec_ultimatefrisbee;
                recVolleyball.Checked = row.rec_volleyball;
                recWaterPolo.Checked = row.rec_waterpolo;
                recWeightLifting.Checked = row.rec_weightlifting;
                recWrestling.Checked = row.rec_wrestling;
                textRecOther.Text = row.rec_other;
            }
        }

        void populateCollegeInfo() {
            if (adminlogic.getCollgeInfoBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_collegeinfosRow row = adminlogic.getCollgeInfoBySchoolID(schoolid)[0];

                if (!row.IsimageNull()) { imgCollegeInfo.Visible = true; }
                imgCollegeInfo.ImageUrl = "/binary-image.aspx?section=collegeinfo&schoolid=" + schoolid;

                textCollegeSummary.Text = row.summary;
                textCollegeDirLastName.Text = row.directorlastname;
                textCollegeDirFirstName.Text = row.directorfirstname;
                textCollegeDirTitle.Text = row.directortitle;
                textCollegePercHigherEd.Text = row.collegepercentage.ToString();
                textCollegeAtt1.Text = row.college1;
                textCollegeAtt2.Text = row.college2;
                textCollegeAtt3.Text = row.college3;
                textCollegeAtt4.Text = row.college4;
                textCollegeAtt5.Text = row.college5;
                textCollegeAtt1No.Text = row.college1no.ToString();
                textCollegeAtt2No.Text = row.college2no.ToString();
                textCollegeAtt3No.Text = row.college3no.ToString();
                textCollegeAtt4No.Text = row.college4no.ToString();
                textCollegeAtt5No.Text = row.college5no.ToString();
                tbCriticalReading25.Text = row["SATCriticalReading25"].Equals(DBNull.Value)? string.Empty : row.SATCriticalReading25.ToString();
                tbCriticalReading75.Text = row["SATCriticalReading75"].Equals(DBNull.Value) ? string.Empty : row.SATCriticalReading75.ToString();
                tbMathematics25.Text = row["SATMathematics25"].Equals(DBNull.Value) ? string.Empty : row.SATMathematics25.ToString();
                tbMathematics75.Text = row["SATMathematics75"].Equals(DBNull.Value) ? string.Empty : row.SATMathematics75.ToString();
                tbWriting25.Text = row["SATWriting25"].Equals(DBNull.Value) ? string.Empty : row.SATWriting25.ToString();
                tbWriting75.Text = row["SATWriting75"].Equals(DBNull.Value) ? string.Empty : row.SATWriting75.ToString();
            }

            DataTable dt = schoologic.getCollegeAlumniInfo(schoolid);

            if (dt.Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_collegealumniRow row = (TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_collegealumniRow)dt.Rows[0];
                txtAName1.Text = row.alumniname1;
                txtAYear1.Text = row.classyear1.ToString();
                txtANotes1.Text = row.notes1;
                txtAName2.Text = row.alumniname2;
                txtAYear2.Text = row.classyear2.ToString();
                txtANotes2.Text = row.notes2;
                txtAName3.Text = row.alumniname3;
                txtAYear3.Text = row.classyear3.ToString();
                txtANotes3.Text = row.notes3;
                txtAName4.Text = row.alumniname4;
                txtAYear4.Text = row.classyear4.ToString();
                txtANotes4.Text = row.notes4;
                txtAName5.Text = row.alumniname5;
                txtAYear5.Text = row.classyear5.ToString();
                txtANotes5.Text = row.notes5;
                txtAName6.Text = row.alumniname6;
                txtAYear6.Text = row.classyear6.ToString();
                txtANotes6.Text = row.notes6;
                txtAName7.Text = row.alumniname7;
                txtAYear7.Text = row.classyear7.ToString();
                txtANotes7.Text = row.notes7;
                txtAName8.Text = row.alumniname8;
                txtAYear8.Text = row.classyear8.ToString();
                txtANotes8.Text = row.notes8;
                txtAName9.Text = row.alumniname9;
                txtAYear9.Text = row.classyear9.ToString();
                txtANotes9.Text = row.notes9;
                txtAName10.Text = row.alumniname10;
                txtAYear10.Text = row.classyear10.ToString();
                txtANotes10.Text = row.notes10;
            }


        }

        void populateSummerProgram() {
            if (adminlogic.getSummerProgramBySchoolID(schoolid).Rows.Count > 0) {

                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_summerprogramsRow row = adminlogic.getSummerProgramBySchoolID(schoolid)[0];
                if (!row.IsimageNull()) { imgsummer.Visible = true; }
                imgsummer.ImageUrl = "~/resources/images/schoolimages/" + schoolid + "/images/" + row.image;

                textSummerProgramSummary.Text = row.summarprogram;
            }

            DataTable programData = schoologic.getSummerProgramDetailsBySchoolIdandProgramId(schoolid, 1);
            if (programData.Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_summerprogramdetailsRow detailRow = schoologic.getSummerProgramDetailsBySchoolIdandProgramId(schoolid, 1)[0];
                txtProgram1.Text = detailRow.name;
                txtProgram1Deadline.Text = detailRow.deadline.ToString();
                txtProgram1Desc.Text = detailRow.description;
                txtProgram1DirName.Text = detailRow.directorname;
                txtProgram1DirTitle.Text = detailRow.directortitle;
                txtProgram1End.Text = detailRow.ends.ToString();
                txtProgram1Start.Text = detailRow.starts.ToString();
                txtProgram1Tuition.Text = detailRow.tuition;
                txtProgram1Url.Text = detailRow.url;
                ddlProgram1Boarding.Items.FindByText(detailRow.boarding).Selected = true;
                ddlProgram1Type.Items.FindByText(detailRow.programname).Selected = true;
                if (detailRow.aid.Equals("Yes"))
                {
                    rdoProgram1.SelectedIndex = rdoProgram1.Items.IndexOf(rdoProgram1.Items.FindByValue("Yes"));
                }
                else
                {
                    if (detailRow.aid.Equals("No"))
                    {
                        rdoProgram1.SelectedIndex = rdoProgram1.Items.IndexOf(rdoProgram1.Items.FindByValue("No"));
                    }
                }

            }

            DataTable programData2 = schoologic.getSummerProgramDetailsBySchoolIdandProgramId(schoolid, 2);
            if (programData2.Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_summerprogramdetailsRow detailRow = schoologic.getSummerProgramDetailsBySchoolIdandProgramId(schoolid, 2)[0];
                txtProgram2.Text = detailRow.name;
                txtProgram2Deadline.Text = detailRow.deadline.ToString();
                txtProgram2Desc.Text = detailRow.description;
                txtProgram2DirName.Text = detailRow.directorname;
                txtProgram2DirTitle.Text = detailRow.directortitle;
                txtProgram2End.Text = detailRow.ends.ToString();
                txtProgram2Start.Text = detailRow.starts.ToString();
                txtProgram2Tuition.Text = detailRow.tuition;
                txtProgram2Url.Text = detailRow.url;
                ddlProgram2Boarding.Items.FindByText(detailRow.boarding).Selected = true;
                ddlProgram2Type.Items.FindByText(detailRow.programname).Selected = true;
                if (detailRow.aid.Equals("Yes"))
                {
                    rdoProgram2.SelectedIndex = rdoProgram2.Items.IndexOf(rdoProgram1.Items.FindByValue("Yes"));
                }
                else
                {
                    if (detailRow.aid.Equals("No"))
                    {
                        rdoProgram2.SelectedIndex = rdoProgram2.Items.IndexOf(rdoProgram1.Items.FindByValue("No"));
                    }
                }

            }

            DataTable programData3 = schoologic.getSummerProgramDetailsBySchoolIdandProgramId(schoolid, 3);
            if (programData3.Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_summerprogramdetailsRow detailRow = schoologic.getSummerProgramDetailsBySchoolIdandProgramId(schoolid, 3)[0];
                txtProgram3.Text = detailRow.name;
                txtProgram3Deadline.Text = detailRow.deadline.ToString();
                txtProgram3Desc.Text = detailRow.description;
                txtProgram3DirName.Text = detailRow.directorname;
                txtProgram3DirTitle.Text = detailRow.directortitle;
                txtProgram3End.Text = detailRow.ends.ToString();
                txtProgram3Start.Text = detailRow.starts.ToString();
                txtProgram3Tuition.Text = detailRow.tuition;
                txtProgram3Url.Text = detailRow.url;
                ddlProgram3Boarding.Items.FindByText(detailRow.boarding).Selected = true;
                ddlProgram3Type.Items.FindByText(detailRow.programname).Selected = true;
                if (detailRow.aid.Equals("Yes"))
                {
                    rdoProgram3.SelectedIndex = rdoProgram3.Items.IndexOf(rdoProgram1.Items.FindByValue("Yes"));
                }
                else
                {
                    if (detailRow.aid.Equals("No"))
                    {
                        rdoProgram3.SelectedIndex = rdoProgram3.Items.IndexOf(rdoProgram1.Items.FindByValue("No"));
                    }
                }
            }

        }

        void populateCustom() {
            if (adminlogic.getCustomBySchoolID(schoolid).Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.tabs_admin_dataset._tabs_customsRow row = adminlogic.getCustomBySchoolID(schoolid)[0];
                textCustomSummary.Text = row.custom;
                txtCustomTitle.Text = row.customname;
                rdoCustom.Items.FindByValue(row.showcustom.ToString()).Selected = true;
            } 
        }

        #endregion

        #region "Update Page"

        void updatePage() {
            // update sections
            updateSchool();
            updatePhoto();
            updateHeadmaster();
            updateDiversity();
            updateGlance();
            updateAcademics();
            updateCampusLife();
            updateAA();
            updateAlumni();
            updateCollegeInfo();
            updateCustom();
            updateSummerPrograms();

            // record history
            adminlogic.addHistory("school " + schoolid.ToString() + " updated by userid: " + userid.ToString(), schoolid, userid);
            //activitylogic.addSchoolAdminActivity(textSchoolName.Text + " has updated their profile", DateTime.Now);
        }

        private void updateAlumni() {
            schoologic.deleteSchoolQuotes(schoolid);
            if (txtQuote1.Text.Length > 0) {
                schoologic.insertAlumniQuotes(schoolid, txtQuote1.Text, txtQuoteName1.Text, txtQuoteYear1.Text, txtQuoteBio1.Text, 1);
            }
            if (txtQuote2.Text.Length > 0) {
                schoologic.insertAlumniQuotes(schoolid, txtQuote2.Text, txtQuoteName2.Text, txtQuoteYear2.Text, txtQuoteBio2.Text, 2);
            }
            if (txtQuote3.Text.Length > 0) {
                schoologic.insertAlumniQuotes(schoolid, txtQuote3.Text, txtQuoteName3.Text, txtQuoteYear3.Text, txtQuoteBio3.Text, 3);
            }
        }

        void updateSchool() {
            // update - does not check exist - part of school/user creation
            adminlogic.updateSchool(textSchoolName.Text, checkCoed.Checked, checkAllBoys.Checked, checkAllGirls.Checked, checkMilitary.Checked, checkElementary.Checked, checkJunior.Checked, checkSecondary.Checked, checkPrePro.Checked, textShortDescription.Text, textAddress1.Text, textAddress2.Text, textCity.Text, Convert.ToInt16(dropState.SelectedValue), textZip.Text, Convert.ToInt16(dropCountry.SelectedValue), textMainPhone.Text, textDirLastName.Text, textDirFirstName.Text, textAdmPhone.Text, textAdmFree.Text, textFax.Text, textEmail.Text, textWeb.Text, checkPreK.Checked, checkKingdergarten.Checked, checkGrade1.Checked, checkGrade2.Checked, checkGrade3.Checked, checkGrade4.Checked, checkGrade5.Checked, checkGrade6.Checked, checkGrade7.Checked, checkGrade8.Checked, checkGrade9.Checked, checkGrade10.Checked, checkGrade11.Checked, checkGrade12.Checked, checkPostGrad.Checked, schoolid);
        }

        void updatePhoto() {
            // update - will create if empty
            byte[] logo = null;
            byte[] img1 = null;
            byte[] img2 = null;
            byte[] img3 = null;

            if (filePhotoLogo.HasFile) {
                logo = new byte[filePhotoLogo.PostedFile.ContentLength];
                filePhotoLogo.PostedFile.InputStream.Read(logo, 0, filePhotoLogo.PostedFile.ContentLength);
            }

            if (filePhotoImage1.HasFile) {
                img1 = new byte[filePhotoImage1.PostedFile.ContentLength];
                filePhotoImage1.PostedFile.InputStream.Read(img1, 0, filePhotoImage1.PostedFile.ContentLength);
            }

            if (filePhotoImage2.HasFile) {
                img2 = new byte[filePhotoImage2.PostedFile.ContentLength];
                filePhotoImage2.PostedFile.InputStream.Read(img2, 0, filePhotoImage2.PostedFile.ContentLength);
            }

            // update - will create if empty
            adminlogic.updatePhoto(logo, img1, img2, img3, schoolid);

        }

        void updateHeadmaster() {
            int hiatus;
            int retire;

            // validate
            try { hiatus = Convert.ToInt16(radioHeadmasterHiatus.SelectedValue); } catch { hiatus = 0; }
            try { retire = Convert.ToInt16(radioHeadmasterRetiring.SelectedValue); } catch { retire = 0; }


            // update - will create if empty
            adminlogic.updateHeadmaster(textHeadmasterLastName.Text, textHeadmasterFirstName.Text, textHeadmasterTitle.Text, Convert.ToInt16(dropPrefix.SelectedValue), Convert.ToInt16(textHeadmasterCurrentYear.Text), Convert.ToInt16(textHeadmasterBoardYear.Text), hiatus, Convert.ToInt16(textHeadmasterHiatusYear.Text), retire, schoolid);
        }

        void updateDiversity() 
        {
            if (textDivInternationalColor.Text.Length.Equals(0))
            {
                textDivInternationalColor.Text = "0";
            }

            if (textDivInternational.Text.Length.Equals(0))
            {
                textDivInternational.Text = "0";
            }

            if (textDivDomestic.Text.Length.Equals(0))
            {
                textDivDomestic.Text = "0";
            }

            // update - will create if empty
            adminlogic.updateDiversity(Convert.ToInt16(textDivInternationalColor.Text), Convert.ToInt16(textDivInternational.Text), Convert.ToInt16(textDivDomestic.Text), schoolid);
        }

        void updateGlance() {
            int tabsapp;
            int paymentplan;
            int needaid;
            int merit;

            // validate
            try { tabsapp = Convert.ToInt16(radioGlanceAcceptTabsApplication.SelectedValue); } catch { tabsapp = 0; }
            try { paymentplan = Convert.ToInt16(radioGlancePaymentPlans.SelectedValue); } catch { paymentplan = 0; }
            try { needaid = Convert.ToInt16(radioGlanceNeedBasedAid.SelectedValue); } catch { needaid = 0; }
            try { merit = Convert.ToInt16(radioGlanceMerit.SelectedValue); } catch { merit = 0; }

            // update - will create if empty
            byte[] img = null;

            if (fileGlanceImage.HasFile) {
                img = new byte[fileGlanceImage.PostedFile.ContentLength];

                fileGlanceImage.PostedFile.InputStream.Read(img, 0, fileGlanceImage.PostedFile.ContentLength);
            }
            adminlogic.updateGlance(img, Convert.ToInt16(textGlanceFounded.Text), Convert.ToInt16(textGlanceCampusSize.Text), 
                Convert.ToInt16(radioReligions.SelectedValue), Convert.ToInt16(textGlanceAccredited.Text), 
                Convert.ToInt16(dropGlanceAccredit1.SelectedValue), Convert.ToInt16(dropGlanceAccredit2.SelectedValue), 
                Convert.ToInt16(textGlanceGirlsBoarding.Text), Convert.ToInt16(textGlanceGirlsDay.Text), 
                Convert.ToInt16(textGlanceBoysBoarding.Text), Convert.ToInt16(textGlanceBoysDay.Text), 
                textGradeRangeBoard.Text, textGradeRangeDay.Text, Convert.ToInt16(dropGlanceCurrencies.SelectedValue), 
                Convert.ToInt16(dropGlanceAdmissionType.SelectedValue), 
                Convert.ToDateTime(dropMonth.SelectedValue + "/" + dropDay.SelectedValue + "/2009"), textGlanceApplicationFee.Text, tabsapp, 
                textGlance7DayTuition.Text, textGlance5DayTuition.Text, textGlanceDayTuition.Text, paymentplan, needaid, 
                Convert.ToDecimal(textGlanceNeedAirPercentage.Text), Convert.ToDecimal(textGlanceNeedAirAverage.Text), merit, 
                Convert.ToDecimal(textGlanceMeritPercentage.Text), Convert.ToDecimal(textGlanceMeritAverage.Text), textGlanceCurrentEndowment.Text, 
                textGlanceStudentEndowment.Text, Convert.ToBoolean(radioGlanceShowFinance.SelectedValue), schoolid);
        }

        void updateAcademics() {
            int saturday;
            int summer;

            // validate
            try { saturday = Convert.ToInt16(radioAcademicSatClasses.SelectedValue); } catch { saturday = 0; }
            try { summer = Convert.ToInt16(radioAcademicSummerPrograms.SelectedValue); } catch { summer = 0; }

            // update - will create if empty
            byte[] img = null;

            if (fileAcademic.HasFile) {
                img = new byte[fileAcademic.PostedFile.ContentLength];
                fileAcademic.PostedFile.InputStream.Read(img, 0, fileAcademic.PostedFile.ContentLength);
            }

           adminlogic.updateAcademic(img, textAcademicSummary.Text, textAcademicDirLastName.Text, textAcademicDirFirstName.Text, textAcademicDirTitle.Text, Convert.ToInt16(textAcademicAvgClassSize.Text), Convert.ToInt16(textAcademicFullTimeTeachers.Text), Convert.ToInt16(textAcademicApClassesOffered.Text), Convert.ToDecimal(textAcademictTeacherWithAdvDegree.Text), textAcademicStudentAndTeacherRatio.Text, saturday, summer, textAcademicNoteworthy.Text, textAcademicEnrichmentOther.Text, textAcademicSupportOther.Text, checkAcademicclassics.Checked, checkAcademiccreativeWriting.Checked, checkAcademichonors.Checked, checkAcademicliterature.Checked, checkAcademicplaywriting.Checked, checkAcademicpoetry.Checked, textAcademicEnglishOther.Text, checkAcademicmandarin.Checked, checkAcademiccantonese.Checked, checkAcademicfrench.Checked, checkAcademicgerman.Checked, checkAcademicitalian.Checked, checkAcademicjapanese.Checked, checkAcademicrussian.Checked, checkAcademicspanish.Checked, checkAcademicgreek.Checked, checkAcademiclatin.Checked, textAcademicForeign.Text, checkAcademicasianHistory.Checked, checkAcademicclassicalHistory.Checked, checkAcademiceuropeHistory.Checked, checkAcademichistoryHonors.Checked, checkAcademicmedievalHistory.Checked, checkAcademicusHistory.Checked, checkAcademicworldHistory.Checked, textAcademicHistoryOther.Text, checkAcademicantropology.Checked, checkAcademiceconomics.Checked, checkAcademicpsychology.Checked, checkAcademicsociology.Checked, textAcademicSocialOther.Text, checkAcademicbible.Checked, checkAcademicethics.Checked, checkAcademicfaith.Checked, checkAcademicmoralPhilosophy.Checked, checkAcademicmythology.Checked, checkAcademicphilosophy.Checked, checkAcademicreligiousStudy.Checked, checkAcademicsocialJustice.Checked, checkAcademictheology.Checked, checkAcademicworldReligion.Checked, textAcademicReligionOther.Text, checkAcademicanatomy.Checked, checkAcademicanimalBehavior.Checked, checkAcademicastronomy.Checked, checkAcademicastrophysics.Checked, checkAcademicbiology.Checked, checkAcademicbiotech.Checked, checkAcademicbotany.Checked, checkAcademicchemistry.Checked, checkAcademicearthScience.Checked, checkAcademicecology.Checked, checkAcademicelectronics.Checked, checkAcademicentomology.Checked, checkAcademicenvironmentalScience.Checked, checkAcademicepidemiology.Checked, checkAcademicgenetics.Checked, checkAcademicgeology.Checked, checkAcademichealth.Checked, checkAcademicmarineBiology.Checked, checkAcademicmeteorology.Checked, checkAcademicmicrobiology.Checked, checkAcademicoceanography.Checked, checkAcademicornithology.Checked, checkAcademicpaleontology.Checked, checkAcademicphysicalScience.Checked, checkAcademicphysics.Checked, checkAcademicphysiology.Checked, checkAcademicsportsMedicine.Checked, checkAcademiczoology.Checked, textAcademicScienceOther.Text, checkAcademicalgebra.Checked, checkAcademiccalculus.Checked, checkAcademicfunctions.Checked, checkAcademichonorsMath.Checked, checkAcademicgeometry.Checked, checkAcademicprobability.Checked, checkAcademicstatistics.Checked, checkAcademictrig.Checked, textAcademicMathOther.Text, checkAcademiccomApp.Checked, checkAcademiccomProgramming.Checked, checkAcademiccomScience.Checked, checkAcademicmultimedia.Checked, checkAcademicwebDesign.Checked, textAcademicComputerOther.Text, checkAcademicdesign3d.Checked, checkAcademicacting.Checked, checkAcademicanimation.Checked, checkAcademicarchitecture.Checked, checkAcademicart.Checked, checkAcademicartHistory.Checked, checkAcademicballet.Checked, checkAcademicceramics.Checked, checkAcademicchoreography.Checked, checkAcademicdance.Checked, checkAcademicdebate.Checked, checkAcademicdesign.Checked, checkAcademicdirecting.Checked, checkAcademicdrama.Checked, checkAcademicdrawing.Checked, checkAcademicfashionDesign.Checked, checkAcademicfiberArts.Checked, checkAcademicfilmVideo.Checked, checkAcademicgraphicDesign.Checked, checkAcademichistoryTheater.Checked, checkAcademicjournalism.Checked, checkAcademiclightingDesign.Checked, checkAcademicmetal.Checked, checkAcademicmodernDance.Checked, checkAcademicpainting.Checked, checkAcademicphotography.Checked, checkAcademicportfolio.Checked, checkAcademicpottery.Checked, checkAcademicprintmaking.Checked, checkAcademicproduction.Checked, checkAcademicpublications.Checked, checkAcademicpublicSpeaking.Checked, checkAcademicscreenPrinting.Checked, checkAcademicscreenwriting.Checked, checkAcademicsculpture.Checked, checkAcademicsilkscreen.Checked, checkAcademicstagecraft.Checked, checkAcademicstudioart.Checked, checkAcademictvProduction.Checked, checkAcademictextiles.Checked, checkAcademictheaterArt.Checked, checkAcademicweaving.Checked, checkAcademicwoodworking.Checked, textAcademicVisualOther.Text, checkAcademicband.Checked, checkAcademicchoralMusic.Checked, checkAcademiccomposition.Checked, checkAcademicelectronicMusic.Checked, checkAcademichistoryJazz.Checked, checkAcademichistoryOfMusic.Checked, checkAcademicindividualInstructions.Checked, checkAcademicmusicAppreciation.Checked, checkAcademicmusicHistory.Checked, checkAcademicmusicTheory.Checked, checkAcademicopera.Checked, checkAcademicorchestra.Checked, checkAcademicprincipleOfArranging.Checked, checkAcademicrecording.Checked, checkAcademicsolfegeEarTraining.Checked, checkAcademicsongwriting.Checked, checkAcademicvoice.Checked, textAcademicMusicOther.Text, checkAcademiccommunityService.Checked, checkAcademicexchangePrograms.Checked, checkAcademicindependentStudy.Checked, checkAcademicinternships.Checked, checkAcademicjrotc.Checked, checkAcademicleadership.Checked, checkAcademiclearningSeaPrograms.Checked, checkAcademicoutdoorEducation.Checked, checkAcademicpersonalFinance.Checked, checkAcademicrifleTeam.Checked, checkAcademicsemesterYearOffCampus.Checked, checkAcademicstudyAbroad.Checked, textAcademicSpecialOther.Text, checkAcademicartHistoryAP.Checked, checkAcademicbiologyAP.Checked, checkAcademiccalculusAB.Checked, checkAcademiccalculusBC.Checked, checkAcademicchemistryAP.Checked, checkAcademiccompScienceA.Checked, checkAcademiccompScienceAB.Checked, checkAcademicmacroeconomicsAP.Checked, checkAcademicmicroeconomicsAP.Checked, checkAcademicenglishLanguageAP.Checked, checkAcademicenglishLitAP.Checked, checkAcademicenvironmentalScienceAP.Checked, checkAcademiceuropeanHistoryAP.Checked, checkAcademicfrenchLanguageAP.Checked, checkAcademicfrenchLitAP.Checked, checkAcademicgermanLanguageAP.Checked, checkAcademiccompGovtPoliticsAP.Checked, checkAcademicusGovAndPoliticsAP.Checked, checkAcademichumanGeographyAP.Checked, checkAcademiclatinLitAP.Checked, checkAcademiclatinVergilAP.Checked, checkAcademicmusicTheoryAP.Checked, checkAcademicphysicsB.Checked, checkAcademicphysicsC.Checked, checkAcademicpsychologyAP.Checked, checkAcademicspanishLanguageAP.Checked, checkAcademicspanishLitAP.Checked, checkAcademicstatisticsAP.Checked, checkAcademicstudioArtAP.Checked, checkAcademicusHistoryAP.Checked, checkAcademicworldHistoryAP.Checked, textAcademicAPOther.Text, textAcademicDistinctiveOther.Text, Convert.ToBoolean(checkAcademic5Day.Checked), Convert.ToBoolean(checkAcademicAP.Checked), Convert.ToBoolean(checkAcademicBaccalaureate.Checked), Convert.ToBoolean(checkAcademicDistanceLearning.Checked), Convert.ToBoolean(checkAcademicInternational.Checked), Convert.ToBoolean(checkAcademicPostGrad.Checked), Convert.ToBoolean(checkSPAdd.Checked), Convert.ToBoolean(checkSPAssistance.Checked), Convert.ToBoolean(checkSPCollege.Checked), Convert.ToBoolean(checkSPESLA.Checked), Convert.ToBoolean(checkSPESLB.Checked), Convert.ToBoolean(checkSPESLC.Checked), Convert.ToBoolean(checkSPEve.Checked), Convert.ToBoolean(checkSPLearningCenter.Checked), Convert.ToBoolean(checkSPLearningDiff.Checked), Convert.ToBoolean(checkSPPeer.Checked), Convert.ToBoolean(checkSPSkills.Checked), Convert.ToBoolean(checkSPSubj.Checked), false, Convert.ToBoolean(checkSPTech.Checked), Convert.ToBoolean(checkSPWrite.Checked), Convert.ToBoolean(1), schoolid);
        }

        void updateCampusLife() {
            // validate
            // validation code here

            // update - will create if empty
            byte[] img = null;

            if (fileCampusLife.HasFile) {
                img = new byte[fileCampusLife.PostedFile.ContentLength];
                fileCampusLife.PostedFile.InputStream.Read(img, 0, fileCampusLife.PostedFile.ContentLength);
            }
            adminlogic.updateCampusLife(img, textCampusSummary.Text, textcampusDirLastName.Text, textcampusDirFirstName.Text, textcampusDirTitle.Text, Convert.ToInt16(textavgStudentsDorm.Text), Convert.ToInt16(textgirlsDorms.Text), Convert.ToInt16(textboysDorms.Text), checkboxGameRoom.Checked, checkboxLaundry.Checked, checkboxLounge.Checked, checkboxWIFI.Checked, checkboxVending.Checked, textCampusDormOther.Text, Convert.ToInt16(dropCampusDressCode.SelectedValue), textCampusStudentLife.Text, checkboxallWeatherTrack.Checked, checkboxbaseballField.Checked, checkboxbasketballCourt.Checked, checkboxfitnessCenter.Checked, checkboxtechCenterFacility.Checked, checkboxvolleyballCourt.Checked, checkboxsandVolleyballCourt.Checked, checkboxfootballField.Checked, checkboxindoorBasketballCourt.Checked, checkboxracquetballCourt.Checked, checkboxpool.Checked, checkboxindoorPool.Checked, checkboxindoorClimbingWall.Checked, textCampusFacilitiesOther.Text, checkboxamnestyIntl.Checked, checkboxanimalRights.Checked, checkboxarchaeologyClub.Checked, checkboxasianClub.Checked, checkboxastronomyClub.Checked, checkboxchessClub.Checked, checkboxclassicsClub.Checked, checkboxcommunityServiceClub.Checked, checkboxcomputerClub.Checked, checkboxdebateClub.Checked, checkboxdiversityClub.Checked, checkboxdormProctors.Checked, checkboxdramaClub.Checked, checkboxenvironmentalClub.Checked, checkboxFCA.Checked, checkboxfencingClub.Checked, checkboxfoodCouncil.Checked, checkboxforeignLanguageClub.Checked, checkboxfreeTibet.Checked, checkboxfutureBizLeader.Checked, checkboxgardeningClub.Checked, checkboxhabitatForHumanity.Checked, checkboxhonorCouncil.Checked, checkboxhorsebackRiding.Checked, checkboxinternationalClub.Checked, checkboxinvestmentClub.Checked, checkboxjewishStudentOrg.Checked, checkboxliteraryMagazine.Checked, checkboxmathClub.Checked, checkboxmodelUN.Checked, checkboxmockTrial.Checked, checkboxnationalHonorSociety.Checked, checkboxnewspaperClub.Checked, checkboxoutingClub.Checked, checkboxpeerCounseling.Checked, checkboxpeerTutoring.Checked, checkboxpepClub.Checked, checkboxphotographyClub.Checked, checkboxquizBowl.Checked, checkboxsailingClub.Checked, checkboxscienceBowl.Checked, checkboxscienceFictionClub.Checked, checkboxscoutingClub.Checked, checkboxsexualitiesClub.Checked, checkboxskateboardClub.Checked, checkboxsnowboardClub.Checked, checkboxsolarCarClub.Checked, checkboxstudentActiviyClub.Checked, checkboxstudentGovtClub.Checked, checkboxstudentPublicationClub.Checked, checkboxstudentRadioStation.Checked, checkboxSADD.Checked, checkboxsurfingClub.Checked, checkboxtheaterClub.Checked, checkboxtvStation.Checked, checkboxweightliftingClub.Checked, checkboxwoodworkClub.Checked, checkboxyearbook.Checked, checkboxyogaClub.Checked, checkboxyoungDemocrats.Checked, checkboxyoungRepublicans.Checked, textCampusClubOther.Text, schoolid);
        }

        void updateAA() {
            // validate
            // validation code here

            // update - will create if empty
            byte[] img = null;

            if (fileAA.HasFile) {
                img = new byte[fileAA.PostedFile.ContentLength];
                fileAA.PostedFile.InputStream.Read(img, 0, fileAA.PostedFile.ContentLength);
            }
            adminlogic.updateAA(img, artDirLastName.Text, artDirFirstName.Text, artDirTitle.Text, athDirLastName.Text, athDirFirstName.Text, athDirTitle.Text, artNote.Text, acapella.Checked, artClub.Checked, audioVisualClub.Checked, brassEnsemble.Checked, chamberChoir.Checked, chamberEnsemble.Checked, chamberOrchestra.Checked, choralMusicArt.Checked, artDance.Checked, dramaClubArt.Checked, folkMusicClub.Checked, gleeClub.Checked, gospelChoir.Checked, guitarEnsemble.Checked, improvGroup.Checked, jazzEnsemble.Checked, pepBand.Checked, rockBand.Checked, stageBand.Checked, stringEnsemble.Checked, techCrew.Checked, theater.Checked, textArtsOther.Text, interAerobics.Checked, interAlpineRacing.Checked, interAlpineSkiing.Checked, interBadminton.Checked, interBaseball.Checked, interBasketball.Checked, interBowling.Checked, interCamping.Checked, interCanoeing.Checked, interCheerleading.Checked, interCrew.Checked, interCricket.Checked, interCrossCountry.Checked, interCurling.Checked, interDance.Checked, interDiving.Checked, interDrillTeam.Checked, interEquestrian.Checked, interFencing.Checked, interFigureSkating.Checked, interFieldHockey.Checked, interFootball.Checked, interFreestyleSki.Checked, interGolf.Checked, interGymnastics.Checked, interHandball.Checked, interHiking.Checked, interHorseback.Checked, interIceClimbing.Checked, interIceHockey.Checked, interIceSkating.Checked, interKayaking.Checked, interKickball.Checked, interKickboxing.Checked, interLacrosse.Checked, interLuge.Checked, interMartialArt.Checked, interMtBike.Checked, interNordicSkiRacing.Checked, interNordicSki.Checked, interOutdoorEdu.Checked, interPaddleTennis.Checked, interPolo.Checked, interPowerLifting.Checked, interRacquet.Checked, interRafting.Checked, interRifle.Checked, interRockClimbing.Checked, interRugby.Checked, interSailing.Checked, interSkateboard.Checked, interSkiJump.Checked, interSnowboard.Checked, interSoccer.Checked, interSoftball.Checked, interSquash.Checked, interSurfing.Checked, interSwimming.Checked, interTableTennis.Checked, interTennis.Checked, interTrackField.Checked, interUltFrisbee.Checked, interVolleyball.Checked, interWaterPolo.Checked, interWeightLifting.Checked, interWrestling.Checked, textSportsOther.Text, reAerobics.Checked, recAlpineSkiRacing.Checked, recAlpineSki.Checked, recBadminton.Checked, recBaseball.Checked, recBasketball.Checked, recBowling.Checked, recCamping.Checked, recCanoeing.Checked, recCheerleading.Checked, recCrew.Checked, recCricket.Checked, recCrossCountry.Checked, recCurling.Checked, recDance.Checked, recDiving.Checked, recDrillTeam.Checked, recEquestrian.Checked, recFencing.Checked, recFieldHockey.Checked, recFigureSkating.Checked, recFootball.Checked, recFreeStyleSki.Checked, recGolf.Checked, recGymnastics.Checked, recHandball.Checked, recHiking.Checked, recHorseback.Checked, recIceClimbing.Checked, recIceHockey.Checked, recKayaking.Checked, recLacrosse.Checked, recLuge.Checked, recMartialArts.Checked, recMtBike.Checked, recNordicSkiRacing.Checked, recNordicSkiing.Checked, recOutdoorEdu.Checked, recPaddleTennis.Checked, recPolo.Checked, recPowerLifting.Checked, recRacquet.Checked, recRafting.Checked, recRifilTeam.Checked, recRockCilmbing.Checked, recRugby.Checked, recSailing.Checked, recSkateboarding.Checked, recSkiJumping.Checked, recSnowboarding.Checked, recSoccer.Checked, recSoftball.Checked, recSquash.Checked, recSurfing.Checked, recSwimming.Checked, recTableTennis.Checked, recTennis.Checked, recTrackField.Checked, recUltFrisbee.Checked, recVolleyball.Checked, recWaterPolo.Checked, recWeightLifting.Checked, recWrestling.Checked, textRecOther.Text, schoolid);
        }

        void updateCollegeInfo() {
            // validate

            // update - will create if empty
            byte[] img = null;

            if (fileCollegeInfo.HasFile) {
                img = new byte[fileCollegeInfo.PostedFile.ContentLength];
                fileCollegeInfo.PostedFile.InputStream.Read(img, 0, fileCollegeInfo.PostedFile.ContentLength);
            }

            adminlogic.updateCollegeInfo(img, textCollegeSummary.Text, textCollegeDirLastName.Text, 
                textCollegeDirFirstName.Text, textCollegeDirTitle.Text, Convert.ToDecimal(textCollegePercHigherEd.Text), 
                textCollegeAtt1.Text, textCollegeAtt2.Text, textCollegeAtt3.Text, 
                textCollegeAtt4.Text, textCollegeAtt5.Text, Convert.ToInt16(textCollegeAtt1No.Text), 
                Convert.ToInt16(textCollegeAtt2No.Text), Convert.ToInt16(textCollegeAtt3No.Text), 
                Convert.ToInt16(textCollegeAtt4No.Text), Convert.ToInt16(textCollegeAtt5No.Text),
                GetInt(tbCriticalReading25.Text), GetInt(tbCriticalReading75.Text),
                GetInt(tbMathematics25.Text), GetInt(tbMathematics75.Text),
                GetInt(tbWriting25.Text), GetInt(tbWriting75.Text),
                schoolid);

            schoologic.deleteCollegeAlumniInfo(schoolid);


            schoologic.insertCollegeAlumniInfo(schoolid,
                                            txtAName1.Text, txtAYear1.Text, txtANotes1.Text,
                                            txtAName2.Text, txtAYear2.Text, txtANotes2.Text,
                                            txtAName3.Text, txtAYear3.Text, txtANotes3.Text,
                                            txtAName4.Text, txtAYear4.Text, txtANotes4.Text,
                                            txtAName5.Text, txtAYear5.Text, txtANotes5.Text,
                                            txtAName6.Text, txtAYear6.Text, txtANotes6.Text,
                                            txtAName7.Text, txtAYear7.Text, txtANotes7.Text,
                                            txtAName8.Text, txtAYear8.Text, txtANotes8.Text,
                                            txtAName9.Text, txtAYear9.Text, txtANotes9.Text,
                                            txtAName10.Text, txtAYear10.Text, txtANotes10.Text);

        }

        private int? GetInt(string value)
        {
            int? returnValue;

            try
            {
                returnValue = Convert.ToInt32(value);
            }
            catch
            {
                returnValue = null;
            }

            return returnValue;
        }

        void updateCustom() {
            int row = adminlogic.updateCustomBySchoolID(textCustomSummary.Text, txtCustomTitle.Text, schoolid, Convert.ToBoolean(rdoCustom.SelectedValue));
        }

        void updateSummerPrograms() 
        {
            if (summerImgUpload.HasFile) 
            {
                // Store image

                // Proper location of directories
                string rootDirectory = @ConfigurationManager.AppSettings["SchoolDirectory"] + schoolid + @"\";
                string imageDirectory = rootDirectory + @"images\";

                // Save the image
                summerImgUpload.SaveAs(imageDirectory + summerImgUpload.FileName); 
                
                // Update the database
                adminlogic.UpdateSummer(textSummerProgramSummary.Text, summerImgUpload.FileName, schoolid);
                
            } 
            else 
            {
                adminlogic.UpdateSummer(textSummerProgramSummary.Text, null, schoolid);
            }

            adminlogic.DeleteSummerProgramDetails(schoolid);
            DateTime start = new DateTime();
            DateTime end = new DateTime();
            DateTime app = new DateTime();
            bool success = false;
            string aid = string.Empty;
            
            if(!String.IsNullOrEmpty(txtProgram1.Text))
            {
                success = DateTime.TryParse(txtProgram1Start.Text, out start);
                success = DateTime.TryParse(txtProgram1End.Text, out end);
                success = DateTime.TryParse(txtProgram1Deadline.Text, out app);
                aid = rdoProgram1.SelectedIndex > -1 ? rdoProgram1.SelectedValue : "No";
                adminlogic.AddSummerDetails(schoolid, txtProgram1.Text, txtProgram1DirName.Text, txtProgram1DirTitle.Text, ddlProgram1Type.SelectedItem.Text, start, end, ddlProgram1Boarding.SelectedItem.Text, txtProgram1Desc.Text, app, txtProgram1Tuition.Text, aid, txtProgram1Url.Text, 1);
            }

            if (!String.IsNullOrEmpty(txtProgram2.Text))
            {
                success = DateTime.TryParse(txtProgram2Start.Text, out start);
                success = DateTime.TryParse(txtProgram2End.Text, out end);
                success = DateTime.TryParse(txtProgram2Deadline.Text, out app);
                aid = rdoProgram2.SelectedIndex > -1 ? rdoProgram2.SelectedValue : "No";
                adminlogic.AddSummerDetails(schoolid, txtProgram2.Text, txtProgram2DirName.Text, txtProgram2DirTitle.Text, ddlProgram2Type.SelectedItem.Text, start, end, ddlProgram2Boarding.SelectedItem.Text, txtProgram2Desc.Text, app, txtProgram2Tuition.Text, aid, txtProgram2Url.Text, 2);
            }

            if (!String.IsNullOrEmpty(txtProgram3.Text))
            {
                success = DateTime.TryParse(txtProgram3Start.Text, out start);
                success = DateTime.TryParse(txtProgram3End.Text, out end);
                success = DateTime.TryParse(txtProgram3Deadline.Text, out app);
                aid = rdoProgram3.SelectedIndex > -1 ? rdoProgram3.SelectedValue : "No";
                adminlogic.AddSummerDetails(schoolid, txtProgram3.Text, txtProgram3DirName.Text, txtProgram3DirTitle.Text, ddlProgram3Type.SelectedItem.Text, start, end, ddlProgram3Boarding.SelectedItem.Text, txtProgram3Desc.Text, app, txtProgram3Tuition.Text, aid, txtProgram3Url.Text, 3);
            }
        }

        bool checkImages() {
            bool retVal = true;
            int totalImageSizeAllowed = 1048576;
            // logo
            if (filePhotoLogo.HasFile) {
                if (filePhotoLogo.PostedFile.ContentLength > totalImageSizeAllowed) {
                    retVal = false;
                }
            }
            // browser card front
            if (filePhotoImage1.HasFile) {
                if (filePhotoImage1.PostedFile.ContentLength > totalImageSizeAllowed) {
                    retVal = false;
                }
            }

            // browser card back
            if (filePhotoImage2.HasFile) {
                if (filePhotoImage2.PostedFile.ContentLength > totalImageSizeAllowed) {
                    retVal = false;
                }
            }

            return retVal;
        }

        #endregion

        protected void btnNextCC_Click(object sender, EventArgs e) {
            CreditCardPerson person = new CreditCardPerson();
            person.Address1 = txtAdd1.Text;
            person.Address2 = txtAdd2.Text;
            person.City = txtCity.Text;
            person.Country = ddlCountry.SelectedItem.Text;
            person.CountryId = ddlCountry.SelectedValue;
            person.Email = txtEmail.Text;
            person.Fullname = txtFName.Text;
            person.Phone = txtPhone.Text;
            person.State = ddlState.SelectedItem.Text;
            person.StateId = ddlState.SelectedValue;
            person.Zip = txtZip.Text;
            Session["CCPerson"] = person;
            ccPayView.ActiveViewIndex = 1;
            lblFullName.Text = txtFName.Text;
        }

        protected void btnBackToPerson_Click(object sender, EventArgs e) {
            ccPayView.ActiveViewIndex = 0;
        }

        protected void chxConfirmRenewal_CheckedChanged(object sender, EventArgs e) {
            if (chxConfirmRenewal.Checked) {
                membershipLink.Visible = true;
            } else { membershipLink.Visible = false; }
        }

        protected void btnThanks_Click(object sender, EventArgs e) {
            CreditCard cc = new CreditCard();
            cc.CCV = txtCCV.Text;
            cc.CreditCardNumber = txtCC.Text;
            cc.ExpDate = txtExp.Text;
            cc.Fullname = txtFName.Text;
            cc.LastFour = txtCC.Text.Substring(12);
            cc.Total = totalRenewal;

            List<string> response;
            int transactionStatusId;
            int responseReasonCode;
            string responseReasonCodeText = string.Empty;
            string transactionId = string.Empty;


            // Submit the Transaction
            string[] name = txtFName.Text.Split(' ');
            TABS_UserControls.resources.code.BAL.AuthorizeNet anet = new TABS_UserControls.resources.code.BAL.AuthorizeNet();
            response = anet.SubmitTransaction(txtCC.Text, txtExp.Text, totalRenewal,
                "School Renewal", name[0], name[1], txtAdd1.Text,
                ddlState.SelectedItem.Text, txtZip.Text);

            transactionStatusId = int.Parse(response[0]);
            responseReasonCode = int.Parse(response[2]);
            responseReasonCodeText = response[3];
            transactionId = response[6];

            manage.addSchoolRenewal(txtCC.Text.Substring(12), double.Parse(totalRenewal), transactionId, transactionStatusId, responseReasonCode, responseReasonCodeText, schoolid, 2, "School Credit Card", DateTime.Now.Year.ToString());

            ccPayView.ActiveViewIndex = 2;
        }

        protected void dropCountry_SelectedIndexChanged(object sender, EventArgs e) {
            ddlState.DataSource = manage.getStatesByCountryId(int.Parse(ddlCountry.SelectedValue));
            ddlState.DataBind();
        }

        protected void eventGrid_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e) {
            eventlogic.deleteProfileEventById(Convert.ToInt16(e.Record["profileeventid"].ToString()));
            eventGrid.DataSource = eventlogic.getCurrentProfileEvents(schoolid);
            eventGrid.DataBind();
        }

        protected void newsGrid_DeleteCommand(object sender, Obout.Grid.GridRecordEventArgs e) {
            newslogic.deleteProfileNewsById(Convert.ToInt16(e.Record["profilenewsid"].ToString()));
            newsGrid.DataSource = newslogic.getCurrentProfileNews(schoolid);
            newsGrid.DataBind();
        }

        protected void gridStudentCountry_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e) {

        }

        protected void gridStudentCountry_InsertCommand(object sender, Obout.Grid.GridRecordEventArgs e) 
        {
            manage.addCountryDiversity(schoolid, Convert.ToInt16(e.Record["country"].ToString()), Convert.ToInt16(e.Record["studentcount"].ToString()));
            this.BindDiversityGrid();
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e) {
            ddlState.DataSource = manage.getStatesByCountryId(Convert.ToInt16(ddlCountry.SelectedValue));
            ddlState.DataBind();
        }

        #region Old Code

        ////void repeatHistory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        ////{
        ////    Literal user = (Literal)e.Item.FindControl("literalUser");
        ////    int id = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "adminid").ToString());
        ////    user.Text = adminlogic.getAdminByID(id)[0].username;
        ////}

        ////protected void timerAutoSave_Tick(object sender, EventArgs e)
        ////{
        ////    updatePage();
        ////    literalAutoSave.Text = "Auto-Saved at " + DateTime.Now.ToString();
        ////}


        #endregion
    }

    public class CreditCardPerson {
        public string Fullname { get; set; }
        public string Email { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string CountryId { get; set; }
        public string State { get; set; }
        public string StateId { get; set; }
        public string Zip { get; set; }
        public string Phone { get; set; }
    }

    public class CreditCard {
        public string Fullname { get; set; }
        public string CreditCardNumber { get; set; }
        public string LastFour { get; set; }
        public string CCV { get; set; }
        public string ExpDate { get; set; }
        public string Total { get; set; }
    }
}