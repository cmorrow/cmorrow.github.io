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
//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiIiwic291cmNlcyI6WyJzZWFyY2guanMiXSwic291cmNlc0NvbnRlbnQiOlsiKGZ1bmN0aW9uKCkge1xuXG4gIC8vIHNldHVwIGJ1dHRvbi9pbnB1dCBldmVudHNcbiAgdmFyIG5hdlNlYXJjaCA9ICQoJyNuYXZTZWFyY2gnKTtcblxuICBuYXZTZWFyY2gua2V5cHJlc3MoZnVuY3Rpb24oZSl7XG4gICAgaWYoZS53aGljaCA9PSAxMykge1xuICAgICAgd2luZG93LmxvY2F0aW9uLmhyZWYgPSAnL3NlYXJjaC5odG1sP3F1ZXJ5PScgKyBuYXZTZWFyY2gudmFsKCk7XG4gICAgfVxuICB9KTtcblxuICBmdW5jdGlvbiBkaXNwbGF5UmVzdWx0cyhyZXN1bHRzKSB7XG4gICAgdmFyICRzZWFyY2hSZXN1bHRzID0gJChcIiNzZWFyY2hSZXN1bHRzXCIpO1xuXG4gICAgLy8gV2FpdCBmb3IgZGF0YSB0byBsb2FkXG4gICAgd2luZG93LmRhdGEudGhlbihmdW5jdGlvbihsb2FkZWRfZGF0YSkge1xuXG4gICAgICAvLyBBcmUgdGhlcmUgYW55IHJlc3VsdHM/XG4gICAgICBpZiAocmVzdWx0cy5sZW5ndGgpIHtcbiAgICAgICAgJHNlYXJjaFJlc3VsdHMuZW1wdHkoKTsgLy8gQ2xlYXIgYW55IG9sZCByZXN1bHRzXG5cbiAgICAgICAgLy8gSXRlcmF0ZSBvdmVyIHRoZSByZXN1bHRzXG4gICAgICAgIHJlc3VsdHMuZm9yRWFjaChmdW5jdGlvbihyZXN1bHQpIHtcbiAgICAgICAgICB2YXIgaXRlbSA9IGxvYWRlZF9kYXRhW3Jlc3VsdC5yZWZdO1xuXG4gICAgICAgICAgLy8gQnVpbGQgYSBzbmlwcGV0IG9mIEhUTUwgZm9yIHRoaXMgcmVzdWx0XG4gICAgICAgICAgdmFyIGFwcGVuZFN0cmluZyA9ICc8bGk+PGEgaHJlZj1cIicgKyBpdGVtLnVybCArICdcIj4nICsgaXRlbS50aXRsZSArICc8L2E+PC9saT4nO1xuXG4gICAgICAgICAgLy8gQWRkIHRoZSBzbmlwcGV0IHRvIHRoZSBjb2xsZWN0aW9uIG9mIHJlc3VsdHMuXG4gICAgICAgICAgJHNlYXJjaFJlc3VsdHMuYXBwZW5kKGFwcGVuZFN0cmluZyk7XG4gICAgICAgIH0pO1xuICAgICAgfSBlbHNlIHtcbiAgICAgICAgLy8gSWYgdGhlcmUgYXJlIG5vIHJlc3VsdHMsIGxldCB0aGUgdXNlciBrbm93LlxuICAgICAgICAkc2VhcmNoUmVzdWx0cy5odG1sKCc8bGk+Tm8gcmVzdWx0cyBmb3VuZC48YnIvPlBsZWFzZSBjaGVjayBzcGVsbGluZywgc3BhY2luZywgeWFkYS4uLjwvbGk+Jyk7XG4gICAgICB9XG5cbiAgICAgIC8vIGhpZGUtY2hvdyByZXN1bHRzIGNvdW50XG4gICAgICBpZihyZXN1bHRzICYmIHJlc3VsdHMubGVuZ3RoID4gMCl7XG4gICAgICAgIHZhciAkY291bnRFbCA9ICQoJyNzZWFyY2gtY291bnQnKTtcbiAgICAgICAgdmFyIG1hdGNoU3RyaW5nID0gcmVzdWx0cy5sZW5ndGggPiAxID8gJyBtYXRjaGVzJyA6ICcgbWF0Y2gnO1xuICAgICAgICAkY291bnRFbC50ZXh0KHJlc3VsdHMubGVuZ3RoICsgbWF0Y2hTdHJpbmcpO1xuICAgICAgICAkY291bnRFbC5zaG93KCk7XG4gICAgICB9ZWxzZXtcbiAgICAgICAgJGNvdW50RWwuaGlkZSgpO1xuICAgICAgfVxuICAgIH0pO1xuICB9XG5cbiAgZnVuY3Rpb24gZ2V0UXVlcnlWYXJpYWJsZSh2YXJpYWJsZSkge1xuICAgIHZhciBxdWVyeSA9IHdpbmRvdy5sb2NhdGlvbi5zZWFyY2guc3Vic3RyaW5nKDEpO1xuICAgIHZhciB2YXJzID0gcXVlcnkuc3BsaXQoJyYnKTtcblxuICAgIGZvciAodmFyIGkgPSAwOyBpIDwgdmFycy5sZW5ndGg7IGkrKykge1xuICAgICAgdmFyIHBhaXIgPSB2YXJzW2ldLnNwbGl0KCc9Jyk7XG5cbiAgICAgIGlmIChwYWlyWzBdID09PSB2YXJpYWJsZSkge1xuICAgICAgICByZXR1cm4gZGVjb2RlVVJJQ29tcG9uZW50KHBhaXJbMV0ucmVwbGFjZSgvXFwrL2csICclMjAnKSk7XG4gICAgICB9XG4gICAgfVxuICB9XG5cbiAgdmFyIHNlYXJjaFRlcm0gPSBnZXRRdWVyeVZhcmlhYmxlKCdxdWVyeScpO1xuXG4gIC8vIEluaXRhbGl6ZSBsdW5yIHdpdGggdGhlIGZpZWxkcyBpdCB3aWxsIGJlIHNlYXJjaGluZyBvbi4gSSd2ZSBnaXZlbiB0aXRsZVxuICAvLyBhIGJvb3N0IG9mIDEwIHRvIGluZGljYXRlIG1hdGNoZXMgb24gdGhpcyBmaWVsZCBhcmUgbW9yZSBpbXBvcnRhbnQuXG4gIHZhciBpZHggPSBsdW5yKGZ1bmN0aW9uICgpIHtcbiAgICB0aGlzLmZpZWxkKCdpZCcpO1xuICAgIHRoaXMuZmllbGQoJ3RpdGxlJywgeyBib29zdDogMTAgfSk7XG4gICAgdGhpcy5maWVsZCgnYXV0aG9yJyk7XG4gICAgdGhpcy5maWVsZCgnY2F0ZWdvcnknKTtcbiAgICB0aGlzLmZpZWxkKCd0YWcnKTtcbiAgICB0aGlzLmZpZWxkKCdjb250ZW50Jyk7XG4gIH0pO1xuXG4gIHdpbmRvdy5kYXRhID0gJC5nZXRKU09OKCcvc2VhcmNoX2RhdGEuanNvbicpO1xuICAvLyBXYWl0IGZvciB0aGUgZGF0YSB0byBsb2FkIGFuZCBhZGQgaXQgdG8gbHVuclxuICB3aW5kb3cuZGF0YS50aGVuKGZ1bmN0aW9uKGRhdGEpe1xuICAgICQuZWFjaChkYXRhLCBmdW5jdGlvbihpbmRleCwgdmFsdWUpe1xuICAgICAgaWR4LmFkZChcbiAgICAgICAgJC5leHRlbmQoeyBcImlkXCI6IGluZGV4IH0sIHZhbHVlKVxuICAgICAgKTtcbiAgICB9KTtcblxuICAgIC8vIGlmIHF1ZXJ5IHBhcmFtIG9uIHBhZ2UgbG9hZCBwZXJmb3JtIHNlYXJjaFxuICAgIGlmICh3aW5kb3cubG9jYXRpb24uaHJlZi5pbmRleE9mKCdzZWFyY2guaHRtbCcpICE9PSAtMSkge1xuICAgICAgbmF2U2VhcmNoLnZhbChzZWFyY2hUZXJtKTtcbiAgICAgIHZhciByZXN1bHRzID0gaWR4LnNlYXJjaChzZWFyY2hUZXJtKTtcbiAgICAgIGRpc3BsYXlSZXN1bHRzKHJlc3VsdHMpO1xuICAgIH1cbiAgfSk7XG5cbiAgXG59KSgpOyJdLCJmaWxlIjoic2VhcmNoLmpzIn0=
