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
    public partial class topics : System.Web.UI.UserControl
    {
        private TABS_UserControls.resources.code.BAL.ForumClass forumlogic = new TABS_UserControls.resources.code.BAL.ForumClass();
        private int userid;
        private int forumid;

        // page navigation
        private int pageindex = 1;
        private int pagesize = 10;
        private int pagemax = 1;

        protected void Page_Init(object sender, EventArgs e)
        {
            try { userid = Convert.ToInt16(Session["userid"]); } catch { userid = 0; }
            try { forumid = Convert.ToInt16(Request.QueryString["forumid"]); } catch { forumid = 0; }

            // page navigation
            try { pageindex = Convert.ToInt16(Request.QueryString["page"]); } catch { pageindex = 1; }
            if (pageindex == 0) { pageindex = 1; }
            pagemax = Convert.ToInt16(Math.Ceiling(Convert.ToDecimal(forumlogic.getTopicsByForumID(forumid).Rows.Count) / Convert.ToDecimal(pagesize)));
            if (pagemax == 0) { pagemax = 1; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // manage view
            if (userid > 0) { multiNewTopic.ActiveViewIndex = 1; }

            DataTable adTable = forumlogic.getForumAdvertisementByForumID(forumid);
            foreach (DataRow row in adTable.Rows) 
            {
                if(!String.IsNullOrEmpty(row["advertisement"].ToString()))
                {
                adLink.HRef = row["advertisementurl"].ToString();
                if (!String.IsNullOrEmpty(row["advertisement"].ToString())) {
                    adImg.ImageUrl = row["advertisement"].ToString();
                    adImg.Visible = true;
                }
                adImg.AlternateText = row["text"].ToString();
                }
                else
                {
                    adImg.Visible = false; 
                }
            }
            topicTitle.Text = forumlogic.getForumByForumID(forumid)[0].forum;
            // server-side binding
            repeatTopics.ItemDataBound += new RepeaterItemEventHandler(repeatTopics_ItemDataBound);
            buttonAddTopic.Click += new EventHandler(buttonAddTopic_Click);
            displayPageNavigation();
            if (!Page.IsPostBack)
            {
                //repeatTopics.DataSource = forumlogic.getTopicsByForumID(forumid);
                // paged data
                repeatTopics.DataSource = forumlogic.getPagedTopicsByForumID(forumid, (pageindex * pagesize) - 9, (pageindex * pagesize));
                repeatTopics.DataBind();
            }
        }

        void displayPageNavigation()
        {
            // declaration
            string val;
            int max = pageindex + 4;
            if (max > pagemax) max = pagemax;

            literalPage.Text = "Page " + pageindex.ToString() + " of " + pagemax.ToString();
            val = "<a href='" + ResolveUrl("~/topics.aspx?forumid=" + forumid.ToString()) + "'>First</a> ";
            if (pageindex > 1) val += "<a href='" + ResolveUrl("~/topics.aspx?forumid=" + forumid.ToString()) + "&page=" + Convert.ToString(pageindex - 1) + "'>Previous</a> ";
            for (int i = pageindex; i <= max; i++)
            {
                val += "<a href='" + ResolveUrl("~/topics.aspx?forumid=" + forumid.ToString() + "&page=" + i.ToString()) + "'>" + i.ToString() + "</a> ";
            }
            if (pageindex < pagemax) val += "<a href='" + ResolveUrl("~/topics.aspx?forumid=" + forumid.ToString()) + "&page=" + Convert.ToString(pageindex + 1) + "'>Next</a> ";
            val += "<a href='" + ResolveUrl("~/topics.aspx?forumid=" + forumid.ToString()) + "&page=" + pagemax.ToString() + "'>Last</a> ";
            literalPageNavigation.Text = val;
        }
        void buttonAddTopic_Click(object sender, EventArgs e)
        {
            // validate
            // validation code here

            // add new topic - activities recorded from back-end
            forumlogic.addTopic(textTopic.Text.Trim(), Convert.ToBoolean(checkSticky.Checked), userid, forumid);

            // reload
            Response.Redirect(Request.Url.ToString());
        }

        void repeatTopics_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            // show sticky indicator
            Image sticky = (Image)e.Item.FindControl("imageSticky");
            sticky.Visible = Convert.ToBoolean(DataBinder.Eval(e.Item.DataItem, "sticky"));

            // show user
            int userid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "userid"));
            Literal userlink = (Literal)e.Item.FindControl("literalUser");

            TABS_UserControls.resources.code.DAL.ForumDataset._tabs_userprofilesDataTable ds = forumlogic.getUserProfileByUserID(userid);
            //userlink.Text = "<a href='user.aspx?userid=" + userid.ToString() + "'>" + ds[0].firstname.Substring(0, 1) + ". " + ds[0].lastname + ", " + ds[0].stateshort + "</a>";
            userlink.Text = ds[0].firstname.Substring(0, 1) + ". " + ds[0].lastname + ", " + ds[0].stateshort;
            // show post count
            int topicid = Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "topicid"));
            Literal postcount = (Literal)e.Item.FindControl("literalPostCount");
            TABS_UserControls.resources.code.DAL.ForumDataset._tabs_postsDataTable postds = forumlogic.getPostsByTopicID(topicid);
            if (postds.Rows.Count > 0)
            {
                postcount.Text = postds.Rows.Count.ToString();

                // show last update
                Literal lastupdate = (Literal)e.Item.FindControl("literalPostUpdate");
                lastupdate.Text = postds[0].createdate.ToShortDateString();
            }

            // bind subscribe - only if not already subscribing
            Literal litsub = (Literal)e.Item.FindControl("textLiteralSubscribed");
            LinkButton subscribe = (LinkButton)e.Item.FindControl("buttonSubscribe");
            subscribe.CommandArgument = DataBinder.Eval(e.Item.DataItem, "topicid").ToString();

            if (forumlogic.getTopicSubscriptionByUserIDTopicID(Convert.ToInt16(DataBinder.Eval(e.Item.DataItem, "topicid")), userid).Rows.Count > 0)
            {
                subscribe.Visible = false;
                litsub.Visible = true;
            }
            else
            {
                subscribe.Visible = true;
                litsub.Visible = false;
            }
        }

        protected void subscribePost(object sender, CommandEventArgs e)
        {
            forumlogic.addTopicSubscription(Convert.ToInt16(e.CommandArgument), userid);

            // reload
            Response.Redirect(Request.Url.ToString());
        }
    }
}