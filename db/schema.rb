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

ActiveRecord::Schema.define(version: 20150704212338) do

  create_table "buys", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "item_id",       limit: 4
    t.string   "item_nombre",   limit: 255
    t.decimal  "item_precio",               precision: 10
    t.integer  "item_cantidad", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "buys", ["user_id"], name: "index_buys_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "activo",      limit: 1,     default: true
  end

  create_table "has_categories", force: :cascade do |t|
    t.integer  "category_id",     limit: 4
    t.integer  "sub_category_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "has_categories", ["category_id"], name: "index_has_categories_on_category_id", using: :btree
  add_index "has_categories", ["sub_category_id"], name: "index_has_categories_on_sub_category_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "nombre",             limit: 255
    t.integer  "cantidad",           limit: 4
    t.decimal  "precio",                         precision: 10
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.string   "cover_file_name",    limit: 255
    t.string   "cover_content_type", limit: 255
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
    t.integer  "user_id",            limit: 4
    t.integer  "category_id",        limit: 4
    t.boolean  "activo",             limit: 1,                  default: true
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "nombre",      limit: 255
    t.text     "descripcion", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "nombre",           limit: 255
    t.string   "apellido_paterno", limit: 255
    t.string   "apellido_materno", limit: 255
    t.date     "fecha_nacimiento"
    t.string   "domicilio",        limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id",          limit: 4
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id",                limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "buys", "users"
  add_foreign_key "has_categories", "categories"
  add_foreign_key "has_categories", "sub_categories"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "roles"
end
