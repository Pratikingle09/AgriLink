import consumer from "channels/consumer"

consumer.subscriptions.create("LiveFeedChannel", {
  connected() {
    console.log("Connected to LiveFeedChannel....")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("Disconnected from LiveFeedChannel....")
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    const liveFeedsElement = document.getElementById('live_feeds');
    liveFeedsElement.innerHTML = data + liveFeedsElement.innerHTML;
  }
});
