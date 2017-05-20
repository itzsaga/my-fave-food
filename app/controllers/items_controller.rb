class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @place = Place.find_by(id: params[:place_id])
    @items = @place.items
  end

  def new
    @place = Place.find_by(id: params[:place_id])
    @item = @place.items.build
  end

  private

  def item_params
    params.require(:item).permit(:name, :rating, :notes, :place_id)
  end
end
