class NotificationBroadcastJob < ApplicationJob
    queue_as :default

    def perform(personal_message)
      message = render_message(personal_message)
      ActionCable.server.broadcast "notifications_#{personal_message.receiver_id}_channel",
                                   message: message,
                                   conversation_id: personal_message.conversation.id,
                                   message_receiver_id: personal_message.receiver_id

      ActionCable.server.broadcast "notifications_#{personal_message.receiver_id}_channel",
                             notification: render_notification(personal_message),
                             conversation_id: personal_message.conversation.id,
                             message_receiver_id: personal_message.receiver_id
    end

    private

    def render_notification(message)
      NotificationsController.render partial: 'notifications/notification', locals: {message: message}
    end

    def render_message(message)
      PersonalMessagesController.render partial: 'personal_messages/personal_message',
                                        locals: {personal_message: message}
    end
  end
