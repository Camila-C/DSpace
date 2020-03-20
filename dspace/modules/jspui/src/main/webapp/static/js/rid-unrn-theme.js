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
    
    // Botón BackToTop
    $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
        $('#back-to-top').fadeIn();
      } else {
        $('#back-to-top').fadeOut();
      }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function () {
      $('#back-to-top').tooltip('hide');
      $('body,html').animate({
        scrollTop: 0
      }, 800);
      return false;
    });
    
    $('#back-to-top').tooltip('show');
  });
})(jQuery);
