[![npm](https://img.shields.io/badge/demo-online-ed1c46.svg)](https://movie-on-rails-esgi.herokuapp.com/)
[![Build Status](https://travis-ci.org/CNadjim/MovieOnRails.svg?branch=master)](https://travis-ci.org/CNadjim/MovieOnRails)
[![GitHub issues](https://img.shields.io/github/issues/CNadjim/MovieOnRails.svg)](https://github.com/CNadjim/MovieOnRails/issues)
[![License Apache-2.0](https://img.shields.io/badge/license-APACHE_2.0-blue.svg)](https://github.com/BettorLeague/bettor-league/blob/master/LICENSE)

# MovieOnRails
https://movie-on-rails-esgi.herokuapp.com/

### Prerequisites

Ensure you have this installed before proceeding further
- Ruby 2.5
- Rails 5.1.6

## Local Environment 

### Launch App
http://localhost:3000
```
$ bundle
$ rails db:migrate RAILS_ENV=development
$ rails s
```
And launch browser to endpoints :
- http://localhost:3000/update/genres
- http://localhost:3000/update/movies
### Rails code
Heroku migrate
```
heroku run rake db:migrate
```
Local reset db
```
rake db:reset db:migrate
```
Create migration & migrate
```
rails generate migration migrationName
rails db:migrate
```
Generate model
```
rails generate model Type name:string color:string --skip-test-framework
rails db:migrate
```

Generate Scaffold
```
rails generate scaffold Type name:string color:string --skip --skip-test-framework --skip-assets
rails db:migrate
```

Add reference
```
rails g migration addTypePokemon2 type:references

In MODEL : add_reference :pokemons, :type, foreign_key:true
```
Add Model
```
rails g model PokemonMove pokemon:references move:references --skip-test-framework
```
Devise
```
gem 'devise'
gem 'devise-i18n'
bundle exec rails generate devise:install
bundle exec rails  generate devise User
bundle exec rails db:migrate
bundle exec rails generate devise:i18n:views
```
Drop db
```
rake db:drop db:create db:migrate
```
### Useful Links 
```
API KEY : 3942737097dcd29145fe000304ac2294
```

```
http://image.tmdb.org/t/p/original/ + imgUrl
```

- https://www.themoviedb.org/documentation/api
- https://medium.com/@felipeluizsoares/automatically-deploy-with-travis-ci-and-heroku-ddba1361647f
- https://openclassrooms.com/courses/initiez-vous-a-ruby-on-rails
- https://stackoverflow.com/questions/42980593/read-data-from-external-api-every-10-seconds
- https://rails-assets.org

### TMDB API
API KEY : `3942737097dcd29145fe000304ac2294`

Exemple de requête API : `https://api.themoviedb.org/3/movie/550?api_key=3942737097dcd29145fe000304ac2294`

API DOC : https://developers.themoviedb.org/3/movies/get-popular-movies
