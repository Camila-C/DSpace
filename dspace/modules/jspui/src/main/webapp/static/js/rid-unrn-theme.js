$.noConflict();
(function ($) {
  $(document).ready(function() {
    // Preguntas frecuentes
    const url = document.location.toString();
    if ( url.match('#') ) {
      $('.collapse').removeClass('in');
      $('a').addClass('collapsed');
      $('#'+url.split('#')[1]).collapse('show');
    }
  });
})(jQuery);
