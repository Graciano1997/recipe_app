# # seeds for Food 
  @user=User.first
  Food.create(name: "Apple", measurement_unit: "grams", price: 5, quantity:10, user: @user)
  Food.create(name: "Pineapple", measurement_unit: "grams", price: 1, quantity:10, user: @user)
  Food.create(name: "Chicken breast", measurement_unit: "units", price: 2, quantity:10, user: @user)
  Recipe.create(name: "Potatto", preparation_time: 1.5, cooking_time:1.0, description: "A traddsdsdsd", user:@user)
  Recipe.create(name: "Bean", preparation_time: 1.5, cooking_time:1.0, description: "A traddsdsdsd", user:@user)
  Recipe.create(name: "Rice", preparation_time: 1.5, cooking_time:1.0, description: "A traddsdsdsd", user:@user)