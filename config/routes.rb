Rails.application.routes.draw do
  root to: 'pages#front'
  get 'about', to: 'pages#about'

  resources :events, only: [:index, :show]
  resources :users
  resources :sessions, only: [:create, :destroy]

  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'

  namespace :admin do
    resources :events, only: [:new, :create, :edit, :update]
  end
end
