Rails.application.routes.draw do
  mount_ember_app :frontend, to: '/'

  constraints subdomain: 'api' do
    resources :users do
      resources :fridges, only: %i[new create]
      resources :pets, only: %i[new create]
    end
    resources :fridges, only: %i[show edit update destroy] do
      member do
        put 'remove_food'
      end
      resources :foods, only: %i[new create]
    end
    resources :foods, only: %i[show edit update destroy]
    resources :pets, only: %i[show edit update destroy]
  
    root 'users#index'

  end
  
  resources :users do
    resources :fridges, only: %i[new create]
    resources :pets, only: %i[new create]
  end
  resources :fridges, only: %i[show edit update destroy] do
    member do
      put 'remove_food'
    end
    resources :foods, only: %i[new create]
  end
  resources :foods, only: %i[show edit update destroy]
  resources :pets, only: %i[show edit update destroy]

  root 'users#index'

  
end
