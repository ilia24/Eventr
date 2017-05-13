$(function() {

if($('#map').length) {
    var lat = parseFloat($('#map').attr('data-parameter1'));
    var lng = parseFloat($('#map').attr('data-parameter2'));
    var eventlocation = {lat, lng};

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

  $('#new_group').toggleClass( "formdisp" );
  $('.groups_container').toggleClass("shift");
  $('#single_group').toggleClass('hidegrouplink')
});



$('#closegroupform').on('click', function(e) {
  e.preventDefault();

  $('#new_group').toggleClass( "formdisp" );
  $('#single_group').toggleClass('hidegrouplink')
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
    var group = $('<li>').html(data).attr('class', 'groups')
    $('.groups_container').append(group)
    $('#new_group').toggleClass( "formdisp" );
  }).fail(function(data){
    console.log('ajax submission failed')
  }).always(function(){
    console.log('ajax ran')
  });

});

});
