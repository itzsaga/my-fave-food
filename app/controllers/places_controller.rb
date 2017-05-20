class PlacesController < ApplicationController
  before_action :authenticate_user!
  before_action :all_items, only: %i[new create edit update]
  before_action :current_place, only: [:update]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new(user_id: current_user.id)
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
    if current_place
      @items = @place.items
      render :show
    else
      redirect_to places_path
    end
  end

  def edit
    if current_place
      @place.items.build
      render :edit
    else
      redirect_to places_path
    end
  end

  def update
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

  def current_place
    @place = Place.find_by(id: params[:id])
  end
end
