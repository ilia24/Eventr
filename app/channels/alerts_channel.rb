class AlertsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "alerts_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
