# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160419183423) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "ancestry"
    t.integer  "status",     default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "cities", force: :cascade do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status",     default: 0
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.integer  "place_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "floors",     default: 1
    t.text     "address"
  end

  add_index "galleries", ["place_id"], name: "index_galleries_on_place_id", using: :btree
  add_index "galleries", ["user_id"], name: "index_galleries_on_user_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "photo"
    t.integer  "city_id"
    t.integer  "status",     default: 0
    t.integer  "integer",    default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "user_id"
  end

  add_index "places", ["city_id"], name: "index_places_on_city_id", using: :btree
  add_index "places", ["user_id"], name: "index_places_on_user_id", using: :btree

  create_table "positions", force: :cascade do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "local_id"
    t.string   "local_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "positions", ["local_type", "local_id"], name: "index_positions_on_local_type_and_local_id", using: :btree

  create_table "routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "place_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "routes", ["place_id"], name: "index_routes_on_place_id", using: :btree
  add_index "routes", ["user_id"], name: "index_routes_on_user_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "acronym"
    t.string   "name"
    t.string   "capital_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "states", ["capital_id"], name: "index_states_on_capital_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role"
    t.string   "name"
    t.integer  "state_id"
    t.integer  "city_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "access_token"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["state_id"], name: "index_users_on_state_id", using: :btree

  add_foreign_key "cities", "states"
  add_foreign_key "galleries", "places"
  add_foreign_key "galleries", "users"
  add_foreign_key "places", "cities"
  add_foreign_key "places", "users"
  add_foreign_key "routes", "places"
  add_foreign_key "routes", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "states"
end
