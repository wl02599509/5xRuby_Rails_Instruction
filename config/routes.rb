Rails.application.routes.draw do
  get "/", to: "blogs#index"
  get "/about", to: "pages#about"

  resources :blogs
  resources :articles
  resource :sessions, only: [:create, :destroy]

  resource :users, except: [:new, :destroy] do
    get :sign_up
    get :sign_in
  end
end
