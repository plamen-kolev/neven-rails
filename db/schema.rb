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

ActiveRecord::Schema.define(version: 20170206125606) do

  create_table "categories", force: :cascade do |t|
    t.string   "slug",        null: false
    t.string   "thumbnail",   null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["title"], name: "index_categories_on_title", unique: true
  end

  create_table "heros", force: :cascade do |t|
    t.string   "video",      null: false
    t.string   "image",      null: false
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "thumbnail",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_options", force: :cascade do |t|
    t.string   "slug",                               null: false
    t.string   "title",                              null: false
    t.integer  "weight",                             null: false
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "product_id"
    t.index ["product_id"], name: "index_product_options_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "thumbnail",       null: false
    t.string   "tags"
    t.string   "hidden_tags"
    t.string   "title",           null: false
    t.text     "description",     null: false
    t.text     "tips",            null: false
    t.text     "benefits",        null: false
    t.boolean  "featured",        null: false
    t.string   "slug",            null: false
    t.boolean  "in_stock",        null: false
    t.string   "hover_thumbnail", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["title"], name: "index_products_on_title", unique: true
  end

  create_table "slides", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stockists", force: :cascade do |t|
    t.string   "slug",       null: false
    t.string   "title",      null: false
    t.string   "address",    null: false
    t.decimal  "lat",        null: false
    t.decimal  "lng",        null: false
    t.string   "thumbnail",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
