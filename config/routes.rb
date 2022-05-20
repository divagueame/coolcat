Rails.application.routes.draw do
  resources :cats
  root 'pages#home' 
  get 'pages/home'
  devise_for :users
  
end
