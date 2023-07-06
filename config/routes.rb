Rails.application.routes.draw do
  devise_for :users

  root "homes#index"
  resources :groups, only: [:index, :show, :new, :create] do
    resources :products, only: [:new, :create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
