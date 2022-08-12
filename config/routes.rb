Rails.application.routes.draw do
  get '/', to: "welcome#home"
  get '/about', to: "welcome#about"

  # blogs
  scope "/@:handler" do
    resource :blogs, except: [:new, :create]
  end

  resource :blogs, only: [] do
    get :new, as: "new"
    post :create, as: "create"
  end

  # articles
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

  #sessions
  resource :sessions, only: [:create, :destroy]

  #users
  resource :users, except: [:destroy, :new] do
    get :sign_up
    get :sign_in
  end

end

