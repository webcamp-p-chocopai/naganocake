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

ActiveRecord::Schema.define(version: 2021_08_16_095339) do

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address", null: false
    t.integer "customer_id", null: false
    t.string "postal_code", null: false
    t.string "dear_name", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id", null: false
    t.integer "customer_id", null: false
    t.integer "item_qty", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "kana_last_name"
    t.string "kana_first_name"
    t.string "phone_number"
    t.string "cust_postal_code"
    t.string "cust_address"
    t.boolean "is_deleted", default: false, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "genre_name", null: false
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_name", null: false
    t.integer "genres_id", null: false
    t.string "item_image_id", null: false
    t.text "item_explanation", null: false
    t.boolean "sale_status", null: false
    t.integer "non_taxed_price", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id", null: false
    t.integer "order_id", null: false
    t.integer "production_status", default: 0, null: false
    t.integer "purchase_quantity", null: false
    t.integer "texed_purchase_price", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "postal_code", null: false
    t.string "dear_address", null: false
    t.string "dear_name", null: false
    t.integer "method_of_payment", default: 0, null: false
    t.integer "freight", null: false
    t.integer "taxed_billing_price", null: false
    t.integer "orderd_status", default: 0, null: false
  end

end
