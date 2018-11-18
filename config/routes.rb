Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  resources :users, :tasks, :categories
  resources :account_activations, only: [:edit]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'sessions#new'
end