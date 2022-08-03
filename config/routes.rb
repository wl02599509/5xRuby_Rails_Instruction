Rails.application.routes.draw do
  get '/', to: "welcome#home"
  get '/about', to: "welcome#about"

  resources :blogs
  resources :articles
  resource :user, except: [:destroy, :new] do
    get :sign_up
  end
end

