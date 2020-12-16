Rails.application.routes.draw do
  resources :projects
  resources :crafts
  resources :supplies
  resources :users

  get '/login', to: 'users#login'
  post '/login', to: 'users#create_session'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'
  
  resources :sessions, only: [:create]
end
