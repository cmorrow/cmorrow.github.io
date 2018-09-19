/****
 *
 * frameReady: Remote function calling for jQuery
 *
 * Version 1.2.0
 *
 * Copyright (c) 2007 Daemach (John Wilson) <daemach@gmail.com>, http://ideamill.synaptrixgroup.com
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 *	Credit John Resig and his excellent book for the ready function concepts.
 *
 * ============================================================================================
 * Usage:  	$.frameReady(function (function),target (string)[,options (map/object)]);
 * 
 * Function: (function/required) An anonymous function to be run within the target frame.
 *
 * Target: (string/required) The target frame.  This must be a window object name (in quotes), 
 *		so work from the top down.  If you have 3 frames named topFrame, navFrame, mainFrame, and 
 *		an iframe inside of mainframe named iFrame, use "top.topFrame", "top.navFrame", 
 *		"top.mainFrame", "top.mainFrame.iFrame" respectively.
 *
 *	Options: (object/optional) Map of options in object literal form.  Options include:
 *
 * 		remote: (boolean/ default true)  Run the function in the context of the target frame. 
 *				If true, jQuery will be loaded in the target frame automatically and you can run 
 *				jQuery selectors in the target frame as if they were local. ie: $("p") instead of 
 *				$("p",top.mainFrame.document).  If false, jQuery will not be loaded automatically 
 *				and you must use a context in jquery selectors.
 *				
 *			load: (array or object)  jquery is loaded by default. You can pass a single object to 
 *				frameReady, or an array of objects that will be loaded and tested in order.  2 types 
 *				of files can be loaded.  Scripts	and stylesheets:
 *				
 *				scripts: {type:"script", src:"/js/myscript.js", id:"_ms", test:"afunction"}
 *				stylesheets: {type:"stylesheet", src:"/css/mycss.css", id:"_ss"}
 *				
 *					type: (string/required) "script" for script files, "stylesheet" for stylesheets.
 *					src: (string/required)  The source of the file, ie: /js/myscript.js.
 *					id: (string/optional)  An id for the id attribute.  If one isn't provided it 
 *						will be generated.
 *					test: (sting/optional) The name of a function that should exist once the script 
 *						is loaded properly.  Until this function becomes available, the script will 
 *						be considered not ready and no other files will be loaded.  If a test is not 
 *						provided, the next file will be loaded immediately.  Tests are not useful 
 *						with stylesheets.
 *
 *	One gotcha: You must have something other than space characters within the body tags of 
 * 	target frame documents for frameReady to work properly.  A single character is enough.  
 *		The reason for this is a workaround for an iFrame bug in Firefox, of all things.
 * ==============================================================================================
 *
 * Example: 
 *
 *		$.frameReady(function(){
 *		  $("<div>I am a div element</div>").prependTo("body");
 *		}, "top.mainFrame", 
 *		{ load: [ 
 *			{type:"script",id:"_fr",src:"/js/jquery.frameReady.js",test: "$.frameReady"},
 *			{type:"stylesheet",id:"_ss",src:"frameReady.css"} 
 *			] } 
 *		); 
 *
 *
 * Release Notes:
 *	
 *	1.2.0 - Added provision for a local callback function;
 *	        Added functionality to reset frame information if frame unloads for any reason;
 *			  
 *	1.1.0 - Added the ability to load scripts and stylesheets inside the target frame before
 *					processing function stack;
 *	
 ****/
