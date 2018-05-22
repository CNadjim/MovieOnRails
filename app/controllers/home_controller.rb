class HomeController < ApplicationController
  layout "landing"
  def index
    @movies = Movie.all
  end
end
