function SetCount(a){var t="#"+$(a).attr("id")+"Count",o=$(a).val().length;$(t).text(o)}function ValidateField(a){var t="#"+$(a).attr("id")+"Error";""==$(a).val()?$(t).show():$(t).hide()}function ValidateForm(){""!=$("#nominatorName").val()&&""!=$("#nominatorEmailAddress").val()&&""!=$("#nominatorRelationship").val()&&""!=$("#applicantNameAndAddress").val()&&""!=$("#whySchoolNeedsGrantEssay").val()&&""!=$("#howGrantIsUsedEssay").val()?$("#NominationForm").submit():alert("You must complete all fields.")}function ResetForm(){$("#nominatorName").val(""),$("#nominatorEmailAddress").val(""),$("#nominatorRelationship").val(""),$("#applicantNameAndAddress").val(""),$("#whySchoolNeedsGrantEssay").val(""),$("#howGrantIsUsedEssay").val(""),$("#whySchoolNeedsGrantEssayCount").text("0"),$("#howGrantIsUsedEssayCount").text("0")}