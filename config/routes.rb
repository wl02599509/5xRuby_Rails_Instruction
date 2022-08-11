Rails.application.routes.draw do
  get '/', to: "welcome#home"
  get '/about', to: "welcome#about"

  get "/@:handler/blogs/", to: "blogs#show"
  get "/@:handler/blogs/:id", to: "articles#show"
  
  resources :blogs

  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy]
    member do
      patch :unlock
    end 
  end
  # patch :unlock, on: :member

  namespace :api do
    namespace :v1 do
      resources :articles, only: [] do
        member do
          post :like
        end
      end
    end
  end

  resource :sessions, only: [:create, :destroy]

  resource :users, except: [:destroy, :new] do
    get :sign_up
    get :sign_in
  end

  get '/@:handler', to: "blogs#show"
end

