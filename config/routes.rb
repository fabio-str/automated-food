Rails.application.routes.draw do

  root 'dashboard#index'

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_up: 'signup' }
  get 'logout', to: 'pages#logout', as: 'logout'
  get 'lp', to: 'pages#lp', as: 'lp'

  resources :subscribe, only: [:index]
  resources :dashboard, only: [:index]
  resources :account, only: [:index, :update]
  resources :billing_portal, only: [:create]
  match '/billing_portal' => 'billing_portal#create', via: [:get]
  match '/cancel' => 'billing_portal#destroy', via: [:get]


  resources :nutrition_profiles
  resources :addresses
  resources :orders
  post '/change_meal', to: 'orders#change_meal', as: 'change_meal'
  

  # static pages
  pages = %w(
    privacy terms
  )

  pages.each do |page|
    get "/#{page}", to: "pages##{page}", as: "#{page.gsub('-', '_')}"
  end

  # admin panels
  authenticated :user, -> user { user.admin? } do
    namespace :admin do
      resources :dashboard, only: [:index]
      resources :impersonations, only: [:new]
      resources :users, only: [:edit, :update, :destroy]
    end

    # convenience helper
    get 'admin', to: 'admin/dashboard#index'
  end
end
