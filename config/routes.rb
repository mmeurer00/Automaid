Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  
  
  delete '/logout', to: 'sessions#logout'

  get '/automations/new', to: 'automations#new'
  post '/automations/create', to: 'automations#create'

  root('static#home')

  resources :users do
    resources :rooms, only: [:show, :index, :new, :create]
  end

  resources :devices do
    resources :automations
  end
  
  resources :devices, :rooms, :users
  
end
