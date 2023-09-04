Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  devise_for :users

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  root to: "homes#top"
  get "home/about" => "homes#about"

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:show, :index, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create,:destroy]
    resources :book_comments, only: [:create,:destroy]
  end

  resources :groups, only: [:new, :index, :show, :create, :edit, :update]

  get 'search' => 'searches#search'
  get "tag_searches/search" => "tag_searches#search"

  get 'messages/:id' => 'messages#message', as: 'message'
  post 'messages' => 'messages#create', as: 'messages'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
