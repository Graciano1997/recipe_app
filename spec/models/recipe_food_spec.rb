require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :each do
  @user=User.create(name: "Gra", email: "gracianohenrique@gmail.com")
  @food=Food.create(name: "Banana", measurement_unit: "grams", price: 12.5, quantity: 2, user_id: @user.id)
  @recipe=Recipe.create(name: "Cake", preparation_time: 1.5, cooking_time:1.5, description: "blablabla", public: true, user_id:@user.id)
  @recipe_food=RecipeFood.create(quantity: 10, food_id: @food.id, recipe_id: @recipe.id)
  end

  it 'is expected to be a Recipe object' do
    expect(@recipe_food).to be_a(RecipeFood)
  end

   it 'is valid with valid attributes' do
     recipe = RecipeFood.new(quantity: 10, food: @food, recipe: @recipe)
     expect(recipe).to be_valid
   end

   it 'is not valid without a quantity' do
     recipe = RecipeFood.new(food: @food, recipe: @recipe)
     expect(recipe).not_to be_valid
   end
end