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

ActiveRecord::Schema.define(version: 20131003183600) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "topstory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "synopsis"
    t.string   "category"
    t.string   "media_type"
    t.boolean  "checked_out"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cover_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "order"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "caption"
    t.integer  "gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_feeds", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "officers", force: true do |t|
    t.string   "title"
    t.integer  "order"
    t.integer  "user_id"
    t.boolean  "public"
    t.boolean  "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "officers", ["user_id"], name: "index_officers_on_user_id", using: :btree

  create_table "resources", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "url"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "resources", ["category_id"], name: "index_resources_on_category_id", using: :btree

  create_table "room_statuses", force: true do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "room_statuses", ["user_id"], name: "index_room_statuses_on_user_id", using: :btree

  create_table "tshirt_orders", force: true do |t|
    t.string   "name"
    t.integer  "tshirt_id"
    t.boolean  "received"
    t.boolean  "paid"
    t.integer  "qty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tshirt_orders", ["tshirt_id"], name: "index_tshirt_orders_on_tshirt_id", using: :btree

  create_table "tshirts", force: true do |t|
    t.string   "name"
    t.string   "size"
    t.boolean  "available"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin"
    t.boolean  "editor"
    t.string   "old_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
