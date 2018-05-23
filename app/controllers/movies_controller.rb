class MoviesController < ApplicationController
  include HTTParty
  BASE_URL = "https://api.themoviedb.org/3/movie/popular?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR&region=FRA&page=1"
  before_action :set_movie,only: ['show','edit','update','destroy']

  def updateDB
    getGenresFromApi
    getMoviesFromApi(1)
    redirect_to movies_path
  end

  def index
    @movies = Movie.all
  end

  def show
  end

  private
    def getGenresFromApi
      urlGenre = "https://api.themoviedb.org/3/genre/movie/list?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR"
      response = HTTParty.get(urlGenre, :headers =>{'Content-Type' => 'application/json'} ).to_json
      result = JSON.parse(response)["genres"]
      for genre in result
        genreDB = Genre.new
        genreDB.name = genre["name"]
        if !Genre.exists?(:name => genre["name"])
          genreDB.save
        end
      end
    end
    def getYoutubeTrailer(filmId)
      urlVideo = "https://api.themoviedb.org/3/movie/"+filmId.to_s+"/videos?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR"
      response = HTTParty.get(urlVideo, :headers =>{'Content-Type' => 'application/json'} ).to_json
      result = JSON.parse(response)["results"]
      url = nil
      for video in result
        if(video["type"] == "Trailer" && video["site"] == "YouTube")
          url = "https://www.youtube.com/watch?v=cxxHCa5VhQM"+video["key"]
        end
      end
      return url
    end

    def addDetailMovie(movie,id)
      urlDetail = "https://api.themoviedb.org/3/movie/"+id.to_s+"?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR"
      response = HTTParty.get(urlDetail, :headers =>{'Content-Type' => 'application/json'} ).to_json
      result = JSON.parse(response)
      movie.runtime = result["runtime"]
      movie.budget = result["budget"]
      movie.revenue = result["revenue"]
      for genre in result["genres"]
        movie.genres << Genre.find_by(name: genre["name"])
      end
    end

    def getMoviesFromApi(page)
      for i in 0..page
        response = HTTParty.get(BASE_URL+i.to_s, :headers =>{'Content-Type' => 'application/json'} ).to_json
        result = JSON.parse(response)["results"]
        for movie in result
          movieDB = Movie.new
          movieDB.title = movie["title"]
          movieDB.video = getYoutubeTrailer(movie["id"])
          movieDB.original_language = movie["original_language"]
          movieDB.original_title = movie["original_title"]
          movieDB.idDB = movie["id"]
          addDetailMovie(movieDB,movie["id"])
          if movie["poster_path"].present?
            movieDB.poster_path = "https://image.tmdb.org/t/p/original"+ movie["poster_path"]
          end
          if movie["backdrop_path"].present?
            movieDB.backdrop_path = "https://image.tmdb.org/t/p/original"+ movie["backdrop_path"]
          end
          movieDB.release_date = movie["release_date"]
          movieDB.vote_count = movie["vote_count"]
          movieDB.vote_average = movie["vote_average"]
          movieDB.overview = movie["overview"]
          if !Movie.exists?(:title => movie["title"])
            movieDB.save
          end
        end
      end
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end
end