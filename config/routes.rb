Rails.application.routes.draw do

  # scope '/crafts' do
  #   resources :craft_categories, only: [:index]
  # end

  # get '/supplies/categories', to: 'craft_categories#index'


  resources :supplies
    # resources :craft_categories, only: :index
  get '/crafts/all', to: 'crafts#index', as: 'all_crafts'

  #not what i actually want, just me messing around to make sure i understand nested resources
  resources :craft_categories, only: [:index, :show, :update], :path =>"crafts" do
    resources :crafts, :path =>"/"
  end
  resources :crafts, only: [:create, :new, :edit, :update, :destroy], :path =>"craft"
  post '/craft/new', to: "crafts#create" #this seems like it miht be very wrong but it's working
  #lol remember to add delete buttons!!!!
  resources :supply_categories
  resources :users
  get '/', to: 'application#index', as: 'homepage'
  get '/login', to: 'users#login'
  post '/login', to: 'users#create_session'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'
  get '/auth/facebook/callback' => 'users#create_facebook' 

end
