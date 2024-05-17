class LiveFeedChannel < ApplicationCable::Channel
  def subscribed
    stream_from "live_feed_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
