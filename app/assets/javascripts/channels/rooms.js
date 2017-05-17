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

$('.grouplink').on('click', function(e) {
  e.preventDefault();

  $.ajax({
    method: 'GET',
    url: $(this).attr('href'),
    data: $(this).serialize(),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded');
    $( "#messages" ).remove();
    $(".side_menu_chat").append(data)
    var newgroup = $('#messages').data('group-id')
    $('#messages').data('group-id', newgroup)
    LoadChat();

  }).fail(function(data){
    console.log('ajax submission failed');
  }).always(function(){
    console.log('ajax ran')
  });

});
});
