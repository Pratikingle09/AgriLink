class LiveFeed < ApplicationRecord
    has_many :answers, dependent: :destroy
    belongs_to :user
    
    validates :title, presence: true
    validates :question_body, presence: true, length: { minimum: 10 }
end
