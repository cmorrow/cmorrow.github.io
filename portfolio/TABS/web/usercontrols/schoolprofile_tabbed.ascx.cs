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
using System.Globalization;

namespace TABS_UserControls.usercontrols {
    public partial class schoolprofile_tabbed : System.Web.UI.UserControl {
        private TABS_UserControls.resources.code.BAL.SchoolClass schoollogic = new TABS_UserControls.resources.code.BAL.SchoolClass();
        private TABS_UserControls.resources.code.BAL.PhotoClass photologic = new TABS_UserControls.resources.code.BAL.PhotoClass();
        private TABS_UserControls.resources.code.BAL.EventClass eventlogic = new TABS_UserControls.resources.code.BAL.EventClass();
        private int schoolid;
        private string summerimg, retVal, alumniVal;

        protected void Page_Init(object sender, EventArgs e) {
            try { schoolid = Convert.ToInt16(Request.QueryString["schoolid"]); } catch { schoolid = 0; }
        }

        protected void Page_Load(object sender, EventArgs e) {

            repeatGlance.ItemDataBound += new RepeaterItemEventHandler(repeatGlance_ItemDataBound);
            repeatAcademics.ItemDataBound += new RepeaterItemEventHandler(repeatAcademics_ItemDataBound);
            repeatCampusLife.ItemDataBound += new RepeaterItemEventHandler(repeatCampusLife_ItemDataBound);
            repeatArts.ItemDataBound += new RepeaterItemEventHandler(repeatArts_ItemDataBound);
            repeatSummerPrograms.ItemDataBound += new RepeaterItemEventHandler(repeatSummerPrograms_ItemDataBound);


            //server-side binding
            if (!Page.IsPostBack) {
                repeatGlance.DataSource = schoollogic.getGlanceBySchoolID(schoolid);
                repeatGlance.DataBind();
                
                repeatAcademics.DataSource = schoollogic.getAcademicBySchoolID(schoolid);
                repeatAcademics.DataBind();

                repeatCampusLife.DataSource = schoollogic.getCampusLifeBySchoolID(schoolid);
                repeatCampusLife.DataBind();

                repeatArts.DataSource = schoollogic.getArtsBySchoolID(schoolid);
                repeatArts.DataBind();

                repeatCollegeInfo.DataSource = schoollogic.getCollegeInfoBySchoolID(schoolid);
                repeatCollegeInfo.DataBind();

                DataTable dt = schoollogic.getSummerProgramBySchoolID(schoolid);
                if (dt.Rows.Count > 0) {
                    summerimg = dt.Rows[0]["image"].ToString();
                } else { summerimg = ""; }

                repeatSummerPrograms.DataSource = dt;
                repeatSummerPrograms.DataBind();

                repeatSummerProgramList.DataSource = schoollogic.getSummerProgramDetailsBySchoolId(schoolid);
                repeatSummerProgramList.DataBind();

                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_customsDataTable customds = schoollogic.getCustomBySchoolID(schoolid);

                if (customds.Rows.Count > 0) {
                    repeatCustom.DataSource = customds;
                    repeatCustom.DataBind();

                    literalCustomTab.Visible = Convert.ToBoolean(customds.Rows[0]["showcustom"].ToString());
                    lblCustomName.Text = customds.Rows[0]["customname"].ToString();
                } else {
                    literalCustomTab.Visible = false;
                }

                this.CheckTabs();
            }
        }

        void repeatSummerPrograms_ItemDataBound(object sender, RepeaterItemEventArgs e) 
        {
            Image imgsummer = (Image)e.Item.FindControl("imageSummer");
            imgsummer.ImageUrl = "~/resources/images/schoolimages/" + schoolid + "/images/" + summerimg;
            bool display = this.DisplayImages("summer");
            if (display == false) {
                imgsummer.Style.Add("display", "none");
            }
        }

        void repeatArts_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_artsandathleticsRow row = schoollogic.getArtsBySchoolID(schoolid)[0];

            Image imgarts = (Image)e.Item.FindControl("imageArts");
            imgarts.ImageUrl = "/binary-image.aspx?section=arts&schoolid=" + schoolid;
            bool display = this.DisplayImages("arts");
            if (display == false) {
                imgarts.Style.Add("display", "none");
            }

            //arts
            int art = 0;
            literalARTS_ACG.Visible = row.arts_acappella; if (!row.arts_acappella) art++;
            literalARTS_ARTCB.Visible = row.arts_artclub; if (!row.arts_artclub) art++;
            literalARTS_AUDI.Visible = row.arts_audiovisual; if (!row.arts_audiovisual) art++;
            literalARTS_BRASS.Visible = row.arts_brass; if (!row.arts_brass) art++;
            literalARTS_CHAMCH.Visible = row.arts_chamberchoir; if (!row.arts_chamberchoir) art++;
            literalARTS_CHAMEN.Visible = row.arts_chamberensemble; if (!row.arts_chamberensemble) art++;
            literalARTS_CHAMOR.Visible = row.arts_chamberorchestra; if (!row.arts_chamberorchestra) art++;
            literalARTS_CHOR.Visible = row.arts_choral; if (!row.arts_choral) art++;
            literalARTS_DANCE.Visible = row.arts_dance; if (!row.arts_dance) art++;
            literalARTS_DRAMA.Visible = row.arts_dramaclub; if (!row.arts_dramaclub) art++;
            literalARTS_FMC.Visible = row.arts_folkmusic; if (!row.arts_folkmusic) art++;
            literalARTS_GLC.Visible = row.arts_gleeclub; if (!row.arts_gleeclub) art++;
            literalARTS_GOCH.Visible = row.arts_gospel; if (!row.arts_gospel) art++;
            literalARTS_GU.Visible = row.arts_guitar; if (!row.arts_guitar) art++;
            literalARTS_IMPRO.Visible = row.arts_improvisation; if (!row.arts_improvisation) art++;
            literalARTS_JAZZ.Visible = row.arts_jazz; if (!row.arts_jazz) art++;
            literalARTS_PEPBAND.Visible = row.arts_pep; if (!row.arts_pep) art++;
            literalARTS_ROCK.Visible = row.arts_rock; if (!row.arts_rock) art++;
            literalARTS_STAGE.Visible = row.arts_stage; if (!row.arts_stage) art++;
            literalARTS_STRING.Visible = row.arts_string; if (!row.arts_string) art++;
            literalARTS_TECH.Visible = row.arts_techcrew; if (!row.arts_techcrew) art++;
            literalARTS_THEATER.Visible = row.arts_theater; if (!row.arts_theater) art++;
            if (art == 22) { aahead1.Visible = true; }

