class Place < ApplicationRecord
  belongs_to :user
  has_many :place_items
  has_many :items, through: :place_items
end
