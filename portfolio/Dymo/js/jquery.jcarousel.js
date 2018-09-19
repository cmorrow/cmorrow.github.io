/**
 * jCarousel - Riding carousels with jQuery
 *   http://sorgalla.com/jcarousel/
 *
 * Copyright (c) 2006 Jan Sorgalla (http://sorgalla.com)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * Built on top of the jQuery library
 *   http://jquery.com
 *
 * Inspired by the "Carousel Component" by Bill Scott
 *   http://billwscott.com/carousel/
 */
!function(t){t.fn.jcarousel=function(t){return this.each(function(){new s(this,t)})};var i={vertical:!1,start:1,offset:1,size:null,scroll:3,visible:null,animation:"normal",easing:"swing",auto:0,wrap:null,initCallback:null,reloadCallback:null,itemLoadCallback:null,itemFirstInCallback:null,itemFirstOutCallback:null,itemLastInCallback:null,itemLastOutCallback:null,itemVisibleInCallback:null,itemVisibleOutCallback:null,buttonNextHTML:"<div></div>",buttonPrevHTML:"<div></div>",buttonNextEvent:"click",buttonPrevEvent:"click",buttonNextCallback:null,buttonPrevCallback:null};t.jcarousel=function(s,n){this.options=t.extend({},i,n||{}),this.locked=!1,this.container=null,this.clip=null,this.list=null,this.buttonNext=null,this.buttonPrev=null,this.wh=this.options.vertical?"height":"width",this.lt=this.options.vertical?"top":"left";for(var l="",o=s.className.split(" "),e=0;e<o.length;e++)if(-1!=o[e].indexOf("jcarousel-skin")){t(s).removeClass(o[e]);var l=o[e];break}"UL"==s.nodeName||"OL"==s.nodeName?(this.list=t(s),this.container=this.list.parent(),this.container.hasClass("jcarousel-clip")?(this.container.parent().hasClass("jcarousel-container")||(this.container=this.container.wrap("<div></div>")),this.container=this.container.parent()):this.container.hasClass("jcarousel-container")||(this.container=this.list.wrap("<div></div>").parent())):(this.container=t(s),this.list=t(s).find(">ul,>ol,div>ul,div>ol")),""!=l&&-1==this.container.parent()[0].className.indexOf("jcarousel-skin")&&this.container.wrap('<div class=" '+l+'"></div>'),this.clip=this.list.parent(),this.clip.length&&this.clip.hasClass("jcarousel-clip")||(this.clip=this.list.wrap("<div></div>").parent()),this.buttonPrev=t(".jcarousel-prev",this.container),0==this.buttonPrev.size()&&null!=this.options.buttonPrevHTML&&(this.buttonPrev=this.clip.before(this.options.buttonPrevHTML).prev()),this.buttonPrev.addClass(this.className("jcarousel-prev")),this.buttonNext=t(".jcarousel-next",this.container),0==this.buttonNext.size()&&null!=this.options.buttonNextHTML&&(this.buttonNext=this.clip.before(this.options.buttonNextHTML).prev()),this.buttonNext.addClass(this.className("jcarousel-next")),this.clip.addClass(this.className("jcarousel-clip")),this.list.addClass(this.className("jcarousel-list")),this.container.addClass(this.className("jcarousel-container"));var a=null!=this.options.visible?Math.ceil(this.clipping()/this.options.visible):null,h=this.list.children("li"),r=this;if(h.size()>0){var c=0,e=this.options.offset;h.each(function(){r.format(this,e++),c+=r.dimension(this,a)}),this.list.css(this.wh,c+"px"),n&&void 0!==n.size||(this.options.size=h.size())}this.container.css("display","block"),this.buttonNext.css("display","block"),this.buttonPrev.css("display","block"),this.funcNext=function(){r.next()},this.funcPrev=function(){r.prev()},this.funcResize=function(){r.reload()},null!=this.options.initCallback&&this.options.initCallback(this,"init"),t.browser.safari?(this.buttons(!1,!1),t(window).bind("load",function(){r.setup()})):this.setup()};var s=t.jcarousel;s.fn=s.prototype={jcarousel:"0.2.3"},s.fn.extend=s.extend=t.extend,s.fn.extend({setup:function(){if(this.first=null,this.last=null,this.prevFirst=null,this.prevLast=null,this.animating=!1,this.timer=null,this.tail=null,this.inTail=!1,!this.locked){this.list.css(this.lt,this.pos(this.options.offset)+"px");var i=this.pos(this.options.start);this.prevFirst=this.prevLast=null,this.animate(i,!1),t(window).unbind("resize",this.funcResize).bind("resize",this.funcResize)}},reset:function(){this.list.empty(),this.list.css(this.lt,"0px"),this.list.css(this.wh,"10px"),null!=this.options.initCallback&&this.options.initCallback(this,"reset"),this.setup()},reload:function(){if(null!=this.tail&&this.inTail&&this.list.css(this.lt,s.intval(this.list.css(this.lt))+this.tail),this.tail=null,this.inTail=!1,null!=this.options.reloadCallback&&this.options.reloadCallback(this),null!=this.options.visible){var i=this,n=Math.ceil(this.clipping()/this.options.visible),l=0,o=0;t("li",this.list).each(function(t){l+=i.dimension(this,n),t+1<i.first&&(o=l)}),this.list.css(this.wh,l+"px"),this.list.css(this.lt,-o+"px")}this.scroll(this.first,!1)},lock:function(){this.locked=!0,this.buttons()},unlock:function(){this.locked=!1,this.buttons()},size:function(t){return void 0!=t&&(this.options.size=t,this.locked||this.buttons()),this.options.size},has:function(t,i){void 0!=i&&i||(i=t),null!==this.options.size&&i>this.options.size&&(i=this.options.size);for(var s=t;i>=s;s++){var n=this.get(s);if(!n.length||n.hasClass("jcarousel-item-placeholder"))return!1}return!0},get:function(i){return t(".jcarousel-item-"+i,this.list)},add:function(t,i){var n=this.get(t),l=0;if(0==n.length){for(var o,n=this.create(t),e=s.intval(t);o=this.get(--e);)if(0>=e||o.length){0>=e?this.list.prepend(n):o.after(n);break}}else l=this.dimension(n);n.removeClass(this.className("jcarousel-item-placeholder")),"string"==typeof i?n.html(i):n.empty().append(i);var a=null!=this.options.visible?Math.ceil(this.clipping()/this.options.visible):null,h=this.dimension(n,a)-l;return t>0&&t<this.first&&this.list.css(this.lt,s.intval(this.list.css(this.lt))-h+"px"),this.list.css(this.wh,s.intval(this.list.css(this.wh))+h+"px"),n},remove:function(t){var i=this.get(t);if(i.length&&!(t>=this.first&&t<=this.last)){var n=this.dimension(i);t<this.first&&this.list.css(this.lt,s.intval(this.list.css(this.lt))+n+"px"),i.remove(),this.list.css(this.wh,s.intval(this.list.css(this.wh))-n+"px")}},next:function(){this.stopAuto(),null==this.tail||this.inTail?this.scroll("both"!=this.options.wrap&&"last"!=this.options.wrap||null==this.options.size||this.last!=this.options.size?this.first+this.options.scroll:1):this.scrollTail(!1)},prev:function(){this.stopAuto(),null!=this.tail&&this.inTail?this.scrollTail(!0):this.scroll("both"!=this.options.wrap&&"first"!=this.options.wrap||null==this.options.size||1!=this.first?this.first-this.options.scroll:this.options.size)},scrollTail:function(t){if(!this.locked&&!this.animating&&this.tail){var i=s.intval(this.list.css(this.lt));t?i+=this.tail:i-=this.tail,this.inTail=!t,this.prevFirst=this.first,this.prevLast=this.last,this.animate(i)}},scroll:function(t,i){this.locked||this.animating||this.animate(this.pos(t),i)},pos:function(t){if(!this.locked&&!this.animating){"circular"!=this.options.wrap&&(t=1>t?1:this.options.size&&t>this.options.size?this.options.size:t);for(var i=this.first>t,n=s.intval(this.list.css(this.lt)),l="circular"!=this.options.wrap&&this.first<=1?1:this.first,o=i?this.get(l):this.get(this.last),e=i?l:l-1,a=null,h=0,r=!1,c=0;i?--e>=t:++e<t;)a=this.get(e),r=!a.length,0==a.length&&(a=this.create(e).addClass(this.className("jcarousel-item-placeholder")),o[i?"before":"after"](a)),o=a,c=this.dimension(a),r&&(h+=c),null!=this.first&&("circular"==this.options.wrap||e>=1&&(null==this.options.size||e<=this.options.size))&&(n=i?n+c:n-c);for(var u=this.clipping(),p=[],f=0,e=t,v=0,o=this.get(t-1);++f;){a=this.get(e),r=!a.length,0==a.length&&(a=this.create(e).addClass(this.className("jcarousel-item-placeholder")),0==o.length?this.list.prepend(a):o[i?"before":"after"](a)),o=a;var c=this.dimension(a);if(0==c)return 0;if("circular"!=this.options.wrap&&null!==this.options.size&&e>this.options.size?p.push(a):r&&(h+=c),v+=c,v>=u)break;e++}for(var d=0;d<p.length;d++)p[d].remove();h>0&&(this.list.css(this.wh,this.dimension(this.list)+h+"px"),i&&(n-=h,this.list.css(this.lt,s.intval(this.list.css(this.lt))-h+"px")));var b=t+f-1;if("circular"!=this.options.wrap&&this.options.size&&b>this.options.size&&(b=this.options.size),e>b)for(f=0,e=b,v=0;++f;){var a=this.get(e--);if(!a.length)break;if(v+=this.dimension(a),v>=u)break}var m=b-f+1;if("circular"!=this.options.wrap&&1>m&&(m=1),this.inTail&&i&&(n+=this.tail,this.inTail=!1),this.tail=null,"circular"!=this.options.wrap&&b==this.options.size&&b-f+1>=1){var g=s.margin(this.get(b),this.options.vertical?"marginBottom":"marginRight");v-g>u&&(this.tail=v-u-g)}for(;t-->m;)n+=this.dimension(this.get(t));return this.prevFirst=this.first,this.prevLast=this.last,this.first=m,this.last=b,n}},animate:function(t,i){if(!this.locked&&!this.animating){this.animating=!0;var s=this,n=function(){s.animating=!1,0==t&&s.list.css(s.lt,0),("both"==s.options.wrap||"last"==s.options.wrap||null==s.options.size||s.last<s.options.size)&&s.startAuto(),s.buttons(),s.notify("onAfterAnimation")};if(this.notify("onBeforeAnimation"),this.options.animation&&0!=i){var l=this.options.vertical?{top:t}:{left:t};this.list.animate(l,this.options.animation,this.options.easing,n)}else this.list.css(this.lt,t+"px"),n()}},startAuto:function(t){if(void 0!=t&&(this.options.auto=t),0==this.options.auto)return this.stopAuto();if(null==this.timer){var i=this;this.timer=setTimeout(function(){i.next()},1e3*this.options.auto)}},stopAuto:function(){null!=this.timer&&(clearTimeout(this.timer),this.timer=null)},buttons:function(t,i){if(void 0==t||null==t){var t=!this.locked&&0!==this.options.size&&(this.options.wrap&&"first"!=this.options.wrap||null==this.options.size||this.last<this.options.size);this.locked||this.options.wrap&&"first"!=this.options.wrap||null==this.options.size||!(this.last>=this.options.size)||(t=null!=this.tail&&!this.inTail)}if(void 0==i||null==i){var i=!this.locked&&0!==this.options.size&&(this.options.wrap&&"last"!=this.options.wrap||this.first>1);this.locked||this.options.wrap&&"last"!=this.options.wrap||null==this.options.size||1!=this.first||(i=null!=this.tail&&this.inTail)}var s=this;this.buttonNext[t?"bind":"unbind"](this.options.buttonNextEvent,this.funcNext)[t?"removeClass":"addClass"](this.className("jcarousel-next-disabled")).attr("disabled",t?!1:!0),this.buttonPrev[i?"bind":"unbind"](this.options.buttonPrevEvent,this.funcPrev)[i?"removeClass":"addClass"](this.className("jcarousel-prev-disabled")).attr("disabled",i?!1:!0),this.buttonNext.length>0&&(void 0==this.buttonNext[0].jcarouselstate||this.buttonNext[0].jcarouselstate!=t)&&null!=this.options.buttonNextCallback&&(this.buttonNext.each(function(){s.options.buttonNextCallback(s,this,t)}),this.buttonNext[0].jcarouselstate=t),this.buttonPrev.length>0&&(void 0==this.buttonPrev[0].jcarouselstate||this.buttonPrev[0].jcarouselstate!=i)&&null!=this.options.buttonPrevCallback&&(this.buttonPrev.each(function(){s.options.buttonPrevCallback(s,this,i)}),this.buttonPrev[0].jcarouselstate=i)},notify:function(t){var i=null==this.prevFirst?"init":this.prevFirst<this.first?"next":"prev";this.callback("itemLoadCallback",t,i),this.prevFirst!==this.first&&(this.callback("itemFirstInCallback",t,i,this.first),this.callback("itemFirstOutCallback",t,i,this.prevFirst)),this.prevLast!==this.last&&(this.callback("itemLastInCallback",t,i,this.last),this.callback("itemLastOutCallback",t,i,this.prevLast)),this.callback("itemVisibleInCallback",t,i,this.first,this.last,this.prevFirst,this.prevLast),this.callback("itemVisibleOutCallback",t,i,this.prevFirst,this.prevLast,this.first,this.last)},callback:function(i,s,n,l,o,e,a){if(void 0!=this.options[i]&&("object"==typeof this.options[i]||"onAfterAnimation"==s)){var h="object"==typeof this.options[i]?this.options[i][s]:this.options[i];if(t.isFunction(h)){var r=this;if(void 0===l)h(r,n,s);else if(void 0===o)this.get(l).each(function(){h(r,this,l,n,s)});else for(var c=l;o>=c;c++)null===c||c>=e&&a>=c||this.get(c).each(function(){h(r,this,c,n,s)})}}},create:function(t){return this.format("<li></li>",t)},format:function(i,s){var n=t(i).addClass(this.className("jcarousel-item")).addClass(this.className("jcarousel-item-"+s));return n.attr("jcarouselindex",s),n},className:function(t){return t+" "+t+(this.options.vertical?"-vertical":"-horizontal")},dimension:function(i,n){var l=void 0!=i.jquery?i[0]:i,o=this.options.vertical?l.offsetHeight+s.margin(l,"marginTop")+s.margin(l,"marginBottom"):l.offsetWidth+s.margin(l,"marginLeft")+s.margin(l,"marginRight");if(void 0==n||o==n)return o;var e=this.options.vertical?n-s.margin(l,"marginTop")-s.margin(l,"marginBottom"):n-s.margin(l,"marginLeft")-s.margin(l,"marginRight");return t(l).css(this.wh,e+"px"),this.dimension(l)},clipping:function(){return this.options.vertical?this.clip[0].offsetHeight-s.intval(this.clip.css("borderTopWidth"))-s.intval(this.clip.css("borderBottomWidth")):this.clip[0].offsetWidth-s.intval(this.clip.css("borderLeftWidth"))-s.intval(this.clip.css("borderRightWidth"))},index:function(t,i){return void 0==i&&(i=this.options.size),Math.round(((t-1)/i-Math.floor((t-1)/i))*i)+1}}),s.extend({defaults:function(s){return t.extend(i,s||{})},margin:function(i,n){if(!i)return 0;var l=void 0!=i.jquery?i[0]:i;if("marginRight"==n&&t.browser.safari){var o,e,a={display:"block","float":"none",width:"auto"};return t.swap(l,a,function(){o=l.offsetWidth}),a.marginRight=0,t.swap(l,a,function(){e=l.offsetWidth}),e-o}return s.intval(t.css(l,n))},intval:function(t){return t=parseInt(t),isNaN(t)?0:t}})}(jQuery);