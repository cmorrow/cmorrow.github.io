$(document).ready(function(){$("#header input").attr("value","enter email address"),$("#header input").one("click",function(){$("#header input").attr("value","")}),$("input#newsletterEmail").attr("value","Enter your e-mail address"),$("input#newsletterEmail").one("click",function(){$("input#newsletterEmail").attr("value","")}),$("#nav ul").hide(),$("#nav li").hover(function(){$(this).addClass("over"),$("ul",this).slideDown("fast")},function(){$("ul",this).slideUp("fast"),$(this).removeClass("over")}),$("a[rel=external]").click(function(){return window.open(this.href),!1});var e=$("#main").height(),t=$("#right").height();e>t?$("#divider").height(e-130):$("#divider").height(t-130),$(document).pngFix()}),$(function(){var e=0;$("table.zebra tr").each(function(){$("th",this).length?e=-1:1>e%2?$(this+":odd").removeClass("even"):$(this).addClass("even"),e++}),$("table.zebra td.driverCol").filter(':contains("Joey Logano")').parent().removeClass("even").addClass("selected"),$("table.zebra tr").each(function(){$("th:first-child",this).css({"border-left":"none"}),$("th:last-child",this).css({"border-right":"none"}),$("td:last-child",this).css({"border-right":"none"})})}),$(function(){$(".journalEntry:last").css({background:"none"}),$(".answerEntry:last").css({background:"none"}),$(".raceNews:last").css({background:"none",padding:"0"})}),$(function(){function e(){var e=$("input#associateId").val();return 9!=e.length?($("#login_error").show(),$("input#associateId").focus(),!1):1!=/^\d+$/.test(e)?($("#login_error").show(),$("input#associateId").focus(),!1):(location.href="associates.aspx",!1)}$("#login_error").hide(),$("a.loginBtn").click(e),$("input#associateId").keypress(function(t){13==t.which&&e()})}),$(function(){function e(){return Math.round(Math.random())-.5}function t(){setTimeout(n,5e3)}function n(){a+=1,a==i.length&&(a=0),$("#ads div").hide(),$(i[a]).show(),t()}var i=["#ad1","#ad2"];i.sort(e);var a=0;$(i[a]).show(),t()});