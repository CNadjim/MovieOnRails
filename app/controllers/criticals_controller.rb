class CriticalsController < ApplicationController
  before_action :set_critical, only: [:show, :destroy]


  # GET /criticals/1
  # GET /criticals/1.json
  def show
  end

  # GET /criticals/movies/new
  def new_movies_critical
    if !(Movie.exists?(:id => params["id"]))
      redirect_to "/"
    else
      @critical = Critical.new
      @critical.movie = Movie.find(params["id"])
    end
  end

  # GET /criticals/tvshows/new
  def new_tvshows_critical
    if !(Tvshow.exists?(:id => params["id"]))
      redirect_to "/"
    else
      @critical = Critical.new
      @critical.tvshow = Tvshow.find(params["id"])
    end
  end


  # POST /criticals/movies/:id
  def create_movies_critical
    @critical = Critical.new(critical_params)
    @critical.user_id = current_user.id
    @critical.date = Date.today
    respond_to do |format|
      if @critical.save
        format.html { redirect_to @critical.movie, notice: 'Critical was successfully created.' }
      else
        format.html { redirect_to '/criticals/new?id='+@critical.movie.id.to_s }
      end
    end
  end

  # POST /criticals/tvshows/:id
  def create_tvshows_critical
    @critical = Critical.new(critical_params)
    @critical.user_id = current_user.id
    @critical.date = Date.today
    respond_to do |format|
      if @critical.save
        format.html { redirect_to @critical.tvshow, notice: 'Critical was successfully created.' }
      else
        format.html { redirect_to '/criticals/new?id='+@critical.tvshow.id.to_s }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_critical
      @critical = Critical.includes(:user,:movie).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def critical_params
      params.require(:critical).permit(:title, :text, :date, :user_id, :movie_id,:tvshow_id)
    end
end
