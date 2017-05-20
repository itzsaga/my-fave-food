class Place < ApplicationRecord
  belongs_to :user
  has_many :place_items
  has_many :items, through: :place_items
  accepts_nested_attributes_for :items

  validates :name, presence: true

  def items_attributes=(item)
    self.items = Item.find_or_create_by(name: item.name)
    self.items.update(item)
  end
end
