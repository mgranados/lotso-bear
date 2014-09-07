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

ActiveRecord::Schema.define(version: 20140907070859) do

  create_table "cars", force: true do |t|
    t.integer  "pre_valuation_id"
    t.integer  "genericCar_id"
    t.integer  "warehouse_id"
    t.string   "carColor"
    t.integer  "carDoorNumber"
    t.string   "carSerie"
    t.string   "carMotor"
    t.string   "carLicensePlates"
    t.text     "carInventoryDescription"
    t.string   "carTaxiNumber"
    t.text     "carSpecialEquipment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_car_generic_spare_parts", force: true do |t|
    t.integer  "genericCar_id"
    t.integer  "genericSparePart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_cars", force: true do |t|
    t.string   "genericCarBrand"
    t.string   "genericCarType"
    t.integer  "genericCarYear"
    t.string   "genericCarGeneration"
    t.string   "genericCarModel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "generic_spare_parts", force: true do |t|
    t.string   "genericSparePartBrand"
    t.string   "genericSparePartType"
    t.string   "genericSparePartName"
    t.string   "genericSparePartCarRegion"
    t.text     "genericSparePartDescription"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "insureds", force: true do |t|
    t.integer  "pre_valuation_id"
    t.boolean  "insuredIsThird"
    t.string   "insuredName"
    t.integer  "insuredTelephone"
    t.string   "insuredEmail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pre_valuations", force: true do |t|
    t.string   "preValuationNumber"
    t.string   "preValuationPolicyNumber"
    t.string   "preValuationSubsection"
    t.date     "preValuationExpeditionDate"
    t.date     "preValuationDate"
    t.float    "preValuationDeductibleValue"
    t.float    "preValuationCommercialValue"
    t.boolean  "preValuationRequiresCrane"
    t.boolean  "preValuationCollectionStatus"
    t.string   "preValuationSpecialConditions"
    t.boolean  "preValuationThirdInsured"
    t.string   "preValuationAgentName"
    t.text     "preValuationComment"
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  create_table "spare_parts", force: true do |t|
    t.integer  "car_id"
    t.integer  "wareHouse_id"
    t.integer  "sparePartStatus"
    t.text     "sparePartDescription"
    t.string   "sparePartCode"
    t.string   "sparePartColor"
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

  create_table "warehouses", force: true do |t|
    t.string   "warehouseBranch"
    t.string   "warehouseLocation"
    t.string   "warehouseGeolocation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