            //Interscholastic Sports:
            int ints = 0;
            literalINTSP_AERO.Visible = row.sports_aerobics; if (!row.sports_aerobics) ints++;
            literalINTSP_ALPI.Visible = row.sports_alpineskiing; if (!row.sports_alpineskiing) ints++;
            literalINTSP_ALPINE.Visible = row.sports_alpineskiracing; if (!row.sports_alpineskiracing) ints++;
            literalINTSP_BADMIN.Visible = row.sports_badminton; if (!row.sports_badminton) ints++;
            literalINTSP_BASEB.Visible = row.sports_baseball; if (!row.sports_baseball) ints++;
            literalINTSP_BASK.Visible = row.sports_basketball; if (!row.sports_basketball) ints++;
            literalINTSP_BOW.Visible = row.sports_bowling; if (!row.sports_bowling) ints++;
            literalINTSP_CAMP.Visible = row.sports_camping; if (!row.sports_camping) ints++;
            literalINTSP_CANOE.Visible = row.sports_canoeing; if (!row.sports_canoeing) ints++;
            literalINTSP_CHEER.Visible = row.sports_cheerleading; if (!row.sports_cheerleading) ints++;
            literalINTSP_CREW.Visible = row.sports_crew; if (!row.sports_crew) ints++;
            literalINTSP_CRICK.Visible = row.sports_cricket; if (!row.sports_cricket) ints++;
            literalINTSP_CROSS.Visible = row.sports_crosscountry; if (!row.sports_crosscountry) ints++;
            literalINTSP_CURL.Visible = row.sports_curling; if (!row.sports_curling) ints++;
            literalINTSP_DANCE.Visible = row.sports_dance; if (!row.sports_dance) ints++;
            literalINTSP_DIVI.Visible = row.sports_diving; if (!row.sports_diving) ints++;
            literalINTSP_DRILL.Visible = row.sports_drillteam; if (!row.sports_drillteam) ints++;
            literalINTSP_EQUE.Visible = row.sports_equestrian; if (!row.sports_equestrian) ints++;
            literalINTSP_FENC.Visible = row.sports_fencing; if (!row.sports_fencing) ints++;
            literalINTSP_FIELD.Visible = row.sports_fieldhockey; if (!row.sports_fieldhockey) ints++;
            literalINTSP_FOOT.Visible = row.sports_football; if (!row.sports_football) ints++;
            literalINTSP_FREE.Visible = row.sports_freestyleski; if (!row.sports_freestyleski) ints++;
            literalINTSP_GOLF.Visible = row.sports_golf; if (!row.sports_golf) ints++;
            literalINTSP_GYMN.Visible = row.sports_gymnastics; if (!row.sports_gymnastics) ints++;
            literalINTSP_HAND.Visible = row.sports_handball; if (!row.sports_handball) ints++;
            literalINTSP_HIKING.Visible = row.sports_hiking; if (!row.sports_hiking) ints++;
            literalINTSP_HORSE.Visible = row.sports_horseback; if (!row.sports_horseback) ints++;
            literalINTSP_ICECLB.Visible = row.sports_iceclimbing; if (!row.sports_iceclimbing) ints++;
            literalINTSP_ICEHO.Visible = row.sports_icehockey; if (!row.sports_icehockey) ints++;
            literalINTSP_ICESK.Visible = row.sports_iceskating; if (!row.sports_iceskating) ints++;
            literalINTSP_KAYA.Visible = row.sports_kayaking; if (!row.sports_kayaking) ints++;
            literalINTSP_KICKBA.Visible = row.sports_kickball; if (!row.sports_kickball) ints++;
            literalINTSP_KICKBO.Visible = row.sports_kickboxing; if (!row.sports_kickboxing) ints++;
            literalINTSP_LACRO.Visible = row.sports_lacrosse; if (!row.sports_lacrosse) ints++;
            literalINTSP_LUGE.Visible = row.sports_luge; if (!row.sports_luge) ints++;
            literalINTSP_MART.Visible = row.sports_martialarts; if (!row.sports_martialarts) ints++;
            literalINTSP_MOUNT.Visible = row.sports_mountainbike; if (!row.sports_mountainbike) ints++;
            literalINTSP_NORDIC.Visible = row.sports_nordicskiing; if (!row.sports_nordicskiing) ints++;
            literalINTSP_NORSK.Visible = row.sports_nordicskiracing; if (!row.sports_nordicskiracing) ints++;
            literalINTSP_OUTDOOR.Visible = row.sports_outdooreducation; if (!row.sports_outdooreducation) ints++;
            literalINTSP_PADD.Visible = row.sports_paddletennis; if (!row.sports_paddletennis) ints++;
            literalINTSP_POLO.Visible = row.sports_polo; if (!row.sports_polo) ints++;
            literalINTSP_POWER.Visible = row.sports_powerlifting; if (!row.sports_powerlifting) ints++;
            literalINTSP_RACQ.Visible = row.sports_racquetball; if (!row.sports_racquetball) ints++;
            literalINTSP_RAFT.Visible = row.sports_rafting; if (!row.sports_rafting) ints++;
            literalINTSP_RIFLE.Visible = row.sports_rifleteam; if (!row.sports_rifleteam) ints++;
            literalINTSP_ROCK.Visible = row.sports_rockclimbing; if (!row.sports_rockclimbing) ints++;
            literalINTSP_RUGB.Visible = row.sports_rugby; if (!row.sports_rugby) ints++;
            literalINTSP_SAIL.Visible = row.sports_sailing; if (!row.sports_sailing) ints++;
            literalINTSP_SKATE.Visible = row.sports_skateboarding; if (!row.sports_skateboarding) ints++;
            literalINTSP_SKI.Visible = row.sports_skijumping; if (!row.sports_skijumping) ints++;
            literalINTSP_SNOW.Visible = row.sports_snowboarding; if (!row.sports_snowboarding) ints++;
            literalINTSP_SOCCER.Visible = row.sports_soccer; if (!row.sports_soccer) ints++;
            literalINTSP_SOFT.Visible = row.sports_softball; if (!row.sports_softball) ints++;
            literalINTSP_SQUASH.Visible = row.sports_squash; if (!row.sports_squash) ints++;
            literalINTSP_SURF.Visible = row.sports_surfing; if (!row.sports_surfing) ints++;
            literalINTSP_SWI.Visible = row.sports_swimming; if (!row.sports_swimming) ints++;
            literalINTSP_TABLE.Visible = row.sports_tabletennis; if (!row.sports_tabletennis) ints++;
            literalINTSP_TENN.Visible = row.sports_tennis; if (!row.sports_tennis) ints++;
            literalINTSP_TRACK.Visible = row.sports_trackandfield; if (!row.sports_trackandfield) ints++;
            literalINTSP_ULTI.Visible = row.sports_ultimatefrisbee; if (!row.sports_ultimatefrisbee) ints++;
            literalINTSP_VOLLE.Visible = row.sports_volleyball; if (!row.sports_volleyball) ints++;
            literalINTSP_WATER.Visible = row.sports_waterpolo; if (!row.sports_waterpolo) ints++;
            literalINTSP_WEIGHT.Visible = row.sports_weightlifting; if (!row.sports_weightlifting) ints++;
            literalINTSP_WREST.Visible = row.sports_wrestling; if (!row.sports_wrestling) ints++;
            if (ints == 65) { aahead2.Visible = true; }

