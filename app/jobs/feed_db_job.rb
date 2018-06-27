class FeedDbJob < ApplicationJob
  queue_as :urgent
  include HTTParty
  BASE_URL_MOVIES = "https://api.themoviedb.org/3/movie/popular?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR&region=FRA&page="
  BASE_URL_SERIES = "https://api.themoviedb.org/3/tv/popular?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR&page="

  def perform(*args)
    getMoviesGenresFromApi
    getSeriesGenresFromApi
    getMoviesFromApi(1)
    getSeriesFromApi(1)
  end


  private
  def getMoviesGenresFromApi
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
  def getSeriesGenresFromApi
    urlGenre = "https://api.themoviedb.org/3/genre/tv/list?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR"
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
        url = "https://www.youtube.com/embed/"+video["key"]
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
    for i in 1..page
      response = HTTParty.get(BASE_URL_MOVIES+i.to_s, :headers =>{'Content-Type' => 'application/json'} ).to_json
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

  def addDetailSerie(serie,id)
    urlDetail = "https://api.themoviedb.org/3/tv/"+id.to_s+"?api_key=3942737097dcd29145fe000304ac2294&language=fr-FR"
    response = HTTParty.get(urlDetail, :headers =>{'Content-Type' => 'application/json'} ).to_json
    result = JSON.parse(response)
    serie.original_country = result["original_country"]
    serie.in_production = result["in_production"]
    serie.last_air_date = result["last_air_date"]
    for genre in result["genres"]
      serie.genres << Genre.find_by(name: genre["name"])
    end
  end
  def getSeriesFromApi(page)
    for i in 1..page
      response = HTTParty.get(BASE_URL_SERIES+i.to_s, :headers =>{'Content-Type' => 'application/json'} ).to_json
      result = JSON.parse(response)["results"]
      for serie in result
        serieDB = Tvshow.new
        addDetailSerie(serieDB,serie["id"])
        serieDB.original_name = serie["original_name"]
        serieDB.name = serie["name"]
        serieDB.popularity = serie["popularity"]
        serieDB.vote_count = serie["vote_count"]
        serieDB.first_air_date = serie["first_air_date"]
        serieDB.original_language = serie["original_language"]
        serieDB.idDb = serie["id"]
        serieDB.vote_average = serie["vote_average"]
        serieDB.overview = serie["overview"]
        if serie["poster_path"].present?
          serieDB.poster_path = "https://image.tmdb.org/t/p/original"+ serie["poster_path"]
        end
        if serie["backdrop_path"].present?
          serieDB.backdrop_path = "https://image.tmdb.org/t/p/original"+ serie["backdrop_path"]
        end
        if !Tvshow.exists?(:name => serie["name"])
          serieDB.save
        end
      end
    end
  end
end
