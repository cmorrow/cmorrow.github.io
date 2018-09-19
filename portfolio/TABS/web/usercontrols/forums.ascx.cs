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

namespace TABS_UserControls.usercontrols {
    public partial class forums : System.Web.UI.UserControl {
        private TABS_UserControls.resources.code.BAL.ForumClass forumlogic = new TABS_UserControls.resources.code.BAL.ForumClass();
        private int userid;
       // private bool hideHead;

        protected void Page_Init(object sender, EventArgs e) {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
        }
        protected void Page_Load(object sender, EventArgs e) {
            // server-side binding
            repeatRecentPost.ItemDataBound += new RepeaterItemEventHandler(repeatRecentPost_ItemDataBound);
            repeatForumAdmins.ItemDataBound += new RepeaterItemEventHandler(repeatForumAdmins_ItemDataBound);
            repeatForumSchools.ItemDataBound += new RepeaterItemEventHandler(repeatForumSchools_ItemDataBound);
            repeatForumRegions.ItemDataBound += new RepeaterItemEventHandler(repeatForumRegions_ItemDataBound);
            if (!Page.IsPostBack) {
                repeatRecentPost.DataSource = forumlogic.getTop2PostsByUserID(userid);
                repeatRecentPost.DataBind();

                repeatForumAdmins.DataSource = forumlogic.getForumsByForumTypeID(1);
                repeatForumAdmins.DataBind();

                repeatForumSchools.DataSource = forumlogic.getForumsByForumTypeID(2);
                repeatForumSchools.DataBind();

                repeatForumRegions.DataSource = forumlogic.getForumsByForumTypeID(3);
                repeatForumRegions.DataBind();

                TABS_UserControls.resources.code.DAL.ForumDataset._tabs_userprofilesRow row = forumlogic.getUserProfileByUserID(Convert.ToInt32(Session["userid"]))[0];
                lblUserName.Text = "Hello " + row.firstname + " " + row.lastname;
                lblCurrentDate.Text = DateTime.Today.ToShortDateString();

                if (row.departmentid == 10) // Office Head
                {
                    //hideHead = false;
                    repeatForumAdmins.Items[0].Visible = true;
                } else {
                    repeatForumAdmins.Items[0].Visible = false;
                }
            }
        }

        void repeatRecentPost_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            Literal posttime = (Literal)e.Item.FindControl("literalPostTime");
            posttime.Text = (Convert.ToDateTime(DataBinder.Eval(e.Item.DataItem, "createdate"))).ToString();

