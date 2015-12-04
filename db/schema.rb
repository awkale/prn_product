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

ActiveRecord::Schema.define(version: 20151122205223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "media_point_products", force: :cascade do |t|
    t.integer  "media_point_id"
    t.integer  "product_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "media_point_products", ["media_point_id"], name: "index_media_point_products_on_media_point_id", using: :btree
  add_index "media_point_products", ["product_id"], name: "index_media_point_products_on_product_id", using: :btree

  create_table "media_points", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.string   "sub_category"
    t.string   "city"
    t.string   "country"
    t.string   "industry"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.integer  "base_price"
    t.integer  "length_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "media_point_products", "media_points"
  add_foreign_key "media_point_products", "products"
end
