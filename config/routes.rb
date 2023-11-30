Rails.application.routes.draw do
  root 'apps#index'
  devise_for :users, controllers: {sessions: 'users/sessions',registrations: "users/registrations"}
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :foods, except: [:update]
end
