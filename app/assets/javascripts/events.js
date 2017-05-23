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




// This is an ajax call to create a new group within the event page
$('#new_group').on('submit', function(e) {
  e.preventDefault();

  $.ajax({
    method: $(this).attr('method'),
    url: $(this).attr('action'),
    data: $(this).serialize(),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded')
    var group = $('<li>').html(data).attr('class', 'groups');
    $('.groups_container').prepend(group);
    $('.new_group_form_container').toggleClass( "formdisp" );
    $('.groups_container').toggleClass("shift");
    $('#single_group').toggleClass('hidegrouplink');
    $('#leavebutton').on('click', function(e) {
      e.preventDefault();
      var group = e.currentTarget.form;
      leaveGroup(group);
    });
  }).fail(function(data){
    console.log('ajax submission failed');
  }).always(function(){
    console.log('ajax ran');
  });

});


// This is an ajax call to leave a group
function leaveGroup(g) {
  $.ajax({
    method: $(g).attr('method'),
    url: $(g).attr('action'),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded');
    var groupbox = g.parentElement.parentElement.parentElement;
    while (groupbox.firstChild) {
    groupbox.removeChild(groupbox.firstChild);
    };
  }).fail(function(data){
    console.log('ajax submission failed');
  }).always(function(){
    console.log('ajax ran');
  });

};

// this is the JS code to bind the leavegroup function to the leavegroup button
$('#leavebutton').on('click', function(e) {
  e.preventDefault();
  var group = e.parent
  leaveGroup(group);
});
});
