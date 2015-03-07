class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :photo)
  end

end
