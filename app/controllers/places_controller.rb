class PlacesController < ApplicationController
  before_action :authenticate_user!, :all_items

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
    @place.items.build
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  def show
    if @place = Place.find_by(id: params[:id])
      @items = @place.items
      render :show
    else
      redirect_to places_path
    end
  end

  def edit
    if @place = Place.find_by(id: params[:id])
      @place.items.build
      render :edit
    else
      redirect_to places_path
    end
  end

  def update
    @place = Place.find_by(id: params[:id])
    if @place.update(place_params)
      redirect_to @place
    else
      render :edit
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :city, :state, :zip_code, :user_id, item_ids:[], items_attributes: %i[name rating notes])
  end

  def all_items
    @items = current_user.items
  end
end