            //Recreational Sports:
            int rec = 0;
            literalRECRESP_AERO.Visible = row.rec_aerobics; if (!row.rec_aerobics) rec++;
            literalRECRESP_ALSKR.Visible = row.rec_alpineskiing; if (!row.rec_alpineskiing) rec++;
            literalRECRESP_ALSKS.Visible = row.rec_alpineskiracing; if (!row.rec_alpineskiracing) rec++;
            literalRECRESP_BADMIN.Visible = row.rec_badminton; if (!row.rec_badminton) rec++;
            literalRECRESP_BASEB.Visible = row.rec_baseball; if (!row.rec_baseball) rec++;
            literalRECRESP_BASK.Visible = row.rec_basketball; if (!row.rec_basketball) rec++;
            literalRECRESP_BOW.Visible = row.rec_bowling; if (!row.rec_bowling) rec++;
            literalRECRESP_CAMP.Visible = row.rec_camping; if (!row.rec_camping) rec++;
            literalRECRESP_CANOE.Visible = row.rec_canoeing; if (!row.rec_canoeing) rec++;
            literalRECRESP_CHEER.Visible = row.rec_cheerleading; if (!row.rec_cheerleading) rec++;
            literalRECRESP_CREW.Visible = row.rec_crew; if (!row.rec_crew) rec++;
            literalRECRESP_CRICK.Visible = row.rec_cricket; if (!row.rec_cricket) rec++;
            literalRECRESP_CROSS.Visible = row.rec_crosscountry; if (!row.rec_crosscountry) rec++;
            literalRECRESP_CURL.Visible = row.rec_curling; if (!row.rec_curling) rec++;
            literalRECRESP_DANCE.Visible = row.rec_dance; if (!row.rec_dance) rec++;
            literalRECRESP_DIVING.Visible = row.rec_diving; if (!row.rec_diving) rec++;
            literalRECRESP_DRILL.Visible = row.rec_drillteam; if (!row.rec_drillteam) rec++;
            literalRECRESP_EQUES.Visible = row.rec_equestrian; if (!row.rec_equestrian) rec++;
            literalRECRESP_FENC.Visible = row.rec_fencing; if (!row.rec_fencing) rec++;
            literalRECRESP_FIELD.Visible = row.rec_fieldhockey; if (!row.rec_fieldhockey) rec++;
            literalRECRESP_FIGURE.Visible = row.rec_figureskating; if (!row.rec_figureskating) rec++;
            literalRECRESP_FOOT.Visible = row.rec_football; if (!row.rec_football) rec++;
            literalRECRESP_FREE.Visible = row.rec_freestyleskiing; if (!row.rec_freestyleskiing) rec++;
            literalRECRESP_GOLF.Visible = row.rec_golf; if (!row.rec_golf) rec++;
            literalRECRESP_GYMN.Visible = row.rec_gymnastics; if (!row.rec_gymnastics) rec++;
            literalRECRESP_HAND.Visible = row.rec_handball; if (!row.rec_handball) rec++;
            literalRECRESP_HIKI.Visible = row.rec_hiking; if (!row.rec_hiking) rec++;
            literalRECRESP_HORSE.Visible = row.rec_horsebackriding; if (!row.rec_horsebackriding) rec++;
            literalRECRESP_ICECLB.Visible = row.rec_iceclimbing; if (!row.rec_iceclimbing) rec++;
            literalRECRESP_ICEHOC.Visible = row.rec_icehockey; if (!row.rec_icehockey) rec++;
            literalRECRESP_KAYAK.Visible = row.rec_kayaking; if (!row.rec_kayaking) rec++;
            literalRECRESP_LACRO.Visible = row.rec_lacrosse; if (!row.rec_lacrosse) rec++;
            literalRECRESP_LUGE.Visible = row.rec_luge; if (!row.rec_luge) rec++;
            literalRECRESP_MARTI.Visible = row.rec_martialarts; if (!row.rec_martialarts) rec++;
            literalRECRESP_MOUNT.Visible = row.rec_mountainbiking; if (!row.rec_mountainbiking) rec++;
            literalRECRESP_NORSA.Visible = row.rec_nordicskiiing; if (!row.rec_nordicskiiing) rec++;
            literalRECRESP_NORSK.Visible = row.rec_nordicskiracing; if (!row.rec_nordicskiracing) rec++;
            literalRECRESP_OUT.Visible = row.rec_outdooreducation; if (!row.rec_outdooreducation) rec++;
            literalRECRESP_PADD.Visible = row.rec_paddletennis; if (!row.rec_paddletennis) rec++;
            literalRECRESP_POLO.Visible = row.rec_polo; if (!row.rec_polo) rec++;
            literalRECRESP_POWER.Visible = row.rec_powerlifting; if (!row.rec_powerlifting) rec++;
            literalRECRESP_RACQ.Visible = row.rec_racquetball; if (!row.rec_racquetball) rec++;
            literalRECRESP_RAFT.Visible = row.rec_rafting; if (!row.rec_rafting) rec++;
            literalRECRESP_RIFLE.Visible = row.rec_rifleteam; if (!row.rec_rifleteam) rec++;
            literalRECRESP_ROCK.Visible = row.rec_rockclimbing; if (!row.rec_rockclimbing) rec++;
            literalRECRESP_RUG.Visible = row.rec_rugby; if (!row.rec_rugby) rec++;
            literalRECRESP_SAIL.Visible = row.rec_sailing; if (!row.rec_sailing) rec++;
            literalRECRESP_SKATE.Visible = row.rec_skateboarding; if (!row.rec_skateboarding) rec++;
            literalRECRESP_SKI.Visible = row.rec_skijumping; if (!row.rec_skijumping) rec++;
            literalRECRESP_SNOW.Visible = row.rec_snowboarding; if (!row.rec_snowboarding) rec++;
            literalRECRESP_SOCC.Visible = row.rec_soccer; if (!row.rec_soccer) rec++;
            literalRECRESP_SOFT.Visible = row.rec_softball; if (!row.rec_softball) rec++;
            literalRECRESP_SQUA.Visible = row.rec_squash; if (!row.rec_squash) rec++;
            literalRECRESP_SURF.Visible = row.rec_surfing; if (!row.rec_surfing) rec++;
            literalRECRESP_SWIM.Visible = row.rec_swimming; if (!row.rec_swimming) rec++;
            literalRECRESP_TABLE.Visible = row.rec_tabletennis; if (!row.rec_tabletennis) rec++;
            literalRECRESP_TENNI.Visible = row.rec_tennis; if (!row.rec_tennis) rec++;
            literalRECRESP_TRACK.Visible = row.rec_trackandfield; if (!row.rec_trackandfield) rec++;
            literalRECRESP_ULTI.Visible = row.rec_ultimatefrisbee; if (!row.rec_ultimatefrisbee) rec++;
            literalRECRESP_VOLL.Visible = row.rec_volleyball; if (!row.rec_volleyball) rec++;
            literalRECRESP_WATERP.Visible = row.rec_waterpolo; if (!row.rec_waterpolo) rec++;
            literalRECRESP_WEIG.Visible = row.rec_weightlifting; if (!row.rec_weightlifting) rec++;
            literalRECRESP_WRES.Visible = row.rec_wrestling; if (!row.rec_wrestling) rec++;
            if (rec == 63) { aahead3.Visible = true; }
        }

        void repeatAcademics_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_academicsRow row = schoollogic.getAcademicBySchoolID(schoolid)[0];

            Image imgacademics = (Image)e.Item.FindControl("imageAcademics");
            imgacademics.ImageUrl = "/binary-image.aspx?section=academics&schoolid=" + schoolid;
            bool display = this.DisplayImages("academics");
            if (display == false) {
                imgacademics.Style.Add("display", "none");
            }
            
            //Advanced/Enrichment Programs
            literalAV_5Day.Visible = row.adv_5day;
            literalAV_AP.Visible = row.adv_ap;
            literalAV_BCC.Visible = row.adv_bacca;
            literalAV_DL.Visible = row.adv_distance;
            literalAV_IN.Visible = row.adv_int;
            literalav_PGY.Visible = row.adv_postgrad;
            if (literalAV_5Day.Visible == false && literalAV_AP.Visible == false && literalAV_BCC.Visible == false && literalAV_DL.Visible == false && literalAV_IN.Visible == false && literalav_PGY.Visible ==false) 
            {
                achead0.Visible = true;
            }


            //Support Programs
            int sup = 0;
            literalSP_ADS.Visible = row.sp_add; if (!row.sp_add) sup++;
            literalSP_AS.Visible = row.sp_ast; if (!row.sp_ast) sup++;
            literalSP_CC.Visible = row.sp_college; if (!row.sp_college) sup++;
            literalSP_ESLB.Visible = row.sp_esla; if (!row.sp_esla) sup++;
            literalSP_ESLI.Visible = row.sp_eslb; if (!row.sp_eslb) sup++;
            literalSP_ESLA.Visible = row.sp_eslc; if (!row.sp_eslc) sup++;
            literalSP_ES.Visible = row.sp_eve; if (!row.sp_eve) sup++;
            literalSP_LC.Visible = row.sp_learningcenter; if (!row.sp_learningcenter) sup++;
            literalSP_LD.Visible = row.sp_learningdiff; if (!row.sp_learningdiff) sup++;
            literalSP_PT.Visible = row.sp_peer; if (!row.sp_peer) sup++;
            literalSP_SSA.Visible = row.sp_skills; if (!row.sp_skills) sup++;
            literalSP_ST.Visible = row.sp_subj; if (!row.sp_subj) sup++;
            literalSP_SPT.Visible = row.sp_supp; if (!row.sp_supp) sup++;
            literalSP_TC.Visible = row.sp_tech; if (!row.sp_tech) sup++;
            literalSP_WC.Visible = row.sp_write; if (!row.sp_write) sup++;
            if (sup == 15) {
                achead1.Visible = true;
            }


            //English
            int eng = 0;
            literalAPE_CLS.Visible = row.english_classic; if (!row.english_classic) eng++;
            literalAPE_CW.Visible = row.english_creative; if (!row.english_creative) eng++;
            literalAPE_HN.Visible = row.english_honors; if (!row.english_honors) eng++;
            literalAPE_LT.Visible = row.english_literature; if (!row.english_literature) eng++;
            literalAPE_PW.Visible = row.english_playwriting; if (!row.english_playwriting) eng++;
            literalAPE_PET.Visible = row.english_poetry; if (!row.english_poetry) eng++;
            if (eng == 6) {
                achead2.Visible = true;
            }


            //Foreing Languages
            int fore = 0;
            literalFR_CM.Visible = row.foreign_mandarin; if (!row.foreign_mandarin) fore++;
            literalFR_CC.Visible = row.foreign_cantonese; if (!row.foreign_cantonese) fore++;
            literalFR_FR.Visible = row.foreign_french; if (!row.foreign_french) fore++;
            literalFR_GM.Visible = row.foreign_german; if (!row.foreign_german) fore++;
            literalFR_IT.Visible = row.foreign_italian; if (!row.foreign_italian) fore++;
            literalFR_JP.Visible = row.foreign_japanese; if (!row.foreign_japanese) fore++;
            literalFR_RS.Visible = row.foreign_russian; if (!row.foreign_russian) fore++;
            literalFR_SP.Visible = row.foreign_spanish; if (!row.foreign_spanish) fore++;
            literalFR_GR.Visible = row.foreign_greek; if (!row.foreign_greek) fore++;
            literalFR_LT.Visible = row.foreign_latin; if (!row.foreign_latin) fore++;
            if (fore == 10) {
                achead4.Visible = true;
            }

