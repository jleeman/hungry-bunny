Rails.application.routes.draw do
  root to: 'pages#front'
  get 'event', to: 'events#show'

  resources :events, only: [:index, :show]
end
