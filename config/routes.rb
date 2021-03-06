Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers
      resources :orders
      resources :items
      resources :addresses
      resources :order_items
      post '/login', to: 'auth#create'
      get '/profile', to: 'customers#profile'
    end
  end
end
