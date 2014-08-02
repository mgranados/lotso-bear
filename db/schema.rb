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

ActiveRecord::Schema.define(version: 20140731180705) do

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_spare_parts", force: true do |t|
    t.integer  "idCar"
    t.integer  "idSparePart"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.integer  "idBrand"
    t.string   "carType"
    t.string   "year"
    t.string   "generation"
    t.string   "model"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spare_parts", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "carRegion"
    t.integer  "parent"
    t.string   "brand"
    t.string   "spareCode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_spare_parts", force: true do |t|
    t.string   "status"
    t.integer  "idWarehouse"
    t.integer  "idWorkshopCar"
    t.string   "color"
    t.integer  "idSparePart"
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
    t.string   "branch"
    t.string   "location"
    t.string   "geoLocation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workshop_cars", force: true do |t|
    t.string   "color"
    t.integer  "doorNumber"
    t.string   "status"
    t.string   "idSerie"
    t.string   "idMotor"
    t.string   "licensePlates"
    t.integer  "idCar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
