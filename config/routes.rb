Rails.application.routes.draw do

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
  end


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
  resources :products, only: [:new]
  resources :products_in_carts, only: [:new, :create]
  root to: "qr_codes#new"

  delete 'avatar/:id', to: 'registered_pets#destroy_avatar', as: 'avatar'
 



end
