Rails.application.routes.draw do
  resources :entities
  devise_for :users

  root to: "groups#index"
  get "groups/index"  
  get "landing", to: 'landing#index', as: 'landing'

  resources :groups
end
