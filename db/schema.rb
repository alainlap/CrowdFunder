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

ActiveRecord::Schema.define(version: 20131205182525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "goal"
    t.text     "description"
    t.string   "img"
    t.date     "end_date"
    t.integer  "min_pledge"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
    t.string   "summary"
    t.string   "projectpicture_file_name"
    t.string   "projectpicture_content_type"
    t.integer  "projectpicture_file_size"
    t.datetime "projectpicture_updated_at"
  end

  create_table "tiers", force: true do |t|
    t.string   "project_id"
    t.integer  "threshold"
    t.text     "reward_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "initial_quantity"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "dollar_amount"
    t.integer  "tier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                    null: false
    t.string   "email",                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street_address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.string   "phone_number"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree

end
