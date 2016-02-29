Rails.application.routes.draw do
  # get "/products/new" => "products#new", as: :new_product
  # post "/products" => "products#create", as: :products
  # get "/products/:id" => "products#show", as: :product
  # get "/products" => "products#index"
  resources :products do
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy] do
    delete :destroy, on: :collection
  end

  resources :departments, only: [:index, :show]

  root "products#index"
end
