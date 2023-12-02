require 'rails_helper'

RSpec.describe Food, type: :model do
  before :each do
  @user=User.create(name: "Gra", email: "gracianohenrique@gmail.com")
  @food=Food.create(name: "Banana", measurement_unit: "grams", price: 12.5, quantity: 2, user_id: @user.id)
  end

  it 'is expected to be a Food object' do
    expect(@food).to be_a(Food)
  end
end