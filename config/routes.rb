Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  get '/logout', to: 'sessions#logout'
  delete '/logout', to: 'sessions#logout'

  get '/automations/new', to: 'automations#new'
  post '/automations/create', to: 'automations#create'

  root('static#home')

  resources :devices, :user_devices, :automations, :users
  
end
