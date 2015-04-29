$(function() {
  var $header = $('header');
  window.stickyHeader = false;
  // sticky header
  $(window).on('scroll', function(e) {
    console.log(window.stickyHeader);
    if ($(this).scrollTop() > 1) {
      if (!window.stickyHeader) {
        stickHeader($header);
      }
    } else {
      console.log(window.stickyHeader);
      if (window.stickyHeader) {
        unstickHeader($header);
      }
    }
  });

});

var unstickHeader = function(header) {
  header.animate({
    fontSize: '1em',
    height: '80px',
    opacity: 1
  }, 500);
  header.removeClass('sticky-header');
  window.stickyHeader = false;
}

var stickHeader = function(header) {
  header.addClass('sticky-header');
  header.animate({
    fontSize: '0.95em',
    height: '60px',
    opacity: 0.9
  }, 800);
  return window.stickyHeader = true;
};