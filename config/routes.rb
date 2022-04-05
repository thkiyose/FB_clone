Rails.application.routes.draw do
  get 'posts/index'
  resources :users, only: [:new,:create,:show]
  resources :sessions, only: [:new,:create,:destroy]
  resources :posts
end
