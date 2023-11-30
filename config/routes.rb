Rails.application.routes.draw do
  root 'apps#index'
  devise_for :users, controllers: {sessions: 'users/sessions',registrations: "users/registrations"}
  resources :foods, except: [:update, :edit]
  resources :recipes, except: [:update, :edit]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
