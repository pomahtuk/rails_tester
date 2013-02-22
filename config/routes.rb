RailsTest::Application.routes.draw do
  get "oauths/oauth"
  get "oauths/callback"
  resources :answers

  resources :questions do
    resources :answers, :shallow => true
  end

  resources :tests do
    resources :questions, :shallow => true
  end

  resources :articles

  resources :posts

  resources :courses do 
    resources :tests, :shallow => true
    resources :articles, :shallow => true
  end


  root to: 'welcome#index'

  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  #resources :users
  post 'users' => "users#create"
  resources :sessions
  resources :password_resets

  scope "/admin" do
    resources :users
    get '/categories' => 'categories#admin_index'
    get '/courses' => 'courses#admin_index'
  end

  resources :categories, :except => [:admin_index] do
    collection do
      get :manage

      # required for Sortable GUI server side actions
      post :rebuild
    end
  end

end
