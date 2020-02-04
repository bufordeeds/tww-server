Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers
      post '/login', to: 'auth#create'
      get '/profile', to: 'customers#profile'
    end
  end
end
