$(function(){function e(){$("#lbContainer").css("margin-top",$(window).height()/2-$("#lbContainer").height()/2),s=$(window.document).scrollTop(),$("#lbContainer").css("top",s),$(window).width()<$("#content").width()?$("#lbContainer").css("left",$("#lbContainer").width()/2+"px"):$("#lbContainer").css("left","50%"),$("#lbContainer2").css("margin-top",$(window).height()/2-$("#lbContainer2").height()/2),s=$(window.document).scrollTop(),$("#lbContainer2").css("top",s),$(window).width()<$("#content").width()?$("#lbContainer2").css("left",$("#lbContainer2").width()/2+"px"):$("#lbContainer2").css("left","50%")}function n(){$("#lbContainer").hide(),$("#lbContainer2").hide(),$("#lbContainer2 :input").val(""),$("#lbContainer2 :checkbox").attr("checked",""),$("#lbOverlay").fadeOut("slow"),$("#"+divID).hide()}function t(t){switch($("#lbOverlay").queue(function(){$(this).fadeIn("slow"),$(this).dequeue()}),t){case"askJoeyBox":$("#"+t).show(),$("#lbContainer2 .top h4").text("Ask Joey a Question"),$("#newsletterBox").hide(),i(),o("#lbContainer2");break;case"newsletterBox":r=$("input#subscribeEdress").val(),$("input#emAddr1").val(r),$("#"+t).show(),$("#lbContainer2 .top h4").text("Newsletter Sign Up"),$("#askJoeyBox").hide(),i(),o("#lbContainer2");break;case"newsletterBox2":r=$("input#newsletterEmail").val(),$("input#emAddr1").val(r),$("#newsletterBox").show(),$("#lbContainer2 .top h4").text("Newsletter Sign Up"),$("#askJoeyBox").hide(),i(),o("#lbContainer2");break;default:$("#"+t).show(),o("#lbContainer")}$("#lbOverlay").click(n),$("a.close").click(n),e()}function i(){var e=$(window).height();"636">e&&$("#lbContainer2 .mid").height(e-116).css("overflow","auto")}function o(e){$(e).queue(function(){$(this).fadeIn("slow"),$(this).dequeue()})}var s="";$(document).ready(function(){e()}),$(window).bind("resize",function(){e()}),$(window).scroll(function(){e()});var r="";$(".lbLink").click(function(){divID=$(this).attr("name"),t(divID)}),$("input#subscribeEdress").keypress(function(e){return 13==e.which?(divID=$("input#subscribeEdress").parent().children("a").attr("name"),t(divID),!1):void 0}),$("input#newsletterEdress").keypress(function(e){return 13==e.which?(divID=$("input#newsletterEdress").parent().children("a").attr("name"),t(divID),!1):void 0}),$("#lbContainer").hover(function(){$(".next,.previous").fadeIn(100)},function(){$(".next,.previous").fadeOut(100)}),$(".next,.previous").click(function(){$("#lbOverlay").queue(function(){$(this).fadeIn("slow"),$(this).dequeue()}),oldDivID=$(this).attr("rel"),divID=$(this).text(),$("#"+oldDivID).hide(),$("#"+divID).show(),$(".previous").show(),$("#lbContainer").queue(function(){$(this).fadeIn("slow"),$(this).dequeue()}),$("#lbOverlay").click(n),$("a.close").click(n),e()})});