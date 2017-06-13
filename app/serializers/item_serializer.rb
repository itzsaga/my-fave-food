class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :notes
  has_many :places
end
