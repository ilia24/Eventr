$(function() {

  $('.open_side_menu').on('click', function(e){
    e.preventDefault();

    $('.side_menu_wrapper').toggleClass( "slide_open" );
  });

});