            Literal topic = (Literal)e.Item.FindControl("literalTopic");
            topic.Text = forumlogic.getTopicByTopicID(Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "topicid")))[0].topic;
        }

        void repeatForumRegions_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            // declaration
            int forumid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "forumid"));
            string val = "";

            Literal topiccount = (Literal)e.Item.FindControl("literalTopicCount");
            Literal postcount = (Literal)e.Item.FindControl("literalPostCount");
            Literal userinfo = (Literal)e.Item.FindControl("literalUser");

            // show only if sub topic exists
            TABS_UserControls.resources.code.DAL.ForumDataset._tabs_topicsDataTable ds = forumlogic.getTop4TopicsByForumID(forumid);
            if (ds.Rows.Count > 0) {
                // show topic count
                topiccount.Text = forumlogic.getTopicsByForumID(forumid).Rows.Count.ToString();

                // show post count
                postcount.Text = forumlogic.getPostsByForumID(forumid).Rows.Count.ToString();

                // show recent post
                TABS_UserControls.resources.code.DAL.ForumDataset._tabs_topicsDataTable topicds = forumlogic.getTopicsByForumID(forumid);
                if (topicds.Rows.Count > 0) {
                    TABS_UserControls.resources.code.DAL.ForumDataset._tabs_userprofilesRow row = forumlogic.getUserProfileByUserID(topicds[0].userid)[0];

                    // topic user
                    val = "<h5>" + topicds[0].topic + "</h5>";
                    val += "<p>by " + row.firstname.Substring(0, 1) + ". " + row.lastname + ", " + row.stateshort + "</p>";
                    //val += "<p>by <a href='user.aspx?userid=" + row.userid.ToString() + "'>" + row.firstname.Substring(0, 1) + ". " + row.lastname + ", " + row.stateshort + "</a></p>";
                    val += "<p>" + topicds[0].createdate.ToString() + "</p>";

                    // topic count
                    topiccount.Text = topicds.Rows.Count.ToString();
                    userinfo.Text = val;
                }

            }
        }

        void repeatForumSchools_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            // declaration
            int forumid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "forumid"));
            string val = "";

            Literal topiccount = (Literal)e.Item.FindControl("literalTopicCount");
            Literal postcount = (Literal)e.Item.FindControl("literalPostCount");
            Literal userinfo = (Literal)e.Item.FindControl("literalUser");

            // show only if sub topic exists
            TABS_UserControls.resources.code.DAL.ForumDataset._tabs_topicsDataTable ds = forumlogic.getTop4TopicsByForumID(forumid);
            if (ds.Rows.Count > 0) {
                // show topic count
                topiccount.Text = forumlogic.getTopicsByForumID(forumid).Rows.Count.ToString();

                // show post count
                postcount.Text = forumlogic.getPostsByForumID(forumid).Rows.Count.ToString();

                // show recent post
                TABS_UserControls.resources.code.DAL.ForumDataset._tabs_topicsDataTable topicds = forumlogic.getTopicsByForumID(forumid);
                if (topicds.Rows.Count > 0) {
                    TABS_UserControls.resources.code.DAL.ForumDataset._tabs_userprofilesRow row = forumlogic.getUserProfileByUserID(topicds[0].userid)[0];

                    // topic user
                    val = "<h5>" + topicds[0].topic + "</h5>";
                    val += "<p>by " + row.firstname.Substring(0, 1) + ". " + row.lastname + ", " + row.stateshort + "</p>";
                    //val += "<p>by <a href='user.aspx?userid=" + row.userid.ToString() + "'>" + row.firstname.Substring(0, 1) + ". " + row.lastname + ", " + row.stateshort + "</a></p>";
                    val += "<p>" + topicds[0].createdate.ToString() + "</p>";

                    // topic count
                    topiccount.Text = topicds.Rows.Count.ToString();
                    userinfo.Text = val;
                }
            }
        }

        void repeatForumAdmins_ItemDataBound(object sender, RepeaterItemEventArgs e) {
            // declaration
            int forumid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "forumid"));
            string val = "";

            HtmlControl p = (HtmlControl)e.Item.FindControl("subforum");
            Literal topiccount = (Literal)e.Item.FindControl("literalTopicCount");
            Literal postcount = (Literal)e.Item.FindControl("literalPostCount");
            Literal userinfo = (Literal)e.Item.FindControl("literalUser");

            DataTable subForum = forumlogic.getSubForumsByForumID(forumid);

            // show only if sub topic exists
            TABS_UserControls.resources.code.DAL.ForumDataset._tabs_topicsDataTable ds = forumlogic.getTop4TopicsByForumID(forumid);

            if (ds.Rows.Count > 0) {
                // show topic count
                topiccount.Text = forumlogic.getTopicsByForumID(forumid).Rows.Count.ToString();

                // show post count
                postcount.Text = forumlogic.getPostsByForumID(forumid).Rows.Count.ToString();

                // show sub from topic list
                if (Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "showtopic")) == true) {
                    // form links
                    Literal link = (Literal)e.Item.FindControl("subforumlinks");
                    int i = 1;
                    foreach (DataRow row in subForum.Rows) 
                    {
                        if (i != subForum.Rows.Count) {
                            val += "<a href='topics.aspx?forumid=" + row["forumid"].ToString() + "'>" + row["forum"].ToString() + "</a>, ";
                            i++;
                        } else {
                            val += "<a href='topics.aspx?forumid=" + row["forumid"].ToString() + "'>" + row["forum"].ToString() + "</a>";
                        }

                    }

                    // finally show
                    link.Text = val;
                    p.Visible = true;
                }

                // show recent post
                TABS_UserControls.resources.code.DAL.ForumDataset._tabs_topicsDataTable topicds = forumlogic.getTopicsByForumID(forumid);
                if (topicds.Rows.Count > 0) {
                    TABS_UserControls.resources.code.DAL.ForumDataset._tabs_userprofilesRow row = forumlogic.getUserProfileByUserID(topicds[0].userid)[0];

                    // topic user
                    val = "<h5>" + topicds[0].topic + "</h5>";
                    val += "<p>by " + row.firstname.Substring(0, 1) + ". " + row.lastname + ", " + row.stateshort + "</p>";
                    //val += "<p>by <a href='user.aspx?userid=" + row.userid.ToString() + "'>" + row.firstname.Substring(0, 1) + ". " + row.lastname + ", " + row.stateshort + "</a></p>";
                    val += "<p>" + topicds[0].createdate.ToString() + "</p>";

                    // topic count
                    topiccount.Text = topicds.Rows.Count.ToString();
                    userinfo.Text = val;
                }

            }
        }
    }
}