Rails.application.routes.draw do

  get 'group/index'
  # usersコントローラー
  get "new" => "users#new"
  post "users/create" => "users#create"
  get "users/create" => "users#new"
  get "login_form" => "users#login_form"
  post "login" => "users#login"
  get "login" => "users#login_form"
  post "logout" => "users#logout"
  get "logout" => "users#index"
  get "users/index" => "users#index"

  # videosコントローラー
  get "index" => "videos#index"
  get "videos/new" => "videos#new"
  post "videos/create" => "videos#create"
  get "videos/create" => "videos#new"
  post "videos/:id/destroy" => "videos#destroy"
  get "videos/:id/destroy" => "videos#index"

  # groupコントローラー
  get "groups" => "group#index"
  get "groups/new" => "group#new"
  post "groups/create" => "group/create"
  get "groups/create" => "group/create"

  # homeコントローラー
  get "/" => "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
