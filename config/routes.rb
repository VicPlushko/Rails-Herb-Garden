Rails.application.routes.draw do
  root 'application#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/home', to: 'users#home'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users do
    resources :remedies
  end

  resources :herbs
  resources :remedies
  


  
end
