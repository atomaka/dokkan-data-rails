Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :awaken_types
  resources :cards
  resources :characters
  resources :leader_skills
  resources :links
  resources :passive_skills
  resources :rarities
  resources :super_attacks
  resources :types
  resources :welcome, only: [:index]

  root to: 'welcome#index'
end
