class InitDb < ActiveRecord::Migration[5.1]
  def change
    create_table :genres
    add_column :genres, :name, :string

    create_table :movies
    add_column :movies, :title, :string
    add_column :movies, :video, :string
    add_column :movies, :original_language, :string
    add_column :movies, :original_title, :string
    add_column :movies, :idDB, :string
    add_column :movies, :revenue, :integer
    add_column :movies, :budget, :integer
    add_column :movies, :runtime, :integer
    add_column :movies, :poster_path, :string
    add_column :movies, :backdrop_path, :string
    add_column :movies, :release_date, :datetime
    add_column :movies, :vote_count, :integer
    add_column :movies, :vote_average, :integer
    add_column :movies, :overview, :text
    add_index :movies,  :title, unique: true
  end
end
