class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @foods=Food.all
  end

  def index
  end

  def create
    @recipe_food=RecipeFood.where(food_id: params[:recipe_food]["food_id"]).first
    if @recipe_food
      @recipe_food.quantity+=params[:recipe_food]["quantity"].to_i
      @recipe_food.save
    else
      @recipe=RecipeFood.new(recipe_food_params)
     @recipe.save
    end
    redirect_to recipe_path(params[:recipe_id].to_i)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id,:recipe_id)
  end
end
