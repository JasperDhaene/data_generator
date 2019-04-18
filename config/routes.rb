Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :fridges, only: %i[new create]
    resources :pets, only: %i[new create]
  end
  resources :fridges, only: %i[show edit update destroy] do
    resources :foods, only: %i[new create]
  end
  resources :foods, only: %i[show edit update destroy]
  resources :pets, only: %i[show edit update destroy]

  root 'users#index'
end
