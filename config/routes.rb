Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'
  resources :users, only: [:show]
  resources :events
  resources :invites, only: [:create, :destroy]
end
