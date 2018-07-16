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
  end

  def create_comment
    comment = Comment.new
    comment.text = params["comment"]["text"]
    comment.date = Date.today
    comment.user_id = current_user.id
    comment.tvshow_id = params["id"]
    comment.save
    redirect_to "/tvshows/"+params["id"].to_s+"#listCom"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvshow
      @tvshow = Tvshow.includes(:comments, :criticals).find(params[:id])
    end
end
