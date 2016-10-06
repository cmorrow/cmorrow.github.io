(function(){


	// init code samples
	var interval; // store current interval
	

	// More info https://github.com/hakimel/reveal.js#configuration
	Reveal.initialize({
		history: true,
		center: false, // turn off vertical centering
		transition: 'zoom', // none/fade/slide/convex/concave/zoom
		controls: false,
		postMessage: true,

		// More info https://github.com/hakimel/reveal.js#dependencies
		dependencies: [
			{ src: 'plugin/markdown/marked.js' },
			{ src: 'plugin/markdown/markdown.js' },
			{ src: 'plugin/notes/notes.js', async: true },
			{ src: 'socket.io/socket.io.js', async: true },
      { src: 'plugin/notes-server/client.js', async: true },
			{ src: 'plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } }
			
		]
	});

	// // titleScreen
	// var titleScreen = Reveal.getState();

	// Reveal.addEventListener( 'slidechanged', function(event) {
	//     var currentSlide = event.currentSlide;
	//     var prevSlide = event.previousSlide;

	//     // data join sample
	//     if(currentSlide.hasAttribute('data-code')){
	// 		  var func = currentSlide.getAttribute('data-code');
	//     	eval(func).start();
	//     }

	//     // Stop any previously running code
	//     if(prevSlide && prevSlide.hasAttribute('data-code')){
	//     	var func = prevSlide.getAttribute('data-code');
	//     	eval(func).stop();
	//     }
	    

	// }, false );



})();