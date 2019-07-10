/*
 * Método de transición del navbar
 */
$.noConflict();
(function ($) {
  $(document).ready(function() {
    // Transition effect for navbar 
    $(window).scroll(function() {
      // checks if window is scrolled more than 50px, adds/removes solid class
      if($(this).scrollTop() > 50) { 
        $('.navbar').addClass('navbar-solid');
        $('#logo').attr('src', '/jspui/image/header/header_logo_unrn_negro.svg')
      } else {
        $('.navbar').removeClass('navbar-solid');
        $('#logo').attr('src','/jspui/image/header/header_logo_unrn_blanco.svg');
      }
    });
  });
})(jQuery);
