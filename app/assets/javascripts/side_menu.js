$(function() {

  // This open and closes the entire side menu
  $('.fa.fa-comment').on('click', function(e){
    e.preventDefault();

    $('.side_menu_wrapper').toggleClass( "slide_open" );
  });

  $('#side_menu_close').on('click', function(e){
    e.preventDefault();

    $('.side_menu_wrapper').toggleClass( "slide_open" );
  });

  $('.side_menu_back_chat').on('click', function(e){
    e.preventDefault();

    $('.side_menu_main_content').toggleClass( "main_slide_in" );
    $('.side_menu_group_content').toggleClass( "group_slide_out" );

  });

});
