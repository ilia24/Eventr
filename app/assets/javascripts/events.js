$(function() {

if($('#map').length) {
    var lat = parseFloat($('#map').attr('data-parameter1'));
    var lng = parseFloat($('#map').attr('data-parameter2'));
    var eventlocation = {lat: lat, lng: lng};

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
      center: eventlocation
    });

    var marker = new google.maps.Marker({
      position: eventlocation,
      map: map,
      title: 'Event location',
      label: 'E'
    });
};

if (screen.width < 1140) {

  $('.event_side_info').detach().prependTo('.event_description_wrapper');
  $('.event_side_info').insertAfter('.event_show_header');

};

// Change heading size for mobile
if ($(window).width() <= 464) {

  $(function() {
    $('h3').each(function(i, em) {
       $(em).replaceWith('<h4>'+$(em).html()+'</h4>');
    });
  });

};

if ($('#event_img').width() < 292) {

  $(this).css('height', 'auto');
  $(this).css('width', '100%')

};




// These two secitons of code are responsible for opening and closing the group create form
$('#single_group').on('click', function(e){
  e.preventDefault();

  $('.new_group_form_container').toggleClass( "formdisp" );
  $('.groups_container').toggleClass("shift");
  $('#single_group').toggleClass('hidegrouplink');
});



$('#closegroupform').on('click', function(e) {
  e.preventDefault();

  $('.new_group_form_container').toggleClass( "formdisp" );
  $('.groups_container').toggleClass("shift");
  $('#single_group').toggleClass('hidegrouplink');
});



// This is an ajax call to leave a group
function leaveGroup(g) {
  $.ajax({
    method: $(g).attr('method'),
    url: $(g).attr('action'),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded');
    var groupbox = $(g.parentElement.parentElement);
    if (groupbox.find('.profile_member').length > 1) {
      groupbox.find('.groupmembers li:last-child').remove();
      var action = groupbox.find('#leavebutton').parent().attr('action');
      var newaction = action.replace('leave', 'join');
      groupbox.find('#leavebutton').parent().attr('action', newaction);
      groupbox.find('#leavebutton').unbind();
      groupbox.find('#leavebutton').attr({
        value: 'join',
        id: 'nil',
        class: 'joinbutton'
      });
      if ($('.side_menu_chat_input').hasClass("show_chat")) {
        $('.side_menu_main_content').toggleClass( "main_slide_in" );
        $('.side_menu_group_content').toggleClass( "group_slide_out" );
        $('.side_menu_chat_input').toggleClass( "show_chat" );
        $('.side_menu_back_chat').toggleClass( "back_chat_slide_in" );
      };
      $('.joinbutton').on('click', function(e) {
        // e.preventDefault();

        var group = e.currentTarget.form;
        // joinGroup(group);
      });
    } else {
      groupbox.remove();
    };
    $('#submitgroupbutton').removeAttr("disabled");
  }).fail(function(data){
    console.log('ajax submission failed');
  }).always(function(){
    console.log('ajax ran');
  });
};


$('.joinbutton').on('click', function(g){
  console.log('join fired');
});

$('.alreadybutton').on('click', function(g){
  g.preventDefault();
});

// this is the JS code to bind the leavegroup function to the leavegroup button
$('#leavebutton').on('click', function(lbut) {
  lbut.preventDefault();
  var group = lbut.currentTarget.parentElement;
  leaveGroup(group);
});
});
