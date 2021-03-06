$(function() {

  // Reveal mobile dropdown menu
  $('.dropdown_mobile').hide();

  $('.logo_sm').on('click', function(e){

    $('.dropdown_mobile').slideToggle('fast');
    $('.dropdown_mobile').toggleClass('active');
    $('.logo_sm').find('i').toggleClass('fa-angle-up fa-angle-down');
    $('html').toggleClass('stop_scroll')
    e.preventDefault();

  });

  if ($(window).width() < 1125) {

    $('.logo').on('click', function(e){

      var touchScroll = function( event ) {
        event.preventDefault();
      };

      $('.dropdown_mobile').slideToggle('fast');
      $('.dropdown_mobile').toggleClass('active');
      $('.logo_sm').find('i').toggleClass('fa-angle-up fa-angle-down');
      $('html').toggleClass('stop_scroll');
      //target the entire page, and listen for touch events
      $('html, body').on('touchstart touchmove');


      //this will disable the scroll
      $( this).bind( 'touchmove', touchScroll );

    });

    $( '.logo' ).click(function() {
        //this will enable scrolling
        $( document ).unbind( 'touchmove', touchScroll );
    });

  }


});
