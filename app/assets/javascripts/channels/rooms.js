$(function() {
function LoadChat() {

  // this code scrolls the chatbox to the bottom
  var messages, messages_to_bottom;
  messages = $('#messages');
  if ($('#messages').length > 0) {
    messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();

//This code creates an AC subscription to the specific group channel, and establishes base functions
    App.global_chat = App.cable.subscriptions.create({
      channel: "GroupsChannel",
      group_id: messages.data('group-id')
    }, {
      connected: function() {
        console.log('connected to ' + messages.data('group-id'))
      },
      disconnected: function() {
        console.log('disconnected from ' + messages.data('group-id'))
      },
      received: function(data) {
        messages.append(data['message']);
        return messages_to_bottom();
      },
      send_message: function(message, group_id) {
        return this.perform('send_message', {
          message: message,
          group_id: group_id
        });
      }
    });

    // this is responsible for actually sending a message
    return $('#new_message').submit(function(e) {
      var $this, textarea;
      $this = $(this);
      textarea = $this.find('#message_body');
      messages = $('#messages');
      if ($.trim(textarea.val()).length > 1) {
        App.global_chat.send_message(textarea.val(), messages.data('group-id'));
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  }
};
LoadChat();
$("#eventdata").remove()

//note about eventdata: i added the top info in a field called eventdata then deleted it, to allow me to send
//extra data in 1 ajax call, as opposed to making 2 ajax calls on 1 click




$('.grouplink').on('click', function(e) {
  e.preventDefault();

  $.ajax({
    method: 'GET',
    url: $(this).attr('href'),
    data: $(this).serialize(),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded');
    App.cable.subscriptions.remove(App.global_chat);
    //this removes the old data, and creates the top part & messages
    $( "#messages" ).remove();
    $(".side_menu_chat").append(data);
    $(".side_menu_group_info").empty()
    $(".side_menu_group_info").append($("#eventdata").children());
    $("#eventdata").remove()
    //this slides back to the new chat
    $('.side_menu_main_content').toggleClass( "main_slide_in" );
    $('.side_menu_group_content').toggleClass( "group_slide_out" );
    $('.side_menu_chat_input').toggleClass( "hide_chat" );
    //this sets the HTML data points to the proper ID's before calling loadchat
    var newgroup = $('#messages').data('group-id');
    $('#messages').data('group-id', newgroup);
    $('#group_id').attr('value', newgroup)
    LoadChat();

  }).fail(function(data){
    console.log('ajax submission failed');
  }).always(function(){
    console.log('ajax ran');
  });

});

//this code is for when the user clicks a group link on the event page


$('.eventgrouplink').on('click', function(e) {
  e.preventDefault();

  $.ajax({
    method: 'GET',
    url: $(this).attr('href'),
    data: $(this).serialize(),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded');
    console.log(data);
    App.cable.subscriptions.remove(App.global_chat);
    //this removes the old data, and creates the top part & messages
    $( "#messages" ).remove();
    $(".side_menu_chat").append(data);
    $(".side_menu_group_info").empty()
    $(".side_menu_group_info").append($("#eventdata").children());
    $("#eventdata").remove()
    $('.side_menu_wrapper').toggleClass( "slide_open" );
    // //this slides back to the new chat
    // $('.side_menu_main_content').toggleClass( "main_slide_in" );
    // $('.side_menu_group_content').toggleClass( "group_slide_out" );
    // $('.side_menu_chat_input').toggleClass( "hide_chat" );
    // //this sets the HTML data points to the proper ID's before calling loadchat
    var newgroup = $('#messages').data('group-id');
    $('#messages').data('group-id', newgroup);
    $('#group_id').attr('value', newgroup)
    LoadChat();

  }).fail(function(data){
    console.log('ajax submission failed');
  }).always(function(){
    console.log('ajax ran');
  });

});
});
