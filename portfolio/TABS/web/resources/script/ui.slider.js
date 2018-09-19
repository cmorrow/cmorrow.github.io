/*
 * jQuery UI Slider 1.7.2
 *
 * Copyright (c) 2009 AUTHORS.txt (http://jqueryui.com/about)
 * Dual licensed under the MIT (MIT-LICENSE.txt)
 * and GPL (GPL-LICENSE.txt) licenses.
 *
 * http://docs.jquery.com/UI/Slider
 *
 * Depends:
 *	ui.core.js
 */
!function(e){e.widget("ui.slider",e.extend({},e.ui.mouse,{_init:function(){var t=this,i=this.options;if(this._keySliding=!1,this._handleIndex=null,this._detectOrientation(),this._mouseInit(),this.element.addClass("ui-slider ui-slider-"+this.orientation+" ui-widget ui-widget-content ui-corner-all"),this.range=e([]),i.range&&(i.range===!0?(this.range=e("<div></div>"),i.values||(i.values=[this._valueMin(),this._valueMin()]),i.values.length&&2!=i.values.length&&(i.values=[i.values[0],i.values[0]])):this.range=e("<div></div>"),this.range.appendTo(this.element).addClass("ui-slider-range"),("min"==i.range||"max"==i.range)&&this.range.addClass("ui-slider-range-"+i.range),this.range.addClass("ui-widget-header")),0==e(".ui-slider-handle",this.element).length&&e('<a href="#"></a>').appendTo(this.element).addClass("ui-slider-handle"),i.values&&i.values.length)for(;e(".ui-slider-handle",this.element).length<i.values.length;)e('<a href="#"></a>').appendTo(this.element).addClass("ui-slider-handle");this.handles=e(".ui-slider-handle",this.element).addClass("ui-state-default ui-corner-all"),this.handle=this.handles.eq(0),this.handles.add(this.range).filter("a").click(function(e){e.preventDefault()}).hover(function(){i.disabled||e(this).addClass("ui-state-hover")},function(){e(this).removeClass("ui-state-hover")}).focus(function(){i.disabled?e(this).blur():(e(".ui-slider .ui-state-focus").removeClass("ui-state-focus"),e(this).addClass("ui-state-focus"))}).blur(function(){e(this).removeClass("ui-state-focus")}),this.handles.each(function(t){e(this).data("index.ui-slider-handle",t)}),this.handles.keydown(function(i){var s=!0,a=e(this).data("index.ui-slider-handle");if(!t.options.disabled){switch(i.keyCode){case e.ui.keyCode.HOME:case e.ui.keyCode.END:case e.ui.keyCode.UP:case e.ui.keyCode.RIGHT:case e.ui.keyCode.DOWN:case e.ui.keyCode.LEFT:s=!1,t._keySliding||(t._keySliding=!0,e(this).addClass("ui-state-active"),t._start(i,a))}var n,l,h=t._step();switch(n=l=t.options.values&&t.options.values.length?t.values(a):t.value(),i.keyCode){case e.ui.keyCode.HOME:l=t._valueMin();break;case e.ui.keyCode.END:l=t._valueMax();break;case e.ui.keyCode.UP:case e.ui.keyCode.RIGHT:if(n==t._valueMax())return;l=n+h;break;case e.ui.keyCode.DOWN:case e.ui.keyCode.LEFT:if(n==t._valueMin())return;l=n-h}return t._slide(i,a,l),s}}).keyup(function(i){var s=e(this).data("index.ui-slider-handle");t._keySliding&&(t._stop(i,s),t._change(i,s),t._keySliding=!1,e(this).removeClass("ui-state-active"))}),this._refreshValue()},destroy:function(){this.handles.remove(),this.range.remove(),this.element.removeClass("ui-slider ui-slider-horizontal ui-slider-vertical ui-slider-disabled ui-widget ui-widget-content ui-corner-all").removeData("slider").unbind(".slider"),this._mouseDestroy()},_mouseCapture:function(t){var i=this.options;if(i.disabled)return!1;this.elementSize={width:this.element.outerWidth(),height:this.element.outerHeight()},this.elementOffset=this.element.offset();var s,a,n={x:t.pageX,y:t.pageY},l=this._normValueFromMouse(n),h=this._valueMax()-this._valueMin()+1,u=this;this.handles.each(function(t){var i=Math.abs(l-u.values(t));h>i&&(h=i,s=e(this),a=t)}),1==i.range&&this.values(1)==i.min&&(s=e(this.handles[++a])),this._start(t,a),u._handleIndex=a,s.addClass("ui-state-active").focus();var o=s.offset(),r=!e(t.target).parents().andSelf().is(".ui-slider-handle");return this._clickOffset=r?{left:0,top:0}:{left:t.pageX-o.left-s.width()/2,top:t.pageY-o.top-s.height()/2-(parseInt(s.css("borderTopWidth"),10)||0)-(parseInt(s.css("borderBottomWidth"),10)||0)+(parseInt(s.css("marginTop"),10)||0)},l=this._normValueFromMouse(n),this._slide(t,a,l),!0},_mouseStart:function(){return!0},_mouseDrag:function(e){var t={x:e.pageX,y:e.pageY},i=this._normValueFromMouse(t);return this._slide(e,this._handleIndex,i),!1},_mouseStop:function(e){return this.handles.removeClass("ui-state-active"),this._stop(e,this._handleIndex),this._change(e,this._handleIndex),this._handleIndex=null,this._clickOffset=null,!1},_detectOrientation:function(){this.orientation="vertical"==this.options.orientation?"vertical":"horizontal"},_normValueFromMouse:function(e){var t,i;"horizontal"==this.orientation?(t=this.elementSize.width,i=e.x-this.elementOffset.left-(this._clickOffset?this._clickOffset.left:0)):(t=this.elementSize.height,i=e.y-this.elementOffset.top-(this._clickOffset?this._clickOffset.top:0));var s=i/t;s>1&&(s=1),0>s&&(s=0),"vertical"==this.orientation&&(s=1-s);var a=this._valueMax()-this._valueMin(),n=s*a,l=n%this.options.step,h=this._valueMin()+n-l;return l>this.options.step/2&&(h+=this.options.step),parseFloat(h.toFixed(5))},_start:function(e,t){var i={handle:this.handles[t],value:this.value()};this.options.values&&this.options.values.length&&(i.value=this.values(t),i.values=this.values()),this._trigger("start",e,i)},_slide:function(e,t,i){this.handles[t];if(this.options.values&&this.options.values.length){var s=this.values(t?0:1);if(2==this.options.values.length&&this.options.range===!0&&(0==t&&i>s||1==t&&s>i)&&(i=s),i!=this.values(t)){var a=this.values();a[t]=i;var n=this._trigger("slide",e,{handle:this.handles[t],value:i,values:a}),s=this.values(t?0:1);n!==!1&&this.values(t,i,"mousedown"==e.type&&this.options.animate,!0)}}else if(i!=this.value()){var n=this._trigger("slide",e,{handle:this.handles[t],value:i});n!==!1&&this._setData("value",i,"mousedown"==e.type&&this.options.animate)}},_stop:function(e,t){var i={handle:this.handles[t],value:this.value()};this.options.values&&this.options.values.length&&(i.value=this.values(t),i.values=this.values()),this._trigger("stop",e,i)},_change:function(e,t){var i={handle:this.handles[t],value:this.value()};this.options.values&&this.options.values.length&&(i.value=this.values(t),i.values=this.values()),this._trigger("change",e,i)},value:function(e){return arguments.length&&(this._setData("value",e),this._change(null,0)),this._value()},values:function(e,t,i,s){return arguments.length>1&&(this.options.values[e]=t,this._refreshValue(i),s||this._change(null,e)),arguments.length?this.options.values&&this.options.values.length?this._values(e):this.value():this._values()},_setData:function(t,i,s){switch(e.widget.prototype._setData.apply(this,arguments),t){case"disabled":i?(this.handles.filter(".ui-state-focus").blur(),this.handles.removeClass("ui-state-hover"),this.handles.attr("disabled","disabled")):this.handles.removeAttr("disabled");case"orientation":this._detectOrientation(),this.element.removeClass("ui-slider-horizontal ui-slider-vertical").addClass("ui-slider-"+this.orientation),this._refreshValue(s);break;case"value":this._refreshValue(s)}},_step:function(){var e=this.options.step;return e},_value:function(){var e=this.options.value;return e<this._valueMin()&&(e=this._valueMin()),e>this._valueMax()&&(e=this._valueMax()),e},_values:function(e){if(arguments.length){var t=this.options.values[e];return t<this._valueMin()&&(t=this._valueMin()),t>this._valueMax()&&(t=this._valueMax()),t}return this.options.values},_valueMin:function(){var e=this.options.min;return e},_valueMax:function(){var e=this.options.max;return e},_refreshValue:function(t){var i=this.options.range,s=this.options,a=this;if(this.options.values&&this.options.values.length){this.handles.each(function(i){var n=(a.values(i)-a._valueMin())/(a._valueMax()-a._valueMin())*100,l={};l["horizontal"==a.orientation?"left":"bottom"]=n+"%",e(this).stop(1,1)[t?"animate":"css"](l,s.animate),a.options.range===!0&&("horizontal"==a.orientation?(0==i&&a.range.stop(1,1)[t?"animate":"css"]({left:n+"%"},s.animate),1==i&&a.range[t?"animate":"css"]({width:n-lastValPercent+"%"},{queue:!1,duration:s.animate})):(0==i&&a.range.stop(1,1)[t?"animate":"css"]({bottom:n+"%"},s.animate),1==i&&a.range[t?"animate":"css"]({height:n-lastValPercent+"%"},{queue:!1,duration:s.animate}))),lastValPercent=n})}else{var n=this.value(),l=this._valueMin(),h=this._valueMax(),u=h!=l?(n-l)/(h-l)*100:0,o={};o["horizontal"==a.orientation?"left":"bottom"]=u+"%",this.handle.stop(1,1)[t?"animate":"css"](o,s.animate),"min"==i&&"horizontal"==this.orientation&&this.range.stop(1,1)[t?"animate":"css"]({width:u+"%"},s.animate),"max"==i&&"horizontal"==this.orientation&&this.range[t?"animate":"css"]({width:100-u+"%"},{queue:!1,duration:s.animate}),"min"==i&&"vertical"==this.orientation&&this.range.stop(1,1)[t?"animate":"css"]({height:u+"%"},s.animate),"max"==i&&"vertical"==this.orientation&&this.range[t?"animate":"css"]({height:100-u+"%"},{queue:!1,duration:s.animate})}}})),e.extend(e.ui.slider,{getter:"value values",version:"1.7.2",eventPrefix:"slide",defaults:{animate:!1,delay:0,distance:0,max:100,min:0,orientation:"horizontal",range:!1,step:1,value:0,values:null}})}(jQuery);