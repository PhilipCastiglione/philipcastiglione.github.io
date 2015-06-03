var applyFilters = {
  clearCards: function() {
    $('.cards').html('');
  },
  getShowRecipes: function() {
    applyFilters.clearCards();
    $.ajax({
      url: '/api/recipes/list',
      dataType: 'json'
    }).done(function(data){
      applyFilters.recipes = data;
    }).done(function() {
      applyFilters.displayRecipes();
    });
  },
  getFilterShowRecipes: function() {
    applyFilters.clearCards();
    $.ajax({
      url: '/api/recipes/list',
      dataType: 'json'
    }).done(function(data){
      applyFilters.recipes = data;
    }).done(function() {
      applyFilters.filterRecipes();
    }).done(function() {
      applyFilters.displayRecipes();
    });
  },
  searchCategories: [],
  populateTerms: function() {
    var searchArray = [];
    $.each(applyFilters.searchCategories, function(index, category) {
      searchArray.push(foodWords[category]);
    });
    applyFilters.searchTerms = searchArray;
  },
  searchTerms: [],
  filterRecipes: function() {
    applyFilters.populateTerms();
    if (applyFilters.searchTerms.length > 0) {
      applyFilters.recipes = $.map(applyFilters.recipes, function(recipe) {
        var count = 0;
        $.each(applyFilters.searchTerms, function(index, terms) {
          var includeRecipe = false;
          $.each(terms, function(index, term) {
            var re = new RegExp(term.toLowerCase());
            if (re.test(recipe['ingredients'].toLowerCase())) {
              includeRecipe = true;
            }
          });
          if (includeRecipe) {
            count++;
          }
        })
        if (count === applyFilters.searchTerms.length) {
          return recipe;
        }
      });
    }
  },
  displayRecipes: function() {
    if (applyFilters.recipes.length === 0 ) {
      $('.cards').append("No dishes matching those criteria. Please remove some filters.");
    } else {
      $.each(applyFilters.recipes, function(index, recipe) {
        applyFilters.render(recipe);
      });
    }
    windowSizeCheck();
  },
  render: function(recipe) {
    $divCard = $('<div>').addClass('card');

    $img = $('<img>').attr('src', recipe['image_url']);
    $divImg = $('<div>').addClass('card-image').append($img);
    $divCard.append($divImg);

    $divHeader = $('<div>').addClass('card-header').append(recipe['title']);
    $divCard.append($divHeader);

    $p = $('<p>').html(recipe['description']);
    $divCopy = $('<div>').addClass('card-copy').append($p);

    $p = $('<p>').html('See full recipe');
    $divFull = $('<div>').addClass('card-see-full').append($p);
    $divFull.on('click', expandFullScreenView);
    $divCopy.append($divFull);    

    $divCard.append($divCopy);

    $divCard.attr('data-id',recipe['id'])

    $('.cards').append($divCard);
  }
};