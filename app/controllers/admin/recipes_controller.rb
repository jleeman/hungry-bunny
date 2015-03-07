class Admin::RecipesController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = "You have successfully created a Recipe!"
      redirect_to admin_recipe_path(@recipe)
    else
      flash[:error] = "Please review required fields."
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      flash[:success] = "Successfully updated Recipe."
      redirect_to admin_recipe_path(@recipe)
    else
      render :edit
    end
  end

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You do not have access."
      redirect_to root_path
    end
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :photo, ingredients_attributes: [:id, :recipe_id, :title, :amount, :prep_method, :_destroy], instructions_attributes: [:id, :recipe_id, :step, :instruction,  :_destroy])
  end
end
