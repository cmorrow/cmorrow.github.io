/**
 * --------------------------------------------------------------------
 * jQuery-Plugin "pngFix"
 * Version: 1.1, 11.09.2007
 * by Andreas Eberhard, andreas.eberhard@gmail.com
 *                      http://jquery.andreaseberhard.de/
 *
 * Copyright (c) 2007 Andreas Eberhard
 * Licensed under GPL (http://www.opensource.org/licenses/gpl-license.php)
 *
 * Changelog:
 *    11.09.2007 Version 1.1
 *    - removed noConflict
 *    - added png-support for input type=image
 *    - 01.08.2007 CSS background-image support extension added by Scott Jehl, scott@filamentgroup.com, http://www.filamentgroup.com
 *    31.05.2007 initial Version 1.0
 * --------------------------------------------------------------------
 * @example $(function(){$(document).pngFix();});
 * @desc Fixes all PNG's in the document on document.ready
 *
 * jQuery(function(){jQuery(document).pngFix();});
 * @desc Fixes all PNG's in the document on document.ready when using noConflict
 *
 * @example $(function(){$('div.examples').pngFix();});
 * @desc Fixes all PNG's within div with class examples
 *
 * @example $(function(){$('div.examples').pngFix( { blankgif:'ext.gif' } );});
 * @desc Fixes all PNG's within div with class examples, provides blank gif for input with png
 * --------------------------------------------------------------------
 */
!function(){jQuery.fn.pngFix=function(t){t=jQuery.extend({blankgif:"images/blank.gif"},t);var i="Microsoft Internet Explorer"==navigator.appName&&4==parseInt(navigator.appVersion)&&-1!=navigator.appVersion.indexOf("MSIE 5.5"),r="Microsoft Internet Explorer"==navigator.appName&&4==parseInt(navigator.appVersion)&&-1!=navigator.appVersion.indexOf("MSIE 6.0");return jQuery.browser.msie&&(i||r)&&(jQuery(this).find("img[@src$=.png]").each(function(){jQuery(this).attr("width",jQuery(this).width()),jQuery(this).attr("height",jQuery(this).height());var t="",i="",r=jQuery(this).attr("id")?'id="'+jQuery(this).attr("id")+'" ':"",e=jQuery(this).attr("class")?'class="'+jQuery(this).attr("class")+'" ':"",s=jQuery(this).attr("title")?'title="'+jQuery(this).attr("title")+'" ':"",a=jQuery(this).attr("alt")?'alt="'+jQuery(this).attr("alt")+'" ':"",n=jQuery(this).attr("align")?"float:"+jQuery(this).attr("align")+";":"",h=jQuery(this).parent().attr("href")?"cursor:hand;":"";this.style.border&&(t+="border:"+this.style.border+";",this.style.border=""),this.style.padding&&(t+="padding:"+this.style.padding+";",this.style.padding=""),this.style.margin&&(t+="margin:"+this.style.margin+";",this.style.margin="");var o=this.style.cssText;i+="<span "+r+e+s+a,i+='style="position:relative;white-space:pre-line;display:inline-block;background:transparent;'+n+h,i+="width:"+jQuery(this).width()+"px;height:"+jQuery(this).height()+"px;",i+="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+jQuery(this).attr("src")+"', sizingMethod='scale');",i+=o+'"></span>',""!=t&&(i='<span style="position:relative;display:inline-block;'+t+h+"width:"+jQuery(this).width()+"px;height:"+jQuery(this).height()+'px;">'+i+"</span>"),jQuery(this).hide(),jQuery(this).after(i)}),jQuery(this).find("*").each(function(){var t=jQuery(this).css("background-image");if(-1!=t.indexOf(".png")){var i=t.split('url("')[1].split('")')[0];jQuery(this).css("background-image","none"),jQuery(this).get(0).runtimeStyle.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+i+"',sizingMethod='scale')"}}),jQuery(this).find("input[@src$=.png]").each(function(){var i=jQuery(this).attr("src");jQuery(this).get(0).runtimeStyle.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+i+"', sizingMethod='scale');",jQuery(this).attr("src",t.blankgif)})),jQuery}}(jQuery);