Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#logout'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/search', to: 'devices#search', as: 'search'  

  root('static#home')

  get '/automations', to: 'automations#all'
  resources :devices do
    resources :automations
  end

  resources :users do
    resources :rooms
  end
  
  resources :devices, :users, :rooms
  
end
