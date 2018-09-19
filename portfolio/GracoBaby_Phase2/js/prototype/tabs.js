/**
 * @author Ryan Johnson <http://saucytiger.com/>
 * @copyright 2008 PersonalGrid Corporation <http://personalgrid.com/>
 * @package LivePipe UI
 * @license MIT
 * @url http://livepipe.net/control/tabs
 * @require prototype.js, livepipe.js
 */
if("undefined"==typeof Prototype)throw"Control.Tabs requires Prototype to be loaded.";if("undefined"==typeof Object.Event)throw"Control.Tabs requires Object.Event to be loaded.";Control.Tabs=Class.create({initialize:function(t,i){if(!$(t))throw"Control.Tabs could not find the element: "+t;this.activeContainer=!1,this.activeLink=!1,this.containers=$H({}),this.links=[],Control.Tabs.instances.push(this),this.options={beforeChange:Prototype.emptyFunction,afterChange:Prototype.emptyFunction,hover:!1,linkSelector:"li a",setClassOnContainer:!1,activeClassName:"active",defaultTab:"first",autoLinkExternal:!0,targetRegExp:/#(.+)$/,showFunction:Element.show,hideFunction:Element.hide},Object.extend(this.options,i||{}),$(t).select(this.options.linkSelector).findAll(function(t){return/^#/.exec((Prototype.Browser.WebKit?decodeURIComponent(t.href):t.href).replace(window.location.href.split("#")[0],""))}).each(function(t){this.addTab(t)}.bind(this)),this.containers.values().each(Element.hide),"first"==this.options.defaultTab?this.setActiveTab(this.links.first()):"last"==this.options.defaultTab?this.setActiveTab(this.links.last()):this.setActiveTab(this.options.defaultTab);var e=this.options.targetRegExp.exec(window.location);e&&e[1]&&e[1].split(",").each(function(t){this.setActiveTab(this.links.find(function(i){return i.key==t}))}.bind(this)),this.options.autoLinkExternal&&$A(document.getElementsByTagName("a")).each(function(t){if(!this.links.include(t)){var i=t.href.replace(window.location.href.split("#")[0],"");"#"==i.substring(0,1)&&this.containers.keys().include(i.substring(1))&&$(t).observe("click",function(t,i){this.setActiveTab(i.substring(1))}.bindAsEventListener(this,i))}}.bind(this))},addTab:function(t){this.links.push(t),t.key=t.getAttribute("href").replace(window.location.href.split("#")[0],"").split("/").last().replace(/#/,"");var i=$(t.key);if(!i)throw"Control.Tabs: #"+t.key+" was not found on the page.";this.containers.set(t.key,i),t[this.options.hover?"onmouseover":"onclick"]=function(t){return window.event&&Event.stop(window.event),this.setActiveTab(t),!1}.bind(this,t)},setActiveTab:function(t){if(t||"undefined"!=typeof t)if("string"==typeof t)this.setActiveTab(this.links.find(function(i){return i.key==t}));else if("number"==typeof t)this.setActiveTab(this.links[t]);else{if(this.notify("beforeChange",this.activeContainer,this.containers.get(t.key))===!1)return;this.activeContainer&&this.options.hideFunction(this.activeContainer),this.links.each(function(t){(this.options.setClassOnContainer?$(t.parentNode):t).removeClassName(this.options.activeClassName)}.bind(this)),(this.options.setClassOnContainer?$(t.parentNode):t).addClassName(this.options.activeClassName),this.activeContainer=this.containers.get(t.key),this.activeLink=t,this.options.showFunction(this.containers.get(t.key)),this.notify("afterChange",this.containers.get(t.key))}},next:function(){this.links.each(function(t,i){if(this.activeLink==t&&this.links[i+1])throw this.setActiveTab(this.links[i+1]),$break}.bind(this))},previous:function(){this.links.each(function(t,i){if(this.activeLink==t&&this.links[i-1])throw this.setActiveTab(this.links[i-1]),$break}.bind(this))},first:function(){this.setActiveTab(this.links.first())},last:function(){this.setActiveTab(this.links.last())}}),Object.extend(Control.Tabs,{instances:[],findByTabId:function(t){return Control.Tabs.instances.find(function(i){return i.links.find(function(i){return i.key==t})})}}),Object.Event.extend(Control.Tabs);