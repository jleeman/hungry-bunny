Rails.application.routes.draw do
  root to: 'pages#front'
  get 'about', to: 'pages#about'
  get 'catering', to: 'pages#catering'
  get 'community', to: 'pages#community'
  get 'faq', to: 'pages#faq'
  get 'contact', to: 'pages#contact'

  resources :events, only: [:index, :show]
  resources :recipes, only: [:index, :show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create, :destroy]
  resources :reservations, only: [:new, :create]

  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'

  namespace :admin do
    resources :events
    resources :recipes
    resources :reservations, only: [:index, :destroy]
  end
end
