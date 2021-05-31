Rails.application.routes.draw do
  resources :products
  devise_for :users
  root 'static_pages#index'
  resources :users
  post 'products/add_to_cart/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  delete 'products/remove_from_cart/:id', to: 'products#remove_from_cart', as: 'remove_from_cart'
  post 'products/add_to_user_cart/:id', to: 'products#add_to_user_cart', as: 'add_to_user_cart'
  delete 'products/remove_from_user_cart/:id', to: 'products#remove_from_user_cart', as: 'remove_from_user_cart'
  get 'get_winner', to: 'products#get_cart_winner', as: 'get_winner'
  get 'get_winner_product', to: 'products#get_cart_winner_product', as: 'get_winner_product'
  get 'top', to: 'products#top_of_products'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
