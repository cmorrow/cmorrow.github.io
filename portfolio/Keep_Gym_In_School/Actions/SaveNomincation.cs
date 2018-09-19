using System;
using System.Configuration;
using System.Web;

using CivicEntertainmentGroup.KeepGymInSchool.Data;
using CivicEntertainmentGroup.KeepGymInSchool.Data.Managers;

namespace CivicEntertainmentGroup.KeepGymInSchool.Web.Actions
{
	public class SaveNomination : IHttpHandler
	{
		public bool IsReusable
		{
			get { return true; }
		}

		public void ProcessRequest(HttpContext context)
		{
			if (!string.IsNullOrEmpty(context.Request.Form["nominatorEmailAddress"].Trim()) &&
				!string.IsNullOrEmpty(context.Request.Form["nominatorName"].Trim()) &&
				!string.IsNullOrEmpty(context.Request.Form["nominatorRelationship"].Trim()) &&
				!string.IsNullOrEmpty(context.Request.Form["applicantNameAndAddress"].Trim()))
			{
				Nomination nomination = new Nomination();
				nomination.CreateDate = DateTime.Now;
				nomination.NominatorEmail = context.Request.Form["nominatorEmailAddress"].Trim();
				nomination.NominatorName = context.Request.Form["nominatorName"].Trim();
				nomination.RelationshipToSchool = context.Request.Form["nominatorRelationship"].Trim();
				nomination.SchoolNameAndAddress = context.Request.Form["applicantNameAndAddress"].Trim();
				nomination.WhySchoolNeedsGrantEssay = context.Request.Form["whySchoolNeedsGrantEssay"].Trim();
				nomination.HowGrantIsUsedEssay = context.Request.Form["howGrantIsUsedEssay"].Trim();

				NominationManager.Save(nomination);
			}

			context.Response.Redirect(ConfigurationManager.AppSettings["NominationFormSuccessRedirect"]);
		}
	}
}
