class HomeController < ApplicationController
  layout "landing"

  def index
    @movies = Movie.all.last(10)
  end

end
