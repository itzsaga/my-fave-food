class Item < ApplicationRecord
  has_many :place_items
  has_many :places, through: :place_items
end
