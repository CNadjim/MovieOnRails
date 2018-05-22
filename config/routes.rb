Rails.application.routes.draw do
  get '/' => 'home#index'
  get '/movies/update' => 'movies#update'
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
