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

ActiveRecord::Schema.define(version: 20150922210246) do

  create_table "office_hour_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.boolean  "is_open",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "office_hour_logs", ["user_id"], name: "index_office_hour_logs_on_user_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255,   null: false
    t.string   "slug",       limit: 255,   null: false
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pages", ["slug"], name: "index_pages_on_slug", unique: true, using: :btree

  create_table "room_statuses", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.boolean  "open",              limit: 1, default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "close_at_midnight", limit: 1, default: true,  null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string   "title",      limit: 255,   null: false
    t.string   "slug",       limit: 255,   null: false
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["slug"], name: "index_updates_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",                  limit: 255,                      null: false
    t.string   "email",                  limit: 255, default: "",         null: false
    t.string   "encrypted_password",     limit: 255, default: "",         null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "first_name",             limit: 255,                      null: false
    t.string   "last_name",              limit: 255,                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_salt",          limit: 255
    t.string   "level",                  limit: 255, default: "inactive", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
