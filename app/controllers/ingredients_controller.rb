class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all(:order => 'id ASC')
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:title, :amount, :prep_method, :recipe_id)
  end
end
