Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#about"

  # usersコントローラー
  get "index" => "users#index"
  get "new" => "users#new"
  post "users/create" => "users#create"
  get "users/create" => "users#new"

  # videosコントローラー
  get "videos/new" => "videos#new"
  post "videos/create" => "videos#create"
  get "videos/create" => "videos#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
