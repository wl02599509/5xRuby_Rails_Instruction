Rails.application.routes.draw do

  root "pages#home"
  get "/about", to: "pages#about"

  scope "/@:handler" do
    resource :blogs, except: [:new, :create]
  end
  resource :blogs, only: [:new, :create]

  resources :articles do
    resources :comments, shallow: true, only: [:create, :destroy]

    member do
      patch :unlock
    end
  end

  # /api/articles/6/like
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

  resource :users, except: [:new, :destroy] do
    get :sign_up
    get :sign_in
  end

  get "/@:handler", to: "blogs#show"
end
