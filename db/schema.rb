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

ActiveRecord::Schema.define(version: 20150113013129) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_spare_alloys", force: true do |t|
    t.integer  "generic_car_id"
    t.integer  "generic_spare_id"
    t.string   "relation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
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

  create_table "families", force: true do |t|
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "family_generic_spare_alloys", force: true do |t|
    t.integer  "family_id"
    t.integer  "generic_spare_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generations", force: true do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_car_generations", force: true do |t|
    t.integer  "generic_car_id"
    t.integer  "generation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_cars", force: true do |t|
    t.string   "brand_id"
    t.string   "type_of_car"
    t.integer  "year"
    t.string   "model"
    t.integer  "doors"
    t.integer  "first_generation_year"
    t.integer  "last_generation_year"
    t.string   "code"
    t.boolean  "gen_continues"
    t.string   "number_of_generation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_images", force: true do |t|
    t.integer  "generic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "generic_spare_families", force: true do |t|
    t.integer  "generic_spare_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_spares", force: true do |t|
    t.string   "brand"
    t.string   "type_of_spare"
    t.string   "name"
    t.string   "region"
    t.text     "description"
    t.integer  "family_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "comment2"
    t.string   "mold_type"
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
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.string   "photo3_content_type"
    t.integer  "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.string   "photo4_file_name"
    t.string   "photo4_content_type"
    t.integer  "photo4_file_size"
    t.datetime "photo4_updated_at"
    t.string   "doc1_file_name"
    t.string   "doc1_content_type"
    t.integer  "doc1_file_size"
    t.datetime "doc1_updated_at"
    t.string   "doc2_file_name"
    t.string   "doc2_content_type"
    t.integer  "doc2_file_size"
    t.datetime "doc2_updated_at"
    t.string   "doc3_file_name"
    t.string   "doc3_content_type"
    t.integer  "doc3_file_size"
    t.datetime "doc3_updated_at"
    t.string   "doc4_file_name"
    t.string   "doc4_content_type"
    t.integer  "doc4_file_size"
    t.datetime "doc4_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spares", force: true do |t|
    t.integer  "car_id"
    t.integer  "warehouse_id"
    t.integer  "spare_id"
    t.string   "status"
    t.text     "description"
    t.string   "code"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

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
