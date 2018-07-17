Rails.application.routes.draw do
  devise_for :users
  get '/login' => 'users#login'
  get '/register' => 'users#register'
  get '/forgot-password' => 'users#forgot'
  get '/' => 'home#index'
  post '/movies' => 'movies#index'
  post '/tvshows' => 'tvshows#index'
  get '/profile' => 'user#profile'
  post '/comments/movies/:id' => 'comments#create_movies_comment'
  post '/comments/tvshows/:id' => 'comments#create_tvshows_comment'
  post '/criticals/movies/:id' => 'criticals#create_movies_critical'
  post '/criticals/tvshows/:id' => 'criticals#create_tvshows_critical'
  get  '/criticals/movies/new/:id' => 'criticals#new_movies_critical'
  get  '/criticals/tvshows/new/:id' => 'criticals#new_tvshows_critical'
  get  '/criticals/:id' => 'criticals#show'
  patch  '/ratings' => 'ratings#update'
  resources :movies
  resources :tvshows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
