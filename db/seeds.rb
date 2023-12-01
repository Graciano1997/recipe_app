# # seeds for Food 
 @user=User.first
 Food.create(name: "Apple", measurement_unit: "grams", price: 5, quantity:10, user: @user)
 Food.create(name: "Pineapple", measurement_unit: "grams", price: 1, quantity:10, user: @user)
 Food.create(name: "Chicken breast", measurement_unit: "units", price: 2, quantity:10, user: @user)
