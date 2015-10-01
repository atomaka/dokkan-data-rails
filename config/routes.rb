Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :links
  resources :welcome, only: [:index]

  root to: 'welcome#index'
end
