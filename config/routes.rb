Rails.application.routes.draw do

  # scope '/crafts' do
  #   resources :craft_categories, only: [:index]
  # end

  get '/crafts/categories', to: 'craft_categories#index'
  
  
  resources :crafts
  resources :supplies
  resources :craft_categories
  resources :supply_categories
  resources :users

  get '/login', to: 'users#login'
  post '/login', to: 'users#create_session'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'
  get '/crafts/new/add_supplies', to: 'crafts#add_supplies'
  post '/crafts/new/add_supplies', to: 'crafts#add_supplies_create'

  
  resources :sessions, only: [:create]
end
