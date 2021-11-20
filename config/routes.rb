Rails.application.routes.draw do
  resources :groups
  resources :entities
  devise_for :users
  get "welcome/index"  
  root to: "welcome#index"  
end
