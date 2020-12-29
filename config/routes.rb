Rails.application.routes.draw do

  # scope '/crafts' do
  #   resources :craft_categories, only: [:index]
  # end

  get '/supplies/categories', to: 'craft_categories#index'
  
  
  resources :crafts
  resources :supplies do
    resources :craft_categories, only: :index
  end
  #not what i actually want, just me messing around to make sure i understand nested resources
  resources :craft_categories

  resources :supply_categories
  resources :users
  get '/', to: 'application#index', as: 'homepage'
  get '/login', to: 'users#login'
  post '/login', to: 'users#create_session'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'
  get '/crafts/new/add_supplies', to: 'crafts#add_supplies'
  post '/crafts/new/add_supplies', to: 'crafts#add_supplies_create'

  
  resources :sessions, only: [:create]
end
