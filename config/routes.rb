Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  
  # posts
  resources :posts

  # users
  resources :users, only: [:index, :show, :edit]

  # likes
  resources :likes, only: [:create, :destroy]

  # comments
  resources :comments, only: [:create]
  
  root to: 'posts#index'
  # root to: 'home#index'
  get 'home/index'
  post 'like_comment', to: 'posts#like_comment', as: "like_comment"
  post 'like_post', to: 'posts#like_post', as: "like_post"
  post 'add_comment', to: 'posts#add_comment', as: "add_comment"
  post 'add_friend', to: 'users#add_friend', as: "add_friend"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
