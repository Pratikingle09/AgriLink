class Answer < ApplicationRecord
  belongs_to :live_feed ,  foreign_key: "live_feed_id" 
  belongs_to :user
end
