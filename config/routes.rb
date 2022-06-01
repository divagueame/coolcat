Rails.application.routes.draw do
  get 'profile/index'
  resources :cats
  root 'pages#home'
  get 'pages/home'
  devise_for :users
  get '/profile', to: 'profile#index'
  get '/admin', to: 'admin#index'
end