            //History
            int his = 0;
            literalHST_AH.Visible = row.history_asian; if (!row.history_asian) his++;
            literalHST_CH.Visible = row.history_classical; if (!row.history_classical) his++;
            literalHST_EH.Visible = row.history_european; if (!row.history_european) his++;
            literalHST_HNS.Visible = row.history_honors; if (!row.history_honors) his++;
            literalHST_MH.Visible = row.history_medieval; if (!row.history_medieval) his++;
            literalHST_USH.Visible = row.history_us; if (!row.history_us) his++;
            literalHST_WH.Visible = row.history_world; if (!row.history_world) his++;
            if (his == 7) { achead3.Visible = true; }

            //Humanities/Social Sciences:
            int soc = 0;
            literalHSS_AT.Visible = row.social_anthropology; if (!row.social_anthropology) soc++;
            literalHSS_ECN.Visible = row.social_economics; if (!row.social_economics) soc++;
            literalHSS_PC.Visible = row.social_psychology; if (!row.social_psychology) soc++;
            literalHSS_SC.Visible = row.social_sociology; if (!row.social_sociology) soc++;
            if (soc == 4) { achead6.Visible = true; }

            //Religion/Philosophy
            int reg = 0;
            literalRP_TB.Visible = row.religion_bible; if (!row.religion_bible) reg++;
            literalRP_ET.Visible = row.religion_ethics; if (!row.religion_ethics) reg++;
            literalRP_FT.Visible = row.religion_faith; if (!row.religion_faith) reg++;
            literalRP_MP.Visible = row.religion_moral; if (!row.religion_moral) reg++;
            literalRP_MT.Visible = row.religion_mythology; if (!row.religion_mythology) reg++;
            literalRP_PS.Visible = row.religion_philosophy; if (!row.religion_philosophy) reg++;
            literalRP_RS.Visible = row.religion_religious; if (!row.religion_religious) reg++;
            literalRP_SJ.Visible = row.religion_social; if (!row.religion_social) reg++;
            literalRP_TE.Visible = row.religion_thology; if (!row.religion_thology) reg++;
            literalRP_WR.Visible = row.religion_world; if (!row.religion_world) reg++;
            if (reg == 10) { achead5.Visible = true; }

            //Sciences
            int sci = 0;
            literalSCI_ANT.Visible = row.science_anatomy; if (!row.science_anatomy) sci++;
            literalSCI_AB.Visible = row.science_animal; if (!row.science_animal) sci++;
            literalSCI_AST.Visible = row.science_astronomy; if (!row.science_astronomy) sci++;
            literalSCI_ASTP.Visible = row.science_astrophysics; if (!row.science_astrophysics) sci++;
            literalSCI_BIO.Visible = row.science_biology; if (!row.science_biology) sci++;
            literalSCI_BIOTEC.Visible = row.science_biotechnology; if (!row.science_biotechnology) sci++;
            literalSCI_BOT.Visible = row.science_botany; if (!row.science_botany) sci++;
            literalSCI_CHM.Visible = row.science_chemistry; if (!row.science_chemistry) sci++;
            literalSCI_ES.Visible = row.science_earth; if (!row.science_earth) sci++;
            literalSCI_EC.Visible = row.science_ecology; if (!row.science_ecology) sci++;
            literalSCI_ELT.Visible = row.science_electronics; if (!row.science_electronics) sci++;
            literalSCI_EVS.Visible = row.science_enviromental; if (!row.science_enviromental) sci++;
            literalSCI_EM.Visible = row.science_entomology; if (!row.science_entomology) sci++;
            literalSCI_GNT.Visible = row.science_genetics; if (!row.science_genetics) sci++;
            literalSCI_GOG.Visible = row.science_geology; if (!row.science_geology) sci++;
            literalSCI_HET.Visible = row.science_health; if (!row.science_health) sci++;
            literalSCI_MB.Visible = row.science_marine; if (!row.science_marine) sci++;
            literalSCI_MTR.Visible = row.science_meteorology; if (!row.science_meteorology) sci++;
            literalSCI_MBO.Visible = row.science_microbiology; if (!row.science_microbiology) sci++;
            literalSCI_OG.Visible = row.science_oceanography; if (!row.science_oceanography) sci++;
            literalSCI_ORTH.Visible = row.science_ornithology; if (!row.science_ornithology) sci++;
            literalSCI_PET.Visible = row.science_paleontology; if (!row.science_paleontology) sci++;
            literalSCI_PS.Visible = row.science_physical; if (!row.science_physical) sci++;
            literalSCI_PYS.Visible = row.science_physics; if (!row.science_physics) sci++;
            literalSCI_PSOG.Visible = row.science_physilogy; if (!row.science_physilogy) sci++;
            literalSCI_SM.Visible = row.science_sports; if (!row.science_sports) sci++;
            literalSCI_ZO.Visible = row.science_zoology; if (!row.science_zoology) sci++;
            if (sci == 27) { achead7.Visible = true; }

            //MATH
            int mat = 0;
            literalMT_ALGE.Visible = row.math_algebra; if (!row.math_algebra) mat++;
            literalMT_CAL.Visible = row.math_calculus; if (!row.math_calculus) mat++;
            literalMT_FUNC.Visible = row.math_functions; if (!row.math_functions) mat++;
            literalMT_GEO.Visible = row.math_geometry; if (!row.math_geometry) mat++;
            literalMT_HONOR.Visible = row.math_honors; if (!row.math_honors) mat++;
            literalMT_PROB.Visible = row.math_probability; if (!row.math_probability) mat++;
            literalMT_STAT.Visible = row.math_statistics; if (!row.math_statistics) mat++;
            literalMT_TRIG.Visible = row.math_trigonometry; if (!row.math_trigonometry) mat++;
            if (mat == 8) { achead8.Visible = true; }

            //Computer Studies
            int cs = 0;
            literalCOMS_CAPP.Visible = row.computer_applications; if (!row.computer_applications) cs++;
            literalCOMS_CPRO.Visible = row.computer_programming; if (!row.computer_programming) cs++;
            literalCOMS_CSC.Visible = row.computer_science; if (!row.computer_science) cs++;
            literalCOMS_MULT.Visible = row.computer_multimedia; if (!row.computer_multimedia) cs++;
            literalCOMS_WEBD.Visible = row.computer_web; if (!row.computer_web) cs++;
            if (cs == 5) { achead9.Visible = true; }

            //MUSIC
            int mus = 0;
            literalMUSIC_BAND.Visible = row.music_band; if (!row.music_band) mus++;
            literalMUSIC_CHORAL.Visible = row.music_choral; if (!row.music_choral) mus++;
            literalMUSIC_COMPO.Visible = row.music_composition; if (!row.music_composition) mus++;
            literalMUSIC_ELECT.Visible = row.music_electronic; if (!row.music_electronic) mus++;
            literalMUSIC_HISTOJZZ.Visible = row.music_jazzhistory; if (!row.music_jazzhistory) mus++;
            literalMUSIC_HISTOMUS.Visible = row.music_musichistory; if (!row.music_musichistory) mus++;
            literalMUSIC_INDIVI.Visible = row.music_individual; if (!row.music_individual) mus++;
            literalMUSIC_MUSICAPP.Visible = row.music_appreciation; if (!row.music_appreciation) mus++;
            literalMUSIC_MUSICHIS.Visible = row.music_history; if (!row.music_history) mus++;
            literalMUSIC_MUSICTHE.Visible = row.music_theory; if (!row.music_theory) mus++;
            literalMUSIC_OPERA.Visible = row.music_opera; if (!row.music_opera) mus++;
            literalMUSIC_ORCHE.Visible = row.music_orchestra; if (!row.music_orchestra) mus++;
            literalMUSIC_PRINCI.Visible = row.music_arranging; if (!row.music_arranging) mus++;
            literalMUSIC_RECORD.Visible = row.music_recording; if (!row.music_recording) mus++;
            literalMUSIC_SOLFE.Visible = row.music_solfege; if (!row.music_solfege) mus++;
            literalMUSIC_SONGWR.Visible = row.music_songwriting; if (!row.music_songwriting) mus++;
            literalMUSIC_VOICE.Visible = row.music_voice; if (!row.music_voice) mus++;
            if (mus == 17) { achead10.Visible = true; }

