Rails.application.routes.draw do

  # scope '/crafts' do
  #   resources :craft_categories, only: [:index]
  # end

  # get '/supplies/categories', to: 'craft_categories#index'


  resources :supplies
    # resources :craft_categories, only: :index
  
  #not what i actually want, just me messing around to make sure i understand nested resources
  resources :craft_categories, only: [:index, :show], :path =>"crafts" do
    resources :crafts, only: :show, :path =>"/"
  end
  resources :crafts, only: [:create, :new, :edit, :update, :destroy], :path =>"craft"
  get '/all_crafts', to: 'crafts#index', as: 'all_crafts'
  #lol remember to add delete buttons!!!!
  resources :supply_categories
  resources :users
  get '/', to: 'application#index', as: 'homepage'
  get '/login', to: 'users#login'
  post '/login', to: 'users#create_session'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'

end
