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

ActiveRecord::Schema.define(version: 20171003224537) do

  create_table "commissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.text     "description",        limit: 16777215
    t.decimal  "price",                               precision: 10, default: 0, null: false
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",      limit: 255
    t.datetime "at"
    t.string   "location",   limit: 255
    t.text     "details",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "exec_boards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "year",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "office_hour_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "user_id"
    t.boolean  "is_open"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_office_hour_logs_on_user_id", using: :btree
  end

  create_table "officers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "name",          limit: 255, null: false
    t.string   "position",      limit: 255, null: false
    t.integer  "exec_board_id",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["exec_board_id"], name: "index_officers_on_exec_board_id", using: :btree
  end

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "title",      limit: 255,      null: false
    t.string   "slug",                        null: false
    t.text     "body",       limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_pages_on_slug", unique: true, using: :btree
  end

  create_table "room_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.integer  "user_id"
    t.boolean  "open",              default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "close_at_midnight", default: true,  null: false
  end

  create_table "updates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "title",      limit: 255,      null: false
    t.string   "slug",                        null: false
    t.text     "body",       limit: 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_updates_on_slug", unique: true, using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string   "login",                                                   null: false
    t.string   "email",                              default: "",         null: false
    t.string   "encrypted_password",     limit: 255, default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,          null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["login"], name: "index_users_on_login", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
