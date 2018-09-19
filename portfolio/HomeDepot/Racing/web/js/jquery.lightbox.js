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
!function($){$.log=$.browser.safari||"undefined"==typeof window.console||"function"!=typeof window.console.log?function(){}:window.console.log,$.params_to_json=$.params_to_json||function(params){if(params=String(params),params=params.substring(params.indexOf("?")+1),params=params.replace(/\+/g,"%20"),"{"===params.substring(0,1)&&"}"===params.substring(params.length-1))return eval(decodeURIComponent(params));params=params.split(/\&|\&amp\;/);for(var json={},i=0,n=params.length;n>i;++i){var param=params[i]||null;if(null!==param&&(param=param.split("="),null!==param)){var key=param[0]||null;if(null!==key&&"undefined"!=typeof param[1]){var value=param[1];key=decodeURIComponent(key),value=decodeURIComponent(value);try{value=eval(value)}catch(e){}var keys=key.split(".");if(1===keys.length)json[key]=value;else{var path="";for(ii in keys)key=keys[ii],path+="."+key,eval("json"+path+" = json"+path+" || {}");eval("json"+path+" = value")}}}}return json},$.LightboxClass=function(){this.construct()},$.fn.lightbox=function(e){if($.Lightbox=$.Lightbox||new $.LightboxClass,$.Lightbox.ie6&&!$.Lightbox.ie6_support)return this;e=$.extend({start:!1,events:!0},e);var i=$(this);if(e.events&&$(i).unbind().click(function(){var e=$(this);return $.Lightbox.init($(e)[0],i)?$.Lightbox.start()?!1:!1:!1}),e.start){var t=$(this);if(!$.Lightbox.init($(t)[0],i))return this;if(!$.Lightbox.start())return this}return this},$.extend($.LightboxClass.prototype,{images:{list:[],image:!1,prev:function(e){return"undefined"!=typeof e||(e=this.active())?this.first(e)?!1:this.get(e.index-1):e},next:function(e){return"undefined"!=typeof e||(e=this.active())?this.last(e)?!1:this.get(e.index+1):e},first:function(e){return"undefined"==typeof e?this.get(0):0===e.index},last:function(e){return"undefined"==typeof e?this.get(this.size()-1):e.index===this.size()-1},single:function(){return 1===this.size()},size:function(){return this.list.length},empty:function(){return 0===this.size()},clear:function(){this.list=[],this.image=!1},active:function(e){return"undefined"==typeof e?this.image:e===!1||(e=this.get(e))?(this.image=e,!0):e},add:function(e){if(e[0]){for(var i=0;i<e.length;i++)this.add(e[i]);return!0}var t=this.create(e);return t?(t.index=this.size(),this.list.push(t),!0):t},create:function(e){var i={src:"",title:"Untitled",description:"",name:"",index:-1,color:null,width:null,height:null,image:!0};if(e.image)i.src=e.src||i.src,i.title=e.title||i.title,i.description=e.description||i.description,i.name=e.name||i.name,i.color=e.color||i.color,i.width=e.width||i.width,i.height=e.height||i.height,i.index=e.index||i.index;else if(e.tagName)if(e=$(e),e.attr("src")||e.attr("href")){i.src=e.attr("src")||e.attr("href"),i.title=e.attr("title")||e.attr("alt")||i.title,i.name=e.attr("name")||"",i.color=e.css("backgroundColor");var t=i.title.indexOf(": ");t>0&&(i.description=i.title.substring(t+2)||i.description,i.title=i.title.substring(0,t)||i.title)}else i=!1;else i=!1;return i?i:($.log("ERROR","We dont know what we have:",e),!1)},get:function(e){if("undefined"==typeof e||null===e)return this.active();if("number"==typeof e)e=this.list[e]||!1;else{if(e=this.create(e),!e)return!1;for(var i=!1,t=0;t<this.size();t++){var o=this.list[t];o.src===e.src&&o.title===e.title&&o.description===e.description&&(i=o)}e=i}return e?e:($.log("ERROR","The desired image doesn't exist: ",e,this.list),!1)},debug:function(){return $.Lightbox.debug(arguments)}},constructed:!1,src:null,baseurl:null,files:{js:{lightbox:"js/jquery.lightbox.js",colorBlend:"js/jquery.colorBlend.js"},css:{lightbox:"css/jquery.lightbox.css"},images:{prev:"images/lightbox/previous.gif",next:"images/lightbox/next.gif",blank:"images/lightbox/blank.gif",loading:"../../../images/lightbox/loading.gif"}},text:{image:"Image",of:"of",close:"Close X",closeInfo:"You can also click anywhere outside the image to close.",download:"",help:{close:"Click to close",interact:"Hover to interact"},about:{text:"jQuery Lightbox Plugin (balupton edition)",title:"Licenced under the GNU Affero General Public License.",link:"http://jquery.com/plugins/project/jquerylightbox_bal"}},keys:{close:"c",prev:"p",next:"n"},handlers:{show:null},opacity:.9,padding:null,speed:400,rel:"lightbox",auto_relify:!0,auto_scroll:"follow",auto_resize:!0,ie6:null,ie6_support:!0,ie6_upgrade:!0,colorBlend:null,download_link:!0,show_linkback:!0,show_info:"auto",show_extended_info:"auto",options:["auto_scroll","auto_resize","download_link","show_info","show_extended_info","ie6_support","colorBlend","baseurl","files","text","show_linkback","keys","opacity","padding","speed","rel","auto_relify"],construct:function(e){var t="undefined"==typeof this.constructed||this.constructed===!1;this.constructed=!0;var o=t;if(e=$.extend({},e),t&&"undefined"==typeof e.files)if(this.src=$("script[src*="+this.files.js.lightbox+"]:first").attr("src"),this.src){this.baseurl=this.src.substring(0,this.src.indexOf(this.files.js.lightbox));var s=this;$.each(this.files,function(e){$.each(this,function(i,t){s.files[e][i]=s.baseurl+t})}),delete s,e=$.extend(e,$.params_to_json(this.src))}else o=!1;else if("object"==typeof e.files){var s=this;$.each(e.files,function(){$.each(this,function(e,i){this[e]=s.baseurl+i})}),delete s}else o=!1;for(i in this.options){var n=this.options[i];"object"==typeof e[n]&&"object"==typeof this[n]?this[n]=$.extend(this[n],e[n]):"undefined"!=typeof e[n]&&(this[n]=e[n])}return this.ie6=t&&navigator.userAgent.indexOf("MSIE 6")>=0?!0:!1,(o||"undefined"!=typeof e.download_link||"undefined"!=typeof e.colorBlend||"object"==typeof e.files||"object"==typeof e.text||"undefined"!=typeof e.show_linkback||"undefined"!=typeof e.scroll_with)&&$(function(){$.Lightbox.domReady()}),!0},domReady:function(){var e=document.getElementsByTagName($.browser.safari?"head":"body")[0],i=this.files.css,t=this.files.js;this.colorBlend===!0&&"undefined"==typeof $.colorBlend?this.colorBlend=!0:(this.colorBlend="undefined"!=typeof $.colorBlend,delete t.colorBlend);for(stylesheet in i){var o=document.createElement("link");o.type="text/css",o.rel="stylesheet",o.media="screen",o.href=i[stylesheet],o.id="lightbox-stylesheet-"+stylesheet.replace(/[^a-zA-Z0-9]/g,""),$("#"+o.id).remove(),e.appendChild(o)}for(script in t){var s=document.createElement("script");s.type="text/javascript",s.src=t[script],s.id="lightbox-script-"+script.replace(/[^a-zA-Z0-9]/g,""),$("#"+s.id).remove(),e.appendChild(s)}return delete t,delete i,delete e,$("#lightbox,#lightbox-overlay").remove(),$("body").append('<div id="lightbox-overlay"></div><div id="lightbox"><div class="top"><div class="left"></div><div class="center"></div></div><div class="title">'+this.text.download+'</div><a href="#" class="close"></a><div id="lightbox-imageBox"><img id="lightbox-image" /><div id="lightbox-nav"><a href="#" id="lightbox-nav-btnPrev"></a><a href="#" id="lightbox-nav-btnNext"></a></div><div id="lightbox-loading"><img src="'+this.files.images.loading+'" /></div></div><div id="lightbox-infoBox"><span id="lightbox-currentNumber"></span></div><div class="bottom"><div class="left"></div><div class="center"></div></div></div>'),this.resizeBoxes(),this.repositionBoxes(),$("#lightbox,#lightbox-overlay").hide(),this.ie6&&this.ie6_support&&$("#lightbox-overlay").css({position:"absolute",top:"0px",left:"0px"}),$.each(this.files.images,function(){var e=new Image;e.onload=function(){e.onload=null,e=null},e.src=this}),$(window).unbind().resize(function(){$.Lightbox.resizeBoxes("resized")}),"follow"===this.scroll&&$(window).scroll(function(){$.Lightbox.repositionBoxes()}),$("#lightbox-nav-btnPrev").unbind().hover(function(){$(this).css({background:"url("+$.Lightbox.files.images.prev+") left 45% no-repeat"})},function(){$(this).css({background:"transparent url("+$.Lightbox.files.images.blank+") no-repeat"})}).click(function(){return $.Lightbox.showImage($.Lightbox.images.prev()),!1}),$("#lightbox-nav-btnNext").unbind().hover(function(){$(this).css({background:"url("+$.Lightbox.files.images.next+") right 45% no-repeat"})},function(){$(this).css({background:"transparent url("+$.Lightbox.files.images.blank+") no-repeat"})}).click(function(){return $.Lightbox.showImage($.Lightbox.images.next()),!1}),$("#lightbox-overlay, #lightbox, #lightbox .close").unbind().click(function(){return $.Lightbox.finish(),!1}),this.auto_relify&&this.relify(),!0},relify:function(){var e={},i=0,t=this.rel;return $.each($("[@rel*="+t+"]"),function(o,s){var n=$(s).attr("rel");n===t&&(n=i),"undefined"==typeof e[n]&&(e[n]=[],i++),e[n].push(s)}),$.each(e,function(e,i){$(i).lightbox()}),!0},init:function(e,i){return"undefined"==typeof i&&(i=e,e=0),this.images.clear(),this.images.add(i)?this.images.empty()?($.log("WARNING","Lightbox started, but no images: ",e,i),!1):this.images.active(e)?!0:!1:!1},start:function(){return this.visible=!0,"disable"===this.scroll&&$(document.body).css("overflow","hidden"),$("embed, object, select").css("visibility","hidden"),this.resizeBoxes("general"),this.repositionBoxes({speed:0}),$("#lightbox-image,#lightbox-nav,#lightbox-nav-btnPrev,#lightbox-nav-btnNext").hide(),$("#lightbox-overlay").css("opacity",this.opacity).fadeIn(400,function(){return $("#lightbox").fadeIn(300),$.Lightbox.showImage($.Lightbox.images.active())?void 0:($.Lightbox.finish(),!1)}),!0},finish:function(){$("#lightbox").hide(),$("#lightbox-overlay").fadeOut(function(){$("#lightbox-overlay").hide()}),$("embed, object, select").css({visibility:"visible"}),this.images.active(!1),"disable"===this.scroll&&$(document.body).css("overflow","visible"),this.visible=!1},resizeBoxes:function(e){if("transition"!==e){var i=$(this.ie6?document.body:document);$("#lightbox-overlay").css({width:i.width(),height:i.height()}),delete i}switch(e){case"general":return!0;case"resized":if(this.auto_resize===!1)return this.repositionBoxes({nHeight:u,speed:this.speed}),!0;case"transition":}var t=this.images.active();if(!t||!t.width||!this.visible)return $.log("WARNING","A resize occured while no image or no lightbox..."),!1;var o=t.width,s=t.height,n=$(window).width(),a=$(window).height();if(this.auto_resize!==!1)for(var r,l=Math.floor(.8*n),h=Math.floor(.8*a);o>l||s>h;)o>l&&(r=l/o,o=l,s=Math.floor(s*r)),s>h&&(r=h/s,s=h,o=Math.floor(o*r));var d=$("#lightbox-imageBox").width(),g=$("#lightbox-imageBox").height(),c=o+30,u=s,f=c-20,b=d-c,p=g-u;return $("#lightbox-nav-btnPrev,#lightbox-nav-btnNext").css("height",u),$("#lightbox").css("width",c),$("#lightbox .center").css("width",f),$("#lightbox .bottom").css("width",c),$("#lightbox .top").css("width",c),"transition"===e?0===b&&0===p?(this.pause(this.speed/3),this.showImage(null,3)):($("#lightbox-image").width(o).height(s),$("#lightbox-imageBox").animate({width:c,height:u},this.speed,function(){$.Lightbox.showImage(null,3)})):($("#lightbox-image").animate({width:o,height:s},this.speed),$("#lightbox-imageBox").animate({width:c,height:u},this.speed)),this.repositionBoxes({nHeight:u,speed:this.speed}),!0},repositioning:!1,reposition_failsafe:!1,repositionBoxes:function(e){if(this.repositioning)return this.reposition_failsafe=!0,null;this.repositioning=!0,e=$.extend({},e),e.callback=e.callback||null,e.speed=e.speed||"slow";var i=this.getPageScroll(),t=e.nHeight||parseInt($("#lightbox").height(),10),o=i.yScroll+($(window).height()-t)/2.5,s=i.xScroll+50+"%",n={left:s,top:o};return e.speed?$("#lightbox").animate(n,"slow",function(){$.Lightbox.reposition_failsafe?($.Lightbox.repositioning=$.Lightbox.reposition_failsafe=!1,$.Lightbox.repositionBoxes(e)):($.Lightbox.repositioning=!1,e.callback&&e.callback())}):($("#lightbox").css(n),this.reposition_failsafe?(this.repositioning=this.reposition_failsafe=!1,this.repositionBoxes(e)):this.repositioning=!1),!0},visible:!1,showImage:function(e,i){if(e=this.images.get(e),!e)return e;i=i||1;var t=i>1&&this.images.active().src!==e.src,o=i>2&&$("#lightbox-image").attr("src")!==e.src;switch((t||o)&&($.log("We wanted to skip a few steps: ",e,i,t,o),i=1),i){case 1:if(this.KeyboardNav_Disable(),$("#lightbox-loading").show(),$("#lightbox-image,#lightbox-nav,#lightbox-nav-btnPrev,#lightbox-nav-btnNext,#lightbox-infoBox").hide(),$("#lightbox-imageBox").unbind(),!this.images.active(e))return!1;if(e.width&&e.height)this.showImage(null,2);else{var s=new Image;s.onload=function(){e.width=s.width,e.height=s.height,$.Lightbox.showImage(null,2),s.onload=null,s=null},s.src=e.src}break;case 2:$("#lightbox-image").attr("src",e.src),("undefined"==typeof this.padding||null===this.padding||isNaN(this.padding))&&(this.padding=parseInt($("#lightbox-imageContainer").css("padding-left"),10)||parseInt($("#lightbox-imageContainer").css("padding"),10)||0),this.colorBlend&&($("#lightbox-overlay").animate({backgroundColor:e.color},2*this.speed),$("#lightbox-imageBox").css("borderColor",e.color)),this.resizeBoxes("transition");break;case 3:$("#lightbox-loading").hide(),$("#lightbox-image").fadeIn(1.5*this.speed,function(){$.Lightbox.showImage(null,4)}),this.preloadNeighbours(),null!==this.handlers.show&&this.handlers.show(e);break;case 4:var n=$("#lightbox-caption-title").html(e.title||"Untitled");this.download_link&&n.attr("href",this.download_link?e.src:""),delete n,$("#lightbox-caption-seperator").html(e.description?": ":""),$("#lightbox-caption-description").html(e.description||"&nbsp;"),this.images.size()>1?$("#lightbox-currentNumber").html(this.text.image+"&nbsp;"+(e.index+1)+"&nbsp;"+this.text.of+"&nbsp;"+this.images.size()):$("#lightbox-currentNumber").html("&nbsp;"),this.show_extended_info===!0?($("#lightbox-imageBox").trigger("mouseover"),$("#lightbox-infoBox").trigger("mouseover")):this.show_info===!0&&$("#lightbox-imageBox").trigger("mouseover"),$("#lightbox-nav-btnPrev, #lightbox-nav-btnNext").css({background:"transparent url("+this.files.images.blank+") no-repeat"}),this.images.first(e)||$("#lightbox-nav-btnPrev").show(),this.images.last(e)||$("#lightbox-nav-btnNext").show(),$("#lightbox-nav").show(),this.KeyboardNav_Enable();break;default:return $.log("ERROR","Don't know what to do: ",e,i),this.showImage(e,1)}return!0},preloadNeighbours:function(){if(this.images.single()||this.images.empty())return!0;var e=this.images.active();if(!e)return e;var i,t=this.images.prev(e);t&&(i=new Image,i.src=t.src);var o=this.images.next(e);o&&(i=new Image,i.src=o.src)},KeyboardNav_Enable:function(){$(document).keydown(function(e){$.Lightbox.KeyboardNav_Action(e)})},KeyboardNav_Disable:function(){$(document).unbind()},KeyboardNav_Action:function(e){e=e||window.event;var i=e.keyCode,t=e.DOM_VK_ESCAPE||27,o=String.fromCharCode(i).toLowerCase();return o===this.keys.close||i===t?$.Lightbox.finish():o===this.keys.prev||37===i?$.Lightbox.showImage($.Lightbox.images.prev()):o===this.keys.next||39===i?$.Lightbox.showImage($.Lightbox.images.next()):!0},getPageScroll:function(){var e,i;self.pageYOffset?(i=self.pageYOffset,e=self.pageXOffset):document.documentElement&&document.documentElement.scrollTop?(i=document.documentElement.scrollTop,e=document.documentElement.scrollLeft):document.body&&(i=document.body.scrollTop,e=document.body.scrollLeft);var t={xScroll:e,yScroll:i};return t},pause:function(e){var i=new Date,t=null;do t=new Date;while(e>t-i)}}),"undefined"==typeof $.Lightbox&&($.Lightbox=new $.LightboxClass)}(jQuery);