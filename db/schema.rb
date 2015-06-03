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

ActiveRecord::Schema.define(version: 20150603061657) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_types", force: true do |t|
    t.string   "name"
    t.string   "doors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_likelihoods", force: true do |t|
    t.integer "generic_car_id"
    t.integer "generic_family_id"
    t.string  "years"
  end

  create_table "generations", force: true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_car_generations", force: true do |t|
    t.integer  "generation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "generic_car_id"
  end

  create_table "generic_car_images", force: true do |t|
    t.integer  "generic_car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "generic_cars", force: true do |t|
    t.integer  "first_generation_year"
    t.integer  "last_generation_year"
    t.string   "number_of_generation"
    t.string   "years"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "gen_continues"
    t.integer  "model_acronym_id"
    t.integer  "car_type_id"
  end

  create_table "generic_families", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.boolean  "mold"
    t.integer  "father_id"
    t.boolean  "active"
  end

  create_table "generic_fittables", force: true do |t|
    t.integer  "generic_car_id"
    t.integer  "generic_spare_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_spare_images", force: true do |t|
    t.string   "generic_spare_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_spares", force: true do |t|
    t.string   "brand"
    t.string   "type_of_spare"
    t.string   "name"
    t.string   "region"
    t.text     "description"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "father_id"
  end

  create_table "insureds", force: true do |t|
    t.integer  "prevaluation_id"
    t.boolean  "third"
    t.string   "name"
    t.integer  "telephone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_acronyms", force: true do |t|
    t.integer  "brand_id"
    t.string   "initials"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mold_components", force: true do |t|
    t.string   "name"
    t.integer  "mold_spare_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mold_spares", force: true do |t|
    t.string   "name"
    t.string   "comment"
    t.string   "mold_type"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_suppliers", force: true do |t|
    t.integer  "order_id"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.date     "entrance_date"
    t.integer  "warehouse_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders_suppliers", id: false, force: true do |t|
    t.integer "order_id",    null: false
    t.integer "supplier_id", null: false
  end

  create_table "prevaluation_images", force: true do |t|
    t.string   "prevaluation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prevaluations", force: true do |t|
    t.string   "number"
    t.string   "policy"
    t.string   "subsection"
    t.date     "expedition_date"
    t.date     "valuation_date"
    t.float    "deductible_value"
    t.float    "commercial_value"
    t.boolean  "requires_crane"
    t.boolean  "collection_status"
    t.string   "special_conditions"
    t.boolean  "third_insured"
    t.string   "agent_name"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: true do |t|
    t.string   "entrance"
    t.string   "departure"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "code"
    t.integer  "warehouse_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spare_likelihoods", force: true do |t|
    t.integer  "generic_spare_id"
    t.integer  "generic_family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_car_images", force: true do |t|
    t.integer  "stock_car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_cars", force: true do |t|
    t.integer  "prevaluation_id"
    t.integer  "generic_car_id"
    t.integer  "warehouse_id"
    t.string   "color"
    t.integer  "door_number"
    t.string   "serie"
    t.string   "motor"
    t.string   "license_plates"
    t.text     "inventory_description"
    t.text     "special_equipment"
    t.string   "economic_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_families", force: true do |t|
    t.integer  "generic_family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price_id"
    t.integer  "supplier_id"
    t.integer  "order_id"
    t.string   "code"
    t.string   "status"
    t.integer  "supplier_code"
    t.integer  "quantity"
    t.integer  "car_order_id"
  end

  create_table "stock_family_images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "stock_family_id"
  end

  create_table "stock_spare_images", force: true do |t|
    t.integer  "stock_spare_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_spares", force: true do |t|
    t.integer  "car_id"
    t.integer  "warehouse_id"
    t.integer  "generic_spare_id"
    t.string   "status"
    t.text     "description"
    t.string   "code"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stock_family_id"
    t.string   "supplier_code"
  end

  create_table "subsections", force: true do |t|
    t.string   "code"
    t.integer  "section_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supplier_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "supplier_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_likelihoods", force: true do |t|
    t.integer  "generic_family_id"
    t.integer  "car_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.string   "years"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "privileges"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  create_table "valuations", force: true do |t|
    t.string   "client_code"
    t.string   "edited_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "warehouses", force: true do |t|
    t.string   "branch"
    t.string   "location"
    t.string   "geolocation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
