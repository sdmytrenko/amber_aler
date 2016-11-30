Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :emergencies do
    member do
      resources :messages, except: [:index, :new, :show]
    end
  end
end