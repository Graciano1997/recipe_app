require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
  @user=User.create(name: "Gra", email: "gracianohenrique@gmail.com")
  @recipe=Recipe.create(name: "Cake", preparation_time: 1.5, cooking_time:1.5, description: "blablabla", public: true, user_id:@user.id)
  end

  it 'is expected to be a Recipe object' do
    expect(@recipe).to be_a(Recipe)
  end

   it 'is valid with valid attributes' do
     recipe = Recipe.new(name: "Cake", preparation_time: 1.5, cooking_time:1.5, description: "blablabla", public: true, user:@user)
     expect(recipe).to be_valid
   end

  it 'is not valid without a name' do
     recipe = Recipe.new(preparation_time: 1.5, cooking_time:1.5, description: "blablabla", public: true, user:@user.id)
    expect(recipe).not_to be_valid
  end
end