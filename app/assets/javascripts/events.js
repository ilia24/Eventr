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
});
