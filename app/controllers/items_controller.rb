class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_place, only: %i[index new create]
  before_action :current_item, only: %i[show edit update destroy]

  def index
    if params[:place_id]
      @items = @place.items
    else
      @items = Item.all
    end
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
    @places = @item.places
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    name = @item.name
    if @item.delete
      redirect_to items_path, notice: "#{name} deleted successfully."
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :rating, :notes)
  end

  def find_place
    @place = Place.find_by(id: params[:place_id])
  end

  def current_item
    @item = Item.find_by(id: params[:id])
  end
end
