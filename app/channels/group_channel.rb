class GroupChannel < ApplicationCable::Channel
  def subscribed
    stream_from "group_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    ActionCable.server.broadcast 'group_channel', message: data['message']
  end
end