            //Performing/Visual Arts
            int va = 0;
            literalPEFVA_3D.Visible = row.visual_3d; if (!row.visual_3d) va++;
            literalPEFVA_ACT.Visible = row.visual_acting; if (!row.visual_acting) va++;
            literalPEFVA_ANIMA.Visible = row.visual_animation; if (!row.visual_animation) va++;
            literalPEFVA_ARCH.Visible = row.visual_architecture; if (!row.visual_architecture) va++;
            literalPEFVA_ART.Visible = row.visual_art; if (!row.visual_art) va++;
            literalPEFVA_ARTHI.Visible = row.visual_arthistory; if (!row.visual_arthistory) va++;
            literalPEFVA_BALL.Visible = row.visual_ballet; if (!row.visual_ballet) va++;
            literalPEFVA_CER.Visible = row.visual_ceramics; if (!row.visual_ceramics) va++;
            literalPEFVA_CHOR.Visible = row.visual_choreography; if (!row.visual_choreography) va++;
            literalPEFVA_DANCE.Visible = row.visual_dance; if (!row.visual_dance) va++;
            literalPEFVA_DEB.Visible = row.visual_debate; if (!row.visual_debate) va++;
            literalPEFVA_DESI.Visible = row.visual_design; if (!row.visual_design) va++;
            literalPEFVA_DIREC.Visible = row.visual_directing; if (!row.visual_directing) va++;
            literalPEFVA_DRA.Visible = row.visual_drama; if (!row.visual_drama) va++;
            literalPEFVA_DRAW.Visible = row.visual_drawing; if (!row.visual_drawing) va++;
            literalPEFVA_FASH.Visible = row.visual_fashion; if (!row.visual_fashion) va++;
            literalPEFVA_FIBER.Visible = row.visual_fiber; if (!row.visual_fiber) va++;
            literalPEFVA_FILM.Visible = row.visual_film; if (!row.visual_film) va++;
            literalPEFVA_GRAP.Visible = row.visual_graphic; if (!row.visual_graphic) va++;
            literalPEFVA_HISTO.Visible = row.visual_theaterhistory; if (!row.visual_theaterhistory) va++;
            literalPEFVA_JOUR.Visible = row.visual_journalism; if (!row.visual_journalism) va++;
            literalPEFVA_LIGHT.Visible = row.visual_lighting; if (!row.visual_lighting) va++;
            literalPEFVA_METAL.Visible = row.visual_metal; if (!row.visual_metal) va++;
            literalPEFVA_MODERN.Visible = row.visual_moderndance; if (!row.visual_moderndance) va++;
            literalPEFVA_PAINT.Visible = row.visual_painting; if (!row.visual_painting) va++;
            literalPEFVA_PHO.Visible = row.visual_photography; if (!row.visual_photography) va++;
            literalPEFVA_PORTF.Visible = row.visual_portfolio; if (!row.visual_portfolio) va++;
            literalPEFVA_POTT.Visible = row.visual_pottery; if (!row.visual_pottery) va++;
            literalPEFVA_PRINT.Visible = row.visual_printmaking; if (!row.visual_printmaking) va++;
            literalPEFVA_PROD.Visible = row.visual_production; if (!row.visual_production) va++;
            literalPEFVA_PUBLICC.Visible = row.visual_publications; if (!row.visual_publications) va++;
            literalPEFVA_PUBSP.Visible = row.visual_publicspeaking; if (!row.visual_publicspeaking) va++;
            literalPEFVA_SCPRI.Visible = row.visual_screenpriting; if (!row.visual_screenpriting) va++;
            literalPEFVA_SCUL.Visible = row.visual_sculpture; if (!row.visual_sculpture) va++;
            literalPEFVA_SCWR.Visible = row.visual_screenwriting; if (!row.visual_screenwriting) va++;
            literalPEFVA_SILK.Visible = row.visual_silkscreen; if (!row.visual_silkscreen) va++;
            literalPEFVA_STAG.Visible = row.visual_stagecraft; if (!row.visual_stagecraft) va++;
            literalPEFVA_STUDIO.Visible = row.visual_studioart; if (!row.visual_studioart) va++;
            literalPEFVA_TELE.Visible = row.visual_televisionproduction; if (!row.visual_televisionproduction) va++;
            literalPEFVA_TEX.Visible = row.visual_textiles; if (!row.visual_textiles) va++;
            literalPEFVA_THEAA.Visible = row.visual_theaterarts; if (!row.visual_theaterarts) va++;

            //theater design where
            literalPEFVA_WEAV.Visible = row.visual_weaving; if (!row.visual_weaving) va++;
            literalPEFVA_WOOD.Visible = row.visual_woodworking; if (!row.visual_woodworking) va++;
            if (va == 43) { achead11.Visible = true; }


            //Performing/Visual Arts
            int pa = 0;
            literalPEFVA_3D.Visible = row.visual_3d; if (!row.visual_3d) pa++;
            literalPEFVA_ACT.Visible = row.visual_acting; if (!row.visual_acting) pa++;
            literalPEFVA_ANIMA.Visible = row.visual_animation; if (!row.visual_animation) pa++;
            literalPEFVA_ARCH.Visible = row.visual_architecture; if (!row.visual_architecture) pa++;
            literalPEFVA_ART.Visible = row.visual_art; if (!row.visual_art) pa++;
            literalPEFVA_ARTHI.Visible = row.visual_arthistory; if (!row.visual_arthistory) pa++;
            literalPEFVA_BALL.Visible = row.visual_ballet; if (!row.visual_ballet) pa++;
            literalPEFVA_CER.Visible = row.visual_ceramics; if (!row.visual_ceramics) pa++;
            literalPEFVA_CHOR.Visible = row.visual_choreography; if (!row.visual_choreography) pa++;
            literalPEFVA_DANCE.Visible = row.visual_dance; if (!row.visual_dance) pa++;
            literalPEFVA_DEB.Visible = row.visual_debate; if (!row.visual_debate) pa++;
            literalPEFVA_DESI.Visible = row.visual_design; if (!row.visual_design) pa++;
            literalPEFVA_DIREC.Visible = row.visual_directing; if (!row.visual_directing) pa++;
            literalPEFVA_DRA.Visible = row.visual_drama; if (!row.visual_drama) pa++;
            literalPEFVA_DRAW.Visible = row.visual_drawing; if (!row.visual_drawing) pa++;
            literalPEFVA_FASH.Visible = row.visual_fashion; if (!row.visual_fashion) pa++;
            literalPEFVA_FIBER.Visible = row.visual_fiber; if (!row.visual_fiber) pa++;
            literalPEFVA_FILM.Visible = row.visual_film; if (!row.visual_film) pa++;
            literalPEFVA_GRAP.Visible = row.visual_graphic; if (!row.visual_graphic) pa++;
            literalPEFVA_HISTO.Visible = row.visual_theaterhistory; if (!row.visual_theaterhistory) pa++;
            literalPEFVA_JOUR.Visible = row.visual_journalism; if (!row.visual_journalism) pa++;
            literalPEFVA_LIGHT.Visible = row.visual_lighting; if (!row.visual_lighting) pa++;
            literalPEFVA_METAL.Visible = row.visual_metal; if (!row.visual_metal) pa++;
            literalPEFVA_MODERN.Visible = row.visual_moderndance; if (!row.visual_moderndance) pa++;
            literalPEFVA_PAINT.Visible = row.visual_painting; if (!row.visual_painting) pa++;
            literalPEFVA_PHO.Visible = row.visual_photography; if (!row.visual_photography) pa++;
            literalPEFVA_PORTF.Visible = row.visual_portfolio; if (!row.visual_portfolio) pa++;
            literalPEFVA_POTT.Visible = row.visual_pottery; if (!row.visual_pottery) pa++;
            literalPEFVA_PRINT.Visible = row.visual_printmaking; if (!row.visual_printmaking) pa++;
            literalPEFVA_PROD.Visible = row.visual_production; if (!row.visual_production) pa++;
            literalPEFVA_PUBLICC.Visible = row.visual_publications; if (!row.visual_publications) pa++;
            literalPEFVA_PUBSP.Visible = row.visual_publicspeaking; if (!row.visual_publicspeaking) pa++;
            literalPEFVA_SCPRI.Visible = row.visual_screenpriting; if (!row.visual_screenpriting) pa++;
            literalPEFVA_SCUL.Visible = row.visual_sculpture; if (!row.visual_sculpture) pa++;
            literalPEFVA_SCWR.Visible = row.visual_screenwriting; if (!row.visual_screenwriting) pa++;
            literalPEFVA_SILK.Visible = row.visual_silkscreen; if (!row.visual_silkscreen) pa++;
            literalPEFVA_STAG.Visible = row.visual_stagecraft; if (!row.visual_stagecraft) pa++;
            literalPEFVA_STUDIO.Visible = row.visual_studioart; if (!row.visual_studioart) pa++;
            literalPEFVA_TELE.Visible = row.visual_televisionproduction; if (!row.visual_televisionproduction) pa++;
            literalPEFVA_TEX.Visible = row.visual_textiles; if (!row.visual_textiles) pa++;
            literalPEFVA_THEAA.Visible = row.visual_theaterarts; if (!row.visual_theaterarts) pa++;
            //where is theater design ?
            literalPEFVA_WEAV.Visible = row.visual_weaving; if (!row.visual_weaving) pa++;
            if(pa == 42) { achead11.Visible = true; }


