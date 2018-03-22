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

ActiveRecord::Schema.define(version: 20180322152752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breeds", force: :cascade do |t|
    t.string "name", null: false
    t.string "life_expectancy", null: false
    t.string "personality", null: false
    t.string "shedding", null: false
    t.string "height", null: false
    t.string "weight", null: false
    t.string "grooming", null: false
    t.string "img_url", null: false
    t.integer "kid_friendly_avg"
    t.integer "dog_friendly_avg"
    t.integer "barking_lvl_avg"
    t.integer "trainability_avg"
    t.integer "energy_lvl_avg"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_breeds_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "breed_id"
    t.bigint "user_id"
    t.integer "kid_friendly", null: false
    t.integer "dog_friendly", null: false
    t.integer "barking_lvl", null: false
    t.integer "trainability", null: false
    t.integer "energy_lvl", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "thumbs_up_count", default: 0, null: false
    t.integer "thumbs_down_count", default: 0, null: false
    t.index ["breed_id"], name: "index_reviews_on_breed_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.integer "value", null: false
    t.integer "breed_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "breeds", "users"
end
