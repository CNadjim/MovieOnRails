class IncreaseMovieRevenuColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :movies, :revenue, :integer, limit: 8
    change_column :movies, :budget, :integer, limit: 8
  end
end
