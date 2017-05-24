class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from("notifications_#{current_user.id}_channel")
    stream_from("notifications_#{current_user.id}_channel")
  end

  def unsubscribed
  end

  def send_message(data)
    conversation = Conversation.find_by(id: data['conversation_id'])
    if conversation && conversation.participates?(current_user)
      personal_message = current_user.sent_personal_messages.build(body: data['message'], receiver_id: data['message_receiver_id'])
      personal_message.conversation = conversation
      personal_message.save!
    end
  end
end
