$(document).ready(function () {

  $('.carousel_item').hide().fadeIn("slow");
  $('.carousel_item').toggleClass('carousel_item_slide_up');
  $('.home_event_name').hide().fadeIn("slow");
  $('.home_event_name').toggleClass('home_event_name_slide');
  $('#home_event_buy_btn').hide().fadeIn("slow");
  $('#home_event_buy_btn').toggleClass('home_event_buy_slide');

  // If iPhone 6s Plus or smaller change carousel arrow size
  if ($(window).width() <= 414) {

    $(".fa.fa-angle-right").removeClass('fa fa-angle-right fa-3x').addClass('fa fa-angle-right fa-2x');
    $(".fa.fa-angle-left").removeClass('fa fa-angle-left fa-3x').addClass('fa fa-angle-left fa-2x');

    $(function() {
      $('h1').each(function(i, em) {
         $(em).replaceWith('<h4>'+$(em).html()+'</h4>');
      });
    });

  };

});
