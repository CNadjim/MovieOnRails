class MoviesController < ApplicationController
  before_action :set_movie,only: ['show']
  before_action :authenticate_user!, only: %i[create_comment]

  authorize_resource

  def index
    @movies = Movie.page(params[:page]).per(10)
  end

  def show
    @comment = Comment.new
    @comment.user = current_user
    @comment.movie = @movie
  end

  def create_comment
    comment = Comment.new
    comment.text = params["comment"]["text"]
    comment.date = Date.today
    comment.user_id = current_user.id
    comment.movie_id = params["id"]
    comment.save
    redirect_to "/movies/"+params["id"].to_s+"#listCom"
  end

  private
    def set_movie
      @movie = Movie.includes(:comments, :criticals).find(params[:id])
    end
end