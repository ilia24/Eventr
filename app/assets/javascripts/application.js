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

$(function() {

  // if screen width is less than 590px remove event logo animation
  if ($(window).width() > 590) {
    $(".eventr_home_btn").hover(
      function() {
        $(this).attr("src", "/assets/eventr-logo.gif");
      },
      function() {
        $(this).attr("src", "/assets/eventr-logo.svg");
      });
  }

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


$(document).ready(function(){

  $('.sendmessage').on('click', function(){
    location.reload();
  })

  var messager = $('<div>').addClass('messager').css('display', 'none');
  $('body').append(messager);

  $('.pledge-convo').click(function(e){
    e.preventDefault();
    $.ajax({
      url:'/personal_messages/new',
      method: 'GET',
      data: {
        receiver_id: $(this).attr('data-receiver-id')
      }
    }).done(function(data){
      $('.messager').html(data);

      var hidden = $('.messager');
    if (hidden.hasClass('visible')){
      console.log('if');
        hidden.animate({left:"-1000px"}).removeClass('visible');
    } else {
      console.log('else');
        hidden.show().animate({left:"0px"}).addClass('visible');
    }
    })
  })
});
