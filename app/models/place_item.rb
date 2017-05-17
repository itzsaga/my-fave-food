class PlaceItem < ApplicationRecord
  belongs_to :place
  belongs_to :item
end
