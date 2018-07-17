class MoviesController < ApplicationController
  before_action :set_movie,only: ['show']
  before_action :authenticate_user!, only: %i[create_comment]
  authorize_resource


  def index
    @search = params[:search]
    @movies= Movie.search(params[:search]).page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @comment.user = current_user
    @comment.movie = @movie

    if (current_user != nil)
      @rating = Rating.find_by(user_id: current_user.id, movie_id: @movie.id)

      if @rating == nil
        @rating = Rating.new
        @rating.score = 0
      end
    end


    @total = @movie.ratings.length
    @moyenne = 0
    @pourcentage = 0

    for rate in @movie.ratings
      @moyenne += rate.score
    end

    if @total > 0
      @moyenne = @moyenne/@total
      @pourcentage = @moyenne / 5.0 * 100.0
    else
      @moyenne = 0
      @pourcentage = 0
    end

  end



  private
    def set_movie
      @movie = Movie.includes(:comments, :criticals, :ratings).find(params[:id])
    end
end