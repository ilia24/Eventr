$(function() {

  $('.upload_avatar_btn').hide();
  $(".user_profile_image").hover(

    function() {
      $('.upload_avatar_btn').slideToggle('fast');
    }, function() {
      $('.upload_avatar_btn').slideToggle('fast');
    });

});
