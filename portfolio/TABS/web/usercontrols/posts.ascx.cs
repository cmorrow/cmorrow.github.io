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

namespace TABS_UserControls.usercontrols
{
    public partial class posts : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.ForumClass forumlogic = new TABS_UserControls.resources.code.BAL.ForumClass();
        private int userid;
        private int topicid;

        protected void Page_Init(object sender, EventArgs e)
        {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            try { topicid = Convert.ToInt16(Request.QueryString["topicid"]); } catch { topicid = 0; }

            //userid = 1;
            //topicid = 25;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Visible = false;
            
            // manage view
            if (userid > 0) { multiNewTopic.ActiveViewIndex = 1; }

            buttonAddPost.Click += new EventHandler(buttonAddPost_Click);
            if (!Page.IsPostBack)
            {
                DataTable postTbl = forumlogic.getPostsByTopicID(topicid);
                if (postTbl.Rows.Count > 0) {
                    repeatPosts.DataSource = postTbl;
                    repeatPosts.DataBind();
                    lblMsgCount.Text = repeatPosts.Rows.Count.ToString();
                    lblTopic.Text = forumlogic.getTopicByTopicID(topicid)[0].topic.ToString();
                    DataTable dt = forumlogic.getLastPostByTopicId(topicid);
                    lblLatestPost.Text = dt.Rows[0]["createdate"].ToString() + " by " + dt.Rows[0]["firstname"].ToString().Substring(0, 1) + "." + dt.Rows[0]["lastname"].ToString() + ", " + dt.Rows[0]["state"].ToString();
                } 
                else 
                {
                    lblMsgCount.Text = "0";
                    lblTopic.Text = forumlogic.getTopicByTopicID(topicid)[0].topic.ToString();
                    lblLatestPost.Text = "N/A";
                }

            }
        }

        void buttonAddPost_Click(object sender, EventArgs e)
        {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            try { topicid = Convert.ToInt16(Request.QueryString["topicid"]); } catch { topicid = 0; }
            
            if (userid > 0 && topicid > 0)
            {
                // add new topic - activities recorded from back-end
                if (textPost.Text.Trim().Length > 0 && textPostBody.Text.Trim().Length > 0)
                {
                    forumlogic.addPost(textPost.Text.Trim(), textPostBody.Text.Trim(), userid, topicid);
                    textPost.Text = "";
                    textPostBody.Text = "";
                    lblMessage.Text = "Your post has been submitted for approval.<br/><br/>";
                }
                else
                {
                    lblMessage.Text = "* Please enter content for the subject and body of your post.<br/><br/>";
                }
            }
            else
            {
                lblMessage.Text = "* Sorry, an error occurred, please try again.<br/><br/>";
            }

            // reload
            DataTable postTbl = forumlogic.getPostsByTopicID(topicid);
            if (postTbl.Rows.Count > 0)
            {
                repeatPosts.DataSource = postTbl;
                repeatPosts.DataBind();
                lblMsgCount.Text = repeatPosts.Rows.Count.ToString();
                lblTopic.Text = forumlogic.getTopicByTopicID(topicid)[0].topic.ToString();
                DataTable dt = forumlogic.getLastPostByTopicId(topicid);
                lblLatestPost.Text = dt.Rows[0]["createdate"].ToString() + " by " + dt.Rows[0]["firstname"].ToString().Substring(0, 1) + "." + dt.Rows[0]["lastname"].ToString() + ", " + dt.Rows[0]["state"].ToString();
            }

            lblMessage.Visible = true;
        }

        protected void repeatPosts_RowDataBound(object sender, GridViewRowEventArgs e) 
        {
            TABS_UserControls.resources.code.DAL.ForumDataset._tabs_userprofilesDataTable ds = forumlogic.getUserProfileByUserID(userid);
            if (e.Row.RowType == DataControlRowType.DataRow) {
                e.Row.Cells[2].Text = ds[0].firstname.Substring(0, 1) + ". " + ds[0].lastname + ", " + ds[0].stateshort;
            }

        }
    }
}