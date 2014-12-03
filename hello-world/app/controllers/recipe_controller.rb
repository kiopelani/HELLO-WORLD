class RecipeController < ApplicationController
  def index
  end

  def search
    @foods = Food.search(params[:search])
  end

end
