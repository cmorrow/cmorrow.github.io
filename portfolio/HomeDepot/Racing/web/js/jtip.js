function JT_init(){$("a.tip").hover(function(){JT_show(this.href,this.rel,this.id,this.name)},function(){$("#JT").remove()}).click(function(){return!1})}function JT_show(t,e,o,i){0==i&&(i="&nbsp;");var n=document.documentElement,d=self.innerWidth||n&&n.clientWidth||document.body.clientWidth,r=d-getAbsoluteLeft(o),f=getAbsoluteTop(o),l=t.replace(/^[^\?]+\??/,""),s=parseQuery(l);if(void 0===s.width&&(s.width=250),void 0!==s.link&&($("#"+o).bind("click",function(){window.location=s.link}),$("#"+o).css("cursor","pointer")),r>1*s.width+75){$("body").append("<div id='JT' style='width:"+1*s.width+"px'><div id='JT_arrow_left'></div><div id='JT_close_left'>"+i+"</div><div id='JT_copy'></div></div>");var c=getElementWidth(o)+11,u=getAbsoluteLeft(o)+c}else{$("body").append("<div id='JT' style='width:"+1*s.width+"px'><div id='JT_arrow_right' style='left:"+(1*s.width+1)+"px'></div><div id='JT_close_right'>"+i+"</div><div id='JT_copy'></div></div>");var u=getAbsoluteLeft(o)-(1*s.width+15)}e||($("#JT_copy").remove(),$("#JT").css({"border-bottom":"none"})),$("#JT").css({left:u+"px",top:f+"px"}),$("#JT_copy").append(e)}function getElementWidth(t){return x=document.getElementById(t),x.offsetWidth}function getAbsoluteLeft(t){for(o=document.getElementById(t),oLeft=o.offsetLeft;null!=o.offsetParent;)oParent=o.offsetParent,oLeft+=oParent.offsetLeft,o=oParent;return oLeft}function getAbsoluteTop(t){for(o=document.getElementById(t),oTop=o.offsetTop;null!=o.offsetParent;)oParent=o.offsetParent,oTop+=oParent.offsetTop,o=oParent;return oTop}function parseQuery(t){var e=new Object;if(!t)return e;for(var o=t.split(/[;&]/),i=0;i<o.length;i++){var n=o[i].split("=");if(n&&2==n.length){var d=unescape(n[0]),r=unescape(n[1]);r=r.replace(/\+/g," "),e[d]=r}}return e}function blockEvents(t){t.target?t.preventDefault():t.returnValue=!1}$(document).ready(JT_init);