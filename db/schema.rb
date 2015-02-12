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

ActiveRecord::Schema.define(version: 20150211094449) do

  create_table "genders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender_name"
  end

  create_table "stuffs", force: true do |t|
    t.integer  "price",        limit: 255
    t.string   "desc"
    t.string   "picture"
    t.string   "nohp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "alamat"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "picture1"
    t.string   "picture2"
    t.integer  "status",                   default: 0
    t.integer  "gender_id",                default: 0
    t.integer  "jumlahKamar"
    t.integer  "jumlahWC"
    t.string   "namaAnda"
    t.string   "email"
    t.datetime "confirm_date"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
  end

end
