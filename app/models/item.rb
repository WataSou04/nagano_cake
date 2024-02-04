class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_item
  has_many :order_details
  belongs_to :genre
end
