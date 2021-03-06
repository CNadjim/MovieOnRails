class CreateJoinTableMovieGenre < ActiveRecord::Migration[5.1]
  def change
    create_join_table :movies, :genres do |t|
      # t.index [:movie_id, :genre_id]
      # t.index [:genre_id, :movie_id]
    end
    create_join_table :tvshows, :genres do |t|
      # t.index [:tvshow_id, :genre_id]
      # t.index [:genre_id, :tvshow_id]
    end
  end
end
