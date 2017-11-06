Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games
      resources :moves
      resources :pieces
      resources :symbols
      resources :users
    end
  end

  root 'games#index'
  get "*path", to: 'games#index'
end
