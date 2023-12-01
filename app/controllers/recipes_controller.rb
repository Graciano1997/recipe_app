class RecipesController < ApplicationController
  def index; end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_items = @recipe.recipe_foods
  end

  def create; end

  def destroy; end

  def togle
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to @recipe
  end
end
