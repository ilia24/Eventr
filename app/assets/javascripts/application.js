// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require owl.carousel.min.js
//= require cable
//= require events.js
//= require dropdown.js
//= require carousel.js
//= require side_menu.js
//= require search_filter.js
//= require home.js
//= require avatar_upload.js



$(function() {

  // if screen width is less than 590px remove event logo animation
  // if ($(window).width() > 590) {
    $(".eventr_home_btn").hover(
      function() {
        $(this).attr("src", "/assets/images/eventr-logo.gif");
      },
      function() {
        $(this).attr("src", "/assets/images/eventr-logo.svg");
      });
  // }

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

      $('.dropdown_mobile').slideToggle('fast');
      $('.dropdown_mobile').toggleClass('active');
      $('.logo_sm').find('i').toggleClass('fa-angle-up fa-angle-down');
      $('html').toggleClass('stop_scroll')
      e.preventDefault();

    });

  }

});
