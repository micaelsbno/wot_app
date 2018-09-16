Rails.application.routes.draw do
  resources :users
  delete '/sessions', to: 'sessions#destroy' 
  resources :sessions
  get '/', to: 'home#index'
  get '/login', to: 'home#login'
  get '/events', to: 'events#index'
  get '/events/:id', to: 'events#show'

  get '/update_events', to: 'api/events#update_events'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
