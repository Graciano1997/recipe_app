require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
    @user = User.create(name: 'Gra', email: 'gracianohenrique@gmail.com')
    @food = Food.create(name: 'Banana', measurement_unit: 'grams', price: 12.5, quantity: 2, user_id: @user.id)
  end

  it 'is expected to be a Food object' do
    expect(@food).to be_a(Food)
  end

  it 'is valid with valid attributes' do
    food = Food.new(name: 'apple', measurement_unit: 'grams' 'pieces', price: 18,
                    quantity: 24, user: @user)
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(measurement_unit: 'pieces', price: 18,
                    quantity: 24, user: @user)
    expect(food).not_to be_valid
  end
end
