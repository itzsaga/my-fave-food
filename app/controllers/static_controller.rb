class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:favorites]

  def home
  end

  def favorites
    @favorites = current_user.favorite_items
    respond_to do |f|
      f.html { render :favorites }
      f.json { render json: @favorites }
    end
  end
end
