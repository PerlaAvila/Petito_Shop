Rails.application.routes.draw do
  get 'products/index'

  get 'qr_codes/new'
  get 'qr_codes/create'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  get 'users/new'

  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about' 
  get '/contact', to: 'static_pages#contact'
  get '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :qr_codes, only: [:new, :create]
  resources :registered_pets
  root to: "qr_codes#new"

  # delete 'registered_pets/:id', to: 'registered_pets#destroy', as: 'delete_pet'




  SampleApp::Application.routes.draw do
  get 'products/index', as: 'products'

  get 'qr_codes/new'

  get 'qr_codes/create'

  get 'password_resets/new'

  get 'password_resets/edit'

    default_url_options :host => "aqueous-wildwood-92497.herokuapp.com"

    # ... snip ...
  end
end
