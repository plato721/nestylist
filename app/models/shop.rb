class Shop < ApplicationRecord
  has_many :shop_item
  has_many :items, through: :shop_item
end
