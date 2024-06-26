class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :product_image
  has_many :carts , dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :reviews, dependent: :destroy


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "price", "product_description", "product_name", "quantity", "updated_at", "user_id"]
  end
  
end
