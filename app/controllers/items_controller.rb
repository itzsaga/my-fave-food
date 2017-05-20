class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @place = Place.find_by(id: params[:place_id])
    @items = @place.items
  end

  def new
    @item = Item.new(place_id: params[:place_id])
  end
end
