Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  patch "books/:id" => "books#update", as: "update_book"
  patch "users/:id" => "users#update", as: "update_user"

  #Booksのルーティングを一括生成(index/create/show/edit/update/destroy)
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  #usersのルーティングを一括生成(index/create/show/edit/update)
  resources :users, only: [:index, :create, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
