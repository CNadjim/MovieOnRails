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

    create_table :tvshows
    add_column :tvshows, :name, :string
    add_column :tvshows, :original_name, :string
    add_column :tvshows, :original_language, :string
    add_column :tvshows, :popularity, :integer
    add_column :tvshows, :original_country, :string
    add_column :tvshows, :vote_count, :integer
    add_column :tvshows, :first_air_date, :datetime
    add_column :tvshows, :idDb, :string
    add_column :tvshows, :vote_average, :integer
    add_column :tvshows, :overview, :text
    add_column :tvshows, :poster_path, :string
    add_column :tvshows, :backdrop_path, :string
    add_column :tvshows, :in_production, :boolean
    add_column :tvshows, :last_air_date, :datetime
    add_column :tvshows, :number_of_episode, :integer
    add_column :tvshows, :number_of_seasons, :integer
    add_index :tvshows,  :name, unique: true

  end

end
