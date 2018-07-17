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

ActiveRecord::Schema.define(version: 20180717204411) do

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "tvshow_id"
    t.index ["movie_id"], name: "index_comments_on_movie_id"
    t.index ["tvshow_id"], name: "index_comments_on_tvshow_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "criticals", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.date "date"
    t.integer "user_id"
    t.integer "movie_id"
    t.integer "tvshow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_criticals_on_movie_id"
    t.index ["tvshow_id"], name: "index_criticals_on_tvshow_id"
    t.index ["user_id"], name: "index_criticals_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
  end

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "genres_tvshows", id: false, force: :cascade do |t|
    t.integer "tvshow_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "video"
    t.string "original_language"
    t.string "original_title"
    t.string "idDB"
    t.integer "revenue", limit: 8
    t.integer "budget", limit: 8
    t.integer "runtime"
    t.string "poster_path"
    t.string "backdrop_path"
    t.datetime "release_date"
    t.integer "vote_count"
    t.integer "vote_average"
    t.text "overview"
    t.index ["title"], name: "index_movies_on_title", unique: true
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "user_id"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tvshow_id"
    t.index ["movie_id"], name: "index_ratings_on_movie_id"
    t.index ["tvshow_id"], name: "index_ratings_on_tvshow_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tvshows", force: :cascade do |t|
    t.string "name"
    t.string "original_name"
    t.string "original_language"
    t.integer "popularity"
    t.string "original_country"
    t.integer "vote_count"
    t.datetime "first_air_date"
    t.string "idDb"
    t.integer "vote_average"
    t.text "overview"
    t.string "poster_path"
    t.string "backdrop_path"
    t.boolean "in_production"
    t.datetime "last_air_date"
    t.integer "number_of_episode"
    t.integer "number_of_seasons"
    t.index ["name"], name: "index_tvshows_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
