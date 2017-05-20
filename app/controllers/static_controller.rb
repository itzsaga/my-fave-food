class StaticController < ApplicationController
  before_action :authenticate_user!, only: [:favorites]

  def home
  end

  def favorites
    @favorites = current_user.favorite_items
  end
end
