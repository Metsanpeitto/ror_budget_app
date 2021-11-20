Rails.application.routes.draw do
  devise_for :users

  get "groups/index"  
  root to: "landing#index"  

  resources :groups
  resources :entities
end
