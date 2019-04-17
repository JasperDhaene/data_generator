Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=begin
  resources :users do
    resources :pets
    resources :fridges
  end
=end

  resources :users do
    resources :fridges
  end
  resources :pets



  root 'users#index'
end
