Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  #devise_for :users

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :chat_rooms, only: [:new, :create, :show, :index]

#  root 'chat_rooms#index'
  root 'pages#index'

  #Show all tables
  get '/tables', to: 'pages#tables'

  #Get menu items
  get '/get_menu', to: 'api/items#get_menu'

  post '/change_pin', to: 'api/chat_rooms#change_pin'
  post '/check_pin', to: 'chat_rooms#check_pin'

end
