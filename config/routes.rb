Air::Application.routes.draw do

  root :to => 'flights#index'
  
  # root(:to => "flights#index")
  # 
  # def root(opts)
  # end
  
  resources :reservations
  resources :users
  resources :flights
  resources :airports

  
  get "sessions/new", :as => :login_page
  post "sessions/create"
  delete "sessions/destroy"


end
