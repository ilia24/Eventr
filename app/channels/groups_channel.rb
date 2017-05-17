class GroupsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "groups_#{params['group_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], group_id: data['group_id'])
  end
end
