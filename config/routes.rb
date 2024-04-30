Rails.application.routes.draw do
  get 'my_question/index'
  get 'learning/index'
  resources :live_feeds do
    resources :answers
  end
  resources :alerts
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