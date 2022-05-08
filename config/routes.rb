Rails.application.routes.draw do
  resources :participations
  resources :info_profile
  resources :info_game
  resources :game_user
  resources :games
  resources :sports
  resources :user_addresses
  resources :users
  resources :cities
  resources :states
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
