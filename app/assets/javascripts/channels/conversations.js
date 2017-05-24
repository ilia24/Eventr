$(function() {
    function LoadConversations() {
    console.log('file');

    var messages = $('#conversation-body');
    var messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();


    if ($('#current-user').size() > 0) {
      console.log('Connected');
      App.personal_chat = App.cable.subscriptions.create({
        channel: "NotificationsChannel"
      }, {
      connected: function() {
        console.log('Connected')
      },
        // Called when the subscription is ready for use on the server

      disconnected: function() {
        console.log('disconnected')
      },
        // Called when the subscription has been terminated by the server

      received: function(data) {
        console.log(data);
        if ((messages.size() > 0) && (messages.data('conversation-id') === data['conversation_id'])) {
          console.log('if is true');
          messages.append(data['message']);
          return messages_to_bottom();
        }
        else {
          console.log('else is true');
          if ($('#conversations').size() > 0) {
            $.getScript('/conversations');

          }

          if (data['notification']) {
            console.log("notified");
            return $('body').append(data['notification']);
          }
        }
      },

      send_message: function(message, conversation_id, message_receiver_id) {
            console.log('sent');
        return this.perform('send_message', {
        message: message,
        conversation_id: conversation_id,
        message_receiver_id: message_receiver_id
        });
      }
      });

    $(document).on('click', '#notification .close', function() {
      return $(this).parents('#notification').fadeOut(1000);
    });

    if (messages.length > 0) {
      messages_to_bottom();
      return $('#new_personal_message').submit(function(e) {
        var $this = $(this);
        var textarea = $this.find('#personal_message_body');
        if ($.trim(textarea.val()).length > 0) {
          App.personal_chat.send_message(textarea.val(), $this.find('#conversation_id').val(), $this.find('#message_receiver_id').val());
          textarea.val('');
        }
        e.preventDefault();
        return false;
      });
    }
  }
  }
  LoadConversations();
});