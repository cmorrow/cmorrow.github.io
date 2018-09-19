/*
 * jQuery ifixpng plugin
 * (previously known as pngfix)
 * Version 2.1  (23/04/2008)
 * @requires jQuery v1.1.3 or above
 *
 * Examples at: http://jquery.khurshid.com
 * Copyright (c) 2007 Kush M.
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
!function(i){i.ifixpng=function(t){i.ifixpng.pixel=t},i.ifixpng.getPixel=function(){return i.ifixpng.pixel||"images/pixel.gif"};var t={ltie7:i.browser.msie&&i.browser.version<7,filter:function(i){return"progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled=true,sizingMethod=crop,src='"+i+"')"}};i.fn.ifixpng=t.ltie7?function(){return this.each(function(){var r=i(this),n=i("base").attr("href");if(n&&(n=n.replace(/\/[^\/]+$/,"/")),r.is("img")||r.is("input")){if(r.attr("src")&&r.attr("src").match(/.*\.png([?].*)?$/i)){var e=n&&r.attr("src").search(/^(\/|http:)/i)?n+r.attr("src"):r.attr("src");r.css({filter:t.filter(e),width:r.width(),height:r.height()}).attr({src:i.ifixpng.getPixel()}).positionFix()}}else{var s=r.css("backgroundImage");s.match(/^url\(["']?(.*\.png([?].*)?)["']?\)$/i)&&(s=RegExp.$1,s=n&&"/"!=s.substring(0,1)?n+s:s,r.css({backgroundImage:"none",filter:t.filter(s)}).children().children().positionFix())}})}:function(){return this},i.fn.iunfixpng=t.ltie7?function(){return this.each(function(){var t=i(this),r=t.css("filter");r.match(/src=["']?(.*\.png([?].*)?)["']?/i)&&(r=RegExp.$1,t.is("img")||t.is("input")?t.attr({src:r}).css({filter:""}):t.css({filter:"",background:"url("+r+")"}))})}:function(){return this},i.fn.positionFix=function(){return this.each(function(){var t=i(this),r=t.css("position");"absolute"!=r&&"relative"!=r&&t.css({position:"relative"})})}}(jQuery);