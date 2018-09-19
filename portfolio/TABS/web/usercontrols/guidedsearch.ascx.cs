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
using System.Text;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace TABS_UserControls.usercontrols
{
    public partial class guidedsearch : System.Web.UI.UserControl
    {
        public int CurrentPage
        {
            get
            {
                // look for current page in ViewState
                object o = this.ViewState["_CurrentPage"];
                if (o == null)
                {
                    return 0; // default page index of 0
                }
                else
                {
                    return (int)o;
                }
            }

            set
            {
                this.ViewState["_CurrentPage"] = value;
            }
        }
        
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();

        // page navigation
        private int pagesize = 10;

        protected void Page_Init(object sender, EventArgs e)
        {
            littbGradeLowId.Text = tbGradeLow.ClientID;
            littbGradeHighId.Text = tbGradeHigh.ClientID;

            littbStudentLowId.Text = tbStudentLow.ClientID;
            littbStudentHighId.Text = tbStudentHigh.ClientID;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // server-side binding
            buttonSearch.Click += new EventHandler(buttonSearch_Click);
            buttonSearch2.Click += new EventHandler(buttonSearch_Click);
            btnSearchTop.Click += new EventHandler(buttonSearch_Click);
            buttonReset.Click += new EventHandler(buttonReset_Click);
            btnResetTop.Click += new EventHandler(buttonReset_Click);
            repeatResult.ItemDataBound += new RepeaterItemEventHandler(repeatResult_ItemDataBound);
        }

        protected void linkPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage--;
            BindRepeater();
        }

        protected void linkNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            BindRepeater();
        }

        
        void repeatResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            string lat = schoollogic.getZip(DataBinder.Eval(e.Item.DataItem, "zip").ToString())[0].lat;
            string lng = schoollogic.getZip(DataBinder.Eval(e.Item.DataItem, "zip").ToString())[0]._long;

            // center map on first item and clear markers for google map
            if (e.Item.ItemIndex == 0)
            {
                literalLat.Text = lat;
                literalLong.Text = lng;
                literalMarkers.Text = "";
            }

            // mark only up to 0 - 9: 10 items
            if (e.Item.ItemIndex < 10)
            {
                DataRowView dr = (DataRowView)e.Item.DataItem;

                string schoolName = dr["schoolname"].ToString();
                schoolName = schoolName.Replace("'", " ");

                StringBuilder sbSchoolInfo = new StringBuilder();
                sbSchoolInfo.Append("<b>").Append(schoolName).Append("</b><br/>");
                sbSchoolInfo.Append(dr["address1"].ToString()).Append("<br/>");
                if (!String.IsNullOrEmpty(dr["address2"].ToString()))
                {
                    sbSchoolInfo.Append(dr["address2"].ToString()).Append("<br/>");
                }
                sbSchoolInfo.Append(dr["city"].ToString()).Append(", ");
                sbSchoolInfo.Append(dr["state"].ToString()).Append(" ");
                sbSchoolInfo.Append(dr["zip"].ToString()).Append("<br/>");
                sbSchoolInfo.Append("<a href=\"/school-profile.aspx?schoolid=").Append(dr["schoolId"]).Append("\">School Profile</a>");
                
                Literal alphabet = (Literal)e.Item.FindControl("literalAlphabet");
                alphabet.Text = Convert.ToChar(e.Item.ItemIndex + 65).ToString();
                literalMarkers.Text += "map.addOverlay(createMarker(new GLatLng(" + lat + "," + lng + "),'" + alphabet.Text + "', '" + sbSchoolInfo.ToString() + "'));";
            }
        }

        void buttonReset_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.ToString());
        }

        void buttonSearch_Click(object sender, EventArgs e)
        {
            // Clear the current page
            CurrentPage = 0;
            
            if (cbCoed.Checked || cbAllBoys.Checked || cbAllGirls.Checked)
            {
                lblError.Visible = false;

                // Validate the zip code
                revZip.Validate();
                if (!revZip.IsValid)
                {
                    textZip.Text = string.Empty;
                }
                // Bind Repeater
                BindRepeater();

                // Ensure the sliders show the correct values
                litGradeLowInit.Text = tbGradeLow.Text;
                litGradeHighInit.Text = tbGradeHigh.Text;

                litStudentLowInit.Text = tbStudentLow.Text;
                litStudentHighInit.Text = tbStudentHigh.Text;

                if (repeatResult.HasControls())
                {
                    // show map panel
                    multiResult.ActiveViewIndex = 1;
                }
                else
                {
                    // Clear any previous markers
                    literalMarkers.Text = "";

                    // show no results panel
                    multiResult.ActiveViewIndex = 2;
                }
            }
            else
            {
                lblError.Visible = true;
            }
        }

        string createQuery()
        {
            StringBuilder qry = new StringBuilder();
            string max = string.Empty;
            string zip = textZip.Text.Trim();
            max = zip.Length.Equals(0) ? "1000000" : dropDistance.SelectedValue;
            
            if (zip.Length == 0) zip = "30318";
            string lat = schoollogic.getZip(zip)[0].lat;
            string lng = schoollogic.getZip(zip)[0]._long;

            qry.Append("with pagedlist as( SELECT [tabs.schools].*, (select state from [tabs.states] where stateid = [tabs.schools].stateid) as state, (select country from [tabs.country] where countryid = [tabs.schools].countryid) as country, (select SUM(girlsboard + girlsday + boysboard + boysday) FROM [tabs.glance] where schoolid = [tabs.schools].schoolid) as studentTotal, row_number() over (order by dbo.sp_tabs_calculateDistance('" + lng + "', '" + lat + "', [tabs.zipcodes].long, [tabs.zipcodes].lat)) as 'rownumber' FROM [tabs.schools] INNER Join [tabs.zipcodes] ON [tabs.schools].zip = [tabs.zipcodes].zipcode INNER JOIN [tabs.academics] a ON [tabs.schools].schoolid = a.schoolid INNER JOIN [tabs.artsandathletics] art ON [tabs.schools].schoolid = art.schoolid INNER JOIN [tabs.campuslifes] life ON [tabs.schools].schoolid = life.schoolid where dbo.sp_tabs_calculateDistance('" + lng + "', '" + lat + "', [tabs.zipcodes].long, [tabs.zipcodes].lat) < " + max + " ");

            bool appendedSomething = false;
            
            // type search
            if (cbCoed.Checked || cbAllBoys.Checked || cbAllGirls.Checked)
            {
                appendedSomething = false; 
                
                qry.Append(" AND (");

                if (cbAllGirls.Checked)
                {
                    qry.Append("allgirls = 1");
                    appendedSomething = true;
                }
                if (cbAllBoys.Checked)
                {
                    if (appendedSomething)
                    {
                        qry.Append(" OR ");
                    }
                    qry.Append("allboys = 1");
                    appendedSomething = true;
                }
                if (cbCoed.Checked)
                {
                    if (appendedSomething)
                    {
                        qry.Append(" OR ");
                    }
                    qry.Append("coed = 1");
                }

                qry.Append(")");
            }

            // Speciality seach
            if (rbMilitarySpeciality.Checked)
            {
                qry.Append(" AND (military=1)");
            }
            else
            {
                if (rbProfessionalSpeciality.Checked)
                {
                    qry.Append(" AND (preprofessionalarts=1)");
                }
            }
            
            appendedSomething = false;
            StringBuilder optional = new StringBuilder();

            // Support Programs
            #region Support Programs

            if (cbESLBeginning.Checked)
            {
                optional.Append("a.sp_esla = 1");
                appendedSomething = true;
            }
            if (cbESLIntermediate.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_eslb = 1");
                appendedSomething = true;
            }
            if (cbESLAdvanced.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_eslc = 1");
                appendedSomething = true;
            }
            if (cbADDADHDSupport.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_add = 1");
                appendedSomething = true;
            }
            if (cbLearningDifferencesSupport.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_learningdiff = 1");
                appendedSomething = true;
            }
            if (cbCollegeCounseling.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_college = 1");
                appendedSomething = true;
            }
            if (cbEveningStudyAssistance.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_eve = 1");
                appendedSomething = true;
            }
            if (cbLearningCenter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_learningcenter = 1");
                appendedSomething = true;
            }
            if (cbPeerTutoringSupport.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_peer = 1");
                appendedSomething = true;
            }
            if (cbStudySkillsAssistance.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_skills = 1");
                appendedSomething = true;
            }
            if (cbTechnologyCenter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_tech = 1");
                appendedSomething = true;
            }
            if (cbSubjectTutoring.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_subj = 1");
                appendedSomething = true;
            }
            if (cbWritingCenter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.sp_write = 1");
                appendedSomething = true;
            }

            #endregion

            // Lanugages and Humanities Courses
            #region Lanugages and Humanities Courses

            if (cbClassics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.english_classic = 1");
                appendedSomething = true;
            }
            if (cbCreativeWriting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.english_creative = 1");
                appendedSomething = true;
            }
            if (cbHonors.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.english_honors = 1");
                appendedSomething = true;
            }
            if (cbLiterature.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.english_literature = 1");
                appendedSomething = true;
            }
            if (cbPlaywriting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.english_playwriting = 1");
                appendedSomething = true;
            }
            if (cbPoetry.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.english_poetry = 1");
                appendedSomething = true;
            }
            if (cbAsianHistory.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.history_asian = 1");
                appendedSomething = true;
            }
            if (cbClassicalHistory.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.history_classical = 1");
                appendedSomething = true;
            }
            if (cbEuropeanHistoryLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.history_european = 1");
                appendedSomething = true;
            }
            if (cbMedievalHistory.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.history_medieval = 1");
                appendedSomething = true;
            }
            if (cbUnitedStatesHistory.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.history_us = 1");
                appendedSomething = true;
            }
            if (cbWorldHistoryLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.history_world = 1");
                appendedSomething = true;
            }
            if (cbTheBible.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_bible = 1");
                appendedSomething = true;
            }
            if (cbEthics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_ethics = 1");
                appendedSomething = true;
            }
            if (cbFaith.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_faith = 1");
                appendedSomething = true;
            }
            if (cbMoralPhilosophy.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_moral = 1");
                appendedSomething = true;
            }
            if (cbMythology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_mythology = 1");
                appendedSomething = true;
            }
            if (cbPhilosophy.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_philosophy = 1");
                appendedSomething = true;
            }
            if (cbReligious.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_religious = 1");
                appendedSomething = true;
            }
            if (cbSocialJustice.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_social = 1");
                appendedSomething = true;
            }
            if (cbTheology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_thology = 1");
                appendedSomething = true;
            }
            if (cbWorldReligions.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.religion_world = 1");
                appendedSomething = true;
            }
            if (cbAnthropology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.social_anthropology = 1");
                appendedSomething = true;
            }
            if (cbEconomics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.social_economics = 1");
                appendedSomething = true;
            }
            if (cbPsychologyLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.social_psychology = 1");
                appendedSomething = true;
            }
            if (cbSociology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.social_sociology = 1");
                appendedSomething = true;
            }
            if (cbChineseMandarin.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_mandarin = 1");
                appendedSomething = true;
            }
            if (cbChineseCantonese.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_cantonese = 1");
                appendedSomething = true;
            }
            if (cbFrench.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_french = 1");
                appendedSomething = true;
            }
            if (cbGerman.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_german = 1");
                appendedSomething = true;
            }
            if (cbItalian.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_italian = 1");
                appendedSomething = true;
            }
            if (cbJapanese.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_japanese = 1");
                appendedSomething = true;
            }
            if (cbRussian.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_russian = 1");
                appendedSomething = true;
            }
            if (cbSpanish.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_spanish = 1");
                appendedSomething = true;
            }
            if (cbGreek.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_greek = 1");
                appendedSomething = true;
            }
            if (cbLatin.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.foreign_latin = 1");
                appendedSomething = true;
            }

            #endregion

            // Advanced/Enrichment Programs
            #region Advanced/Enrichment Programs

            if (cb5DayBoarding.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.adv_5day = 1");
                appendedSomething = true;
            }
            if (cbPostgraduateYear.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.adv_postgrad = 1");
                appendedSomething = true;
            }
            if (cbInternationalBaccalaureate.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.adv_bacca = 1");
                appendedSomething = true;
            }
            if (cbAPCourses.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.adv_ap = 1");
                appendedSomething = true;
            }
            if (cbDistanceLearning.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.adv_distance = 1");
                appendedSomething = true;
            }

            #endregion

            // Math Science and Computer Science
            #region Math Science and Computer Science

            if (cbAnatomy.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_anatomy = 1");
                appendedSomething = true;
            }
            if (cbAnimalBehavior.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_animal = 1");
                appendedSomething = true;
            }
            if (cbAstronomy.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_astronomy = 1");
                appendedSomething = true;
            }
            if (cbAstrophysics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_astrophysics = 1");
                appendedSomething = true;
            }
            if (cbBiologyMath.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_biology = 1");
                appendedSomething = true;
            }
            if (cbBiotechnology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_biotechnology = 1");
                appendedSomething = true;
            }
            if (cbBotany.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_botany = 1");
                appendedSomething = true;
            }
            if (cbChemistryMath.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_chemistry = 1");
                appendedSomething = true;
            }
            if (cbEarthScience.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_earth = 1");
                appendedSomething = true;
            }
            if (cbEcology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_ecology = 1");
                appendedSomething = true;
            }
            if (cbElectronics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_electronics = 1");
                appendedSomething = true;
            }
            if (cbEntomology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_entomology = 1");
                appendedSomething = true;
            }
            if (cbEnvironmentalScienceMath.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_environmental = 1");
                appendedSomething = true;
            }
            if (cbEpidemiology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_eidemiology = 1");
                appendedSomething = true;
            }
            if (cbGenetics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_genetics = 1");
                appendedSomething = true;
            }
            if (cbGeology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_geology = 1");
                appendedSomething = true;
            }
            if (cbHealth.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_health = 1");
                appendedSomething = true;
            }
            if (cbMarineBiology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_marine = 1");
                appendedSomething = true;
            }
            if (cbMicrobiology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_microbiology = 1");
                appendedSomething = true;
            }
            if (cbOceanography.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_oceanography = 1");
                appendedSomething = true;
            }
            if (cbOrnithology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_ornithology = 1");
                appendedSomething = true;
            }
            if (cbPaleontology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_paleontology = 1");
                appendedSomething = true;
            }
            if (cbPhysicalScience.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_physical = 1");
                appendedSomething = true;
            }
            if (cbPhysics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_physics = 1");
                appendedSomething = true;
            }
            if (cbPhysiology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_physilogy = 1");
                appendedSomething = true;
            }
            if (cbSportsMedicine.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_sports = 1");
                appendedSomething = true;
            }
            if (cbZoology.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.science_zoology = 1");
                appendedSomething = true;
            }
            if (cbAlgebra.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_algebra = 1");
                appendedSomething = true;
            }
            if (cbCalculus.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_calculus = 1");
                appendedSomething = true;
            }
            if (cbFunctions.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_functions = 1");
                appendedSomething = true;
            }
            if (cbHonorsMath.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_honors = 1");
                appendedSomething = true;
            }
            if (cbGeometry.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_geometry = 1");
                appendedSomething = true;
            }
            if (cbProbability.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_probability = 1");
                appendedSomething = true;
            }
            if (cbStatisticsMath.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_statistics = 1");
                appendedSomething = true;
            }
            if (cbTrigonometry.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.math_triginometry = 1");
                appendedSomething = true;
            }
            if (cbComputerApplications.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.computer_applications = 1");
                appendedSomething = true;
            }
            if (cbComputerProgramming.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.computer_programming = 1");
                appendedSomething = true;
            }
            if (cbComputerScience.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.computer_science = 1");
                appendedSomething = true;
            }
            if (cbMultimedia.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.computer_multimedia = 1");
                appendedSomething = true;
            }
            if (cbWebDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.computer_web = 1");
                appendedSomething = true;
            }

            #endregion

            // Drama Visual Art Music Courses
            #region Drama Visual Art Music Courses

            if (cbActing.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_acting = 1");
                appendedSomething = true;
            }
            if (cbBallet.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_ballet = 1");
                appendedSomething = true;
            }
            if (cbChoreography.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_choreography = 1");
                appendedSomething = true;
            }
            if (cbDanceDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_dance = 1");
                appendedSomething = true;
            }
            if (cbDebate.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_debate = 1");
                appendedSomething = true;
            }
            if (cbDirecting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_directing = 1");
                appendedSomething = true;
            }
            if (cbDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_drama = 1");
                appendedSomething = true;
            }
            if (cbFilmandVideo.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_film = 1");
                appendedSomething = true;
            }
            if (cbHistoryofTheater.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_theaterhistory = 1");
                appendedSomething = true;
            }
            if (cbLightingDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_lighting = 1");
                appendedSomething = true;
            }
            if (cbModernDance.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_moderndance = 1");
                appendedSomething = true;
            }
            if (cbProduction.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_production = 1");
                appendedSomething = true;
            }
            if (cbPublicSpeaking.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_publicspeaking = 1");
                appendedSomething = true;
            }
            if (cbStagecraft.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_stagecraft = 1");
                appendedSomething = true;
            }
            if (cbTelevisionProducion.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_televisionproduction = 1");
                appendedSomething = true;
            }
            if (cbTheaterArts.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_theaterarts = 1");
                appendedSomething = true;
            }
            if (cbTheaterDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_theaterdesign = 1");
                appendedSomething = true;
            }
            if (cb3DDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_3d = 1");
                appendedSomething = true;
            }
            if (cbAnimation.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_animation = 1");
                appendedSomething = true;
            }
            if (cbArchitecture.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_architecture = 1");
                appendedSomething = true;
            }
            if (cbArt.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_art = 1");
                appendedSomething = true;
            }
            if (cbArtHistoryDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_arthistory = 1");
                appendedSomething = true;
            }
            if (cbCeramics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_ceramics = 1");
                appendedSomething = true;
            }
            if (cbDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_design = 1");
                appendedSomething = true;
            }
            if (cbDrawing.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_drawing = 1");
                appendedSomething = true;
            }
            if (cbFashionDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_fashion = 1");
                appendedSomething = true;
            }
            if (cbFiberArts.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_fiber = 1");
                appendedSomething = true;
            }
            if (cbGraphicDesign.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_graphic = 1");
                appendedSomething = true;
            }
            if (cbMetal.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_metal = 1");
                appendedSomething = true;
            }
            if (cbPainting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_painting = 1");
                appendedSomething = true;
            }
            if (cbPhotographyDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_photography = 1");
                appendedSomething = true;
            }
            if (cbPortfolio.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_portfolio = 1");
                appendedSomething = true;
            }
            if (cbPottery.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_pottery = 1");
                appendedSomething = true;
            }
            if (cbPrintmaking.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_printmaking = 1");
                appendedSomething = true;
            }
            if (cbScreenwriting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_screenwriting = 1");
                appendedSomething = true;
            }
            if (cbScreenprinting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_screenpriting = 1");
                appendedSomething = true;
            }
            if (cbSculpture.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_sculpture = 1");
                appendedSomething = true;
            }
            if (cbSilkscreen.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_silkscreen = 1");
                appendedSomething = true;
            }
            if (cbStudioArtDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_studioart = 1");
                appendedSomething = true;
            }
            if (cbTextiles.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_televisionproduction = 1");
                appendedSomething = true;
            }
            if (cbWeaving.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_weaving = 1");
                appendedSomething = true;
            }
            if (cbWoodworking.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.visual_woodworking = 1");
                appendedSomething = true;
            }
            if (cbBand.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_band = 1");
                appendedSomething = true;
            }
            if (cbChoralMusicDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_choral = 1");
                appendedSomething = true;
            }
            if (cbComposition.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_composition = 1");
                appendedSomething = true;
            }
            if (cbElectronicMusic.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_electronic = 1");
                appendedSomething = true;
            }
            if (cbHistoryofJazz.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.musicjazzhistory = 1");
                appendedSomething = true;
            }
            if (cbHistoryofMusic.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_musichistory = 1");
                appendedSomething = true;
            }
            if (cbIndividualInstructions.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_individual = 1");
                appendedSomething = true;
            }
            if (cbMusicAppreciation.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_appreciation = 1");
                appendedSomething = true;
            }
            if (cbMusicHistory.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_musichistory = 1");
                appendedSomething = true;
            }
            if (cbMusicTheoryDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_theory = 1");
                appendedSomething = true;
            }
            if (cbOpera.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_opera = 1");
                appendedSomething = true;
            }
            if (cbOrchestra.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_orchestra = 1");
                appendedSomething = true;
            }
            if (cbPrinciplesofArranging.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_arranging = 1");
                appendedSomething = true;
            }
            if (cbRecording.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_recording = 1");
                appendedSomething = true;
            }
            if (cbSolfegeEarTraining.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_solfege = 1");
                appendedSomething = true;
            }
            if (cbSongwriting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_songwriting = 1");
                appendedSomething = true;
            }
            if (cbVoice.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.music_voice = 1");
                appendedSomething = true;
            }

            #endregion

            // AP Courses
            #region AP Courses

            if (cbArtHistoryAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_arthistory = 1");
                appendedSomething = true;
            }
            if (cbBiologyAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_biology = 1");
                appendedSomething = true;
            }
            if (cbCalculusAB.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_calculusab = 1");
                appendedSomething = true;
            }
            if (cbCalculusBC.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_calculuscd = 1");
                appendedSomething = true;
            }
            if (cbChemistryAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_chemistry = 1");
                appendedSomething = true;
            }
            if (cbComparativeGovernmentPolitics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_comparativegov = 1");
                appendedSomething = true;
            }
            if (cbComputerScienceA.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_computera = 1");
                appendedSomething = true;
            }
            if (cbComputerScienceAB.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_computerab = 1");
                appendedSomething = true;
            }
            if (cbMicroeconomics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_microeconomics = 1");
                appendedSomething = true;
            }
            if (cbMacroeconomics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_macroeconomics = 1");
                appendedSomething = true;
            }
            if (cbEnglishLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_english = 1");
                appendedSomething = true;
            }
            if (cbEnglishLiterature.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_englishliterature = 1");
                appendedSomething = true;
            }
            if (cbEnvironmentalScienceAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_environmental = 1");
                appendedSomething = true;
            }
            if (cbEuropeanHistoryAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_europeanhistory = 1");
                appendedSomething = true;
            }
            if (cbFrenchLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_french = 1");
                appendedSomething = true;
            }
            if (cbFrenchLiterature.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_frenchliterature = 1");
                appendedSomething = true;
            }
            if (cbGermanLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_german = 1");
                appendedSomething = true;
            }
            if (cbHumanGeography.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_humangeography = 1");
                appendedSomething = true;
            }
            if (cbLatinLiterature.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_latinliterature = 1");
                appendedSomething = true;
            }
            if (cbLatinVirgil.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_latinvirgil = 1");
                appendedSomething = true;
            }
            if (cbMusicTheoryAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_musictheory = 1");
                appendedSomething = true;
            }
            if (cbPhysicsB.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_physicsb = 1");
                appendedSomething = true;
            }
            if (cbPhysicsC.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_physicsc = 1");
                appendedSomething = true;
            }
            if (cbPsychologyAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_psychology = 1");
                appendedSomething = true;
            }
            if (cbSpanishLanguage.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_spanish = 1");
                appendedSomething = true;
            }
            if (cbSpanishLiterature.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_spanishliterature = 1");
                appendedSomething = true;
            }
            if (cbStatisticsAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_statistics = 1");
                appendedSomething = true;
            }
            if (cbStudioArtAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_studioart = 1");
                appendedSomething = true;
            }
            if (cbUSGovernmentPolitics.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_usgov = 1");
                appendedSomething = true;
            }
            if (cbUSHistory.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_ushistory = 1");
                appendedSomething = true;
            }
            if (cbWorldHistoryAP.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.ap_worldhistory = 1");
                appendedSomething = true;
            }

            #endregion

            // Special Programs
            #region Special Programs

            if (cbCommunityServiceSpecial.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_community = 1");
                appendedSomething = true;
            }
            if (cbExchangePrograms.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_exchange = 1");
                appendedSomething = true;
            }
            if (cbIndependentStudy.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_independent = 1");
                appendedSomething = true;
            }
            if (cbInternships.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_internship = 1");
                appendedSomething = true;
            }
            if (cbJROTC.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_ jrotc= 1");
                appendedSomething = true;
            }
            if (cbLeadership.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_leadership = 1");
                appendedSomething = true;
            }
            if (cbLearningatSeaPrograms.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_learningatsea = 1");
                appendedSomething = true;
            }
            if (cbOutdoorEducationSpecial.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_outdoor = 1");
                appendedSomething = true;
            }
            if (cbPersonalFinance.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_finance = 1");
                appendedSomething = true;
            }
            if (cbRifleTeamSpecial.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_rifle = 1");
                appendedSomething = true;
            }
            if (cbSemesterYearOffCampus.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("a.special_semester = 1");
                appendedSomething = true;
            }

            #endregion

            // Art and Music
            #region Art and Music

            if (cbACappellaGroup.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_acappela = 1");
                appendedSomething = true;
            }
            if (cbChamberChoir.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_chamberchoir = 1");
                appendedSomething = true;
            }
            if (cbChoralMusicArt.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_choral = 1");
                appendedSomething = true;
            }
            if (cbGleeClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_gleeclub = 1");
                appendedSomething = true;
            }
            if (cbGospelChoir.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_gospel= 1");
                appendedSomething = true;
            }
            if (cbBrassEnsemble.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_brass = 1");
                appendedSomething = true;
            }
            if (cbChamberEnsemble.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_chamberensemble = 1");
                appendedSomething = true;
            }
            if (cbChamberOrchestra.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_chamberorchestra = 1");
                appendedSomething = true;
            }
            if (cbFolkMusicClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_folkmusic = 1");
                appendedSomething = true;
            }
            if (cbGuitarEnsemble.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_guitar = 1");
                appendedSomething = true;
            }
            if (cbImprovisationGroup.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_improvisation = 1");
                appendedSomething = true;
            }
            if (cbJazzEnsemble.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_jaxx = 1");
                appendedSomething = true;
            }
            if (cbPepBand.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_pep = 1");
                appendedSomething = true;
            }
            if (cbRockBand.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_rock = 1");
                appendedSomething = true;
            }
            if (cbStageBand.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_stage = 1");
                appendedSomething = true;
            }
            if (cbStringEnsemble.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_string = 1");
                appendedSomething = true;
            }
            if (cbAudiovisualClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_audiovisual = 1");
                appendedSomething = true;
            }
            if (cbArtClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_artclub = 1");
                appendedSomething = true;
            }
            if (cbDanceArt.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_dance = 1");
                appendedSomething = true;
            }
            if (cbDramaClubArt.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_dramaclub = 1");
                appendedSomething = true;
            }
            if (cbTechCrew.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_techcrew = 1");
                appendedSomething = true;
            }
            if (cbTheaterorDrama.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.arts_theater = 1");
                appendedSomething = true;
            }

            #endregion

            // Clubs and Organizations
            #region Clubs and Organizations

            if (cbAmnestyInternational.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_amnesty = 1");
                appendedSomething = true;
            }
            if (cbAnimalRightsClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_animal = 1");
                appendedSomething = true;
            }
            if (cbDiversityClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_diversity = 1");
                appendedSomething = true;
            }
            if (cbEnvironmentClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_environmental = 1");
                appendedSomething = true;
            }
            if (cbFreeTibet.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_freetibet= 1");
                appendedSomething = true;
            }
            if (cbYoungDemocrats.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_youngdemocrats = 1");
                appendedSomething = true;
            }
            if (cbYoungRepublicans.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_youngrepublicans = 1");
                appendedSomething = true;
            }
            if (cbDormProctors.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_dorm = 1");
                appendedSomething = true;
            }
            if (cbHonorCouncil.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_honor = 1");
                appendedSomething = true;
            }
            if (cbModelUN.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_modelun = 1");
                appendedSomething = true;
            }
            if (cbStudentGovernment.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_studentgov = 1");
                appendedSomething = true;
            }
            if (cbAsianClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_asian = 1");
                appendedSomething = true;
            }
            if (cbFCA.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_fca = 1");
                appendedSomething = true;
            }
            if (cbJewishStudentOrganization.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_jewish = 1");
                appendedSomething = true;
            }
            if (cbCommunityServiceClubs.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_community = 1");
                appendedSomething = true;
            }
            if (cbHabitatforHumanity.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_habitat = 1");
                appendedSomething = true;
            }
            if (cbStudentsAgainstDrunkDriving.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_sadd = 1");
                appendedSomething = true;
            }
            if (cbArchaeologyClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_archaeology = 1");
                appendedSomething = true;
            }
            if (cbAstronomyClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_astronomy = 1");
                appendedSomething = true;
            }
            if (cbClassicsClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_classics = 1");
                appendedSomething = true;
            }
            if (cbDebateClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_debate = 1");
                appendedSomething = true;
            }
            if (cbForeignLanguageClubs.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_foreignlanguage = 1");
                appendedSomething = true;
            }
            if (cbMathClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_math = 1");
                appendedSomething = true;
            }
            if (cbNationalHonorSociety.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_nhs = 1");
                appendedSomething = true;
            }
            if (cbPeerTutoringClubs.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_peertutoring = 1");
                appendedSomething = true;
            }
            if (cbQuizBowl.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_quizbowl = 1");
                appendedSomething = true;
            }
            if (cbScienceBowl.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_sciencebowl = 1");
                appendedSomething = true;
            }
            if (cbFencing.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_fencing = 1");
                appendedSomething = true;
            }
            if (cbHorsebackRiding.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_horseback = 1");
                appendedSomething = true;
            }
            if (cbSkateboardingClubs.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_skateboarding = 1");
                appendedSomething = true;
            }
            if (cbSnowboarding.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_snowboarding = 1");
                appendedSomething = true;
            }
            if (cbSurfing.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_surfing = 1");
                appendedSomething = true;
            }
            if (cbWeightlifting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_weighlifting = 1");
                appendedSomething = true;
            }
            if (cbYoga.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_yoga = 1");
                appendedSomething = true;
            }
            if (cbLiteraryMagazine.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_literay = 1");
                appendedSomething = true;
            }
            if (cbNewspaper.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_newspaper = 1");
                appendedSomething = true;
            }
            if (cbPhotographyClubs.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_photography = 1");
                appendedSomething = true;
            }
            if (cbStudentPublications.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_ = 1");
                appendedSomething = true;
            }
            if (cbStudentRadioStation.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_ = 1");
                appendedSomething = true;
            }
            if (cbTVStation.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_publications = 1");
                appendedSomething = true;
            }
            if (cbYearbook.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_yearbook = 1");
                appendedSomething = true;
            }
            if (cbChessClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_chess = 1");
                appendedSomething = true;
            }
            if (cbComputerClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_computer = 1");
                appendedSomething = true;
            }
            if (cbDramaClubClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_drama = 1");
                appendedSomething = true;
            }
            if (cbFoodCouncil.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_foodcouncil = 1");
                appendedSomething = true;
            }
            if (cbFutureBusinessLeaders.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_futureleaders = 1");
                appendedSomething = true;
            }
            if (cbGardening.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_gardening = 1");
                appendedSomething = true;
            }
            if (cbInvestmentClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_investment = 1");
                appendedSomething = true;
            }
            if (cbOutingClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_outing = 1");
                appendedSomething = true;
            }
            if (cbPeerCounseling.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_peercounseling = 1");
                appendedSomething = true;
            }
            if (cbPepClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_pepclub = 1");
                appendedSomething = true;
            }
            if (cbSailingClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_sailing = 1");
                appendedSomething = true;
            }
            if (cbScienceFictionClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_sciencefiction = 1");
                appendedSomething = true;
            }
            if (cbScouting.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_scouting = 1");
                appendedSomething = true;
            }
            if (cbSexualitiesClubs.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_sexualities = 1");
                appendedSomething = true;
            }
            if (cbSolarCarClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_solarcar = 1");
                appendedSomething = true;
            }
            if (cbStudentActivities.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_studentactivities = 1");
                appendedSomething = true;
            }
            if (cbTheater.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_theater = 1");
                appendedSomething = true;
            }
            if (cbWoodworkingClub.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("life.club_woodworking = 1");
                appendedSomething = true;
            }

            #endregion

            // Interscholastic Sports
            #region Interscholastic Sports

            if (cbAlpineSkiRacingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_alpineskiracing = 1");
                appendedSomething = true;
            }
            if (cbAlpineSkiingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_alpineskiing = 1");
                appendedSomething = true;
            }
            if (cbFigureSkatingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_figureskating = 1");
                appendedSomething = true;
            }
            if (cbFieldHockeyRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_fieldhockey = 1");
                appendedSomething = true;
            }
            if (cbFreeStyleSkiingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_freestyleski = 1");
                appendedSomething = true;
            }
            if (cbIceClimbingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_iceclimbing= 1");
                appendedSomething = true;
            }
            if (cbIceHockeyInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_icehockey = 1");
                appendedSomething = true;
            }
            if (cbIceSkatingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_iceskating = 1");
                appendedSomething = true;
            }
            if (cbLugeInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_luge = 1");
                appendedSomething = true;
            }
            if (cbNordicSkiRacingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_nordicskiracing = 1");
                appendedSomething = true;
            }
            if (cbNordicSkiingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_nordicskiing = 1");
                appendedSomething = true;
            }
            if (cbSkiJumpingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_skijumping = 1");
                appendedSomething = true;
            }
            if (cbSnowboardingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_snowboarding = 1");
                appendedSomething = true;
            }
            if (cbBadmintonInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_badminton = 1");
                appendedSomething = true;
            }
            if (cbPaddleTennisInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_paddletennis = 1");
                appendedSomething = true;
            }
            if (cbRacquetBallInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_racquetball = 1");
                appendedSomething = true;
            }
            if (cbSquashInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_squash = 1");
                appendedSomething = true;
            }
            if (cbTableTennisInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_tabletennis = 1");
                appendedSomething = true;
            }
            if (cbTennisInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_tennis = 1");
                appendedSomething = true;
            }
            if (cbAerobicsInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_aerobics = 1");
                appendedSomething = true;
            }
            if (cbBowlingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_bowling = 1");
                appendedSomething = true;
            }
            if (cbCheerleadingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_cheerleading = 1");
                appendedSomething = true;
            }
            if (cbDanceInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_dance = 1");
                appendedSomething = true;
            }
            if (cbFencingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_fencing = 1");
                appendedSomething = true;
            }
            if (cbGymnasticsInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_gymnastics = 1");
                appendedSomething = true;
            }
            if (cbKickboxingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_kickboxing = 1");
                appendedSomething = true;
            }
            if (cbMartialArtsInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_martialarts = 1");
                appendedSomething = true;
            }
            if (cbPowerLiftingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_powerlifting = 1");
                appendedSomething = true;
            }
            if (cbWeightLiftingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_weightlifting = 1");
                appendedSomething = true;
            }
            if (cbWrestlingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_wrestling = 1");
                appendedSomething = true;
            }
            if (cbCampingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_camping = 1");
                appendedSomething = true;
            }
            if (cbCrossCountryRunningInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_crosscountry = 1");
                appendedSomething = true;
            }
            if (cbCurlingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_curling = 1");
                appendedSomething = true;
            }
            if (cbDrillTeamInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_drillteam = 1");
                appendedSomething = true;
            }
            if (cbEquesrianInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_equestrian = 1");
                appendedSomething = true;
            }
            if (cbHikingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_hiking = 1");
                appendedSomething = true;
            }
            if (cbHorsebackRidingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_horseback = 1");
                appendedSomething = true;
            }
            if (cbMountainBikingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_mountainbike = 1");
                appendedSomething = true;
            }
            if (cbOutdoorEducationInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_outdooreducation = 1");
                appendedSomething = true;
            }
            if (cbPoloInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_polo = 1");
                appendedSomething = true;
            }
            if (cbRifleTeamInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_rifleteam = 1");
                appendedSomething = true;
            }
            if (cbRockClimbingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_rockclimbing = 1");
                appendedSomething = true;
            }
            if (cbSkateboardingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_skateboarding = 1");
                appendedSomething = true;
            }
            if (cbTrackandFieldInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_trackandfield = 1");
                appendedSomething = true;
            }
            if (cbUltimateFrisbeeInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_ultimatefrisbee = 1");
                appendedSomething = true;
            }
            if (cbBaseballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_baseball = 1");
                appendedSomething = true;
            }
            if (cbBasketballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_basketball = 1");
                appendedSomething = true;
            }
            if (cbCricketInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_cricket = 1");
                appendedSomething = true;
            }
            if (cbFieldHockeyInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_fieldhockey = 1");
                appendedSomething = true;
            }
            if (cbFootballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_football = 1");
                appendedSomething = true;
            }
            if (cbGolfInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_golf = 1");
                appendedSomething = true;
            }
            if (cbHandballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_handball = 1");
                appendedSomething = true;
            }
            if (cbKickballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_kickball = 1");
                appendedSomething = true;
            }
            if (cbLarcrosseInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_lacrosse = 1");
                appendedSomething = true;
            }
            if (cbRugbyInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_rugby = 1");
                appendedSomething = true;
            }
            if (cbSoccerInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_soccer = 1");
                appendedSomething = true;
            }
            if (cbSoftballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_softball = 1");
                appendedSomething = true;
            }
            if (cbVolleyballInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_volleyball = 1");
                appendedSomething = true;
            }
            if (cbCanoeingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_canoeing = 1");
                appendedSomething = true;
            }
            if (cbCrewInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_crew = 1");
                appendedSomething = true;
            }
            if (cbDivingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_diving = 1");
                appendedSomething = true;
            }
            if (cbKayakingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_kayaking = 1");
                appendedSomething = true;
            }
            if (cbRaftingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_rafting = 1");
                appendedSomething = true;
            }
            if (cbSailingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_sailing = 1");
                appendedSomething = true;
            }
            if (cbSurfingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_surfing = 1");
                appendedSomething = true;
            }
            if (cbSwimmingInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_swimming = 1");
                appendedSomething = true;
            }
            if (cbWaterPoloInter.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.sports_polo = 1");
                appendedSomething = true;
            }

            #endregion

            // Recreational Sports
            #region Recreational Sports

            if (cbAlpineSkiRacingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_alpineskiracing = 1");
                appendedSomething = true;
            }
            if (cbAlpineSkiingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_alpineskiing = 1");
                appendedSomething = true;
            }
            if (cbFigureSkatingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_figureskating = 1");
                appendedSomething = true;
            }
            if (cbFreeStyleSkiingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_freestyleski = 1");
                appendedSomething = true;
            }
            if (cbIceClimbingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_iceclimbing= 1");
                appendedSomething = true;
            }
            if (cbIceHockeyRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_icehockey = 1");
                appendedSomething = true;
            }
            if (cbIceSkatingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_iceskating = 1");
                appendedSomething = true;
            }
            if (cbLugeRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_luge = 1");
                appendedSomething = true;
            }
            if (cbNordicSkiRacingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_nordicskiracing = 1");
                appendedSomething = true;
            }
            if (cbNordicSkiingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_nordicskiing = 1");
                appendedSomething = true;
            }
            if (cbSkiJumpingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_skijumping = 1");
                appendedSomething = true;
            }
            if (cbSnowboardingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_snowboarding = 1");
                appendedSomething = true;
            }
            if (cbBadmintonRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_badminton = 1");
                appendedSomething = true;
            }
            if (cbPaddleTennisRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_paddletennis = 1");
                appendedSomething = true;
            }
            if (cbRacquetBallRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_racquetball = 1");
                appendedSomething = true;
            }
            if (cbSquashRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_squash = 1");
                appendedSomething = true;
            }
            if (cbTableTennisRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_tabletennis = 1");
                appendedSomething = true;
            }
            if (cbTennisRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_tennis = 1");
                appendedSomething = true;
            }
            if (cbAerobicsRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_aerobics = 1");
                appendedSomething = true;
            }
            if (cbBowlingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_bowling = 1");
                appendedSomething = true;
            }
            if (cbCheerleadingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_cheerleading = 1");
                appendedSomething = true;
            }
            if (cbDanceRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_dance = 1");
                appendedSomething = true;
            }
            if (cbFencingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_fencing = 1");
                appendedSomething = true;
            }
            if (cbGymnasticsRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_gymnastics = 1");
                appendedSomething = true;
            }
            if (cbKickboxingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_kickboxing = 1");
                appendedSomething = true;
            }
            if (cbMartialArtsRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_martialarts = 1");
                appendedSomething = true;
            }
            if (cbPowerLiftingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_powerlifting = 1");
                appendedSomething = true;
            }
            if (cbWeightLiftingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_weightlifting = 1");
                appendedSomething = true;
            }
            if (cbWrestlingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_wrestling = 1");
                appendedSomething = true;
            }
            if (cbCampingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_camping = 1");
                appendedSomething = true;
            }
            if (cbCrossCountryRunningRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_crosscountry = 1");
                appendedSomething = true;
            }
            if (cbCurlingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_curling = 1");
                appendedSomething = true;
            }
            if (cbDrillTeamRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_drillteam = 1");
                appendedSomething = true;
            }
            if (cbEquesrianRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_equestrian = 1");
                appendedSomething = true;
            }
            if (cbHikingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_hiking = 1");
                appendedSomething = true;
            }
            if (cbHorsebackRidingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_horseback = 1");
                appendedSomething = true;
            }
            if (cbMountainBikingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_mountainbike = 1");
                appendedSomething = true;
            }
            if (cbOutdoorEducationRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_outdooreducation = 1");
                appendedSomething = true;
            }
            if (cbPoloRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_polo = 1");
                appendedSomething = true;
            }
            if (cbRifleTeamRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_rifleteam = 1");
                appendedSomething = true;
            }
            if (cbRockClimbingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_rockclimbing = 1");
                appendedSomething = true;
            }
            if (cbSkateboardingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_skateboarding = 1");
                appendedSomething = true;
            }
            if (cbTrackandFieldRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_trackandfield = 1");
                appendedSomething = true;
            }
            if (cbUltimateFrisbeeRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_ultimatefrisbee = 1");
                appendedSomething = true;
            }
            if (cbBaseballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_baseball = 1");
                appendedSomething = true;
            }
            if (cbBasketballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_basketball = 1");
                appendedSomething = true;
            }
            if (cbCricketRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_cricket = 1");
                appendedSomething = true;
            }
            if (cbFieldHockeyRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_fieldhockey = 1");
                appendedSomething = true;
            }
            if (cbFootballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_football = 1");
                appendedSomething = true;
            }
            if (cbGolfRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_golf = 1");
                appendedSomething = true;
            }
            if (cbHandballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_handball = 1");
                appendedSomething = true;
            }
            if (cbKickballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_kickball = 1");
                appendedSomething = true;
            }
            if (cbLarcrosseRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_lacrosse = 1");
                appendedSomething = true;
            }
            if (cbRugbyRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_rugby = 1");
                appendedSomething = true;
            }
            if (cbSoccerRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_soccer = 1");
                appendedSomething = true;
            }
            if (cbSoftballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_softball = 1");
                appendedSomething = true;
            }
            if (cbVolleyballRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_volleyball = 1");
                appendedSomething = true;
            }
            if (cbCanoeingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_canoeing = 1");
                appendedSomething = true;
            }
            if (cbCrewRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_crew = 1");
                appendedSomething = true;
            }
            if (cbDivingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_diving = 1");
                appendedSomething = true;
            }
            if (cbKayakingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_kayaking = 1");
                appendedSomething = true;
            }
            if (cbRaftingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_rafting = 1");
                appendedSomething = true;
            }
            if (cbSailingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_sailing = 1");
                appendedSomething = true;
            }
            if (cbSurfingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_surfing = 1");
                appendedSomething = true;
            }
            if (cbSwimmingRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_swimming = 1");
                appendedSomething = true;
            }
            if (cbWaterPoloRecreat.Checked)
            {
                if (appendedSomething)
                {
                    optional.Append(" OR ");
                }
                optional.Append("art.rec_polo = 1");
                appendedSomething = true;
            }

            #endregion

            if (appendedSomething == true)
            {
                // Add the optional queries
                qry.Append(" AND (");
                qry.Append(optional.ToString());
                qry.Append(")");
            }

            // Grades
            int lowgrade = int.Parse(tbGradeLow.Text);
            int highgrade = int.Parse(tbGradeHigh.Text);
            string gradeText = string.Empty;

            qry.Append(" AND (");
            for (int i = lowgrade; i <= highgrade; i++)
            {
                gradeText = schoollogic.getGradeReferenceBYValue(i)[0].grade;
                if (i.Equals(lowgrade))
                {
                    qry.Append("[" + gradeText + "] = 1");
                }
                else
                {
                    qry.Append(" OR [" + gradeText + "] = 1");
                }
            }
            qry.Append(")");


            // Student Count
            qry.Append(") select * from pagedlist ");
            qry.Append("WHERE studentTotal BETWEEN ").Append(tbStudentLow.Text).Append(" AND ").Append(tbStudentHigh.Text).Append(";");

            return qry.ToString();
        }

        void BindRepeater()
        {  
            // formulate query
            string connectionString = ConfigurationManager.ConnectionStrings["tabs_adminConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlDataAdapter sda = new SqlDataAdapter();
            DataSet ds = new DataSet(); 
            try
            {
                sda.SelectCommand = new SqlCommand(createQuery(), conn);
                sda.Fill(ds);
            }
            catch (System.IndexOutOfRangeException)
            {
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                DataTable dt = ds.Tables[0];
                litNumberofResults.Text = dt.Rows.Count.ToString();
                

                // Set pagination controls
                PagedDataSource pds = SetPaginationControls(ref dt);

                repeatResult.DataSource = pds;
                repeatResult.DataBind();
            }
            else
            {
                repeatResult.Controls.Clear();
            }
        }

        private PagedDataSource SetPaginationControls(ref DataTable dt)
        {
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = dt.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = pagesize;
            pds.CurrentPageIndex = CurrentPage.Equals(0)? 0: CurrentPage - 1;

            liNext.Visible = !pds.IsLastPage;
            linkNext.Enabled = !pds.IsLastPage;

            liPrevious.Visible = !pds.IsFirstPage;
            linkPrevious.Enabled = !pds.IsFirstPage;

            List<int> pageNumbers = new List<int>();

            for (int i = 1; i <= pds.PageCount; i++)
            {
                pageNumbers.Add(i);
            }

            rptPageNumbers.DataSource = pageNumbers;
            rptPageNumbers.DataBind();


            return pds;

        }

        protected void rptPageNumbers_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int pageNumber = (int)e.Item.DataItem;

                HtmlContainerControl li = (HtmlContainerControl)e.Item.FindControl("liPageNumber");
                LinkButton lb = (LinkButton)e.Item.FindControl("lbPageNumber");

                lb.CommandArgument = pageNumber.ToString();
                lb.Text = pageNumber.ToString();

                if (pageNumber.Equals(CurrentPage.Equals(0)? 1 : CurrentPage))
                {
                    Label lbl = (Label)e.Item.FindControl("lblPageSelected");
                    lbl.Text = pageNumber.ToString();

                    li.Attributes.Add("class", "pages-selected");
                    lb.Visible = false;
                }
            }
        }

        protected void rptPageNumbers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int pageClicked = int.Parse(e.CommandArgument.ToString());

            CurrentPage = pageClicked;
            BindRepeater();
        }

        protected void linkNext_Click1(object sender, EventArgs e)
        {
            CurrentPage += 1;
            BindRepeater();
        }

        protected void linkPrevious_Click1(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            BindRepeater();
        }
    }
}