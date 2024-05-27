class User < ApplicationRecord
  has_many :live_feeds
  has_many :products , dependent: :destroy
  has_many :carts
  has_many :orders, dependent: :destroy
  has_one :profile_image, dependent: :destroy
  has_many :reviews


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



         validates :mobile, phone: { possible: true, allow_blank: true, types: [:voip, :mobile], country_specifier: -> (phone) { 'IN' } }

end
