$(function() {
function loadAlert() {
  App.user_alert = App.cable.subscriptions.create({
    channel: "AlertsChannel",
  }, {
    connected: function() {
      console.log('connected to alerts channel')
    },
    disconnected: function() {
      console.log('disconnected from alerts channel')
    },
    received: function(data) {

    }
  });
};

if (document.cookie === "") {
  console.log('user not logged in, not launching alerts cable')
  return
} else {
};

});
