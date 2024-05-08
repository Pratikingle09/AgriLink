class User < ApplicationRecord
  has_many :alerts
  has_many :live_feeds
  has_many :products , dependent: :destroy
  has_many :carts
  has_many :orders, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
