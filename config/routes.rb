Rails.application.routes.draw do
  root 'apps#index'
  devise_for :users, controllers: {sessions: 'users/sessions',registrations: "users/registrations"}
  resources :foods, except: [:update, :edit]
  resources :recipes, except: [:update, :edit] do
  resources :recipe_foods, only: [:new,:create]
  end
  get '/recipes/:id/visibity', to: "recipes#togle"
  get '/public_recipes', to: "recipes#public_recipes"
  get '/general_shopping_list', to: "recipe_foods#general_shopping_list"
  get 'up' => 'rails/health#show', as: :rails_health_check
end
