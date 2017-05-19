class Item < ApplicationRecord
  has_many :place_items
  has_many :places, through: :place_items

  validates :name, presence: true, uniqueness: true
  validates :notes, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5 }
end
