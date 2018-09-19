$(document).ready(JT_init);

    
    function JT_init(){
		       $("a.tip")
			   .hover(function(){JT_show(this.href,this.rel,this.name,this.id)},function(){$('.popup').remove()})
	           .click(function(){return false});  
	}

	function JT_show(url,rel,title,linkId){
		
		if(title == false){title="&nbsp;"};
		
		var de = document.documentElement;
		
		var w = self.innerWidth || (de&&de.clientWidth) || document.body.clientWidth;
		
		var clickElementx = getAbsoluteLeft(linkId);
		var clickElementy = getAbsoluteTop(linkId); //set y position
		alert(linkId);
		var queryString = url.replace(/^[^\?]+\??/,'');
		var params = parseQuery( queryString );
		if(params['width'] === undefined){params['width'] = 250};
		$('#' + linkId).css('cursor','pointer');
		
		$("body").append("<table class='popup'><tbody><tr><td id='topleft' class='corner'></td><td class='top'>"+title+"</td><td id='topright' class='corner'></td></tr><tr><td class='left'></td><td><p class='popup-contents' style='width:"+(params['width']+px'>"+rel+"</td><td class='right'></td></tr><tr><td class='corner' id='bottomleft'></td><td class='bottom'><img width='30' height='29' alt='' src='http://jqueryfordesigners.com/demo/images/coda/bubble-tail2.png'/></td><td id='bottomright' class='corner'></td></tr></tbody></table>");
	  	$(".popup").fadeIn("slow");
		var distance = 10;
	    var time = 250;
	    var hideDelay = 500;

	    var hideDelayTimer = null;
	// stops the hide event if we move from the trigger to the popup element
	      // if (hideDelayTimer) clearTimeout(hideDelayTimer);
	      // 	      
	      // 	      	      // don't trigger the animation again if we're being shown, or already visible
	      // 	      	      if (beingShown || shown) {
	      // 	      	        return;
	      // 	      	      } else {
	      // 	      	        beingShown = true;
	      // 	      
	      // 	      	        // reset position of popup box
	      // 	      	        popup.css({
	      // 	      	          top: -100,
	      // 	      	          left: -33,
	      // 	      	          display: 'block' // brings the popup back in to view
	      // 	      	
	      // 	      	        })
	      // 	      
	      // 	      	        // (we're using chaining on the popup) now animate it's opacity and position
	      // 	      	        .animate({
	      // 	      	          top: '-=' + distance + 'px',
	      // 	      	          opacity: 1
	      // 	      	        }, time, 'swing', function() {
	      // 	      	          // once the animation is complete, set the tracker variables
	      // 	      	          beingShown = false;
	      // 	      	          shown = true;
	      // 	      	        });
	      // 	      	      }
	}