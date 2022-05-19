Rails.application.routes.draw do

  #deviseを使用する際URLにusersを含む
  devise_for :users

  #homes/topをrootディレクトリに指定
  root to: "homes#top"
  #homes/aboutを名前付きルートをaboutに指定
  get "home/about" => "homes#about", as: "about"

  patch "books/:id" => "books#update", as: "update_book"
  patch "users/:id" => "users#update", as: "update_user"

  resources :homes, only: [:top, :about]
  #Booksのルーティングを一括生成(index/create/show/edit/update/destroy)
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  #usersのルーティングを一括生成(index/create/show/edit/update)
  resources :users, only: [:index, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
