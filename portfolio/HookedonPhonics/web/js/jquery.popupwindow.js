jQuery.fn.popupwindow=function(e){var t=e||{};return this.each(function(e){var r,n,i,o,l;if(i=(jQuery(this).attr("rel")||"").split(","),r={height:600,width:600,toolbar:0,scrollbars:0,status:0,resizable:1,left:0,top:0,center:0,createnew:1,location:0,menubar:0},1==i.length&&1==i[0].split(":").length)l=i[0],"undefined"!=typeof t[l]&&(r=jQuery.extend(r,t[l]));else for(var s=0;s<i.length;s++)o=i[s].split(":"),"undefined"!=typeof r[o[0]]&&2==o.length&&(r[o[0]]=o[1]);1==r.center&&(r.top=(screen.height-(r.height+110))/2,r.left=(screen.width-r.width)/2),n="location="+r.location+",menubar="+r.menubar+",height="+r.height+",width="+r.width+",toolbar="+r.toolbar+",scrollbars="+r.scrollbars+",status="+r.status+",resizable="+r.resizable+",left="+r.left+",screenX="+r.left+",top="+r.top+",screenY="+r.top,jQuery(this).bind("click",function(){var t=r.createnew?"PopUpWindow"+e:"PopUpWindow";return window.open(this.href,t,n).focus(),!1})})};