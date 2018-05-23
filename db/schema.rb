# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180523174856) do

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "video"
    t.string "original_language"
    t.string "original_title"
    t.string "idDB"
    t.integer "revenue"
    t.integer "budget"
    t.integer "runtime"
    t.string "poster_path"
    t.string "backdrop_path"
    t.datetime "release_date"
    t.integer "vote_count"
    t.integer "vote_average"
    t.text "overview"
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

end
