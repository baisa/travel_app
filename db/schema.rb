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

ActiveRecord::Schema.define(version: 20160103130805) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "todo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "assignments", ["participant_id"], name: "index_assignments_on_participant_id"
  add_index "assignments", ["todo_id"], name: "index_assignments_on_todo_id"

  create_table "costs", force: :cascade do |t|
    t.string   "title"
    t.decimal  "amount"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "costs", ["trip_id"], name: "index_costs_on_trip_id"

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "file"
  end

  add_index "documents", ["trip_id"], name: "index_documents_on_trip_id"

  create_table "ideas", force: :cascade do |t|
    t.text     "idea"
    t.datetime "planned_at"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ideas", ["trip_id"], name: "index_ideas_on_trip_id"

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "participants", ["trip_id"], name: "index_participants_on_trip_id"

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "places", ["trip_id"], name: "index_places_on_trip_id"

  create_table "todos", force: :cascade do |t|
    t.text     "task"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "todos", ["trip_id"], name: "index_todos_on_trip_id"

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_trips", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_trips", ["trip_id"], name: "index_user_trips_on_trip_id"
  add_index "user_trips", ["user_id"], name: "index_user_trips_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
