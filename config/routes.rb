Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :games
      resources :moves
      resources :pieces
      resources :sessions
      resources :symbols
      resources :users do
        collection do
          resources :current
        end
      end
    end
  end

  root 'games#index'
  get "*path", to: 'games#index'
end
