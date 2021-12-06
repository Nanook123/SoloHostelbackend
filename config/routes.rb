Rails.application.routes.draw do
  get '/hostels/mine', to: 'hostels#mine'
  resources :hostels, only: [:create, :index, :destroy]

  get '/users', to: 'users#index'
  resources :users, only: [] do
    resources :friends, only: [:create, :destroy], shallow: true
  end
  get '/me', to: 'users#show'
  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/hostel_post', to: 'hostels#create'
  delete '/removefriend/:id', to: 'friends#destroy'
  post '/friendlist', to: 'friends#create'
  get '/friend', to: 'friends#index'
end
