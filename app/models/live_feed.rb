class LiveFeed < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    has_one_attached :post_image

    
    validates :post_image, presence: true
    validates :question_body, presence: true, length: { minimum: 10 }

    after_create_commit { broadcast_prepend_to 'live_feed_channel', target: 'live_feeds' }
end
