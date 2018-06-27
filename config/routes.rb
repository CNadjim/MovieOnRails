Rails.application.routes.draw do
  resources :tvshows
  resources :criticals
  devise_for :users
  get '/login' => 'users#login'
  get '/register' => 'users#register'
  get '/forgot-password' => 'users#forgot'
  get '/' => 'home#index'
  get '/update/movies' => 'movies#updateMovies'
  get '/update/genres' => 'movies#updateGenres'
  post 'movies/:id/add_comment' => 'movies#create_comment'
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
