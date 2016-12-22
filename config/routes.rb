Rails.application.routes.draw do
  root to: 'emergencies#index'
  get 'emergencies', to: 'emergencies#show_list'
  devise_for :users
  resources :users

  resources :emergencies do
      resources :messages, except: [:index, :show, :new], shallow: true
  end

  namespace :admin do
    resources :emergencies, only: [:destroy]
    resources :users do
      member do
        patch 'toggle_active'
      end
    end
  end
end