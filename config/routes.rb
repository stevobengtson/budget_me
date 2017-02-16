# frozen_string_literal: true
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  # For general sign up and user profile we have some unique urls
  get '/profile', to: 'users#profile'
  post '/users', to: 'users#create'

  # For session management we have unique urls
  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy' # Added so we can use a simple link
  get '/signup', to: 'sessions#signup'

  resources :accounts, except: [:new, :show]
  resources :transactions
  resources :categories
  resources :category_groups
end
