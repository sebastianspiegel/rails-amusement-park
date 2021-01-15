Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#welcome'

  resources :users
  resources :rides
  resources :attractions 

  get '/signin', to: 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/logout' => 'sessions#destroy'


end
