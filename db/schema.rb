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

ActiveRecord::Schema.define(version: 20131115154824) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_feeds", force: true do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "office_hours", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "day",        null: false
    t.integer  "starts",     null: false
    t.integer  "ends",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "office_hours", ["user_id"], name: "index_office_hours_on_user_id"

  create_table "officers", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.integer  "order",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "resource_categories", force: true do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "title",                null: false
    t.text     "text",                 null: false
    t.string   "url"
    t.integer  "resource_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_statuses", force: true do |t|
    t.integer  "user_id"
    t.boolean  "open", default: false,                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "close_at_midnight", default: true, null: false
  end

  create_table "users", force: true do |t|
    t.string   "login",                                       null: false
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name",                                  null: false
    t.string   "last_name",                                   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt"
    t.string   "level",                  default: "inactive", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["login"], name: "index_users_on_login", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
