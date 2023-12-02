class RecipesController < ApplicationController
  def index;
  @current_user_recipes=current_user.recipes
  end

  def new;
  @recipe=Recipe.new
  end


  def show
    @recipe = Recipe.find(params[:id])
    @recipe_items = @recipe.recipe_foods
  end

  def create
    @recipe=Recipe.new(recipe_params)
    @recipe.user_id=current_user.id
    if @recipe.save
    redirect_to recipes_path
    else
        render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe_food=RecipeFood.where(recipe_id:@recipe.id).destroy_all
    @recipe.destroy
    redirect_to recipe_path
  end

  def public_recipes
    @public_recipes=Recipe.where(public:true).order(created_at: :desc)
    @current_user=current_user
  end
  def togle
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to @recipe
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name,:preparation_time,:cooking_time,:description,:public)
  end
end
