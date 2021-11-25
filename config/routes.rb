Rails.application.routes.draw do
  devise_for :users

  root to: "groups#index"
  get "groups/index"  
  get "landing", to: 'landing#index', as: 'landing'

  resources :entities
  resources :groups
end
