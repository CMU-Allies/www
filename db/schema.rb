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

ActiveRecord::Schema.define(version: 20170516172238) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "commissions", force: :cascade do |t|
    t.text     "description",        limit: 65535
    t.decimal  "price",                            precision: 10, default: 0, null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  create_table "exec_boards", force: :cascade do |t|
    t.integer  "year",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_feeds", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "office_hour_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.boolean  "is_open",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_office_hour_logs_on_user_id"
  end

  create_table "office_hours", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "day",        null: false
    t.integer  "starts",     null: false
    t.integer  "ends",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_office_hours_on_user_id"
  end

  create_table "officers", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "position",      null: false
    t.integer  "exec_board_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["exec_board_id"], name: "index_officers_on_exec_board_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",      limit: 255,   null: false
    t.string   "slug",       limit: 255,   null: false
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "rails_admin_histories", force: :cascade do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["item", "table", "month", "year"], name: "index_rails_admin_histories"
  end

  create_table "resource_categories", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title",                null: false
    t.text     "text",                 null: false
    t.string   "url"
    t.integer  "resource_category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.index ["slug"], name: "index_updates_on_slug", unique: true
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["login"], name: "index_users_on_login", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
