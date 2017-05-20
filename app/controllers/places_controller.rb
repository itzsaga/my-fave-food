class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    @place.items.build
    @items = Item.all
  end

  def create
    @place = Place.new(place_params)
    @items = Item.all
    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  def show
    if @place = Place.find_by(id: params[:id])
      render :show
    else
      redirect_to places_path
    end
  end

  def place_params
    params.require(:place).permit(:name, :address, :city, :state, :zip_code, :user_id, item_ids:[], items_attributes: [:name, :rating, :notes])
  end
end
