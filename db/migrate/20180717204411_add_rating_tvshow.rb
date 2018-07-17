class AddRatingTvshow < ActiveRecord::Migration[5.1]
  def change
    add_reference :ratings, :tvshow, foreign_key: true
  end
end
