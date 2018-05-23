Rails.application.routes.draw do
  get '/' => 'home#index'
  get '/update/movies' => 'movies#updateMovies'
  get '/update/genres' => 'movies#updateGenres'
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
