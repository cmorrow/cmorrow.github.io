$(function(){function e(){$("#lbContainer").hide(),$("#lbContainer2").hide(),$("#lbContainer2 :input").val(""),$("#lbContainer2 :checkbox").attr("checked",""),$("#lbOverlay").fadeOut("slow"),$(".errorMsg").hide()}function t(t){e(),$("p.required").show(),$("#lbContainer2 form").show(),"askJoey"==t?$("#thankyouBox").remove():($("#thankyouBox2").remove(),$("#header input").attr("value","enter email address"),$("input#newsletterEmail:visible").attr("value","Enter your e-mail address"))}function n(e){if($(".errorMsg").hide(),"askJoey"==e){var t=$("textarea#question").val();if(""==t)return $("span#message_error").show(),$("textarea#question").focus(),!1;var n=$("input#fname").val();if(""==n)return $("span#fname_error").show(),$("input#fname").focus(),!1;var r=$("input#lname").val();if(""==r)return $("span#lname_error").show(),$("input#lname").focus(),!1;var o=$("input#cLocation").val();if(""==o)return $("span#city_error").show(),$("input#cLocation").focus(),!1;var i=$("select#sLocation").val();if(""==i)return $("#state_error").show(),$("select#sLocation").focus(),!1;var s=$("input#zCode").val();if(""==s)return $("#zip_error").show(),$("input#zCode").focus(),!1;var u=$("input#emAddr").val();if(" "!=u&&!/.+@.+\.[a-zA-Z]{2,4}$/.test(u))return $("span#email_error").show(),$("input#emAddr").focus(),!1;var c="",l="",p="",d="",h=$("input#raceNewsletter").is(":checked"),f=$("input#promotion").is(":checked"),v=$("input#khNewsletter").is(":checked");1==h&&$("#newsgacode").attr("src","aj_newsletterSignup.html")}else{var t="",u=$("input#emAddr1").val();if(" "!=u&&!/.+@.+\.[a-zA-Z]{2,4}$/.test(u))return $("span#email_error1").show(),$("input#emAddr1").focus(),!1;var n=$("input#fname1").val();if(""==n)return $("span#fname_error1").show(),$("input#fname1").focus(),!1;var r=$("input#lname1").val();if(""==r)return $("span#lname_error1").show(),$("input#lname1").focus(),!1;var s=$("input#zCode1").val();if(""==s)return $("#zip_error1").show(),$("input#zCode1").focus(),!1;var o=$("input#cLocation1").val(),i=$("select#sLocation1").val(),c=$("input#mAddr").val(),l=$("input#mAddr2").val(),p=$("input#dayphone").val(),d=$("input#evephone").val(),h=$("input#raceNewsletter1").is(":checked"),f=$("input#promotion1").is(":checked"),v=$("input#khNewsletter1").is(":checked");$("#newsgacode").attr("src","newsletterSignup.html")}var m="&fname="+n+"&lname="+r+"&email="+u+"&address="+c+"&address2="+l+"&city="+o+"&state="+i+"&zip="+s+"&dayphone="+p+"&eveningphone="+d+"&question="+t+"&raceNews="+h+"&promotions="+f+"&knowHowNews="+v;a(e,m)}function a(e,n){return $.ajax({type:"POST",url:"/exacttarget/Default.aspx",data:n,success:function(){"askJoey"==e?($("p.required").hide(),$("#lbContainer2 form").hide(),$("#lbContainer2 .top h4").text("Thank You!"),$("#askJoeyBox").append("<div id='thankyouBox'></div>"),$("#thankyouBox").html("<h5>Thank you for submitting your question.</h5><p class='thankyouBtn'><a href='javascript:void(0);' class='button'>Close</a></p>").fadeIn(),$("#lbContainer2 p.thankyouBtn a").click(function(){t(e)})):($("p.required").hide(),$("#lbContainer2 form").hide(),$("#lbContainer2 .top h4").text("Thank You!"),$("#newsletterBox").append("<div id='thankyouBox2'></div>"),$("#thankyouBox2").html("<h5>You are now subscribed to our newsletter.</h5><p class='thankyouBtn'><a href='javascript:void(0);' class='button'>Close</a></p>").fadeIn(),$("#lbContainer2 p.thankyouBtn a").click(function(){t(e)}))}}),!1}$(".errorMsg").hide(),$("#askJoeyBox a.submitButton").click(function(){n("askJoey")}),$("#newsletterBox a.submitButton").click(function(){n("newsletter")}),$("#lbContainer2 a.close").click(function(){e()}),$("#lbContainer2 .cancelButton").click(function(){return e(),!1})});