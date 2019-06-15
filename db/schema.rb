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

ActiveRecord::Schema.define(version: 2019_06_15_132239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_tags", force: :cascade do |t|
    t.bigint "area_id"
    t.bigint "tag_id"
    t.index ["area_id"], name: "index_area_tags_on_area_id"
    t.index ["tag_id"], name: "index_area_tags_on_tag_id"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.integer "desk_number"
    t.integer "current_population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_desks", force: :cascade do |t|
    t.date "starts_at"
    t.date "ends_at"
    t.bigint "user_id"
    t.bigint "desk_id"
    t.index ["desk_id"], name: "index_booking_desks_on_desk_id"
    t.index ["user_id"], name: "index_booking_desks_on_user_id"
  end

  create_table "booking_rooms", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "room_id"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.index ["room_id"], name: "index_booking_rooms_on_room_id"
    t.index ["user_id"], name: "index_booking_rooms_on_user_id"
  end

  create_table "desks", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.index ["area_id"], name: "index_desks_on_area_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_rooms_on_area_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "unavailability_desks", force: :cascade do |t|
    t.date "starts_at"
    t.date "ends_at"
    t.bigint "desk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["desk_id"], name: "index_unavailability_desks_on_desk_id"
  end

  create_table "unavailability_rooms", force: :cascade do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_unavailability_rooms_on_room_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "job"
    t.integer "balance", default: 100
    t.boolean "has_dog", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "area_tags", "areas"
  add_foreign_key "area_tags", "tags"
  add_foreign_key "booking_desks", "desks"
  add_foreign_key "booking_desks", "users"
  add_foreign_key "booking_rooms", "rooms"
  add_foreign_key "booking_rooms", "users"
  add_foreign_key "rooms", "areas"
  add_foreign_key "unavailability_desks", "desks"
  add_foreign_key "unavailability_rooms", "rooms"
end
