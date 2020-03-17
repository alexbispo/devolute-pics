Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth', to: 'authentication#create'
      post 'auth/check', to: 'authentication#token_check'
      resources :users, only: [:create]
      resources :pictures, only: [:create, :index]
    end
  end
end
