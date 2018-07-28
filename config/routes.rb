Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#about"

  # usersコントローラー
  get "index" => "users#index"

  # videosコントローラー
  get "videos/new" => "videos#new"
  post "videos/create" => "videos#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
