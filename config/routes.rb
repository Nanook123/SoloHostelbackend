Rails.application.routes.draw do
  resources :hostel_posts
  resources :friends
  resources :users
  get '/me', to: 'users#show'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end