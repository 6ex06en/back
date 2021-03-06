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

ActiveRecord::Schema.define(version: 20150911064138) do

  create_table "tests", force: :cascade do |t|
    t.string   "question"
    t.integer  "score"
    t.text     "answers",      default: "--- []\n"
    t.string   "typeinput"
    t.integer  "checksum"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.text     "right_answer", default: "--- []\n"
  end

  add_index "tests", ["checksum"], name: "index_tests_on_checksum"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "admin",           default: true
    t.string   "password"
    t.string   "auth_token"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "password_digest"
  end

end
