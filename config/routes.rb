Rails.application.routes.draw do
  get '/', to: "welcome#home"
  get '/about', to: "welcome#about"

  resources :blogs
  resources :articles do
    member do
      patch :unlock
    end 
  end
  resource :sessions, only: [:create, :destroy]

  resource :users, except: [:destroy, :new] do
    get :sign_up
    get :sign_in
  end
end

