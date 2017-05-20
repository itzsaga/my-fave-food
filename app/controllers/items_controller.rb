class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_place, only: %i[index new create]

  def index
    @items = @place.items
  end

  def new
    @item = @place.items.build
  end

  def create
    @item = Item.new(item_params)
    @item.place_ids = params[:place_id]
    if @item.save
      redirect_to @item
    else
      render :new
    end

  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def update
    @item = Item.find_by(id: params[:id])
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :rating, :notes)
  end

  def find_place
    @place = Place.find_by(id: params[:place_id])
  end
end
