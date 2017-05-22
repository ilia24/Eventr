$(document).ready(function () {
  $('.carousel_item').hide().fadeIn("slow");
  $('.carousel_item').toggleClass('carousel_item_slide_up');
  $('.home_event_name').hide().fadeIn("slow");
  $('.home_event_name').toggleClass('home_event_name_slide');
  $('#home_event_buy_btn').hide().fadeIn("slow");
  $('#home_event_buy_btn').toggleClass('home_event_buy_slide');
});
