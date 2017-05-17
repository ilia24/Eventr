$(function() {
  $('.grouplink').on('click', function(e) {
    e.preventDefault();

    $.ajax({
      method: 'GET',
      url: $(this).attr('href'),
      data: $(this).serialize(),
      dataType: 'html'

    }).done(function(data){
      console.log('ajax submission succeeded');
      console.log(data)




    }).fail(function(data){
      console.log('ajax submission failed');
    }).always(function(){
      console.log('ajax ran')
    });

  });


});


// var group = $('<li>').html(data).attr('class', 'groups')
// $('.groups_container').prepend(group)
