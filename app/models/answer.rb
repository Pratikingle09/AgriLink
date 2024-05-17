class Answer < ApplicationRecord
  belongs_to :live_feed ,  foreign_key: "live_feed_id" 
  belongs_to :user

  after_commit :create_notification, on: :create

  private
  
  def create_notification
    Notification.create do |notification|
      notification.notify_type = 'post'
      notification.actor = self.user
      notification.user=self.live_feed.user
      notification.target=self
      notification.second_target= self.live_feed
    end
end
end