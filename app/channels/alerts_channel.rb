class AlertsChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user.channel
  end

  def receive(data)
  end

end
