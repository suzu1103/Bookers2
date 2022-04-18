Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => "homes#about", as: "about"
  resources :books, only: [:new, :index, :show]
  resources :users, only: [:index, :show, :edit]
  
  # 参考
  # resources :users, only: [:show, :edit, :update]
  # resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #   resource :favorites, only: [:create, :destroy]
  # resources :post_comments, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
