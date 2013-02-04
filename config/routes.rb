RailsTest::Application.routes.draw do
  resources :posts

  root to: 'welcome#index'

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  #resources :users
  post 'users' => "users#create"
  resources :sessions
  resources :password_resets

  scope "/admin" do
    resources :users
  end

end