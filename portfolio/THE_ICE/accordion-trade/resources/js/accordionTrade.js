$(document).ready(function(){$(".silverheader").hover(function(){$(this).css({cursor:"hand"})},function(){$(this).css({cursor:"pointer"})}),$(".silverheader").toggle(function(){$(this).css({background:"url(resources/images/mktArrowDown.gif) no-repeat left top"})},function(){$(this).css({background:"url(resources/images/mktArrowCollapse.gif) no-repeat left top"})}),$(".silverheaderOpen").toggle(function(){$(this).css({background:"url(resources/images/mktArrowCollapse.gif) no-repeat left top"})},function(){$(this).css({background:"url(resources/images/mktArrowDown.gif) no-repeat left top"})}),$("#iceWebHdr").click(function(){$("#iceWeb").find(".more").slideToggle("slow")}),$("#iceWebHdr").click(function(){$("#iceWeb").find(".more").toggleClass("collapsed")}),$("#iceLiveHdr").click(function(){$("#iceLive").find(".more").slideToggle("slow")}),$("#iceLiveHdr").click(function(){$("#iceLive").find(".more").toggleClass("collapsed")}),$("#iceTickHdr").click(function(){$("#iceTick").find(".more").slideToggle("slow")}),$("#iceTickHdr").click(function(){$("#iceTick").find(".more").toggleClass("collapsed")}),$("#iceHistoricalHdr").click(function(){$("#iceHistorical").find(".more").slideToggle("slow")}),$("#iceHistoricalHdr").click(function(){$("#iceHistorical").find(".more").toggleClass("collapsed")}),$("#iceDataVendorsHdr").click(function(){$("#iceDataVendors").find(".more").slideToggle("slow")}),$("#iceDataVendorsHdr").click(function(){$("#iceDataVendors").find(".more").toggleClass("collapsed")}),$("#iceEndHdr").click(function(){$("#iceEnd").find(".more").slideToggle("slow")}),$("#iceEndHdr").click(function(){$("#iceEnd").find(".more").toggleClass("collapsed")}),$("#hdr1").click(function(){$("#section1").slideToggle("slow")}),$("#hdr1").click(function(){$("#section1").toggleClass("collapsed")}),$("#hdr2").click(function(){$("#section2").slideToggle("slow")}),$("#hdr2").click(function(){$("#section2").toggleClass("collapsed")}),$("#hdr3").click(function(){$("#section3").slideToggle("slow")}),$("#hdr3").click(function(){$("#section3").toggleClass("collapsed")}),$(".hdrImage").hover(function(){$(this).css({cursor:"hand"})},function(){$(this).css({cursor:"pointer"})})});