/**
 * jQuery Plugin colorBlend v1.6.0
 * Requires jQuery 1.2.6+ (Not tested with earlier versions).
 * Based on the Fade plugin http://plugins.jquery.com/project/fade
 * Code losely based on the Cycle plugin http://plugins.jquery.com/project/cycle It was a great resource in creating this one) 
 * Copyright (c) 2007-2008 Aaron E. [jquery at happinessinmycheeks dot com] 
 * 
 *	@param: Object Array. Arguments need to be in object notation.
 *	Returns: jQuery.
 *	Options:	
 *		param:		What css color option you wish to fade. 
 *					Such as "background-color", "color", "boarder-color", "scrollbar-face-color" etc.
 *					(default: "background-color).
 *		fps:		Frames per second (default: 30).
 *		cycles:		How many times you want the object to fade. 0 = Infinite. (default: 0).
 *		random:		Will transition from a random color to a random color. (default: false).
 *					Note: Will change isFade to false.
 *		isFade:		Will fade from the original color and back to the original color. (default: true).
 *					Note: Cannont set to true if random is set to true.
 *		fromColor:	*DEPRECIATED* Starting color. accepts RGB, Hex, Name values.
 *					Will be overwritten if random is set to true. Also accepts "random" as an option.
 *		toColor:	*DEPRECIATED* Ending color. Same as above.
 *		colorList:	Now accepts an array of color strings! colorList can accept 3 or 6 digit hex colors (#000000, #000) it can also accept rgb and color names. 
 *		alpha:		Opacity of element! accepts numerical array and old comma seperated string. (Default: [100, 100]). 
 *		isQueue:	Will queue up color aniimations for a paramater. 
 *	Examples: 
 *		$("body").colorBlend([{fromColor:"black", toColor:"white", param:"color"}]);
 *		var myColors = [
 *			{param:'color', colorList["white", "black"]},
 *			{param:'background-color', random: true, alpha:[20,75]},
 *			{param:'border-left-color', colorList: ["random", "black"]},
 *			{param:'border-right-color', fromColor:"white", "black"]},
 *			{param:'border-top-color', colorList: ["white", "black", "pink"]},
 *			{param:'border-bottom-color', colorList: ["white", "tomato", "lime"]}
 *		];
 *		$("tr").colorBlend(myColors);
 *
 *	Known issues: 
 *			* If used on a lot of objects it can cause major browser slowdown and it will eat a lot of cpu. 
 *			* Still one flickering bug when it comes to opacity. Trying to track it down. 
 *
 *	Additions:
 *		1.0.2
 *			* Added "parent" as a valid color value. Will check parents until valid color is found. 
 *				defaults to white if there are no parents with color.
 *		1.0.3
 *			* Added Alpha/Opacity blending! Add alpha:"0,100" to list of parameters. 
 *				Note: Will change the opacity of element only, not the property!
 *				If you only want text to appear and dissapear, you'll have to put it in it's own element, otherise the whole
 *				element will fade, not just your text.
 *		1.0.4
 *			* Alpha will now take just one argument alpha:"30" if you want to just change the alpha and not have it animate. 
 *			* Current is now the default fromColor value. The current value will get the current color of the element. If current is transparent, it will get the parent color.
 *			* Opposite is now the default toColor value.
 *
 *		1.3.0
 *			* Added Queueing ability, so an animation will take arguments and process them once they are available. 
 *			* Added Action parameter available arguments are stop, pause, and resume. Resume continues a paused animation. Where stop lets you assign a whole new animation to the element.
 *			* Added isQueue as an option allows you to decide if you want an option to be queued or not
 *
 *		1.4.0
 *			* Added pause all, stop all, resume all.
 *			* Have objects stored in an non-named array for traversing.
 *		1.6.0
 *			* Changed some internals for smaller quicker code. 
 *			* Added colorList. fromColor and toColor still work, but they are just converted into a colorList.
 *			* Changed alpha to an array as well, can use more than 2 params. Still works with older string based param.
 *	Bugs fixed:
 *		1.0.1 
 *			* Undesired flickering effect if colorBlend was called multiple times on the same css parameter.
 *		1.0.2 
 *			* Noticed element would keep color attributes in certain circumstances.
 *		1.0.4
 *			* Fixed bug where under certain conditions the color would flicker. 
 *		1.0.5
 *			* Great find by cratchit and he supplied the fix. Can now call colorBlend without any options. 
 *		1.2.0
 *			* Flicker fix in 1.0.4 caused other issues. Fixed for good. 
 *			* Found that if you try to get current color from scroll bar, it blows up. Added check for undefined as a color. Defaults to white.
 *		1.3.0
 *			* Found MORE flickering issues, and fixed them. I guess it's not over until the fat lady sings. Didn't see any more flicking, but I don't hear a fat lady.
 *		1.5.0
 *			* In my ignorance I noticed that alpha is taken care of quite nicely by jquery itself. No need to fix what isn't broke. Removed the custom stuff I had placed in.
 *			* Found an issue where if pausing and resuming something repeatitivly it might not sync up and cause weird flashing effects. Added isPOrS variable to check if paused or stopped. Seems to work. 
 *		1.6.1
 *			* Found that in my last release I had accidentally hosed the "current", "random", "parent" and "opposite" options for the color list.
 */
