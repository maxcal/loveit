Rails.application.routes.draw do

  resources :posts
  devise_for :users
  get 'posts/index'

  root to: 'posts#index'
  resources :posts, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
