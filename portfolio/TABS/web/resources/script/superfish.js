/*
 * Superfish v1.4.8 - jQuery menu widget
 * Copyright (c) 2008 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 * 	http://www.opensource.org/licenses/mit-license.php
 * 	http://www.gnu.org/licenses/gpl.html
 *
 * CHANGELOG: http://users.tpg.com.au/j_birch/plugins/superfish/changelog.txt
 */
!function(s){s.fn.superfish=function(a){var i=s.fn.superfish,n=i.c,o=s(['<span class="',n.arrowClass,'"> &#187;</span>'].join("")),e=function(){var a=s(this),i=l(a);clearTimeout(i.sfTimer),a.showSuperfishUl().siblings().hideSuperfishUl()},t=function(){var a=s(this),n=l(a),o=i.op;clearTimeout(n.sfTimer),n.sfTimer=setTimeout(function(){o.retainPath=s.inArray(a[0],o.$path)>-1,a.hideSuperfishUl(),o.$path.length&&a.parents(["li.",o.hoverClass].join("")).length<1&&e.call(o.$path)},o.delay)},l=function(s){var a=s.parents(["ul.",n.menuClass,":first"].join(""))[0];return i.op=i.o[a.serial],a},r=function(s){s.addClass(n.anchorClass).append(o.clone())};return this.each(function(){var o=this.serial=i.o.length,l=s.extend({},i.defaults,a);l.$path=s("li."+l.pathClass,this).slice(0,l.pathLevels).each(function(){s(this).addClass([l.hoverClass,n.bcClass].join(" ")).filter("li:has(ul)").removeClass(l.pathClass)}),i.o[o]=i.op=l,s("li:has(ul)",this)[s.fn.hoverIntent&&!l.disableHI?"hoverIntent":"hover"](e,t).each(function(){l.autoArrows&&r(s(">a:first-child",this))}).not("."+n.bcClass).hideSuperfishUl();var h=s("a",this);h.each(function(s){var a=h.eq(s).parents("li");h.eq(s).focus(function(){e.call(a)}).blur(function(){t.call(a)})}),l.onInit.call(this)}).each(function(){var a=[n.menuClass];!i.op.dropShadows||s.browser.msie&&s.browser.version<7||a.push(n.shadowClass),s(this).addClass(a.join(" "))})};var a=s.fn.superfish;a.o=[],a.op={},a.IE7fix=function(){var i=a.op;s.browser.msie&&s.browser.version>6&&i.dropShadows&&void 0!=i.animation.opacity&&this.toggleClass(a.c.shadowClass+"-off")},a.c={bcClass:"sf-breadcrumb",menuClass:"sf-js-enabled",anchorClass:"sf-with-ul",arrowClass:"sf-sub-indicator",shadowClass:"sf-shadow"},a.defaults={hoverClass:"sfHover",pathClass:"current",pathLevels:2,delay:500,animation:{opacity:"show"},speed:"normal",autoArrows:!1,dropShadows:!0,disableHI:!1,onInit:function(){},onBeforeShow:function(){},onShow:function(){},onHide:function(){}},s.fn.extend({hideSuperfishUl:function(){var i=a.op,n=i.retainPath===!0?i.$path:"";i.retainPath=!1;var o=s(["li.",i.hoverClass].join(""),this).add(this).not(n).removeClass(i.hoverClass).find(">ul").hide().css("visibility","hidden");return i.onHide.call(o),this},showSuperfishUl:function(){var s=a.op,i=(a.c.shadowClass+"-off",this.addClass(s.hoverClass).find(">ul:hidden").css("visibility","visible"));return a.IE7fix.call(i),s.onBeforeShow.call(i),i.animate(s.animation,s.speed,function(){a.IE7fix.call(i),s.onShow.call(i)}),this}})}(jQuery);