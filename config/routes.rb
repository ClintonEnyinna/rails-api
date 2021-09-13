Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :tasks

      post '/login', to: 'authentication#authenticate'
    end
  end
end
