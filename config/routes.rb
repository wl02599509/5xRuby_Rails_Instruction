Rails.application.routes.draw do
  # get "/", to: "welcome#home"
  get "/", to: "blogs#index"
  get "/about", to: "pages#about"

  resources :blogs
  resources :articles
end