            //Special Programs
            int sp = 0;
            literalSPCPRO_COMM.Visible = row.special_community; if (!row.special_community) sp++;
            literalSPCPRO_EXCH.Visible = row.special_exchange; if (!row.special_exchange) sp++;
            literalSPCPRO_INDE.Visible = row.special_independent; if (!row.special_independent) sp++;
            literalSPCPRO_INTER.Visible = row.special_internship; if (!row.special_internship) sp++;
            literalSPCPRO_JROT.Visible = row.special_jrotc; if (!row.special_jrotc) sp++;
            literalSPCPRO_LEADER.Visible = row.special_leadership; if (!row.special_leadership) sp++;
            literalSPCPRO_LEARN.Visible = row.special_learningatsea; if (!row.special_learningatsea) sp++;
            literalSPCPRO_OUTDOOR.Visible = row.special_outdoor; if (!row.special_outdoor) sp++;
            literalSPCPRO_PERSON.Visible = row.special_finance; if (!row.special_finance) sp++;
            literalSPCPRO_RIFILE.Visible = row.special_rifle; if (!row.special_rifle) sp++;
            literalSPCPRO_SEME.Visible = row.special_semester; if (!row.special_semester) sp++;
            literalSPCPRO_STUD.Visible = row.special_abroad; if (!row.special_abroad) sp++;
            if (sp == 12) { achead12.Visible = true; }

            // Distinctive
            if (row.distinctive_other.Length > 0) {
                literDP1.Text = row.distinctive_other;
            } else { literDP1.Text = "N/A"; }

