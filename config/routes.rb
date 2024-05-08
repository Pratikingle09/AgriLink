Rails.application.routes.draw do


  get 'seller_dashboard/index'
  get 'seller_dashboard/products'
  get 'seller_dashboard/orders'
  
  resources :carts, only: [:index]
  get 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
  patch 'update_quantity/:id', to: 'carts#update_quantity', as: 'update_quantity'
  get 'remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  post 'checkout', to: 'carts#checkout', as: 'checkout'


  resources :products
  get 'my_question/index'
  get 'learning/index'
  resources :live_feeds do
    resources :answers
  end
  resources :alerts, only: [:index , :create , :destroy]
  get 'my_questions/question'
  root to: "home#index"

  devise_for :user, controllers:{ registrations:'user/registrations'}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
