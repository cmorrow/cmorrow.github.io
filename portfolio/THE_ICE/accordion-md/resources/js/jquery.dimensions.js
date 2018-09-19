/* Copyright (c) 2007 Paul Bakaus (paul.bakaus@googlemail.com) and Brandon Aaron (brandon.aaron@gmail.com || http://brandonaaron.net)
 * Dual licensed under the MIT (http://www.opensource.org/licenses/mit-license.php)
 * and GPL (http://www.opensource.org/licenses/gpl-license.php) licenses.
 *
 * $LastChangedDate: 2007-10-06 20:11:15 +0200 (Sa, 06 Okt 2007) $
 * $Rev: 3581 $
 *
 * Version: @VERSION
 *
 * Requires: jQuery 1.2+
 */
!function(t){function i(i,o){return parseInt(t.css(i.jquery?i[0]:i,o))||0}t.dimensions={version:"@VERSION"},t.each(["Height","Width"],function(o,e){t.fn["inner"+e]=function(){if(this[0]){var t="Height"==e?"Top":"Left",o="Height"==e?"Bottom":"Right";return i(this,e.toLowerCase())+i(this,"padding"+t)+i(this,"padding"+o)}},t.fn["outer"+e]=function(o){if(this[0]){var n="Height"==e?"Top":"Left",s="Height"==e?"Bottom":"Right";return o=t.extend({margin:!1},o||{}),i(this,e.toLowerCase())+i(this,"border"+n+"Width")+i(this,"border"+s+"Width")+i(this,"padding"+n)+i(this,"padding"+s)+(o.margin?i(this,"margin"+n)+i(this,"margin"+s):0)}}}),t.each(["Left","Top"],function(i,o){t.fn["scroll"+o]=function(i){return this[0]?void 0!=i?this.each(function(){this==window||this==document?window.scrollTo("Left"==o?i:t(window).scrollLeft(),"Top"==o?i:t(window).scrollTop()):this["scroll"+o]=i}):this[0]==window||this[0]==document?self["Left"==o?"pageXOffset":"pageYOffset"]||t.boxModel&&document.documentElement["scroll"+o]||document.body["scroll"+o]:this[0]["scroll"+o]:void 0}}),t.fn.extend({position:function(){var t,o,e,n,s=this[0];return s&&(e=this.offsetParent(),t=this.offset(),o=e.offset(),t.top-=i(s,"marginTop"),t.left-=i(s,"marginLeft"),o.top+=i(e,"borderTopWidth"),o.left+=i(e,"borderLeftWidth"),n={top:t.top-o.top,left:t.left-o.left}),n},offsetParent:function(){for(var i=this[0].offsetParent;i&&!/^body|html$/i.test(i.tagName)&&"static"==t.css(i,"position");)i=i.offsetParent;return t(i)}})}(jQuery);