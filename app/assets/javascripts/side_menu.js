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
    $('.side_menu_chat_input').toggleClass( "hide_chat" );
  });

  // Collapses and reveals groups section
  $('#groups').on('click', function(e){

    $(this).next('.side_menu_main_groups_list').slideToggle('fast');
    $(this).toggleClass('active');
    $(this).find('i').toggleClass('fa-chevron-down fa-chevron-up')
    e.preventDefault();

  });

  // Collapses and reveals eventr section
  $('#eventrs').on('click', function(e){

    $(this).next('.side_menu_main_eventrs_list').slideToggle('fast');
    $(this).toggleClass('active');
    $(this).find('i').toggleClass('fa-chevron-down fa-chevron-up')
    e.preventDefault();

  });

  // Collapses and reveals event detail
  $('.side_menu_group_event_details').hide();
  $('.event_details_btn').on('click', function(e){

    $('.side_menu_group_event_details').slideToggle('fast');
    $(this).toggleClass('active');
    e.preventDefault();

  });

  // Triggers event detail icon animation when hover over
  $(".event_details_btn").hover(
    function() {
        $(this).attr("src", "/assets/eventr-logo-short.gif");
    },
    function() {
        $(this).attr("src", "/assets/eventr-logo-short.svg");
    }
  );

  //
  // function Scroll(ev){
  //   if(window.pageYOffset>94){
  //
  //   }
  // }
  // window.onscroll=Scroll

});
