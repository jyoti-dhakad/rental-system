Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  

  
  get "login", to: "sessions#new"
  # get "all", to: "users#all"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :users
  resources :vehicles
  resources :bookings
  get "current_booking", to: "bookings#current_booking"

  namespace :admin do
    resources :bookings do
      member do
        put :approve
        put :cancel
      end
    end
  end

  resources :current_users
  resources :feedbacks


end
