using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TABS_UserControls.resources.code.BAL;
using Obout.Grid;
using System.Data;

namespace TABS_UserControls.usercontrols {
    public partial class schooljobs : System.Web.UI.UserControl 
    {
        int userid, schoolid;
        private UserClass userlogic = new UserClass();
        private JobClass joblogic = new JobClass();

        protected void Page_Init(object sender, EventArgs e) {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            try { schoolid = userlogic.getUserByUserID(userid)[0].schoolid; } catch { schoolid = 0; }

            // debug only
            //schoolid = 870;
        }

        protected void Page_Load(object sender, EventArgs e) 
        {
            jobGrid.DataSource = joblogic.getJobsBySchoolId(schoolid);
            jobGrid.DataBind();
        }

        protected void jobGrid_RowDataBound(object sender, Obout.Grid.GridRowEventArgs e) 
        {
            if (e.Row.RowType == Obout.Grid.GridRowType.DataRow) 
            {
                int jobId = Convert.ToInt16(e.Row.Cells[4].Text);
                GridDataControlFieldCell cell = e.Row.Cells[0] as GridDataControlFieldCell;
                Label lbl = cell.FindControl("lblJobType") as Label;
                List<string> types = new List<string>();
                string val = "";
                DataTable typeTable = joblogic.getJobTypesByJobId(jobId);
                foreach (DataRow row in typeTable.Rows) 
                {
                    types.Add(row["jobtype"].ToString());
                }

                if (types.Count > 1) {
                    for (int i = 0; i < types.Count; i++) {
                        if (i != types.Count) {
                            val += types[i].ToString() + ",";
                        } else { val = types[i].ToString(); }
                    }
                }

                lbl.Text = val;
            }
        }

        public void DeleteRecord(object sender, GridRecordEventArgs e) 
        {
            int jobid = Convert.ToInt16(e.Record["JobId"].ToString());
            DataTable jobApp = joblogic.getJobAppliesByJobId(jobid);
            if (jobApp.Rows.Count > 0) {
                int applyid = Convert.ToInt32(jobApp.Rows[0]["JobsToJobApplyMethodId"].ToString());
                joblogic.deleteJobRelationships(jobid, applyid);
            } else {
                joblogic.deleteJobRelationships(jobid, 0);
            }

            joblogic.deleteJobByJobId(Convert.ToInt16(e.Record["JobId"].ToString()));
            joblogic.deleteJobTypesByJobId(Convert.ToInt16(e.Record["JobId"].ToString()));
        }

       
    }
}