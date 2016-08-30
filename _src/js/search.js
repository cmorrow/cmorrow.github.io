(function() {

  // setup button/input events
  var navSearch = $('#navSearch');

  navSearch.keypress(function(e){
    if(e.which == 13) {
      window.location.href = '/search.html?query=' + navSearch.val();
    }
  });

  function displayResults(results) {
    var $searchResults = $("#searchResults");

    // Wait for data to load
    window.data.then(function(loaded_data) {

      // Are there any results?
      if (results.length) {
        $searchResults.empty(); // Clear any old results

        // Iterate over the results
        results.forEach(function(result) {
          var item = loaded_data[result.ref];

          // Build a snippet of HTML for this result
          var appendString = '<li><a href="' + item.url + '">' + item.title + '</a></li>';

          // Add the snippet to the collection of results.
          $searchResults.append(appendString);
        });
      } else {
        // If there are no results, let the user know.
        $searchResults.html('<li>No results found.<br/>Please check spelling, spacing, yada...</li>');
      }

      // hide-chow results count
      if(results && results.length > 0){
        var $countEl = $('#search-count');
        var matchString = results.length > 1 ? ' matches' : ' match';
        $countEl.text(results.length + matchString);
        $countEl.show();
      }else{
        $countEl.hide();
      }
    });
  }

  function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split('&');

    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split('=');

      if (pair[0] === variable) {
        return decodeURIComponent(pair[1].replace(/\+/g, '%20'));
      }
    }
  }

  var searchTerm = getQueryVariable('query');

  // Initalize lunr with the fields it will be searching on. I've given title
  // a boost of 10 to indicate matches on this field are more important.
  var idx = lunr(function () {
    this.field('id');
    this.field('title', { boost: 10 });
    this.field('author');
    this.field('category');
    this.field('tag');
    this.field('content');
  });

  window.data = $.getJSON('/search_data.json');
  // Wait for the data to load and add it to lunr
  window.data.then(function(data){
    $.each(data, function(index, value){
      idx.add(
        $.extend({ "id": index }, value)
      );
    });

    // if query param on page load perform search
    if (window.location.href.indexOf('search.html') !== -1) {
      navSearch.val(searchTerm);
      var results = idx.search(searchTerm);
      displayResults(results);
    }
  });

  
})();