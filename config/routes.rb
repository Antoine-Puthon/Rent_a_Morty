Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :morties, only: [:new,:create,:show,:update] do
    resources :reservations, only: :create
     resources :reviews, only: [:new, :create]
  end

  resources :reservations, only: [:show, :destroy]
  namespace :my do
    resources :morties, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
