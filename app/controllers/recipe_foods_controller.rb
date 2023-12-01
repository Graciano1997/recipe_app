class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @user=User.find(current_user.id)
  end

  def index
  end

  def create
    RecipeFood.create!(quantity: params[:recipe_food]["quantity"],food_id:params[:recipe_food]["food_id"],recipe_id:params[:recipe_id])
    redirect_to recipe_path(params[:recipe_id].to_i)
  end
end
