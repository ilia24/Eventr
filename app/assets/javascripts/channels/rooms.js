$(function() {

//THIS FUNCTION IS RESPONSIBLE FOR LOADING GROUP CHATS
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

//THIS FUNCTION IS RESPONSIBLE FOR LOADING PRIVATE CHATS//
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
  console.log('user not logged in, not launching chat cable')
  return
} else {
  LoadChat();
  LoadPrivateChat();
  $("#eventdata").remove();
};

//note about eventdata: i added the top info in a field called eventdata then deleted it, to allow me to send
//extra data in 1 ajax call, as opposed to making 2 ajax calls on 1 click

//GENERAL SIDEBAR FUNCTIONS

//this function removes the old sidebar data, and creates the top part & messages
function AppendData(d) {
  $( "#messages" ).remove();
  $(".side_menu_chat").append(d);
  $(".side_menu_group_info").empty();
  if ($("#eventdata").length) {
    $(".side_menu_group_info").append($("#eventdata").children());
    $("#eventdata").remove();
  };
};

//this function adds the new groupdata into the DOM before reinitializing the chat
function SetChatGroup() {
  if ($('.side_menu_chat').is(':empty')) {
    App.cable.subscriptions.remove(App.global_chat);
    App.cable.subscriptions.remove(App.private_chat);
  } else {
    App.cable.subscriptions.remove(App.global_chat);
    App.cable.subscriptions.remove(App.private_chat);
    var newgroup = $('#messages').data('group-id');
    $('#messages').data('group-id', newgroup);
    $('#group_id').attr('value', newgroup)
    LoadChat();
  };
};


function ToggleChatView() {
  $('.side_menu_main_content').toggleClass( "main_slide_in" );
  $('.side_menu_group_content').toggleClass( "group_slide_out" );
  $('.side_menu_chat_input').toggleClass( "show_chat" );
  $('.side_menu_back_chat').toggleClass( "back_chat_slide_in" );
};

function OpenMenuIfClosed() {
  if ($('.side_menu_wrapper').hasClass("slide_open")) {
    return;
} else {
   $('.side_menu_wrapper').toggleClass( "slide_open" );
};
};

function OpenChatIfClosed() {
  if ($('.side_menu_chat_input').hasClass("show_chat")) {
    return;
} else {
  ToggleChatView();
};
};

function MenuLogic(){
  if ($('.side_menu_wrapper').hasClass("slide_open") && $('.side_menu_chat_input').hasClass("show_chat")) {
    $('.side_menu_wrapper').toggleClass( "slide_open" );
    ToggleChatView();
} else if ($('.side_menu_wrapper').hasClass("slide_open") && !$('.side_menu_chat_input').hasClass("show_chat")) {
    OpenChatIfClosed();
} else {
    OpenChatIfClosed();
    OpenMenuIfClosed();
};
};


//this is when a user clicks on an eventchat/privatechat in the sidebar
$('.grouplink, .chatlink').on('click', function(e) {
  e.preventDefault();

  $('.event_details_btn').toggleClass('event_details_btn_slide_in');

  $.ajax({
    method: 'GET',
    url: $(this).attr('href'),
    data: $(this).serialize(),
    dataType: 'html'

  }).done(function(data){
    console.log('ajax submission succeeded');
    AppendData(data);
    ToggleChatView();
    SetChatGroup();
  }).fail(function(data){
    console.log('ajax submission failed');
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
    AppendData(data);
    SetChatGroup();
    MenuLogic();
  }).fail(function(data){
    console.log('ajax submission failed');
  });
});

$('.intrudergrouplink').on('click', function(e) {
  e.preventDefault();
});

});
