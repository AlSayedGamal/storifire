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

ActiveRecord::Schema.define(version: 20120401180849) do

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "steps", force: :cascade do |t|
    t.string   "kind"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "story_id"
    t.string   "doer"
    t.string   "verb"
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.integer  "role_id"
    t.text     "need"
    t.text     "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "points"
  end

end
