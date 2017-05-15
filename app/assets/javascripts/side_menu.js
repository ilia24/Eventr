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

  // Goes back to main chat menu
  $('.side_menu_back_chat').on('click', function(e){
    e.preventDefault();

    $('.side_menu_main_content').toggleClass( "main_slide_in" );
    $('.side_menu_group_content').toggleClass( "group_slide_out" );
  });

  // Collapses groups section
  $('#groups').on('click', function(e){

    $(this).next('.side_menu_main_groups_list').slideToggle('fast');
    $(this).toggleClass('active');
    e.preventDefault();

  });

});
