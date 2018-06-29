Rails.application.routes.draw do
  resources :tvshows
  resources :criticals
  devise_for :users
  get '/login' => 'users#login'
  get '/register' => 'users#register'
  get '/forgot-password' => 'users#forgot'
  get '/' => 'home#index'
  post 'movies' => 'movies#index'
  post 'tvshows' => 'tvshows#index'
  post 'movies/:id/add_comment' => 'movies#create_comment'
  post 'tvshows/:id/add_comment' => 'tvshows#create_comment'
  resources :movies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
