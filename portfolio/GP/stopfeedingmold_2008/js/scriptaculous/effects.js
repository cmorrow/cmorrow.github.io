// Copyright (c) 2005, 2006 Thomas Fuchs (http://script.aculo.us, http://mir.aculo.us)
String.prototype.parseColor=function(){var e="#";if("rgb("==this.slice(0,4)){var t=this.slice(4,this.length-1).split(","),n=0;do e+=parseInt(t[n]).toColorPart();while(++n<3)}else if("#"==this.slice(0,1)){if(4==this.length)for(var n=1;4>n;n++)e+=(this.charAt(n)+this.charAt(n)).toLowerCase();7==this.length&&(e=this.toLowerCase())}return 7==e.length?e:arguments[0]||this},Element.collectTextNodes=function(e){return $A($(e).childNodes).collect(function(e){return 3==e.nodeType?e.nodeValue:e.hasChildNodes()?Element.collectTextNodes(e):""}).flatten().join("")},Element.collectTextNodesIgnoreClass=function(e,t){return $A($(e).childNodes).collect(function(e){return 3==e.nodeType?e.nodeValue:e.hasChildNodes()&&!Element.hasClassName(e,t)?Element.collectTextNodesIgnoreClass(e,t):""}).flatten().join("")},Element.setContentZoom=function(e,t){return e=$(e),e.setStyle({fontSize:t/100+"em"}),navigator.appVersion.indexOf("AppleWebKit")>0&&window.scrollBy(0,0),e},Element.getOpacity=function(e){return $(e).getStyle("opacity")},Element.setOpacity=function(e,t){return $(e).setStyle({opacity:t})},Element.getInlineOpacity=function(e){return $(e).style.opacity||""},Element.forceRerendering=function(e){try{e=$(e);var t=document.createTextNode(" ");e.appendChild(t),e.removeChild(t)}catch(n){}},Array.prototype.call=function(){var e=arguments;this.each(function(t){t.apply(this,e)})};var Effect={_elementDoesNotExistError:{name:"ElementDoesNotExistError",message:"The specified DOM element does not exist, but is required for this effect to operate"},tagifyText:function(e){if("undefined"==typeof Builder)throw"Effect.tagifyText requires including script.aculo.us' builder.js library";var t="position:relative";/MSIE/.test(navigator.userAgent)&&!window.opera&&(t+=";zoom:1"),e=$(e),$A(e.childNodes).each(function(n){3==n.nodeType&&(n.nodeValue.toArray().each(function(i){e.insertBefore(Builder.node("span",{style:t}," "==i?String.fromCharCode(160):i),n)}),Element.remove(n))})},multiple:function(e,t){var n;n="object"!=typeof e&&"function"!=typeof e||!e.length?$(e).childNodes:e;var i=Object.extend({speed:.1,delay:0},arguments[2]||{}),o=i.delay;$A(n).each(function(e,n){new t(e,Object.extend(i,{delay:n*i.speed+o}))})},PAIRS:{slide:["SlideDown","SlideUp"],blind:["BlindDown","BlindUp"],appear:["Appear","Fade"]},toggle:function(e,t){e=$(e),t=(t||"appear").toLowerCase();var n=Object.extend({queue:{position:"end",scope:e.id||"global",limit:1}},arguments[2]||{});Effect[e.visible()?Effect.PAIRS[t][1]:Effect.PAIRS[t][0]](e,n)}},Effect2=Effect;Effect.Transitions={linear:Prototype.K,sinoidal:function(e){return-Math.cos(e*Math.PI)/2+.5},reverse:function(e){return 1-e},flicker:function(e){return-Math.cos(e*Math.PI)/4+.75+Math.random()/4},wobble:function(e){return-Math.cos(e*Math.PI*9*e)/2+.5},pulse:function(e,t){return t=t||5,0==Math.round(e%(1/t)*t)?e*t*2-Math.floor(e*t*2):1-(e*t*2-Math.floor(e*t*2))},none:function(){return 0},full:function(){return 1}},Effect.ScopedQueue=Class.create(),Object.extend(Object.extend(Effect.ScopedQueue.prototype,Enumerable),{initialize:function(){this.effects=[],this.interval=null},_each:function(e){this.effects._each(e)},add:function(e){var t=(new Date).getTime(),n="string"==typeof e.options.queue?e.options.queue:e.options.queue.position;switch(n){case"front":this.effects.findAll(function(e){return"idle"==e.state}).each(function(t){t.startOn+=e.finishOn,t.finishOn+=e.finishOn});break;case"with-last":t=this.effects.pluck("startOn").max()||t;break;case"end":t=this.effects.pluck("finishOn").max()||t}e.startOn+=t,e.finishOn+=t,(!e.options.queue.limit||this.effects.length<e.options.queue.limit)&&this.effects.push(e),this.interval||(this.interval=setInterval(this.loop.bind(this),15))},remove:function(e){this.effects=this.effects.reject(function(t){return t==e}),0==this.effects.length&&(clearInterval(this.interval),this.interval=null)},loop:function(){for(var e=(new Date).getTime(),t=0,n=this.effects.length;n>t;t++)this.effects[t]&&this.effects[t].loop(e)}}),Effect.Queues={instances:$H(),get:function(e){return"string"!=typeof e?e:(this.instances[e]||(this.instances[e]=new Effect.ScopedQueue),this.instances[e])}},Effect.Queue=Effect.Queues.get("global"),Effect.DefaultOptions={transition:Effect.Transitions.sinoidal,duration:1,fps:60,sync:!1,from:0,to:1,delay:0,queue:"parallel"},Effect.Base=function(){},Effect.Base.prototype={position:null,start:function(e){this.options=Object.extend(Object.extend({},Effect.DefaultOptions),e||{}),this.currentFrame=0,this.state="idle",this.startOn=1e3*this.options.delay,this.finishOn=this.startOn+1e3*this.options.duration,this.event("beforeStart"),this.options.sync||Effect.Queues.get("string"==typeof this.options.queue?"global":this.options.queue.scope).add(this)},loop:function(e){if(e>=this.startOn){if(e>=this.finishOn)return this.render(1),this.cancel(),this.event("beforeFinish"),this.finish&&this.finish(),this.event("afterFinish"),void 0;var t=(e-this.startOn)/(this.finishOn-this.startOn),n=Math.round(t*this.options.fps*this.options.duration);n>this.currentFrame&&(this.render(t),this.currentFrame=n)}},render:function(e){"idle"==this.state&&(this.state="running",this.event("beforeSetup"),this.setup&&this.setup(),this.event("afterSetup")),"running"==this.state&&(this.options.transition&&(e=this.options.transition(e)),e*=this.options.to-this.options.from,e+=this.options.from,this.position=e,this.event("beforeUpdate"),this.update&&this.update(e),this.event("afterUpdate"))},cancel:function(){this.options.sync||Effect.Queues.get("string"==typeof this.options.queue?"global":this.options.queue.scope).remove(this),this.state="finished"},event:function(e){this.options[e+"Internal"]&&this.options[e+"Internal"](this),this.options[e]&&this.options[e](this)},inspect:function(){var e=$H();for(property in this)"function"!=typeof this[property]&&(e[property]=this[property]);return"#<Effect:"+e.inspect()+",options:"+$H(this.options).inspect()+">"}},Effect.Parallel=Class.create(),Object.extend(Object.extend(Effect.Parallel.prototype,Effect.Base.prototype),{initialize:function(e){this.effects=e||[],this.start(arguments[1])},update:function(e){this.effects.invoke("render",e)},finish:function(e){this.effects.each(function(t){t.render(1),t.cancel(),t.event("beforeFinish"),t.finish&&t.finish(e),t.event("afterFinish")})}}),Effect.Event=Class.create(),Object.extend(Object.extend(Effect.Event.prototype,Effect.Base.prototype),{initialize:function(){var e=Object.extend({duration:0},arguments[0]||{});this.start(e)},update:Prototype.emptyFunction}),Effect.Opacity=Class.create(),Object.extend(Object.extend(Effect.Opacity.prototype,Effect.Base.prototype),{initialize:function(e){if(this.element=$(e),!this.element)throw Effect._elementDoesNotExistError;!/MSIE/.test(navigator.userAgent)||window.opera||this.element.currentStyle.hasLayout||this.element.setStyle({zoom:1});var t=Object.extend({from:this.element.getOpacity()||0,to:1},arguments[1]||{});this.start(t)},update:function(e){this.element.setOpacity(e)}}),Effect.Move=Class.create(),Object.extend(Object.extend(Effect.Move.prototype,Effect.Base.prototype),{initialize:function(e){if(this.element=$(e),!this.element)throw Effect._elementDoesNotExistError;var t=Object.extend({x:0,y:0,mode:"relative"},arguments[1]||{});this.start(t)},setup:function(){this.element.makePositioned(),this.originalLeft=parseFloat(this.element.getStyle("left")||"0"),this.originalTop=parseFloat(this.element.getStyle("top")||"0"),"absolute"==this.options.mode&&(this.options.x=this.options.x-this.originalLeft,this.options.y=this.options.y-this.originalTop)},update:function(e){this.element.setStyle({left:Math.round(this.options.x*e+this.originalLeft)+"px",top:Math.round(this.options.y*e+this.originalTop)+"px"})}}),Effect.MoveBy=function(e,t,n){return new Effect.Move(e,Object.extend({x:n,y:t},arguments[3]||{}))},Effect.Scale=Class.create(),Object.extend(Object.extend(Effect.Scale.prototype,Effect.Base.prototype),{initialize:function(e,t){if(this.element=$(e),!this.element)throw Effect._elementDoesNotExistError;var n=Object.extend({scaleX:!0,scaleY:!0,scaleContent:!0,scaleFromCenter:!1,scaleMode:"box",scaleFrom:100,scaleTo:t},arguments[2]||{});this.start(n)},setup:function(){this.restoreAfterFinish=this.options.restoreAfterFinish||!1,this.elementPositioning=this.element.getStyle("position"),this.originalStyle={},["top","left","width","height","fontSize"].each(function(e){this.originalStyle[e]=this.element.style[e]}.bind(this)),this.originalTop=this.element.offsetTop,this.originalLeft=this.element.offsetLeft;var e=this.element.getStyle("font-size")||"100%";["em","px","%","pt"].each(function(t){e.indexOf(t)>0&&(this.fontSize=parseFloat(e),this.fontSizeType=t)}.bind(this)),this.factor=(this.options.scaleTo-this.options.scaleFrom)/100,this.dims=null,"box"==this.options.scaleMode&&(this.dims=[this.element.offsetHeight,this.element.offsetWidth]),/^content/.test(this.options.scaleMode)&&(this.dims=[this.element.scrollHeight,this.element.scrollWidth]),this.dims||(this.dims=[this.options.scaleMode.originalHeight,this.options.scaleMode.originalWidth])},update:function(e){var t=this.options.scaleFrom/100+this.factor*e;this.options.scaleContent&&this.fontSize&&this.element.setStyle({fontSize:this.fontSize*t+this.fontSizeType}),this.setDimensions(this.dims[0]*t,this.dims[1]*t)},finish:function(){this.restoreAfterFinish&&this.element.setStyle(this.originalStyle)},setDimensions:function(e,t){var n={};if(this.options.scaleX&&(n.width=Math.round(t)+"px"),this.options.scaleY&&(n.height=Math.round(e)+"px"),this.options.scaleFromCenter){var i=(e-this.dims[0])/2,o=(t-this.dims[1])/2;"absolute"==this.elementPositioning?(this.options.scaleY&&(n.top=this.originalTop-i+"px"),this.options.scaleX&&(n.left=this.originalLeft-o+"px")):(this.options.scaleY&&(n.top=-i+"px"),this.options.scaleX&&(n.left=-o+"px"))}this.element.setStyle(n)}}),Effect.Highlight=Class.create(),Object.extend(Object.extend(Effect.Highlight.prototype,Effect.Base.prototype),{initialize:function(e){if(this.element=$(e),!this.element)throw Effect._elementDoesNotExistError;var t=Object.extend({startcolor:"#ffff99"},arguments[1]||{});this.start(t)},setup:function(){return"none"==this.element.getStyle("display")?(this.cancel(),void 0):(this.oldStyle={},this.options.keepBackgroundImage||(this.oldStyle.backgroundImage=this.element.getStyle("background-image"),this.element.setStyle({backgroundImage:"none"})),this.options.endcolor||(this.options.endcolor=this.element.getStyle("background-color").parseColor("#ffffff")),this.options.restorecolor||(this.options.restorecolor=this.element.getStyle("background-color")),this._base=$R(0,2).map(function(e){return parseInt(this.options.startcolor.slice(2*e+1,2*e+3),16)}.bind(this)),this._delta=$R(0,2).map(function(e){return parseInt(this.options.endcolor.slice(2*e+1,2*e+3),16)-this._base[e]}.bind(this)),void 0)},update:function(e){this.element.setStyle({backgroundColor:$R(0,2).inject("#",function(t,n,i){return t+Math.round(this._base[i]+this._delta[i]*e).toColorPart()}.bind(this))})},finish:function(){this.element.setStyle(Object.extend(this.oldStyle,{backgroundColor:this.options.restorecolor}))}}),Effect.ScrollTo=Class.create(),Object.extend(Object.extend(Effect.ScrollTo.prototype,Effect.Base.prototype),{initialize:function(e){this.element=$(e),this.start(arguments[1]||{})},setup:function(){Position.prepare();var e=Position.cumulativeOffset(this.element);this.options.offset&&(e[1]+=this.options.offset);var t=window.innerHeight?window.height-window.innerHeight:document.body.scrollHeight-(document.documentElement.clientHeight?document.documentElement.clientHeight:document.body.clientHeight);this.scrollStart=Position.deltaY,this.delta=(e[1]>t?t:e[1])-this.scrollStart},update:function(e){Position.prepare(),window.scrollTo(Position.deltaX,this.scrollStart+e*this.delta)}}),Effect.Fade=function(e){e=$(e);var t=e.getInlineOpacity(),n=Object.extend({from:e.getOpacity()||1,to:0,afterFinishInternal:function(e){0==e.options.to&&e.element.hide().setStyle({opacity:t})}},arguments[1]||{});return new Effect.Opacity(e,n)},Effect.Appear=function(e){e=$(e);var t=Object.extend({from:"none"==e.getStyle("display")?0:e.getOpacity()||0,to:1,afterFinishInternal:function(e){e.element.forceRerendering()},beforeSetup:function(e){e.element.setOpacity(e.options.from).show()}},arguments[1]||{});return new Effect.Opacity(e,t)},Effect.Puff=function(e){e=$(e);var t={opacity:e.getInlineOpacity(),position:e.getStyle("position"),top:e.style.top,left:e.style.left,width:e.style.width,height:e.style.height};return new Effect.Parallel([new Effect.Scale(e,200,{sync:!0,scaleFromCenter:!0,scaleContent:!0,restoreAfterFinish:!0}),new Effect.Opacity(e,{sync:!0,to:0})],Object.extend({duration:1,beforeSetupInternal:function(e){Position.absolutize(e.effects[0].element)},afterFinishInternal:function(e){e.effects[0].element.hide().setStyle(t)}},arguments[1]||{}))},Effect.BlindUp=function(e){return e=$(e),e.makeClipping(),new Effect.Scale(e,0,Object.extend({scaleContent:!1,scaleX:!1,restoreAfterFinish:!0,afterFinishInternal:function(e){e.element.hide().undoClipping()}},arguments[1]||{}))},Effect.BlindDown=function(e){e=$(e);var t=e.getDimensions();return new Effect.Scale(e,100,Object.extend({scaleContent:!1,scaleX:!1,scaleFrom:0,scaleMode:{originalHeight:t.height,originalWidth:t.width},restoreAfterFinish:!0,afterSetup:function(e){e.element.makeClipping().setStyle({height:"0px"}).show()},afterFinishInternal:function(e){e.element.undoClipping()}},arguments[1]||{}))},Effect.SwitchOff=function(e){e=$(e);var t=e.getInlineOpacity();return new Effect.Appear(e,Object.extend({duration:.4,from:0,transition:Effect.Transitions.flicker,afterFinishInternal:function(e){new Effect.Scale(e.element,1,{duration:.3,scaleFromCenter:!0,scaleX:!1,scaleContent:!1,restoreAfterFinish:!0,beforeSetup:function(e){e.element.makePositioned().makeClipping()},afterFinishInternal:function(e){e.element.hide().undoClipping().undoPositioned().setStyle({opacity:t})}})}},arguments[1]||{}))},Effect.DropOut=function(e){e=$(e);var t={top:e.getStyle("top"),left:e.getStyle("left"),opacity:e.getInlineOpacity()};return new Effect.Parallel([new Effect.Move(e,{x:0,y:100,sync:!0}),new Effect.Opacity(e,{sync:!0,to:0})],Object.extend({duration:.5,beforeSetup:function(e){e.effects[0].element.makePositioned()},afterFinishInternal:function(e){e.effects[0].element.hide().undoPositioned().setStyle(t)}},arguments[1]||{}))},Effect.Shake=function(e){e=$(e);var t={top:e.getStyle("top"),left:e.getStyle("left")};return new Effect.Move(e,{x:20,y:0,duration:.05,afterFinishInternal:function(e){new Effect.Move(e.element,{x:-40,y:0,duration:.1,afterFinishInternal:function(e){new Effect.Move(e.element,{x:40,y:0,duration:.1,afterFinishInternal:function(e){new Effect.Move(e.element,{x:-40,y:0,duration:.1,afterFinishInternal:function(e){new Effect.Move(e.element,{x:40,y:0,duration:.1,afterFinishInternal:function(e){new Effect.Move(e.element,{x:-20,y:0,duration:.05,afterFinishInternal:function(e){e.element.undoPositioned().setStyle(t)}})}})}})}})}})}})},Effect.SlideDown=function(e){e=$(e).cleanWhitespace();var t=e.down().getStyle("bottom"),n=e.getDimensions();return new Effect.Scale(e,100,Object.extend({scaleContent:!1,scaleX:!1,scaleFrom:window.opera?0:1,scaleMode:{originalHeight:n.height,originalWidth:n.width},restoreAfterFinish:!0,afterSetup:function(e){e.element.makePositioned(),e.element.down().makePositioned(),window.opera&&e.element.setStyle({top:""}),e.element.makeClipping().setStyle({height:"0px"}).show()},afterUpdateInternal:function(e){e.element.down().setStyle({bottom:e.dims[0]-e.element.clientHeight+"px"})},afterFinishInternal:function(e){e.element.undoClipping().undoPositioned(),e.element.down().undoPositioned().setStyle({bottom:t})}},arguments[1]||{}))},Effect.SlideUp=function(e){e=$(e).cleanWhitespace();var t=e.down().getStyle("bottom");return new Effect.Scale(e,window.opera?0:1,Object.extend({scaleContent:!1,scaleX:!1,scaleMode:"box",scaleFrom:100,restoreAfterFinish:!0,beforeStartInternal:function(e){e.element.makePositioned(),e.element.down().makePositioned(),window.opera&&e.element.setStyle({top:""}),e.element.makeClipping().show()},afterUpdateInternal:function(e){e.element.down().setStyle({bottom:e.dims[0]-e.element.clientHeight+"px"})},afterFinishInternal:function(e){e.element.hide().undoClipping().undoPositioned().setStyle({bottom:t}),e.element.down().undoPositioned()}},arguments[1]||{}))},Effect.Squish=function(e){return new Effect.Scale(e,window.opera?1:0,{restoreAfterFinish:!0,beforeSetup:function(e){e.element.makeClipping()},afterFinishInternal:function(e){e.element.hide().undoClipping()}})},Effect.Grow=function(e){e=$(e);var t,n,i,o,s=Object.extend({direction:"center",moveTransition:Effect.Transitions.sinoidal,scaleTransition:Effect.Transitions.sinoidal,opacityTransition:Effect.Transitions.full},arguments[1]||{}),r={top:e.style.top,left:e.style.left,height:e.style.height,width:e.style.width,opacity:e.getInlineOpacity()},a=e.getDimensions();switch(s.direction){case"top-left":t=n=i=o=0;break;case"top-right":t=a.width,n=o=0,i=-a.width;break;case"bottom-left":t=i=0,n=a.height,o=-a.height;break;case"bottom-right":t=a.width,n=a.height,i=-a.width,o=-a.height;break;case"center":t=a.width/2,n=a.height/2,i=-a.width/2,o=-a.height/2}return new Effect.Move(e,{x:t,y:n,duration:.01,beforeSetup:function(e){e.element.hide().makeClipping().makePositioned()},afterFinishInternal:function(e){new Effect.Parallel([new Effect.Opacity(e.element,{sync:!0,to:1,from:0,transition:s.opacityTransition}),new Effect.Move(e.element,{x:i,y:o,sync:!0,transition:s.moveTransition}),new Effect.Scale(e.element,100,{scaleMode:{originalHeight:a.height,originalWidth:a.width},sync:!0,scaleFrom:window.opera?1:0,transition:s.scaleTransition,restoreAfterFinish:!0})],Object.extend({beforeSetup:function(e){e.effects[0].element.setStyle({height:"0px"}).show()},afterFinishInternal:function(e){e.effects[0].element.undoClipping().undoPositioned().setStyle(r)}},s))}})},Effect.Shrink=function(e){e=$(e);var t,n,i=Object.extend({direction:"center",moveTransition:Effect.Transitions.sinoidal,scaleTransition:Effect.Transitions.sinoidal,opacityTransition:Effect.Transitions.none},arguments[1]||{}),o={top:e.style.top,left:e.style.left,height:e.style.height,width:e.style.width,opacity:e.getInlineOpacity()},s=e.getDimensions();switch(i.direction){case"top-left":t=n=0;break;case"top-right":t=s.width,n=0;break;case"bottom-left":t=0,n=s.height;break;case"bottom-right":t=s.width,n=s.height;break;case"center":t=s.width/2,n=s.height/2}return new Effect.Parallel([new Effect.Opacity(e,{sync:!0,to:0,from:1,transition:i.opacityTransition}),new Effect.Scale(e,window.opera?1:0,{sync:!0,transition:i.scaleTransition,restoreAfterFinish:!0}),new Effect.Move(e,{x:t,y:n,sync:!0,transition:i.moveTransition})],Object.extend({beforeStartInternal:function(e){e.effects[0].element.makePositioned().makeClipping()},afterFinishInternal:function(e){e.effects[0].element.hide().undoClipping().undoPositioned().setStyle(o)}},i))},Effect.Pulsate=function(e){e=$(e);var t=arguments[1]||{},n=e.getInlineOpacity(),i=t.transition||Effect.Transitions.sinoidal,o=function(e){return i(1-Effect.Transitions.pulse(e,t.pulses))};return o.bind(i),new Effect.Opacity(e,Object.extend(Object.extend({duration:2,from:0,afterFinishInternal:function(e){e.element.setStyle({opacity:n})}},t),{transition:o}))},Effect.Fold=function(e){e=$(e);var t={top:e.style.top,left:e.style.left,width:e.style.width,height:e.style.height};return e.makeClipping(),new Effect.Scale(e,5,Object.extend({scaleContent:!1,scaleX:!1,afterFinishInternal:function(){new Effect.Scale(e,1,{scaleContent:!1,scaleY:!1,afterFinishInternal:function(e){e.element.hide().undoClipping().setStyle(t)}})}},arguments[1]||{}))},Effect.Morph=Class.create(),Object.extend(Object.extend(Effect.Morph.prototype,Effect.Base.prototype),{initialize:function(e){if(this.element=$(e),!this.element)throw Effect._elementDoesNotExistError;var t=Object.extend({style:{}},arguments[1]||{});if("string"==typeof t.style)if(-1==t.style.indexOf(":")){var n="",i="."+t.style;$A(document.styleSheets).reverse().each(function(e){if(e.cssRules?cssRules=e.cssRules:e.rules&&(cssRules=e.rules),$A(cssRules).reverse().each(function(e){if(i==e.selectorText)throw n=e.style.cssText,$break}),n)throw $break}),this.style=n.parseStyle(),t.afterFinishInternal=function(e){e.element.addClassName(e.options.style),e.transforms.each(function(t){"opacity"!=t.style&&(e.element.style[t.style.camelize()]="")})}}else this.style=t.style.parseStyle();else this.style=$H(t.style);this.start(t)},setup:function(){function e(e){return(!e||["rgba(0, 0, 0, 0)","transparent"].include(e))&&(e="#ffffff"),e=e.parseColor(),$R(0,2).map(function(t){return parseInt(e.slice(2*t+1,2*t+3),16)})}this.transforms=this.style.map(function(t){var n=t[0].underscore().dasherize(),i=t[1],o=null;if("#zzzzzz"!=i.parseColor("#zzzzzz"))i=i.parseColor(),o="color";else if("opacity"==n)i=parseFloat(i),!/MSIE/.test(navigator.userAgent)||window.opera||this.element.currentStyle.hasLayout||this.element.setStyle({zoom:1});else if(Element.CSS_LENGTH.test(i))var s=i.match(/^([\+\-]?[0-9\.]+)(.*)$/),i=parseFloat(s[1]),o=3==s.length?s[2]:null;var r=this.element.getStyle(n);return $H({style:n,originalValue:"color"==o?e(r):parseFloat(r||0),targetValue:"color"==o?e(i):i,unit:o})}.bind(this)).reject(function(e){return e.originalValue==e.targetValue||"color"!=e.unit&&(isNaN(e.originalValue)||isNaN(e.targetValue))})},update:function(e){var t=$H(),n=null;this.transforms.each(function(i){n="color"==i.unit?$R(0,2).inject("#",function(t,n,o){return t+Math.round(i.originalValue[o]+(i.targetValue[o]-i.originalValue[o])*e).toColorPart()}):i.originalValue+Math.round((i.targetValue-i.originalValue)*e*1e3)/1e3+i.unit,t[i.style]=n}),this.element.setStyle(t)}}),Effect.Transform=Class.create(),Object.extend(Effect.Transform.prototype,{initialize:function(e){this.tracks=[],this.options=arguments[1]||{},this.addTracks(e)},addTracks:function(e){return e.each(function(e){var t=$H(e).values().first();this.tracks.push($H({ids:$H(e).keys().first(),effect:Effect.Morph,options:{style:t}}))}.bind(this)),this},play:function(){return new Effect.Parallel(this.tracks.map(function(e){var t=[$(e.ids)||$$(e.ids)].flatten();return t.map(function(t){return new e.effect(t,Object.extend({sync:!0},e.options))})}).flatten(),this.options)}}),Element.CSS_PROPERTIES=$w("backgroundColor backgroundPosition borderBottomColor borderBottomStyle borderBottomWidth borderLeftColor borderLeftStyle borderLeftWidth borderRightColor borderRightStyle borderRightWidth borderSpacing borderTopColor borderTopStyle borderTopWidth bottom clip color fontSize fontWeight height left letterSpacing lineHeight marginBottom marginLeft marginRight marginTop markerOffset maxHeight maxWidth minHeight minWidth opacity outlineColor outlineOffset outlineWidth paddingBottom paddingLeft paddingRight paddingTop right textIndent top width wordSpacing zIndex"),Element.CSS_LENGTH=/^(([\+\-]?[0-9\.]+)(em|ex|px|in|cm|mm|pt|pc|\%))|0$/,String.prototype.parseStyle=function(){var e=Element.extend(document.createElement("div"));e.innerHTML='<div style="'+this+'"></div>';var t=e.down().style,n=$H();return Element.CSS_PROPERTIES.each(function(e){t[e]&&(n[e]=t[e])}),/MSIE/.test(navigator.userAgent)&&!window.opera&&this.indexOf("opacity")>-1&&(n.opacity=this.match(/opacity:\s*((?:0|1)?(?:\.\d*)?)/)[1]),n},Element.morph=function(e,t){return new Effect.Morph(e,Object.extend({style:t},arguments[2]||{})),e},["setOpacity","getOpacity","getInlineOpacity","forceRerendering","setContentZoom","collectTextNodes","collectTextNodesIgnoreClass","morph"].each(function(e){Element.Methods[e]=Element[e]}),Element.Methods.visualEffect=function(e,t,n){return s=t.gsub(/_/,"-").camelize(),effect_class=s.charAt(0).toUpperCase()+s.substring(1),new Effect[effect_class](e,n),$(e)},Element.addMethods();