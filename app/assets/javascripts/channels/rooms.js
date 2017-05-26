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
  messages = $('#messages');
  if ($('#messages').length > 0) {
    messages_to_bottom = function() {
      return messages.scrollTop(messages.prop("scrollHeight"));
    };
    messages_to_bottom();

//This code creates an AC subscription to the specific group channel, and establishes base functions
    App.private_chat = App.cable.subscriptions.create({
      channel: "ConvoChannel",
      conversation_id: messages.data('conversation-id')
    }, {
      connected: function() {
        console.log('PCHAT: connected to ' +  messages.data('conversation-id'))
      },
      disconnected: function() {
        console.log('PCHAT: disconnected from ' +  messages.data('conversation-id'))
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
      messages = $('#messages');
      if ($.trim(textarea.val()).length > 1) {
        App.private_chat.send_chat(textarea.val(), messages.data('conversation-id'));
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

function DeleteChats(){
  if (App.global_chat !== undefined) {
    App.cable.subscriptions.remove(App.global_chat);
  };
  if (App.private_chat !== undefined) {
    App.cable.subscriptions.remove(App.private_chat);
  };
};

//this function adds the new groupdata into the DOM before reinitializing the chat
function SetChatGroup() {
  if ($('.side_menu_group_info').is(':empty')) {

    DeleteChats();
    var newchat = $('#messages').data('conversation-id');
    $('#group_id').attr('value', newchat);
    $('.side_menu_chat_input').find('form').attr('class', 'new_personal_message');
    $('.side_menu_chat_input').find('form').attr('id', 'new_personal_message');
    if ($('.side_menu_chat_input').find('#group_id').attr('id') === "group_id") {
      $('.side_menu_chat_input').find('#group_id').attr('name', 'conversation_id');
      $('.side_menu_chat_input').find('#group_id').attr('id', 'conversation_id');
      $('.side_menu_chat_input').find('#message_body').attr('name', 'personal_message[body]')
      $('.side_menu_chat_input').find('#message_body').attr('id', 'personal_message_body')
    };
    LoadPrivateChat();
  } else {

    DeleteChats();
    var newgroup = $('#messages').data('group-id');
    $('#group_id').attr('value', newgroup);
    $('.side_menu_chat_input').find('form').attr('class', 'new_message');
    $('.side_menu_chat_input').find('form').attr('id', 'new_message');
    if ($('.side_menu_chat_input').find('#conversation_id').attr('id') === "conversation_id") {
      $('.side_menu_chat_input').find('#conversation_id').attr('name', 'group_id');
      $('.side_menu_chat_input').find('#conversation_id').attr('id', 'group_id');
      $('.side_menu_chat_input').find('#personal_message_body').attr('name', 'message[body]')
      $('.side_menu_chat_input').find('#personal_message_body').attr('id', 'message_body')
    };
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

//PRIV CHAT ajax
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

//this code is for when a user clicks on "see message" on a user page
$('.see_chat_button').on('click', function(e) {
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
