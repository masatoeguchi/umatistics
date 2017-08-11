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

ActiveRecord::Schema.define(version: 20170811165107) do

  create_table "race_data", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "order",           limit: 4
    t.integer  "wakuban",         limit: 4
    t.integer  "umaban",          limit: 4
    t.float    "odds",            limit: 24
    t.integer  "popular",         limit: 4
    t.string   "sex",             limit: 255
    t.integer  "age",             limit: 4
    t.integer  "burden",          limit: 4
    t.string   "jockey",          limit: 255
    t.float    "time",            limit: 24
    t.string   "trainer",         limit: 255
    t.integer  "weight",          limit: 4
    t.integer  "w_diff",          limit: 4
    t.integer  "pass3",           limit: 4
    t.integer  "pass4",           limit: 4
    t.float    "l3",              limit: 24
    t.string   "racePlace",       limit: 255
    t.string   "baba_condition",  limit: 255
    t.string   "course",          limit: 255
    t.integer  "length",          limit: 4
    t.datetime "date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "week_id",         limit: 8
    t.text     "age_condition",   limit: 65535
    t.text     "class_condition", limit: 65535
    t.string   "raceNumber",      limit: 255
    t.integer  "race_kai",        limit: 1
    t.integer  "race_week",       limit: 1
    t.string   "handi_cap",       limit: 255
  end

  create_table "returns", force: :cascade do |t|
    t.integer  "tansyo_num",        limit: 2
    t.integer  "tansyo_return",     limit: 4
    t.integer  "fukusyo_num1",      limit: 2
    t.integer  "fukusyo_num2",      limit: 2
    t.integer  "fukusyo_num3",      limit: 2
    t.integer  "fukusyo_return1",   limit: 4
    t.integer  "fukusyo_return2",   limit: 4
    t.integer  "fukusyo_return3",   limit: 4
    t.integer  "wide_num1_1",       limit: 2
    t.integer  "wide_num1_2",       limit: 2
    t.integer  "wide_num2_1",       limit: 2
    t.integer  "wide_num2_2",       limit: 2
    t.integer  "wide_num3_1",       limit: 2
    t.integer  "wide_num3_2",       limit: 2
    t.integer  "wide_return1",      limit: 4
    t.integer  "wide_return2",      limit: 4
    t.integer  "wide_return3",      limit: 4
    t.integer  "wakuren_num1",      limit: 2
    t.integer  "wakuren_num2",      limit: 2
    t.integer  "wakuren_return",    limit: 4
    t.integer  "umaren_num1",       limit: 2
    t.integer  "umaren_num2",       limit: 2
    t.integer  "umaren_return",     limit: 4
    t.integer  "umatan_num1",       limit: 2
    t.integer  "umatan_num2",       limit: 2
    t.integer  "umatan_return",     limit: 4
    t.integer  "sanrenpuku_num1",   limit: 2
    t.integer  "sanrenpuku_num2",   limit: 2
    t.integer  "sanrenpuku_num3",   limit: 2
    t.integer  "sanrenpuku_return", limit: 4
    t.integer  "sanrentan_num1",    limit: 2
    t.integer  "sanrentan_num2",    limit: 2
    t.integer  "sanrentan_num3",    limit: 2
    t.integer  "sanrentan_return",  limit: 4
    t.integer  "week_id",           limit: 8
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "winning_rates", force: :cascade do |t|
    t.integer  "name",       limit: 4
    t.float    "win_ratio",  limit: 24
    t.float    "top2_ratio", limit: 24
    t.float    "top3_ratio", limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
