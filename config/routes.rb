Rails.application.routes.draw do
  resources :users, :tasks, :categories
  root 'tasks#index'
end