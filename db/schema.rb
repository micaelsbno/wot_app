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

ActiveRecord::Schema.define(version: 2018_09_13_075055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_times", force: :cascade do |t|
    t.bigint "event_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_times_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "image_url"
    t.bigint "fb_id"
    t.bigint "place_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_events_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "street"
    t.string "country"
    t.integer "zip"
    t.float "latitude"
    t.float "longitude"
    t.bigint "fb_id"
    t.text "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_events", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.string "rsvp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.float "latitude"
    t.float "longitude"
    t.integer "radius"
    t.bigint "fb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_times", "events"
  add_foreign_key "events", "places"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
end
