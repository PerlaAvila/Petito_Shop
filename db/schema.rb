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

ActiveRecord::Schema.define(version: 20170210021324) do

  create_table "collars", force: :cascade do |t|
    t.integer  "registered_pet_id"
    t.integer  "price"
    t.string   "size"
    t.string   "category"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["registered_pet_id"], name: "index_collars_on_registered_pet_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer  "price"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registered_pets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "pet_name"
    t.integer  "pet_age"
    t.string   "pet_disease"
    t.string   "pet_vaccines"
    t.text     "pet_info"
    t.string   "owner_name"
    t.integer  "owner_phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_registered_pets_on_user_id"
  end

  create_table "user_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_user_products_on_product_id"
    t.index ["user_id"], name: "index_user_products_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.boolean  "admin",             default: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
