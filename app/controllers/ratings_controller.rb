class RatingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]
  before_action :authenticate_user!, only: [:update]

  def update
    rating = Rating.new(rating_params)
    if rating.movie == nil
      @rating = Rating.find_by(user_id: current_user.id, tvshow_id: rating.tvshow.id)
    else
      @rating = Rating.find_by(user_id: current_user.id, movie_id: rating.movie.id)
    end

    if @rating == nil
      @rating = Rating.new(rating_params)
      @rating.user_id = current_user.id
      @rating.save
    else
      @rating.update_attributes(score: rating.score)
    end
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def rating_params
    params.require(:rating).permit(:score, :movie_id, :tvshow_id)
  end
end
