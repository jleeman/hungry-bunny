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

ActiveRecord::Schema.define(version: 20150307230142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "event_id"
  end

  add_index "courses", ["event_id"], name: "index_courses_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "cocktail"
    t.text     "title"
    t.text     "description"
    t.string   "photo"
    t.date     "event_date"
    t.time     "event_time"
    t.string   "event_type"
    t.text     "address"
    t.text     "dessert"
    t.text     "course_1"
    t.text     "course_2"
    t.text     "course_3"
    t.text     "course_4"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "title"
    t.string   "amount"
    t.text     "prep_method"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

  create_table "instructions", force: :cascade do |t|
    t.integer  "step"
    t.text     "instruction"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "instructions", ["recipe_id"], name: "index_instructions_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.boolean  "admin"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "courses", "events", on_delete: :cascade
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "instructions", "recipes", on_delete: :cascade
end
