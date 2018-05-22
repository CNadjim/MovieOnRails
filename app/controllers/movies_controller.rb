class MoviesController < ApplicationController
  include HTTParty
  BASE_URL = "https://api.themoviedb.org/3/movie/popular?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR&region=FRA&page=1"

  def update
    for i in 0..6
      response = HTTParty.get(BASE_URL+i.to_s, :headers =>{'Content-Type' => 'application/json'} ).to_json
      result = JSON.parse(response)["results"]
      for movie in result
        pp movie["title"]
        movieDB = Movie.new
        movieDB.title = movie["title"]
        movieDB.video = movie["video"]
        if movie["poster_path"].present?
          movieDB.poster_path = "https://image.tmdb.org/t/p/original"+ movie["poster_path"]
        end
        if movie["backdrop_path"].present?
          movieDB.backdrop_path = "https://image.tmdb.org/t/p/original"+ movie["backdrop_path"]
        end
        movieDB.release_date = movie["release_date"]
        movieDB.vote_count = movie["vote_count"]
        movieDB.vote_average = movie["vote_average"]
        movieDB.overview = movie["vote_average"]
        if !Movie.exists?(:title => movie["title"])
          movieDB.save
        end
      end
    end
    redirect_to movies_path
  end

  def index
    @movies = Movie.all
  end
end