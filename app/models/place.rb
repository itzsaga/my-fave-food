class Place < ApplicationRecord
  belongs_to :user
  has_many :place_items
  has_many :items, through: :place_items
  # accepts_nested_attributes_for :items

  validates :name, presence: true
  validates :zip_code, numericality: { only_integer: true}, length: { is: 5 }

  def items_attributes=(items_attributes)
    items_attributes.values.each do |item_attribute|
      item = Item.find_or_create_by(item_attribute)
      self.items << item if item.persisted?
    end
  end
end
