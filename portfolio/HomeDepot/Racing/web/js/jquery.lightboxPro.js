/**
 * jQuery Lightbox Plugin (balupton edition) - Lightboxes for jQuery
 * Copyright (C) 2008 Benjamin Arthur Lupton
 * http://jquery.com/plugins/project/jquerylightbox_bal
 *
 * This file is part of jQuery Lightbox (balupton edition).
 * 
 * jQuery Lightbox (balupton edition) is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 * 
 * jQuery Lightbox (balupton edition) is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with jQuery Lightbox (balupton edition).  If not, see <http://www.gnu.org/licenses/>.
 *
 * @name jquery_lightbox: jquery.lightbox.js
 * @package jQuery Lightbox Plugin (balupton edition)
 * @version 1.3.4-final
 * @date September 12, 2008
 * @category jQuery plugin
 * @author Benjamin "balupton" Lupton {@link http://www.balupton.com}
 * @copyright (c) 2008 Benjamin Arthur Lupton {@link http://www.balupton.com}
 * @license GNU Affero General Public License - {@link http://www.gnu.org/licenses/agpl.html}
 * @example Visit {@link http://jquery.com/plugins/project/jquerylightbox_bal} for more information.
 */
!function($){$.log=$.browser.safari||"undefined"==typeof window.console||"function"!=typeof window.console.log?function(){}:window.console.log,$.params_to_json=$.params_to_json||function(params){if(params=String(params),params=params.substring(params.indexOf("?")+1),params=params.replace(/\+/g,"%20"),"{"===params.substring(0,1)&&"}"===params.substring(params.length-1))return eval(decodeURIComponent(params));params=params.split(/\&|\&amp\;/);for(var json={},i=0,n=params.length;n>i;++i){var param=params[i]||null;if(null!==param&&(param=param.split("="),null!==param)){var key=param[0]||null;if(null!==key&&"undefined"!=typeof param[1]){var value=param[1];key=decodeURIComponent(key),value=decodeURIComponent(value);try{value=eval(value)}catch(e){}var keys=key.split(".");if(1===keys.length)json[key]=value;else{var path="";for(ii in keys)key=keys[ii],path+="."+key,eval("json"+path+" = json"+path+" || {}");eval("json"+path+" = value")}}}}return json},$.LightboxClass=function(){this.construct()},$.fn.lightbox=function(e){if($.Lightbox=$.Lightbox||new $.LightboxClass,$.Lightbox.ie6&&!$.Lightbox.ie6_support)return this;e=$.extend({start:!1,events:!0},e);var t=$(this);if(e.events&&($(t).unbind().click(function(){var e=$(this);return $.Lightbox.init($(e)[0],t)?$.Lightbox.start()?!1:!1:!1}),$(t).addClass("lightbox-enabled")),e.start){var i=$(this);if(!$.Lightbox.init($(i)[0],t))return this;if(!$.Lightbox.start())return this}return this},$.extend($.LightboxClass.prototype,{images:{list:[],image:!1,prev:function(e){return"undefined"!=typeof e||(e=this.active())?this.first(e)?!1:this.get(e.index-1):e},next:function(e){return"undefined"!=typeof e||(e=this.active())?this.last(e)?!1:this.get(e.index+1):e},first:function(e){return"undefined"==typeof e?this.get(0):0===e.index},last:function(e){return"undefined"==typeof e?this.get(this.size()-1):e.index===this.size()-1},single:function(){return 1===this.size()},size:function(){return this.list.length},empty:function(){return 0===this.size()},clear:function(){this.list=[],this.image=!1},active:function(e){return"undefined"==typeof e?this.image:e===!1||(e=this.get(e))?(this.image=e,!0):e},add:function(e){if(e[0]){for(var t=0;t<e.length;t++)this.add(e[t]);return!0}var i=this.create(e);return i?(i.index=this.size(),this.list.push(i),!0):i},create:function(e){var t={src:"",title:"Untitled",description:"",name:"",index:-1,color:null,width:null,height:null,image:!0};if(e.image)t.src=e.src||t.src,t.title=e.title||t.title,t.description=e.description||t.description,t.name=e.name||t.name,t.color=e.color||t.color,t.width=e.width||t.width,t.height=e.height||t.height,t.index=e.index||t.index;else if(e.tagName)if(e=$(e),e.attr("src")||e.attr("href")){t.src=e.attr("src")||e.attr("href"),t.title=e.attr("title")||e.attr("alt")||t.title,t.name=e.attr("name")||"",t.color=e.css("backgroundColor");var i=t.title.indexOf(": ");i>0&&(t.description=t.title.substring(i+2)||t.description,t.title=t.title.substring(0,i)||t.title)}else t=!1;else t=!1;return t?t:($.log("ERROR","We dont know what we have:",e),!1)},get:function(e){if("undefined"==typeof e||null===e)return this.active();if("number"==typeof e)e=this.list[e]||!1;else{if(e=this.create(e),!e)return!1;for(var t=!1,i=0;i<this.size();i++){var o=this.list[i];o.src===e.src&&o.title===e.title&&o.description===e.description&&(t=o)}e=t}return e?e:($.log("ERROR","The desired image doesn't exist: ",e,this.list),!1)},debug:function(){return $.Lightbox.debug(arguments)}},constructed:!1,src:null,baseurl:null,files:{js:{lightbox:"js/jquery.lightboxPro.js",colorBlend:"js/jquery.color.js"},css:{lightbox:"../css/jquery.lightbox.css"},images:{prev:"images/lightbox/lbPrevious.gif",next:"images/lightbox/lbNext.gif",blank:"images/lightbox/blank.gif",loading:"../../images/lightbox/loading.gif"}},text:{image:"Image",of:"of",close:"",closeInfo:"You can also click anywhere outside the image to close.",download:"Direct link to download the image.",help:{close:"",interact:""},about:{text:"",title:"Licenced under the GNU Affero General Public License.",link:"http://jquery.com/plugins/project/jquerylightbox_bal"}},keys:{close:"c",prev:"p",next:"n"},handlers:{show:null},opacity:.9,padding:null,speed:400,rel:"lightbox",auto_relify:!0,auto_scroll:"follow",auto_resize:!1,ie6:null,ie6_support:!0,ie6_upgrade:!1,colorBlend:null,download_link:!0,show_info:"auto",show_extended_info:"false",options:["auto_scroll","auto_resize","download_link","show_info","show_extended_info","ie6_support","ie6_upgrade","colorBlend","baseurl","files","text","show_linkback","keys","opacity","padding","speed","rel","auto_relify"],construct:function(e){var t="undefined"==typeof this.constructed||this.constructed===!1;this.constructed=!0;var o=t;if(e=$.extend({},e),t&&"undefined"==typeof e.files)if(this.src=$("script[src*="+this.files.js.lightbox+"]:first").attr("src"),this.src){this.baseurl=this.src.substring(0,this.src.indexOf(this.files.js.lightbox));var s=this;$.each(this.files,function(e){$.each(this,function(t,i){s.files[e][t]=s.baseurl+i})}),delete s,e=$.extend(e,$.params_to_json(this.src))}else o=!1;else if("object"==typeof e.files){var s=this;$.each(e.files,function(){$.each(this,function(e,t){this[e]=s.baseurl+t})}),delete s}else o=!1;for(i in this.options){var n=this.options[i];"object"==typeof e[n]&&"object"==typeof this[n]?this[n]=$.extend(this[n],e[n]):"undefined"!=typeof e[n]&&(this[n]=e[n])}return this.ie6=t&&navigator.userAgent.indexOf("MSIE 6")>=0?!0:!1,(o||"undefined"!=typeof e.download_link||"undefined"!=typeof e.colorBlend||"object"==typeof e.files||"object"==typeof e.text||"undefined"!=typeof e.show_linkback||"undefined"!=typeof e.scroll_with)&&$(function(){$.Lightbox.domReady()}),!0},domReady:function(){var e=document.getElementsByTagName($.browser.safari?"head":"body")[0],t=this.files.css,i=this.files.js;this.colorBlend===!0&&"undefined"==typeof $.colorBlend?this.colorBlend=!0:(this.colorBlend="undefined"!=typeof $.colorBlend,delete i.colorBlend);for(stylesheet in t){var o=document.createElement("link");o.type="text/css",o.rel="stylesheet",o.media="screen",o.href=t[stylesheet],o.id="lightbox-stylesheet-"+stylesheet.replace(/[^a-zA-Z0-9]/g,""),$("#"+o.id).remove(),e.appendChild(o)}for(script in i){var s=document.createElement("script");s.type="text/javascript",s.src=i[script],s.id="lightbox-script-"+script.replace(/[^a-zA-Z0-9]/g,""),$("#"+s.id).remove(),e.appendChild(s)}return delete i,delete t,delete e,$("#lightbox,#lightbox-overlay").remove(),$("body").append('<div id="lightbox-overlay"></div><div id="lightbox"><div id="lightboxTop"><span class="left"></span><a class="close" href="javascript:void(0);">close</a><span id="lightboxCaption"></span></div><div id="lightboxContent"><div id="lightboxImage"></div><a href="#" id="lightbox-nav-btnPrev"></a><a href="#" id="lightbox-nav-btnNext"></a></div><div id="lightboxInfo"><span id="lightboxCurrentNumber"></span></div><div id="lightboxBottom"><span class="left"></span></div></div>'),this.resizeBoxes(),this.repositionBoxes(),$("#lightbox,#lightbox-overlay,#lightbox-overlay-text-interact").hide(),this.ie6&&this.ie6_support&&$("#lightbox-overlay").css({position:"absolute",top:"0px",left:"0px"}),$.each(this.files.images,function(){var e=new Image;e.onload=function(){e.onload=null,e=null},e.src=this}),$(window).unbind().resize(function(){$.Lightbox.resizeBoxes("resized")}),"follow"===this.scroll&&$(window).scroll(function(){$.Lightbox.repositionBoxes()}),$("#lightbox-nav-btnPrev").unbind().hover(function(){$(this).css({background:"url("+$.Lightbox.files.images.prev+") left 45% no-repeat"})},function(){$(this).css({background:"transparent url("+$.Lightbox.files.images.blank+") no-repeat"})}).click(function(){return $.Lightbox.showImage($.Lightbox.images.prev()),!1}),$("#lightbox-nav-btnNext").unbind().hover(function(){$(this).css({background:"url("+$.Lightbox.files.images.next+") right 45% no-repeat"})},function(){$(this).css({background:"transparent url("+$.Lightbox.files.images.blank+") no-repeat"})}).click(function(){return $.Lightbox.showImage($.Lightbox.images.next()),!1}),$("#lightbox-overlay, #lightbox, #lightbox-btnClose").unbind().click(function(){return $.Lightbox.finish(),!1}),this.auto_relify&&this.relify(),!0},relify:function(){var e={},t=0,i=this.rel;return $.each($("[@rel*="+i+"]"),function(o,s){var n=$(s).attr("rel");n===i&&(n=t),"undefined"==typeof e[n]&&(e[n]=[],t++),e[n].push(s)}),$.each(e,function(e,t){$(t).lightbox()}),!0},init:function(e,t){return"undefined"==typeof t&&(t=e,e=0),this.images.clear(),this.images.add(t)?this.images.empty()?($.log("WARNING","Lightbox started, but no images: ",e,t),!1):this.images.active(e)?!0:!1:!1},start:function(){return this.visible=!0,"disable"===this.scroll&&$(document.body).css("overflow","hidden"),$("embed, object, select").css("visibility","hidden"),this.resizeBoxes("resized"),this.repositionBoxes({speed:0}),$("#lightboxInfo").hide(),$("#lightboxContent,#lightbox-nav,#lightbox-nav-btnPrev,#lightbox-nav-btnNext").hide(),$("#lightbox-overlay").css("opacity",this.opacity).fadeIn(400,function(){return $("#lightbox").fadeIn(300),$.Lightbox.showImage($.Lightbox.images.active())?void 0:($.Lightbox.finish(),!1)}),!0},finish:function(){$("#lightbox").hide(),$("#lightbox-overlay").fadeOut(function(){$("#lightbox-overlay").hide()}),$("embed, object, select").css({visibility:"visible"}),this.images.active(!1),"disable"===this.scroll&&$(document.body).css("overflow","visible"),this.visible=!1},resizeBoxes:function(e){if("transition"!==e){var t=$(this.ie6?document.body:document);$("#lightbox-overlay").css({width:t.width(),height:t.height()}),delete t}switch(e){case"general":return!0;case"resized":if(this.auto_resize===!1)return this.repositionBoxes({nHeight:u,speed:this.speed}),!0;case"transition":}var i=this.images.active();if(!i||!i.width||!this.visible)return $.log("WARNING","A resize occured while no image or no lightbox..."),!1;var o=i.width,s=i.height,n=$(window).width(),a=$(window).height();if(this.auto_resize!==!1)for(var r,l=Math.floor(.8*n),h=Math.floor(.8*a);o>l||s>h;)o>l&&(r=l/o,o=l,s=Math.floor(s*r)),s>h&&(r=h/s,s=h,o=Math.floor(o*r));var d=$("#lightboxContent").width(),c=$("#lightboxContent").height(),g=o+2*this.padding,u=s+2*this.padding,f=d-g,b=c-u;$("#lightbox-nav-btnPrev,#lightbox-nav-btnNext").css("height",u);var p=g+18;return"transition"===e?0===f&&0===b?(this.pause(this.speed/3),this.showImage(null,3)):($("#lightboxImage").width(o).height(s),$("#lightboxTop").animate({width:p},this.speed),$("#lightboxBottom").animate({width:p},this.speed),$("#lightboxImage").animate({width:g,height:u},this.speed,function(){$.Lightbox.showImage(null,3)})):$("#lightboxImage").animate({width:o,height:s},this.speed),this.repositionBoxes({nHeight:u,speed:this.speed}),!0},repositioning:!1,reposition_failsafe:!1,repositionBoxes:function(e){if(this.repositioning)return this.reposition_failsafe=!0,null;this.repositioning=!0,e=$.extend({},e),e.callback=e.callback||null,e.speed=e.speed||"slow";var t=this.getPageScroll(),i=e.nHeight||parseInt($("#lightbox").height(),10),o=t.yScroll+($(window).height()-i)/2.5,s=t.xScroll,n={left:s,top:o};return e.speed?$("#lightbox").animate(n,"slow",function(){$.Lightbox.reposition_failsafe?($.Lightbox.repositioning=$.Lightbox.reposition_failsafe=!1,$.Lightbox.repositionBoxes(e)):($.Lightbox.repositioning=!1,e.callback&&e.callback())}):($("#lightbox").css(n),this.reposition_failsafe?(this.repositioning=this.reposition_failsafe=!1,this.repositionBoxes(e)):this.repositioning=!1),!0},visible:!1,showImage:function(e,t){if(e=this.images.get(e),!e)return e;t=t||1;var i=t>1&&this.images.active().src!==e.src,o=t>2&&$("#lightboxImage").attr("src")!==e.src;switch((i||o)&&($.log("We wanted to skip a few steps: ",e,t,i,o),t=1),t){case 1:if(this.KeyboardNav_Disable(),$("#lightbox-loading").show(),$("#lightboxImage,#lightbox-nav,#lightbox-nav-btnPrev,#lightbox-nav-btnNext").hide(),$("#lightboxImage").unbind(),!this.images.active(e))return!1;if(e.width&&e.height)this.showImage(null,2);else{var s=new Image;s.onload=function(){e.width=s.width,e.height=s.height,$.Lightbox.showImage(null,2),s.onload=null,s=null},s.src=e.src}break;case 2:$("#lightboxImage").attr("src",e.src),this.colorBlend&&($("#lightbox-overlay").animate({backgroundColor:e.color},2*this.speed),$("#lightboxImageBox").css("borderColor",e.color)),this.resizeBoxes("transition");break;case 3:$("#lightbox-loading").hide(),$("#lightboxImage").fadeIn(1.5*this.speed,function(){$.Lightbox.showImage(null,4)}),this.preloadNeighbours(),null!==this.handlers.show&&this.handlers.show(e);break;case 4:{$("#lightboxCaption-title").html(e.title||"Untitled")}$("#lightboxCaption-seperator").html(e.description?": ":""),$("#lightboxCaption-description").html(e.description||"&nbsp;"),this.images.size()>1?$("#lightbox-currentNumber").html(this.text.image+"&nbsp;"+(e.index+1)+"&nbsp;"+this.text.of+"&nbsp;"+this.images.size()):$("#lightbox-currentNumber").html("&nbsp;"),$("#lightbox-nav-btnPrev, #lightbox-nav-btnNext").css({background:"transparent url("+this.files.images.blank+") no-repeat"}),this.images.first(e)||$("#lightbox-nav-btnPrev").show(),this.images.last(e)||$("#lightbox-nav-btnNext").show(),$("#lightbox-nav").show(),this.KeyboardNav_Enable();break;default:return $.log("ERROR","Don't know what to do: ",e,t),this.showImage(e,1)}return!0},preloadNeighbours:function(){if(this.images.single()||this.images.empty())return!0;var e=this.images.active();if(!e)return e;var t,i=this.images.prev(e);i&&(t=new Image,t.src=i.src);var o=this.images.next(e);o&&(t=new Image,t.src=o.src)},KeyboardNav_Enable:function(){$(document).keydown(function(e){$.Lightbox.KeyboardNav_Action(e)})},KeyboardNav_Disable:function(){$(document).unbind()},KeyboardNav_Action:function(e){e=e||window.event;var t=e.keyCode,i=e.DOM_VK_ESCAPE||27,o=String.fromCharCode(t).toLowerCase();return o===this.keys.close||t===i?$.Lightbox.finish():o===this.keys.prev||37===t?$.Lightbox.showImage($.Lightbox.images.prev()):o===this.keys.next||39===t?$.Lightbox.showImage($.Lightbox.images.next()):!0},getPageScroll:function(){var e,t;self.pageYOffset?(t=self.pageYOffset,e=self.pageXOffset):document.documentElement&&document.documentElement.scrollTop?(t=document.documentElement.scrollTop,e=document.documentElement.scrollLeft):document.body&&(t=document.body.scrollTop,e=document.body.scrollLeft);var i={xScroll:e,yScroll:t};return i},pause:function(e){var t=new Date,i=null;do i=new Date;while(e>i-t)}}),"undefined"==typeof $.Lightbox&&($.Lightbox=new $.LightboxClass)}(jQuery);