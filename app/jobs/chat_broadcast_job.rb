class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform(chat)
    ActionCable.server.broadcast "convo_#{chat[:conversation_id]}_channel",
    chat: render_message(chat)
  end

private

def render_message(b)
  PersonalMessagesController.render partial: 'personal_messages/personal_message', locals: {personal_message: b}
end

end
