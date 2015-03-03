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

ActiveRecord::Schema.define(version: 20150303072633) do

  create_table "page_views", force: true do |t|
    t.string   "userId"
    t.string   "path"
    t.string   "referrer"
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchases", force: true do |t|
    t.string   "userId"
    t.float    "revenue"
    t.string   "shippingMethod"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", force: true do |t|
    t.string   "userId"
    t.string   "email"
    t.string   "name"
    t.string   "subscriptionPlan"
    t.integer  "friendCount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end