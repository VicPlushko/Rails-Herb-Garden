Rails.application.routes.draw do
  root 'application#welcome'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/home', to: 'users#home'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users do
    resources :remedies, only: [:new, :create, :show, :edit, :update, :destroy]
  end

  resources :herbs
  resources :remedies
  


  
end
