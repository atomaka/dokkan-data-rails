Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get '/welcome', to: 'welcome#index'

  root to: 'welcome#index'

  namespace :admin do
    root to: 'dashboard#index'

    get '/dashboard', to: 'dashboard#index'

    resources :awaken_types
    resources :cards
    resources :characters
    resources :leader_skills
    resources :links
    resources :passive_skills
    resources :rarities
    resources :super_attacks
    resources :types
    resources :users, except: [:new, :create]
    resources :versions, only: [:show]
  end

  namespace :api do
    namespace :v1 do
      resources :cards, only: [:index, :show]
      resources :links, only: [:index, :show]
    end
  end
end
