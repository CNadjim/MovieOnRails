class TvshowsController < ApplicationController
  before_action :set_tvshow, only: [:show]
  before_action :authenticate_user!, only: %i[create_comment]

  # GET /tvshows
  # GET /tvshows.json
  def index
    @search = params[:search]
    @tvshows= Tvshow.search(params[:search]).page(params[:page]).per(10)
  end

  # GET /tvshows/1
  # GET /tvshows/1.json
  def show
    @comment = Comment.new
    @comment.user = current_user
    @comment.tvshow = @tvshow

    if (current_user != nil)
      @rating = Rating.find_by(user_id: current_user.id, tvshow_id: @tvshow.id)

      if @rating == nil
        @rating = Rating.new
        @rating.score = 0
      end
    end


    @total = @tvshow.ratings.length
    @moyenne = 0
    @pourcentage = 0

    for rate in @tvshow.ratings
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
    # Use callbacks to share common setup or constraints between actions.
    def set_tvshow
      @tvshow = Tvshow.includes(:comments, :criticals, :ratings).find(params[:id])
    end
end
