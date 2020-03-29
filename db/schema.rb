# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_29_233922) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_products", force: :cascade do |t|
    t.integer "Category_id", null: false
    t.integer "Product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Category_id"], name: "index_category_products_on_Category_id"
    t.index ["Product_id"], name: "index_category_products_on_Product_id"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "Order_id", null: false
    t.integer "Product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Order_id"], name: "index_order_products_on_Order_id"
    t.index ["Product_id"], name: "index_order_products_on_Product_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "quantity"
    t.float "total_cost"
    t.datetime "order_date"
    t.integer "User_id", null: false
    t.integer "Status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Status_id"], name: "index_orders_on_Status_id"
    t.index ["User_id"], name: "index_orders_on_User_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.float "price"
    t.text "description"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "province"
    t.float "tax_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.string "password"
    t.string "street_address"
    t.string "postal_code"
    t.integer "Province_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["Province_id"], name: "index_users_on_Province_id"
  end

  add_foreign_key "category_products", "Categories"
  add_foreign_key "category_products", "Products"
  add_foreign_key "order_products", "Orders"
  add_foreign_key "order_products", "Products"
  add_foreign_key "orders", "Statuses"
  add_foreign_key "orders", "Users"
  add_foreign_key "users", "Provinces"
end
