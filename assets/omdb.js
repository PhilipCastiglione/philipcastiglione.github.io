$(document).ready(function() {

  var yearOrder = function(a, b) {
    if (parseInt(a['Year']) < parseInt(b['Year'])) {
      return 1;
    }
    if (parseInt(a['Year']) > parseInt(b['Year'])) {
      return -1;
    }
    return 0;
  };

  var fetchMovie = function(event) {
    var $target = $(event.target);
    var url = 'http://www.omdbapi.com/?i=' + $target.attr('id') + '&tomatoes=true';
    $.get(url, function(data) {
      var $div = $('<div>');
      $div.append($('<p>').text('Runtime: ' + data['Runtime']));
      $div.append($('<p>').text('Genres: ' + data['Genre']));
      $div.append($('<p>').text('Plot: ' + data['Plot']));
      $div.append($('<p>').text('Imdb rating: ' + data['imdbRating'] + ' from ' + data['imdbVotes'] + ' votes'));
      $div.append($('<p>').text('Rotten Tomatoes rating: ' + data['tomatoRating']));
      $div.append($('<p>').text('Metacritic rating: ' + data['Metascore']));
      $div.insertAfter($target);
      $target.unbind();
    });
  };

  var output = function(results) {
    var sortedResults = results.sort(yearOrder);
    for (result of sortedResults) {
      var $p = $('<p>').attr('class', 'movie').attr('id', result['imdbID']);
      $p.text(result['Title'] + ', ' + result['Year']);
      $p.click(fetchMovie);
      $('#movies').append($p);
    }
  };

  var notify = function(message) {
    $('#flash').text(message);
  };

  // on page load attach 
  var fetchList = function(searchText, pageNum) {
    // TODO: only movies at the moment
    var url = 'http://www.omdbapi.com/?s=' + searchText + '&page=' + pageNum + '&type=movie';
    $.get(url, function(data) {
      var results = data;
      var count = parseInt(results["totalResults"]);
      if (isNaN(count)) {
        notify('no results');
      } else if (count > 100) {
        notify('too many (>100) results, narrow your search');
      } else if (count > pageNum * 10) {
        output(results['Search']);
        fetchList(searchText, pageNum + 1);
      } else {
        // update screen with results
        output(results['Search']);
        notify('click to view a result or search again');
      }
    });
  };

  var search = function() {
    var searchText = $('#searchText').val();
    notify('');
    if (searchText.length > 0) {
      $('#movies').html('');
      fetchList(searchText, 1);
    } else {
      notify('enter something to search for');
    }
  }

  $('#go').click(search);
});
