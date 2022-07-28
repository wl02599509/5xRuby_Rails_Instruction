Rails.application.routes.draw do
  get "/", to: "welcome#home"
  get "/about", to: "pages#about"

  resources :blogs
end
