Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  get '/signup', to: 'user#new'
  resources :users, :tasks, :categories
  root 'sessions#new'
end