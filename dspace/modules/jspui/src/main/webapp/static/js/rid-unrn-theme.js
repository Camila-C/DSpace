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

    function resizeInput() {
      $(this).attr('size', $(this).val().length - $(this).val().length*0.25);
    }
  
    $('.tagsinput .tag input[type="text"]')
        // event handler
        .keyup(resizeInput)
        // resize on page load
        .each(resizeInput);
  });
})(jQuery);
