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

ActiveRecord::Schema.define(version: 20170416195438) do

  create_table "ip_addresses", force: :cascade do |t|
    t.string   "ip",                limit: 255
    t.string   "name",              limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "building",          limit: 255
    t.string   "room",              limit: 255
    t.string   "mac",               limit: 255
    t.string   "serial_number",     limit: 255
    t.string   "hardware_category", limit: 255
    t.string   "model",             limit: 255
    t.string   "user",              limit: 255
    t.string   "password",          limit: 255
    t.text     "additional_info",   limit: 65535
  end

end
