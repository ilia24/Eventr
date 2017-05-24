class ConvoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "convo_#{params['conversation_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_chat(data)
    current_user.personal_messages.create!(body: data['body'], conversation_id: data['conversation_id'])
  end
end
