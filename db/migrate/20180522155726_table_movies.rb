class TableMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies
    add_column :movies, :title, :string
    add_column :movies, :video, :string
    add_column :movies, :poster_path, :string
    add_column :movies, :backdrop_path, :string
    add_column :movies, :release_date, :datetime
    add_column :movies, :vote_count, :integer
    add_column :movies, :vote_average, :integer
    add_column :movies, :overview, :text
    add_index :movies, :title, unique: true
  end
end
