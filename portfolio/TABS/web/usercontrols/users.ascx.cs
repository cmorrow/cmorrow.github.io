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
using Obout.Grid;
using System.Text;

namespace TABS_UserControls.usercontrols {
    public partial class users : System.Web.UI.UserControl {
        UserClass userlogic = new UserClass();
        ProfileClass profilelogic = new ProfileClass();
        int userid, postuser;
        string action;

        protected void Page_Init(object sender, EventArgs e) {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            //userid = 1;
        }

        protected void Page_Load(object sender, EventArgs e) {


            try { postuser = Convert.ToInt32(Request.QueryString["u"]); } catch { postuser = 0; }
            try { action = Request.QueryString["action"]; } catch { action = ""; }

            if (action == "pass") {
                this.SendPassword(postuser);
            } else if (action == "inactive") {
                userlogic.updateUserStatus(false, postuser);
            } else if (action == "active") {
                userlogic.updateUserStatus(true, postuser);
            }


            if (!Page.IsPostBack) {
                gridUsers.DataSource = userlogic.getUsersBySchoolId(userid);
                gridUsers.DataBind();

                DataTable dt = userlogic.getSchoolByUserId(userid);
                lblSchoolName.Text = dt.Rows[0]["schoolname"].ToString();

                List<SchoolPositions> positions = new List<SchoolPositions>();
                DataTable pt = new DataTable();

                for (int i = 0; i < 22; i++) {
                    pt = userlogic.getSchoolPrimaryPosition(Convert.ToInt32(dt.Rows[0]["schoolid"]), i);
                    if (pt.Rows.Count > 0) {
                        positions.Add(new SchoolPositions(pt.Rows[0]["firstname"].ToString() + " " + pt.Rows[0]["lastname"].ToString(), pt.Rows[0]["position"].ToString()));
                    } else {
                        string val = "";
                        switch (i) {
                            case 1:
                                val = "Head of School";
                                positions.Add(new SchoolPositions("N/A", val));
                                break;
                            case 2:
                                val = "Head's Assitance/Secretary";
                                positions.Add(new SchoolPositions("N/A", val));
                                break;
                            case 3:
                                val = "Associate/Assistant Head of School";
                                positions.Add(new SchoolPositions("N/A", val));
                                break;
                            case 4:
                                val = "Director of Admission";
                                positions.Add(new SchoolPositions("N/A", val));
                                break;
                            case 5:
                                val = "Dean of Students";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 6:
                                val = "Director of Residential Life";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 7:
                                val = "Dean of Faculty";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 8:
                                val = "Dean of Studies/Academics";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 9:
                                val = "Directory of Advancement/Development";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 10:
                                val = "Director of Alumni/Constituency Affairs";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 11:
                                val = "Director of Communications/PR/Marketing";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 12:
                                val = "Bursar/Business Officer";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 13:
                                val = "Director of Financial Aid";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 14:
                                val = "Director of Technology/IT";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 15:
                                val = "Director of Diversity/Multiculturalism";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 16:
                                val = "Director of Counseling";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 17:
                                val = "Director of Health Services";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 18:
                                val = "Chaplain/Director of Religious or Spiritual Life";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 19:
                                val = "Director of Student Activities";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 20:
                                val = "Director of College Advising";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 21:
                                val = "Director of Athletics";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            case 22:
                                val = "Director of Summer and/or Auxiliary Programs";
                                positions.Add(new SchoolPositions("N/A", val));

                                break;
                            default:
                                break;
                        }
                    }
                }

                repeatPosition.DataSource = positions;
                repeatPosition.DataBind();
            }
        }

        private void SendPassword(int uid) {
            StringBuilder sb = new StringBuilder();
            string user = userlogic.getUserByUserID(uid)[0].username.ToString();
            sb.AppendLine("Dear " + user + ",");
            sb.AppendLine("Don’t worry—everybody forgets a password sooner or later! Please find yours below.");
            sb.AppendLine("");
            sb.AppendLine("PASSWORD: " + userlogic.getUserByUsername(user)[0].password);
            DataTable dt = profilelogic.getAdminBySchoolID(Convert.ToInt32(userlogic.getUserByUsername(user)[0].schoolid));
            string admin = dt.Rows[0]["firstname"].ToString() + " " + dt.Rows[0]["lastname"].ToString();
            sb.AppendLine("");
            sb.AppendLine("Make sure to keep your profile up to date and contact " + admin + ", your school administrator, to update any information that you are unable to change. ");
            sb.AppendLine("If you ever have questions or need help, just send us an email or give us a call (828-258-5354).");
            sb.AppendLine("We hope to see you soon at TABS.org, or at one of our on-site events.");
            sb.AppendLine("Have a great week!");
            sb.AppendLine("Thank you,");
            sb.AppendLine("The TABS Staff");
            InfrastructureClass infra = new InfrastructureClass();
            List<string> to = new List<string>();
            to.Add(user);
            List<string> cc = new List<string>();
            List<string> bc = new List<string>();
            infra.SendEmail("tabs@tabs.org", to, cc, bc, "TABS Password", sb.ToString(), false);

        }

        protected void gridUsers_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e) 
        {
            if (e.Row.RowType == Obout.Grid.GridRowType.DataRow) 
            {
                GridDataControlFieldCell cell = e.Row.Cells[5] as GridDataControlFieldCell;
                Label lbl = cell.FindControl("isactive") as Label;
                HyperLink inactiveLnk = cell.FindControl("lbInactive") as HyperLink;
                HyperLink activeLnk = cell.FindControl("lbActive") as HyperLink;
                if (lbl.Text == "True") {
                    activeLnk.Visible = false;
                    inactiveLnk.Visible = true;
                } 
                else 
                {
                    activeLnk.Visible = true;
                    inactiveLnk.Visible = false;
                }
            }
        }

        protected void gridUsers_DeleteCommand(object sender, GridRecordEventArgs e) {
            
        }

    }

    public class SchoolPositions {
        public string PositionName { get; set; }
        public string Person { get; set; }

        public SchoolPositions(string person, string position) {
            PositionName = position;
            Person = person;
        }
    }
}