            //AP Courses Available:
            int ap = 0;
            literalAPCSAVA_ARH.Visible = row.ap_arthistory; if (!row.ap_arthistory) ap++;
            literalAPCSAVA_BIO.Visible = row.ap_biology; if (!row.ap_biology) ap++;
            literalAPCSAVA_CALAB.Visible = row.ap_calculusab; if (!row.ap_calculusab) ap++;
            literalAPCSAVA_CALBC.Visible = row.ap_calculuscd; if (!row.ap_calculuscd) ap++;
            literalAPCSAVA_CHEM.Visible = row.ap_chemistry; if (!row.ap_chemistry) ap++;
            literalAPCSAVA_COMA.Visible = row.ap_computera; if (!row.ap_computera) ap++;
            literalAPCSAVA_COMAB.Visible = row.ap_computerab; if (!row.ap_computerab) ap++;
            literalAPCSAVA_COMPAGP.Visible = row.ap_comparativegov; if (!row.ap_comparativegov) ap++;
            literalAPCSAVA_ELANG.Visible = row.ap_english; if (!row.ap_english) ap++;
            literalAPCSAVA_ELITER.Visible = row.ap_englishliterature; if (!row.ap_englishliterature) ap++;
            literalAPCSAVA_ENVS.Visible = row.ap_environmental; if (!row.ap_environmental) ap++;
            literalAPCSAVA_EUROH.Visible = row.ap_europeanhistory; if (!row.ap_europeanhistory) ap++;
            literalAPCSAVA_FRELIT.Visible = row.ap_frenchliterature; if (!row.ap_frenchliterature) ap++;
            literalAPCSAVA_FRLANG.Visible = row.ap_french; if (!row.ap_french) ap++;
            literalAPCSAVA_GERMLANG.Visible = row.ap_german; if (!row.ap_german) ap++;
            literalAPCSAVA_HUMAN.Visible = row.ap_humangeography; if (!row.ap_humangeography) ap++;
            literalAPCSAVA_LALITER.Visible = row.ap_latinliterature; if (!row.ap_latinliterature) ap++;
            literalAPCSAVA_LAVER.Visible = row.ap_latinvergil; if (!row.ap_latinvergil) ap++;
            literalAPCSAVA_MACRO.Visible = row.ap_macroeconomics; if (!row.ap_macroeconomics) ap++;
            literalAPCSAVA_MICRO.Visible = row.ap_microeconomics; if (!row.ap_microeconomics) ap++;
            literalAPCSAVA_MUT.Visible = row.ap_musictheory; if (!row.ap_musictheory) ap++;
            literalAPCSAVA_PHB.Visible = row.ap_physicsb; if (!row.ap_physicsb) ap++;
            literalAPCSAVA_PHC.Visible = row.ap_physicsc; if (!row.ap_physicsc) ap++;
            literalAPCSAVA_PSY.Visible = row.ap_psychology; if (!row.ap_psychology) ap++;
            literalAPCSAVA_SPLANG.Visible = row.ap_spanish; if (!row.ap_spanish) ap++;
            literalAPCSAVA_SPLITER.Visible = row.ap_spanishliterature; if (!row.ap_spanishliterature) ap++;
            literalAPCSAVA_STAT.Visible = row.ap_statistics; if (!row.ap_statistics) ap++;
            literalAPCSAVA_STUART.Visible = row.ap_studioart; if (!row.ap_studioart) ap++;
            literalAPCSAVA_USCO.Visible = row.ap_usgov; if (!row.ap_usgov) ap++;
            literalAPCSAVA_USHIST.Visible = row.ap_ushistory; if (!row.ap_ushistory) ap++;
            literalAPCSAVA_WORLD.Visible = row.ap_worldhistory; if (!row.ap_worldhistory) ap++;
            if (ap == 31) { achead14.Visible = true; }


        }

        void repeatCampusLife_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_campuslifesRow row = schoollogic.getCampusLifeBySchoolID(schoolid)[0];

            Image imgcampus = (Image)e.Item.FindControl("imageCampus");
            imgcampus.ImageUrl = "/binary-image.aspx?section=campus&schoolid=" + schoolid;
            bool display = this.DisplayImages("campus");
            if (display == false) {
                imgcampus.Style.Add("display", "none");
            }
            //dorm
            int dorm = 0;
            Literal item = (Literal)e.Item.FindControl("literalDorm_GameRoom");
            item.Visible = row.dorm_gameroom; if (!row.dorm_gameroom) dorm++;

            item = (Literal)e.Item.FindControl("literalDorm_Laundry");
            item.Visible = row.dorm_laundry; if (!row.dorm_laundry) dorm++;

            item = (Literal)e.Item.FindControl("literalDorm_Lounge");
            item.Visible = row.dorm_lounge; if (!row.dorm_lounge) dorm++;

            item = (Literal)e.Item.FindControl("literalDorm_WiFi");
            item.Visible = row.dorm_wifi; if (!row.dorm_wifi) dorm++;

            item = (Literal)e.Item.FindControl("literalDorm_Vending");
            item.Visible = row.dorm_vending; if (!row.dorm_vending) dorm++;
            if (dorm == 5) {
                item = (Literal)e.Item.FindControl("chead1");
                item.Visible = true;
            }

            //Facilites
            //where is ALL-weather track?
            int fac = 0;
            literalFAC_BASE.Visible = row.facility_baseball; if (!row.facility_baseball) fac++;
            literalFAC_BASKET.Visible = row.facility_basketball; if (!row.facility_basketball) fac++;
            literalFAC_FITEN.Visible = row.facility_fitness; if (!row.facility_fitness) fac++;
            literalFAC_TECH.Visible = row.facility_technology; if (!row.facility_technology) fac++;
            literalFAC_VOLL.Visible = row.facility_volleyball; if (!row.facility_volleyball) fac++;
            literalFAC_SAND.Visible = row.facility_sandvolleyball; if (!row.facility_sandvolleyball) fac++;
            literalFAC_FOOT.Visible = row.facility_football; if (!row.facility_football) fac++;
            literalFAC_INDOBK.Visible = row.facility_basketballindoor; if (!row.facility_basketballindoor) fac++;
            literalFAC_REC.Visible = row.facility_racquetball; if (!row.facility_racquetball) fac++;
            literalFAC_POOL.Visible = row.facility_pool; if (!row.facility_pool) fac++;
            literalFAC_INDOP.Visible = row.facility_poolindoor; if (!row.facility_poolindoor) fac++;
            literalFAC_INDOCW.Visible = row.facility_wall; if (!row.facility_wall) fac++;
            if (fac == 12) { chead2.Visible = true; }

            //Clubs and Organizations
            int co = 0;
            literalCLUBNOG_AMNINTER.Visible = row.club_amnesty; if (!row.club_amnesty) co++;
            literalCLUBNOG_ANIMAL.Visible = row.club_animal; if (!row.club_animal) co++;
            literalCLUBNOG_ARCHA.Visible = row.club_archaeology; if (!row.club_archaeology) co++;
            literalCLUBNOG_ASIAN.Visible = row.club_asian; if (!row.club_asian) co++;
            literalCLUBNOG_ASTRO.Visible = row.club_astronomy; if (!row.club_astronomy) co++;
            literalCLUBNOG_CHESS.Visible = row.club_chess; if (!row.club_chess) co++;
            literalCLUBNOG_CLASS.Visible = row.club_classics; if (!row.club_classics) co++;
            literalCLUBNOG_COMMUNI.Visible = row.club_community; if (!row.club_community) co++;
            literalCLUBNOG_COMPUTER.Visible = row.club_computer; if (!row.club_computer) co++;
            literalCLUBNOG_DEBATECL.Visible = row.club_debate; if (!row.club_debate) co++;
            literalCLUBNOG_DIVER.Visible = row.club_diversity; if (!row.club_diversity) co++;
            literalCLUBNOG_DORMPRO.Visible = row.club_dorm; if (!row.club_dorm) co++;
            literalCLUBNOG_DRAMA.Visible = row.club_drama; if (!row.club_drama) co++;

            literalCLUBNOG_EVRCL.Visible = row.club_environmental; if (!row.club_environmental) co++;
            literalCLUBNOG_FCA.Visible = row.club_fca; if (!row.club_fca) co++;
            literalCLUBNOG_FENCING.Visible = row.club_fencing; if (!row.club_fencing) co++;
            literalCLUBNOG_FOODCOUN.Visible = row.club_foodcouncil; if (!row.club_foodcouncil) co++;
            literalCLUBNOG_FORELC.Visible = row.club_foreignlanguage; if (!row.club_foreignlanguage) co++;
            literalCLUBNOG_FREE.Visible = row.club_freetibet; if (!row.club_freetibet) co++;
            literalCLUBNOG_FUTURE.Visible = row.club_futureleaders; if (!row.club_futureleaders) co++;
            literalCLUBNOG_GARD.Visible = row.club_gardening; if (!row.club_gardening) co++;
            literalCLUBNOG_HAFH.Visible = row.club_habitat; if (!row.club_habitat) co++;
            literalCLUBNOG_HONOR.Visible = row.club_honor; if (!row.club_honor) co++;
            literalCLUBNOG_HORRI.Visible = row.club_horseback; if (!row.club_horseback) co++;
            literalCLUBNOG_INTCL.Visible = row.club_international; if (!row.club_international) co++;
            literalCLUBNOG_INVECL.Visible = row.club_investment; if (!row.club_investment) co++;
            literalCLUBNOG_JSO.Visible = row.club_jewish; if (!row.club_jewish) co++;
            literalCLUBNOG_LITMGZ.Visible = row.club_literary; if (!row.club_literary) co++;
            literalCLUBNOG_MATHCB.Visible = row.club_math; if (!row.club_math) co++;
            literalCLUBNOG_MODELUN.Visible = row.club_modelun; if (!row.club_modelun) co++;
            literalCLUBNOG_NATIONAL.Visible = row.club_nhs; if (!row.club_nhs) co++;
            literalCLUBNOG_NEWSPP.Visible = row.club_newspaper; if (!row.club_newspaper) co++;
            literalCLUBNOG_OUTING.Visible = row.club_outing; if (!row.club_outing) co++;
            literalCLUBNOG_PEERCOS.Visible = row.club_peercounseling; if (!row.club_peercounseling) co++;
            literalCLUBNOG_PEERTUT.Visible = row.club_peertutoring; if (!row.club_peertutoring) co++;
            literalCLUBNOG_PEPCLUB.Visible = row.club_pepclub; if (!row.club_pepclub) co++;
            literalCLUBNOG_PHOTO.Visible = row.club_photography; if (!row.club_photography) co++;
            literalCLUBNOG_QUIZ.Visible = row.club_quizbowl; if (!row.club_quizbowl) co++;
            literalCLUBNOG_SADD.Visible = row.club_sadd; if (!row.club_sadd) co++;
            literalCLUBNOG_SAILING.Visible = row.club_sailing; if (!row.club_sailing) co++;
            literalCLUBNOG_SCIBOW.Visible = row.club_sciencebowl; if (!row.club_sciencebowl) co++;
            literalCLUBNOG_SCIFIC.Visible = row.club_sciencefiction; if (!row.club_sciencefiction) co++;
            literalCLUBNOG_SCOUT.Visible = row.club_scouting; if (!row.club_scouting) co++;
            literalCLUBNOG_SEXUALCB.Visible = row.club_sexualities; if (!row.club_sexualities) co++;
            literalCLUBNOG_SKATE.Visible = row.club_skateboarding; if (!row.club_skateboarding) co++;
            literalCLUBNOG_SNOW.Visible = row.club_snowboarding; if (!row.club_snowboarding) co++;
            literalCLUBNOG_SOLAR.Visible = row.club_solarcar; if (!row.club_solarcar) co++;
            literalCLUBNOG_STUACT.Visible = row.club_studentactivities; if (!row.club_studentactivities) co++;
            literalCLUBNOG_STUGOV.Visible = row.club_studentgov; if (!row.club_studentgov) co++;
            literalCLUBNOG_STUPUB.Visible = row.club_publications; if (!row.club_publications) co++;
            literalCLUBNOG_STURAS.Visible = row.club_radiostation; if (!row.club_radiostation) co++;
            literalCLUBNOG_SURFING.Visible = row.club_surfing; if (!row.club_surfing) co++;
            literalCLUBNOG_THEATER.Visible = row.club_theater; if (!row.club_theater) co++;
            literalCLUBNOG_TVST.Visible = row.club_tvstation; if (!row.club_tvstation) co++;
            literalCLUBNOG_WEIGHT.Visible = row.club_weighlifting; if (!row.club_weighlifting) co++;
            literalCLUBNOG_WOOD.Visible = row.club_woodworking; if (!row.club_woodworking) co++;
            literalCLUBNOG_YEARB.Visible = row.club_yearbook; if (!row.club_yearbook) co++;
            literalCLUBNOG_YOGA.Visible = row.club_yoga; if (!row.club_yoga) co++;
            literalCLUBNOG_YOUNGDE.Visible = row.club_youngdemocrats; if (!row.club_youngdemocrats) co++;
            if (co == 59) { chead3.Visible = true; }

        }

        void repeatGlance_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            int boysboard = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "boysboard"));
            int girlboard = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "girlsboard"));
            int boysday = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "boysday"));
            int girlsday = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "girlsday"));
            Image imgglance = (Image)e.Item.FindControl("imageGlance");
            imgglance.ImageUrl = "/binary-image.aspx?section=glance&schoolid=" + schoolid;
            bool display = this.DisplayImages("glance");
            if (display == false) {
                imgglance.Style.Add("display", "none");
            }

            TABS_UserControls.resources.code.DAL.PhotoDataset._tabs_photosDataTable ds = photologic.getPhotosBySchoolID(schoolid);
            if (ds.Rows.Count > 0) {
                if (ds[0].IslogoNull() == true) imgglance.Visible = false;
            }

            Literal boystotal = (Literal)e.Item.FindControl("literalBoysTotal");
            boystotal.Text = Convert.ToString(boysboard + boysday);

            Literal girlstotal = (Literal)e.Item.FindControl("literalGirlsTotal");
            girlstotal.Text = Convert.ToString(girlboard + girlsday);

            Literal boardtotal = (Literal)e.Item.FindControl("literalBoard");
            boardtotal.Text = Convert.ToString(boysboard + girlboard);

            Literal daytotal = (Literal)e.Item.FindControl("literalDay");
            daytotal.Text = Convert.ToString(boysday + girlsday);

            Literal total = (Literal)e.Item.FindControl("literalTotal");
            total.Text = Convert.ToString(boysboard + boysday + girlboard + girlsday);

            Literal tabsapp = (Literal)e.Item.FindControl("literalTABSApplication");
            if (Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "tabapplication")) == 1) tabsapp.Text = "Yes";

            Literal paymentplans = (Literal)e.Item.FindControl("literalPaymentPlans");
            if (Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "paymentplan"))) paymentplans.Text = "Offered";

            Literal needaid = (Literal)e.Item.FindControl("literalNeedAid");
            if (Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "needaid"))) needaid.Text = "Offered";

            Literal merit = (Literal)e.Item.FindControl("literalMerit");
            if (Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "merit"))) merit.Text = "Offered";

            Panel pan = (Panel)e.Item.FindControl("schoolfinancediv");
            if (Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "showfinance")) == true) {
                pan.Visible = true;
            } else { pan.Visible = false; }
        }

        protected void repeatCollegeInfo_ItemDataBound(object sender, RepeaterItemEventArgs e) 
        {
            Image imgcollege = (Image)e.Item.FindControl("imageCollege");
            imgcollege.ImageUrl = "/binary-image.aspx?section=collegeinfo&schoolid=" + schoolid;
            bool display = this.DisplayImages("collegeinfo");
            if (display == false) {
                imgcollege.Style.Add("display", "none");
            }

            Repeater childrep = (Repeater)e.Item.FindControl("quoteRep");
            DataTable qDT = schoollogic.getSchoolAlumniQuotes(schoolid);
            if (qDT.Rows.Count > 0) {
                childrep.DataSource = qDT;
                childrep.DataBind();
            } else {
                Label lbl = (Label)e.Item.FindControl("cchead1");
                lbl.Visible = true;
            }
        }

        protected bool DisplayImages(string imgType) 
        {
            bool retVal = true;
            switch (imgType) {
                case "glance":
                    if (DBNull.Value.Equals(schoollogic.getGlanceBySchoolID(schoolid)[0].image) == true || schoollogic.getGlanceBySchoolID(schoolid)[0].image == null) {
                        retVal = false;
                    }
                    break;
                case "academics":
                    if (DBNull.Value.Equals(schoollogic.getAcademicBySchoolID(schoolid)[0].image) == true || schoollogic.getAcademicBySchoolID(schoolid)[0].image == null) {
                        retVal = false;
                    }
                    break;
                case "campus":
                    if (DBNull.Value.Equals(schoollogic.getCampusLifeBySchoolID(schoolid)[0].image) == true || schoollogic.getCampusLifeBySchoolID(schoolid)[0].image == null) {
                        retVal = false;
                    }
                    break;
                case "arts":
                    if (DBNull.Value.Equals(schoollogic.getArtsBySchoolID(schoolid)[0].image) == true || schoollogic.getArtsBySchoolID(schoolid)[0].image == null) {
                        retVal = false;
                    }
                    break;
                case "collegeinfo":
                    if (DBNull.Value.Equals(schoollogic.getCollegeInfoBySchoolID(schoolid)[0].image) == true || schoollogic.getCollegeInfoBySchoolID(schoolid)[0].image == null) {
                        retVal = false;
                    }
                    break;
                case "summer":
                    if (schoollogic.getSummerProgramBySchoolID(schoolid)[0].image == null) {
                        retVal = false;
                    }
                    break;
                default:
                    break;
            }

            return retVal;
        }

        protected void CheckTabs() 
        {
            if (repeatGlance.Items.Count == 0) {
                glaceTab.Style.Add("display", "none");
            }
            if (repeatCampusLife.Items.Count == 0) {
                campusTab.Style.Add("display", "none");
            }
            if (repeatAcademics.Items.Count == 0) {
                academicTab.Style.Add("display", "none");
            }
            if (repeatArts.Items.Count == 0) {
                artTab.Style.Add("display", "none");
            }
            if (repeatSummerPrograms.Items.Count == 0) {
                summerTab.Style.Add("display", "none");
            }
        }

        public string DBToMoney(string val) 
        {
            if (val.Contains("N/A") || val.Contains("NA")) {
                return val;
            }
            if (val.Contains("$")) {
                val = val.Replace("$", "");
            }

            try {
                Decimal dec = Convert.ToDecimal(val);
                string retVal = dec.ToString();
                if (!retVal.Contains("$")) {
                    return "$" + retVal;
                } else { return retVal; }
            } catch {
                return val;
            }
        }

        public string DBToDate(string val) 
        {
            DateTime dt = Convert.ToDateTime(val);
            return dt.ToShortDateString();
        }

        public string DBToPercentage(string val) 
        {
            if (val.Contains("%")) {
                val = val.Replace("%", "");
            }

            return String.Format("{0:0%}", val);
            
        }

        public string DetermineStatus(string val) {
            if (val.Equals("0")) {
                return "Not Offered";
            } else {
                return "Offered";
            }
        }

        public string DeterminePaymentStatus(string val) {
            if (val.Equals("0")) {
                return "Not Available";
            } else {
                return "Available";
            }
        }

        public string DetermineYesorNo(string val) {
            if (val.Equals("0")) { return "No"; } else { return "Yes"; }
        }

        public string ConvertToDollar(string val) {
            if (val != "N/A") {
                return "$" + String.Format("{0:c}", Decimal.Parse(val, NumberStyles.Currency).ToString()) + "/yr";
            } else { return val; }
        }

        public string GetAlumni() {

            DataTable dt = schoollogic.getCollegeAlumniInfo(schoolid);
            retVal = "N/A";

            if (dt.Rows.Count > 0) {
                TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_collegealumniRow row = (TABS_UserControls.resources.code.DAL.SchoolDataset._tabs_collegealumniRow)dt.Rows[0];

                if (row.alumniname1.Length > 0) {
                    alumniVal += row.alumniname1 + " " + row.classyear1.ToString() + " " + row.notes1 + "<br/>";
                    alumniVal += row.alumniname2 + " " + row.classyear2.ToString() + " " + row.notes2 + "<br/>";
                    alumniVal += row.alumniname3 + " " + row.classyear3.ToString() + " " + row.notes3 + "<br/>";
                    alumniVal += row.alumniname4 + " " + row.classyear4.ToString() + " " + row.notes4 + "<br/>";
                    alumniVal += row.alumniname5 + " " + row.classyear5.ToString() + " " + row.notes5 + "<br/>";
                    alumniVal += row.alumniname6 + " " + row.classyear6.ToString() + " " + row.notes6 + "<br/>";
                    alumniVal += row.alumniname7 + " " + row.classyear7.ToString() + " " + row.notes7 + "<br/>";
                    alumniVal += row.alumniname8 + " " + row.classyear8.ToString() + " " + row.notes8 + "<br/>";
                    alumniVal += row.alumniname9 + " " + row.classyear9.ToString() + " " + row.notes9 + "<br/>";
                    alumniVal += row.alumniname10 + " " + row.classyear10.ToString() + " " + row.notes10 + "<br/>";

                    retVal = "<p>Distinguished Alumni</p>";
                    retVal += alumniVal;
                } else {
                }
            
            }

               return retVal;
       }

        public string CheckEmptyString(string val) {
            if (string.IsNullOrEmpty(val.Replace(" ",""))) { return "N/A"; } else { return val; }
        }

        public string CheckEmptyString(string val1, string val2) {
            if (string.IsNullOrEmpty(val1) || string.IsNullOrEmpty(val2)) { return "N/A"; } else { return val1 + " " + val2; }
        }

        public string ShowSAT(string value)
        {
            if (String.IsNullOrEmpty(value))
            {
                return "NA";
            }
            else
            {
                return value;
            }
        }

        //public string CalculatePercentage(string val, int repId) {
        //    string retVal = String.Empty;
        //    Decimal percent = 0;
        //    String strplaces = new String('0', 0);
        //    switch (repId) {
        //        case 1:
        //            percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount1)) * 100;
        //            retVal = percent.ToString("#" + strplaces);
        //            break;
        //        case 2:
        //            percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount2)) * 100;
        //            retVal = percent.ToString("#" + strplaces);
        //            break;
        //        case 3:
        //            percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount3)) * 100;
        //            retVal = percent.ToString("#" + strplaces);
        //            break;
        //        case 4:
        //            percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount4)) * 100;
        //            retVal = percent.ToString("#" + strplaces);
        //            break;
        //        case 5:
        //            percent = Decimal.Divide(Convert.ToDecimal(val), Convert.ToDecimal(totalcount5)) * 100;
        //            retVal = percent.ToString("#" + strplaces);
        //            break;
        //        default:
        //            break;
        //    }

        //    return retVal + "%";
        //}

    }
}