Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :morties, only: [:new,:create,:show] do
    resources :reservations, only: :create
  end
  resources :reservations, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
