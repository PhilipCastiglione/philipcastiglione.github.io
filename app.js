$(document).ready(function() {

  // pages by position
  var position = {
    now: 0,
    destinations: ['.about','.proj-1','.proj-2','.proj-3','.contact']
  };

  // scroll to page with with animation
  var scrollToTarget = function(target) {
    $('body').animate({scrollTop: ($(target).offset().top - $('.splash').offset().top)}, 900);
  };

  // scroll up one page
  var scrollUp = function() {
    if (position.now !== 0) {
      position.now--;
      scrollToTarget(position.destinations[position.now]);
    }
  };

  // scroll down one page
  var scrollDown = function() {
    if (position.now !== position.destinations.length - 1) {
      position.now++;
      scrollToTarget(position.destinations[position.now]);
    }
  };

  // event listener for scroll to target links
  $('.scroll-to-target').on('click', function() {
    position.now = position.destinations.indexOf($(this).attr('data-link'));
    scrollToTarget($(this).attr('data-link'));
  });

  // event listeners for scroll up links
  $('.scroll-up').on('click', scrollUp);

  // event listeners for scroll down links
  $('.scroll-down').on('click', scrollDown);

  // keydown listeners for scroll up and down
  $(window).on('keydown', function(e) {
    // check key and execute
    switch(e.which) {
      case(37): // left arrow
      case(38): // up arrow
      case(38): // pageup
      case(38): // home
        e.preventDefault();
        e.returnValue = false;
        scrollUp();
        break;
      case(32): // spacebar
      case(39): // right arrow
      case(40): // down arrow
      case(40): // pagedown
      case(40): // end
        e.preventDefault();
        e.returnValue = false;
        scrollDown();
        break;
      default:
    };
  });

  // scrolling through touchpad/mousewheel etc!!

});