!function(e){function r(r){if(!r.internals.animating){var a="string"==typeof r.alpha?r.alpha.split(","):r.alpha;if(""!=r.fromColor&&""!=r.toColor){switch(r.fromColor.toLowerCase()){case"current":r.fromColor=r.parent.css(r.param);break;case"parent":case"transparent":r.fromColor=u(r.parent,r.param);break;case"opposite":r.fromColor=i(r.toColor);break;case"random":r.fromColor=d(),r.internals.fromRand=!0}switch(r.toColor.toLowerCase()){case"current":r.toColor=r.parent.css(r.param);break;case"parent":case"transparent":r.toColor=u(r.parent,r.param);break;case"opposite":r.toColor=i(r.fromColor);break;case"random":r.toColor=d(),r.internals.toRand=!0}r.colorList=[r.fromColor,r.toColor]}return 1==r.colorList.length&&"random"==r.colorList[0].toLowerCase()&&(r.internals.toRand=!0,r.colorList[0]=d()),e.each(r.colorList,function(e,a){switch(a.toLowerCase()){case"current":r.colorList[e]="transparent"==r.parent.css(r.param)?u(r.parent,r.param):r.parent.css(r.param);break;case"parent":case"transparent":r.colorList[e]=u(r.parent,r.param);break;case"opposite":r.colorList[e]=i(c(u(r.parent,r.param)));break;case"random":r.colorList[e]=d()}}),r.internals.currentCycle=r.cycles>0?r.cycles:0,r.internals.frames=Math.floor(r.fps*(r.duration/1e3)),r.internals.delay=Math.floor(r.duration/((r.internals.frames+1)*r.colorList.length)),r.random&&(r.isFade=!1,r.colorList=[d(),d()]),r.isFade&&(r.internals.currentCycle=2*r.internals.currentCycle,r.internals.delay=Math.floor(r.internals.delay/2),r.internals.frames=Math.floor(r.internals.frames/2)),r.internals.alphaArry=t(a,r.internals.frames),r.internals.aniArray=o(r.colorList,r.internals.frames),r}}function a(r){if(!r.internals.isPOrS){var t=!1;if(r.internals.animating=!0,r.parent.css(r.param,r.internals.aniArray[r.internals.pos]),n(r.parent,r.internals.alphaArry[r.internals.pos]),r.internals.pos+=r.internals.direction,(r.internals.pos<0||r.internals.pos>=r.internals.aniArray.length)&&(r.internals.currentCycle-=0!=r.internals.currentCycle?1:0,r.internals.direction=-1*r.internals.direction,r.internals.pos+=r.internals.direction,r.random&&(r.colorList=[r.colorList[r.colorList.length-1],d()],r.internals.aniArray=o(r.colorList,r.internals.frames)),r.isFade||(r.internals.direction=1,r.internals.pos=0),0==r.internals.currentCycle&&r.cycles>0&&(t=!0)),t)if(clearTimeout(r.internals.tId),r.internals.tId=0,r.isQueue&&r.queue.length>0){var i=r.queue.concat();i.splice(0,1),r=e.extend(r,r.queue.shift()),r.queue=i.concat(),r.internals.tId=setTimeout(function(){a(r)},r.internals.delay)}else r.internals.animating=!1,r.internals.isPOrS=!0;else r.internals.tId=setTimeout(function(){a(r)},r.internals.delay)}}function n(e,r){e.css("opacity",parseFloat(r/100))}function t(e,r){for(var a=0,n=[],t=0,o=0;o<e.length-1;o++){var i=e[o],l=e[o+1];for(a=0;r>=a;a++)t=Math.floor(i*((r-a)/r)+l*(a/r)),n[n.length]=t}return t!=e[e.length-1]&&(n[n.length]=parseInt(e[e.length-1])),n}function o(e,r){for(var a,n,t,o,i=0,s=[],u=0;u<e.length-1;u++){var d=F(e[u]),p=F(e[u+1]);for(i=0;r>=i;i++)a=Math.floor(d[0]*((r-i)/r)+p[0]*(i/r)),n=Math.floor(d[1]*((r-i)/r)+p[1]*(i/r)),t=Math.floor(d[2]*((r-i)/r)+p[2]*(i/r)),o=l(a,n,t),s[s.length]=o}return o.toLowerCase()!=c(e[e.length-1])&&(s[s.length]=c(e[e.length-1])),s}function i(e){e=c(e).split("#").join("").split("");for(var r,a="0123456789abcdef",n=a.split("").reverse().join(""),t=0;t<e.length;t++)r=a.indexOf(e[t]),e[t]=n.substring(r,r+1);return"#"+e.join("")}function l(e,r,a){return e=e.toString(16),1==e.length&&(e="0"+e),r=r.toString(16),1==r.length&&(r="0"+r),a=a.toString(16),1==a.length&&(a="0"+a),"#"+e+r+a}function s(e){var r=[];e=e.replace("#","");for(var a=0;3>a;a++)r[r.length]=parseInt(e.substr(2*a,2),16);return r.join(",")}function F(e){var r;return e&&e.constructor==Array&&3==e.length?e:(r=/rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(e))?[parseInt(r[1]),parseInt(r[2]),parseInt(r[3])]:(r=/rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(e))?[2.55*parseFloat(r[1]),2.55*parseFloat(r[2]),2.55*parseFloat(r[3])]:(r=/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(e))?[parseInt(r[1],16),parseInt(r[2],16),parseInt(r[3],16)]:(r=/#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(e))?[parseInt(r[1]+r[1],16),parseInt(r[2]+r[2],16),parseInt(r[3]+r[3],16)]:s(m[jQuery.trim(e).toLowerCase()]).split(",")}function c(e){var r=F(e);return l(parseInt(r[0]),parseInt(r[1]),parseInt(r[2]))}function u(r,a){var n="#ffffff";return e(r).parents().each(function(){var r=e(this).css(a);return"transparent"!=r&&""!=r?(n=r,!1):void 0}),n}function d(){for(var e,r=[],a=0;3>a;a++)e=p(0,255).toString(16),1==e.length&&(e="0"+e),r[r.length]=e;return"#"+r.join("")}function p(e,r){return Math.floor(Math.random()*(r-e+1))+e}function f(e){return"undefined"==typeof e?!0:!1}var h=[];e.fn.colorBlend=function(n){function t(r){var n=!1;return e.each(o,function(t,o){var i=h[o];e.each(i,function(e){switch(r){case"stop":case"pause":n=!0,clearTimeout(i[e].internals.tId),i[e].internals.isPOrS=!0,"stop"==r&&(i[e].internals.animating=!1);break;case"resume":n=!0,i[e].internals.isPOrS=!1,a(i[e])}})}),n}n||(n=[{}]);var o=[];return this.each(function(){o[o.length]=e.data(e(this).get(0))}),this.each(function(){var o=e(this),i=e.data(o.get(0)),l=!1;f(h[i])&&(h[i]=[]),e.each(n,function(a){var s=!1;n[a]=e.extend({},e.fn.colorBlend.defaults,n[a]),n[a].queue=[],n[a].internals=e.extend({},e.fn.colorBlend.internals),n[a].parent=o,"all"==n[a].param&&(l=t(n[a].action)),e.each(h[i],function(e){return h[i][e].param.toLowerCase()==n[a].param.toLowerCase()||"all"==n[a].param.toLowerCase()?(h[i][e].internals.animating||h[i].splice(e,1,r(n[a])),s=!0,!1):void 0}),s||h[i].push(r(n[a]))}),l||e.each(h[i],function(t){var o=h[i][t].internals.animating,l=h[i][t].internals.isPOrS;e.each(n,function(e){if(h[i][t].param.toLowerCase()!=n[e].param.toLowerCase())return!0;switch(n[e].action){case"stop":case"pause":clearTimeout(h[i][t].internals.tId),h[i][t].internals.isPOrS=!0,l=!0,"stop"==n[e].action&&(h[i][t].internals.animating=!1);break;case"resume":o=!0,l=!1,h[i][t].internals.isPOrS=!1,a(h[i][t]);break;default:o&&h[i][t].isQueue&&h[i][t].cycles>0&&h[i][t].queue.push(r(n[e]))}}),o||l||a(h[i][t])})})},e.fn.colorBlend.defaults={fps:30,duration:1e3,param:"background-color",cycles:0,random:!1,isFade:!0,fromColor:"",toColor:"",colorList:["current","opposite"],alpha:["100","100"],action:"",isQueue:!0},e.fn.colorBlend.internals={aniArray:[],alphaArry:[],pos:0,currentCycle:0,direction:1,frames:0,delay:0,fromRand:!1,toRand:!1,animating:!1,tId:0,isPOrS:!1};var m={aliceblue:"F0F8FF",antiquewhite:"FAEBD7",aqua:"00FFFF",aquamarine:"7FFFD4",azure:"F0FFFF",beige:"F5F5DC",bisque:"FFE4C4",black:"000000",blanchedalmond:"FFEBCD",blue:"0000FF",blueviolet:"8A2BE2",brown:"A52A2A",burlywood:"DEB887",cadetblue:"5F9EA0",chartreuse:"7FFF00",chocolate:"D2691E",coral:"FF7F50",cornflowerblue:"6495ED",cornsilk:"FFF8DC",crimson:"DC143C",cyan:"00FFFF",darkblue:"00008B",darkcyan:"008B8B",darkgoldenrod:"B8860B",darkgray:"A9A9A9",darkgreen:"006400",darkkhaki:"BDB76B",darkmagenta:"8B008B",darkolivegreen:"556B2F",darkorange:"FF8C00",darkorchid:"9932CC",darkred:"8B0000",darksalmon:"E9967A",darkseagreen:"8FBC8F",darkslateblue:"483D8B",darkslategray:"2F4F4F",darkturquoise:"00CED1",darkviolet:"9400D3",deeppink:"FF1493",deepskyblue:"00BFFF",dimgray:"696969",dodgerblue:"1E90FF",firebrick:"B22222",floralwhite:"FFFAF0",forestgreen:"228B22",fuchsia:"FF00FF",gainsboro:"DCDCDC",ghostwhite:"F8F8FF",gold:"FFD700",goldenrod:"DAA520",gray:"808080",grey:"808080",green:"008000",greenyellow:"ADFF2F",honeydew:"F0FFF0",hotpink:"FF69B4",indianred:"CD5C5C",indigo:"4B0082",ivory:"FFFFF0",khaki:"F0E68C",lavender:"E6E6FA",lavenderblush:"FFF0F5",lawngreen:"7CFC00",lemonchiffon:"FFFACD",lightblue:"ADD8E6",lightcoral:"F08080",lightcyan:"E0FFFF",lightgoldenrodyellow:"FAFAD2",lightgreen:"90EE90",lightgrey:"D3D3D3",lightpink:"FFB6C1",lightsalmon:"FFA07A",lightseagreen:"20B2AA",lightskyblue:"87CEFA",lightslategray:"778899",lightsteelblue:"B0C4DE",lightyellow:"FFFFE0",lime:"00FF00",limegreen:"32CD32",linen:"FAF0E6",magenta:"FF00FF",maroon:"800000",mediumaquamarine:"66CDAA",mediumblue:"0000CD",mediumorchid:"BA55D3",mediumpurple:"9370DB",mediumseagreen:"3CB371",mediumslateblue:"7B68EE",mediumspringgreen:"00FA9A",mediumturquoise:"48D1CC",mediumvioletred:"C71585",midnightblue:"191970",mintcream:"F5FFFA",mistyrose:"FFE4E1",moccasin:"FFE4B5",navajowhite:"FFDEAD",navy:"000080",oldlace:"FDF5E6",olive:"808000",olivedrab:"6B8E23",orange:"FFA500",orangered:"FF4500",orchid:"DA70D6",palegoldenrod:"EEE8AA",palegreen:"98FB98",paleturquoise:"AFEEEE",palevioletred:"DB7093",papayawhip:"FFEFD5",peachpuff:"FFDAB9",peru:"CD853F",pink:"FFC0CB",plum:"DDA0DD",powderblue:"B0E0E6",purple:"800080",red:"FF0000",rosybrown:"BC8F8F",royalblue:"4169E1",saddlebrown:"8B4513",salmon:"FA8072",sandybrown:"F4A460",seagreen:"2E8B57",seashell:"FFF5EE",sienna:"A0522D",silver:"C0C0C0",skyblue:"87CEEB",slateblue:"6A5ACD",slategray:"708090",snow:"FFFAFA",springgreen:"00FF7F",steelblue:"4682B4",tan:"D2B48C",teal:"008080",thistle:"D8BFD8",tomato:"FF6347",turquoise:"40E0D0",violet:"EE82EE",wheat:"F5DEB3",white:"FFFFFF",whitesmoke:"F5F5F5",yellow:"FFFF00",yellowgreen:"9ACD32"}}(jQuery);