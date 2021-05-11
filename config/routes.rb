Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#logout'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  get '/search', to: 'devices#search', as: 'search' 
  get '/devices/order_by_quantity', to: 'devices#order_by_quantity'

  get '/filter_by_location', to: 'rooms#filter_by_location'   

  root('static#home')

  get '/automations', to: 'automations#all'
  resources :devices do
    resources :automations
  end
  
  delete '/devices/:id/automations/:id', to: 'automations#destroy'

  resources :users do
    resources :rooms
  end
  
  resources :rooms
  
end
