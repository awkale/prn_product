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

ActiveRecord::Schema.define(version: 20160719175316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",              default: "",    null: false
    t.string   "encrypted_password", default: "",    null: false
    t.integer  "sign_in_count",      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "god_mode",           default: false, null: false
    t.boolean  "read_only",          default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channels", force: :cascade do |t|
    t.string   "channel_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "distributions", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "distributions", ["product_id"], name: "index_distributions_on_product_id", using: :btree
  add_index "distributions", ["recipient_id"], name: "index_distributions_on_recipient_id", using: :btree

  create_table "industries", force: :cascade do |t|
    t.string   "industry_name"
    t.integer  "parent_id"
    t.integer  "lft",                        null: false
    t.integer  "rgt",                        null: false
    t.integer  "depth",          default: 0, null: false
    t.integer  "children_count", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "industries", ["lft"], name: "index_industries_on_lft", using: :btree
  add_index "industries", ["parent_id"], name: "index_industries_on_parent_id", using: :btree
  add_index "industries", ["rgt"], name: "index_industries_on_rgt", using: :btree

  create_table "multimedia", force: :cascade do |t|
    t.string   "media_type"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name"
    t.text     "description"
    t.string   "code"
    t.integer  "base_price"
    t.integer  "length_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "recipient_channels", force: :cascade do |t|
    t.integer  "channel_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recipient_channels", ["channel_id"], name: "index_recipient_channels_on_channel_id", using: :btree
  add_index "recipient_channels", ["recipient_id"], name: "index_recipient_channels_on_recipient_id", using: :btree

  create_table "recipient_industries", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "industry_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recipient_industries", ["industry_id"], name: "index_recipient_industries_on_industry_id", using: :btree
  add_index "recipient_industries", ["recipient_id"], name: "index_recipient_industries_on_recipient_id", using: :btree

  create_table "recipient_subjects", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recipient_subjects", ["recipient_id"], name: "index_recipient_subjects_on_recipient_id", using: :btree
  add_index "recipient_subjects", ["subject_id"], name: "index_recipient_subjects_on_subject_id", using: :btree

  create_table "recipients", force: :cascade do |t|
    t.string   "recipient_name"
    t.string   "alternate_name"
    t.text     "description"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
  end

  create_table "renderings", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "multimedium_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "renderings", ["multimedium_id"], name: "index_renderings_on_multimedium_id", using: :btree
  add_index "renderings", ["recipient_id"], name: "index_renderings_on_recipient_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "subject_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "distributions", "products"
  add_foreign_key "distributions", "recipients"
  add_foreign_key "recipient_channels", "channels"
  add_foreign_key "recipient_channels", "recipients"
  add_foreign_key "recipient_industries", "industries"
  add_foreign_key "recipient_industries", "recipients"
  add_foreign_key "recipient_subjects", "recipients"
  add_foreign_key "recipient_subjects", "subjects"
  add_foreign_key "renderings", "multimedia"
  add_foreign_key "renderings", "recipients"
end
