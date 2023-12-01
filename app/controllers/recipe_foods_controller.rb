class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def index; end

  def create
    @recipe_food = RecipeFood.where(food_id: params[:recipe_food]['food_id'],recipe_id: params[:recipe_food]['recipe_id']).first
    if @recipe_food
      @recipe_food.quantity += params[:recipe_food]['quantity'].to_i
      @recipe_food.save
    else
      @recipe = RecipeFood.new(recipe_food_params)
      @recipe.save
    end
    redirect_to recipe_path(params[:recipe_id].to_i)
  end

  def general_shopping_list
  @total=0
  @shopping_list=what_food_to_buy?
  @shopping_list.each do |item|
    @total+=item[:price]
  end
  @total
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end

  def have_this_food?(base,item)
    @food_element=nil
    base.each do |element|
      if(item==element[:food])
        @food_element=element
      end
    end
    @food_element
  end

  def what_food_to_buy?
    @food_to_buy=[]
    @all_recipes = current_user.recipes
    @all_recipes.each do |recipe_item|
      recipe_item.recipe_foods.each do |recipe_food_item|
        @food=have_this_food?(@food_to_buy,recipe_food_item.food.name)
        if @food
          @index_food=@food_to_buy.index(@food)
          @food_to_buy[@index_food][:quantity]+=recipe_food_item.quantity
          @food_to_buy[@index_food][:price]=recipe_food_item.food.price*@food_to_buy[@index_food][:quantity]
        else

          @food={} if @food==nil
          @food[:food]=recipe_food_item.food.name
          @food[:quantity]=(recipe_food_item.quantity.to_i - Food.includes(:user).where(id:recipe_food_item.food_id.to_i,user:current_user).first.quantity.to_i).abs
          @food[:price]=recipe_food_item.food.price*@food[:quantity]
          @food[:unit]=recipe_food_item.food.measurement_unit
          @food_to_buy.push(@food)
        end
      end
    end
    @food_to_buy
  end
end
