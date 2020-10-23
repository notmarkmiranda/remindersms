Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "dashboard#show", as: "dashboard"

  resources :groups

  namespace :api do
    namespace :v1 do
      post "/auth/login", to: "authentication#login"

      resources :groups
    end
  end
end
