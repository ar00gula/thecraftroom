Rails.application.routes.draw do

  # scope '/crafts' do
  #   resources :craft_categories, only: [:index]
  # end

  # get '/supplies/categories', to: 'craft_categories#index'

  resources :craft_categories, only: [:index, :show, :update], :path =>"/crafts" do 
    resources :crafts, only: [:show, :new], :path =>"activities"
  end

  resources :crafts, :path =>"activities"

  resources :supplies
  patch '/supply', to: 'supplies#update_stock'
  
  resources :supply_categories, except: :new
  resources :users, except: [:new, :show]
  get '/', to: 'application#homepage', as: 'homepage'
  get '/login', to: 'users#login'
  post '/login', to: 'users#create_session'
  patch '/login', to: 'users#create_session'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#create'
  get '/home', to: 'users#show'


  get '/auth/facebook/callback' => 'users#create_facebook'
  
# This will do what I want it to but also is definitely what namespaced routes are for and I woul dlike to add that!!
  # resources :admin do
  #   resources: :users, only: index
  # end

end
