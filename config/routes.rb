Rails.application.routes.draw do
  resources :games
  resources :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/users' => 'players#create'
  post '/login' =>  'players#login'
  get '/notifications' => 'games#notifications'  
end