"undefined"==typeof $daemach&&($daemach={},$daemach.debug=!1,$daemach.log=function(){top.window.console&&top.window.console.log&&$daemach.debug&&top.window.console.log([].join.call(arguments,""))}),"undefined"==typeof $daemach.frameReady&&($daemach.frameReady={}),jQuery.frameReady=function(f,t,r,j){var jQueryPath="/js/jQuery.js",u="undefined",$fr=$daemach.frameReady,fn=t.split(".").join("_");typeof $fr[fn]==u&&($fr[fn]={},$fr[fn].settings={remote:!0,jquery:!0,load:[{type:"script",id:"_jq",src:jQueryPath,test:"jQuery"}],bLoaded:!1,loadInit:[],callback:!1},$fr[fn].target=t);var fr=$fr[fn],frs=fr.settings;if(fr.done)return $daemach.log(fr.target+" is ready.  Running functions now."),frs.remote?eval(fr.target).eval("("+f.toString()+")()"):f();for(var a=2;a<arguments.length;a++){var arg=arguments[a];if($.isFunction(arg))frs.callback=arg;else if("object"==typeof arg&&(typeof arg.remote!==u&&(frs.remote=arg.remote),typeof arg.jquery!==u&&(frs.jquery=arg.jquery),frs.remote&&frs.jquery||frs.load.pop(),typeof arg.load!==u)){var bl=!0;if(arg.load.constructor==Array&&arg.load.length)for(var i=0;i<arg.load.length;i++){bl=!0;for(var h=0;h<frs.load.length;h++)frs.load[h].src==arg.load[i].src&&(bl=!1);bl&&frs.load.push(arg.load[i])}else if("object"==typeof arg.load){for(var h=0;h<frs.load.length;h++)frs.load[h].src==arg.load.src&&(bl=!1);bl&&frs.load.push(arg.load)}}}fr.timer?fr.ready.push(f):(fr.ready=[f],"undefined"!=typeof addEvent&&addEvent(window,"load",function(){jQuery.isFrameReady(fn)}),fr.timer=setInterval(function(){jQuery.isFrameReady(fn)},13))},jQuery.isFrameReady=function(fn){var u="undefined",$d=$daemach,fr=$d.frameReady[fn],frs=fr.settings;if(fr.done)return!1;var fx=eval(fr.target);if($d.log(fn,": New Pass. Checking target"),"undefined"!=typeof fx){$d.log(fn,": Found target.  Checking DOM");var fd=fx.document;if(fd&&fd.getElementsByTagName&&fd.getElementById&&fd.body&&fd.body.innerHTML.length)if($d.log(fn,": Found DOM"),frs.load.length&&!frs.bLoaded)for(var i=0;i<frs.load.length;i++){var s=frs.load[i],_test;try{_test=eval("typeof fx."+s.test+' !== "undefined"')}catch(ex){_test=!1}finally{$d.log(fn,": Running test for script ",i,". ",_test||!s.test?"Passed.":"Failed.")}if(!_test&&s.test||!frs.loadInit[i]){if(frs.bLoaded=!1,typeof frs.loadInit[i]==u){var id=s.id||"frs_"+i;switch(s.type){case"script":$d.log(fn,": Loading script "+i+" ("+s.src+")");var ele=fd.createElement("script");ele.setAttribute("id",id),ele.setAttribute("src",s.src),fd.getElementsByTagName("body")[0].appendChild(ele),frs.loadInit[i]=!0;break;case"stylesheet":$d.log(fn,": Loading stylesheet "+i+" ("+s.src+")");var ele=fd.createElement("link");ele.setAttribute("id",id),ele.setAttribute("href",s.src),ele.setAttribute("rel","stylesheet"),ele.setAttribute("type","text/css"),fd.getElementsByTagName("body")[0].appendChild(ele),frs.loadInit[i]=!0;break;default:$d.log(fn,": Script "+i+" has a bad or missing type attribute...")}}break}frs.bLoaded=typeof s.test==u?!0:_test}else{clearInterval(fr.timer),fr.timer=null,fr.ready.push(function(){window.frameReadyUnload=function(e,a){$(window).bind("unload",function(){e.jQuery.frameReady.unload(a)})}}),$d.log(fn,": Processing function stack:");for(var i=0;i<fr.ready.length;i++)frs.remote?fx.eval("("+fr.ready[i].toString()+")()"):fr.ready[i]();fx.frameReadyUnload(window,fn),$d.log(fn,": Function stack processing complete."),fr.ready=null,fr.done=!0,frs.callback&&($d.log(fn,": Found a callback.  Executing..."),frs.callback())}}$d.log(fn,":")},jQuery.frameReady.unload=function(e){$daemach.log("Frame "+e+" is unloading.  Resetting state."),$daemach.frameReady[e].done=!1,$daemach.frameReady[e].settings.bLoaded=!1,$daemach.frameReady[e].settings.loadInit=[]};