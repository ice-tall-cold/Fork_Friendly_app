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

ActiveRecord::Schema.define(version: 20171205005238) do

  create_table "health_concern_maps", force: :cascade do |t|
    t.string "Calorie_Friendly"
    t.string "Heart_Healthy"
    t.string "Sodium_Friendly"
    t.string "Carb_Friendly"
    t.string "Kidney_Friendly"
    t.string "Comments"
    t.integer "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_health_concern_maps_on_product_category_id"
  end

  create_table "health_concerns", force: :cascade do |t|
    t.integer "Calorie_Friendly"
    t.integer "Heart_Healthy"
    t.integer "Sodium_Friendly"
    t.integer "Carb_Friendly"
    t.integer "Kidney_Friendly"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_health_concerns_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.integer "product_line_id"
    t.string "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_line_id"], name: "index_product_categories_on_product_line_id"
  end

  create_table "product_lines", force: :cascade do |t|
    t.string "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "Name"
    t.string "Company_Name"
    t.text "Serving_Size"
    t.float "Calories"
    t.float "Sat_Fat"
    t.float "Sodium"
    t.float "Carbs"
    t.float "Sugar"
    t.float "Fiber"
    t.float "Protein"
    t.text "Whole_Grain"
    t.text "twenty_cent"
    t.text "Gluten_Free"
    t.text "Organic"
    t.text "Phosphorus"
    t.text "Soy"
    t.text "Potassium"
    t.text "Milk"
    t.text "Egg"
    t.text "Nut"
    t.text "FODMAP"
    t.text "Additional_Info"
    t.integer "product_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
  end

  create_table "user_carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "product_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_user_carts_on_product_id"
    t.index ["user_id"], name: "index_user_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "First_Name"
    t.string "Last_Name"
    t.string "Email"
    t.string "password_digest"
    t.string "Gender"
    t.boolean "Admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

end
