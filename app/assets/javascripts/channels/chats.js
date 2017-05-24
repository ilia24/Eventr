$(function() {
function LoadPrivateChat() {
  // this code scrolls the chatbox to the bottom
  var messages, messages_to_bottom;
  messages = $('#convo');
  if ($('#convo').length > 0) {
    messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();

//This code creates an AC subscription to the specific group channel, and establishes base functions
    App.private_chat = App.cable.subscriptions.create({
      channel: "ConvoChannel",
      conversation_id: convo.dataset.conversationId
    }, {
      connected: function() {
        console.log('PCHAT: connected to ' + convo.dataset.conversationId)
      },
      disconnected: function() {
        console.log('PCHAT: disconnected from ' + convo.dataset.conversationId)
      },
      received: function(data) {
        messages.append(data['chat']);
        return messages_to_bottom();
      },
      send_chat: function(textdata, convo_id) {
        return this.perform('send_chat', {
          body: textdata,
          conversation_id: convo_id
        });
      }
    });

    // this is responsible for actually sending a message
    return $('#new_personal_message').submit(function(e) {
      var $this, textarea;
      $this = $(this);
      textarea = $this.find('#personal_message_body');
      messages = $('#convo');
      if ($.trim(textarea.val()).length > 1) {
        App.private_chat.send_chat(textarea.val(), convo.dataset.conversationId);
        textarea.val('');
      }
      e.preventDefault();
      return false;
    });
  }
};
if (document.cookie === "") {
  console.log('user not logged in, not launching chat cable');
  return
} else {
  LoadPrivateChat();
};

});
