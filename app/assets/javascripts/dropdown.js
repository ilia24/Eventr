$(function() {

  $('.dropbtn').on('click', function(e) {
      e.stopPropagation();
      $('#myDropdown').toggleClass( "show" );
  });

  $(document).on('click', function() {
      $('#myDropdown').attr('class', 'dropdown-content')
  });

  if (screen.width < 1241) {

    $('#eventr_logo_btn').click( function(e){
      e.preventDefault();

    });

  };

});
