class AlertsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "alerts_channel"
  end

end
