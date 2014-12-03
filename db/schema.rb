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

ActiveRecord::Schema.define(version: 20141203072824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gas", force: true do |t|
    t.string   "station"
    t.string   "station_id",    default: "0"
    t.string   "zip"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "address"
    t.string   "phone",         default: "951-277-7772"
    t.string   "lat"
    t.string   "lng"
    t.string   "diesel",        default: "0"
    t.string   "reg_date",      default: "0"
    t.string   "mid_date",      default: "0"
    t.string   "pre_date",      default: "0"
    t.string   "diesel_date",   default: "0"
    t.string   "reg_price",     default: "0"
    t.string   "mid_price",     default: "0"
    t.string   "pre_price",     default: "0"
    t.string   "diesel_price",  default: "0"
    t.string   "reg_update",    default: "RCART"
    t.string   "mid_update",    default: "RCART"
    t.string   "pre_update",    default: "RCART"
    t.string   "diesel_update", default: "RCART"
    t.string   "distance"
    t.string   "credit",        default: "0"
    t.string   "carwash",       default: "0"
    t.string   "hours",         default: "0"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "wishlist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category",    default: ""
    t.string   "price",       default: "0.00"
  end

  create_table "products", force: true do |t|
    t.string   "name",       default: ""
    t.string   "store_name", default: ""
    t.string   "lat",        default: "0"
    t.string   "long",       default: "0"
    t.string   "price",      default: "0"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",             default: ""
    t.string   "last_name",              default: ""
    t.string   "username",               default: ""
    t.boolean  "admin",                  default: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "wishlists", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
