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

ActiveRecord::Schema.define(version: 20191226200022) do

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "current_location"
    t.boolean  "available?",       default: true
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.string   "comment"
    t.integer  "ratingable_id"
    t.string   "ratingable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "passenger_id"
    t.integer  "driver_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "origin_title"
    t.string   "origin_address"
    t.string   "destination_title"
    t.string   "destination_address"
  end

end
