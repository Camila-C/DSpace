/*
 * Método de transición del navbar
 */
$.noConflict();
(function ($) {
  $(document).ready(function() {
    // Efecto de transición para el Navbar 
    $(window).scroll(function() {
      // checks if window is scrolled more than 50px, adds/removes solid class
      if($(this).scrollTop() > 50) { 
        $('.navbar').addClass('navbar-solid');
        $('#logo').attr('src', '/jspui/image/header/header_logo_unrn_negro.svg');
      } else {
        $('.navbar').removeClass('navbar-solid');
        $('#logo').attr('src','/jspui/image/header/header_logo_unrn_blanco.svg');
      }
    });
    // Preguntas frecuentes
    const url = document.location.toString();
    if ( url.match('#') ) {
      $('.collapse').removeClass('in');
      $('a').addClass('collapsed');
      $('#'+url.split('#')[1]).collapse('show');
    }
  });
})(jQuery);
