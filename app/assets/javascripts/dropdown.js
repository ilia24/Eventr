$(function() {

  $('.dropbtn').on('click', function(e) {
      e.stopPropagation();
      $('#myDropdown').toggleClass( "show" );
  });

  $(document).on('click', function() {
      $('#myDropdown').attr('class', 'dropdown-content')
  });

});
