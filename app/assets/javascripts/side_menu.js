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
    $('.side_menu_chat_input').toggleClass( "show_chat" );
    $('.side_menu_back_chat').toggleClass( "back_chat_slide_in" );
    $('.event_details_btn').toggleClass('event_details_btn_slide_in');

  });

  // Collapses and reveals pending requests section
  $('#pending').on('click', function(e){

    $(this).next('.side_menu_main_pending').slideToggle('fast');
    $(this).toggleClass('active');
    $(this).find('i').toggleClass('fa-chevron-up fa-chevron-down')
    e.preventDefault();

  });

  // Collapses and reveals groups section
  $('#groups').on('click', function(e){

    $(this).next('.side_menu_main_groups_list').slideToggle('fast');
    $(this).toggleClass('active');
    $(this).find('i').toggleClass('fa-chevron-up fa-chevron-down')
    e.preventDefault();

  });

  // Collapses and reveals eventr section
  $('#eventrs').on('click', function(e){

    $(this).next('.side_menu_main_eventrs_list').slideToggle('fast');
    $(this).toggleClass('active');
    $(this).find('i').toggleClass('fa-chevron-up fa-chevron-down')
    e.preventDefault();

  });

  // Collapses and reveals event detail
  $('.side_menu_group_event_details').hide();
  $('.event_details_btn').on('click', function(e){

    $('.side_menu_group_event_details').slideToggle('fast');
    $(this).toggleClass('active');
    e.preventDefault();

  });

});
