# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_09_211155) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "line_stops", force: :cascade do |t|
    t.bigint "line_id", null: false
    t.bigint "stop_id", null: false
    t.integer "sequence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_line_stops_on_line_id"
    t.index ["stop_id"], name: "index_line_stops_on_stop_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "name"
    t.string "type_of_vehicle"
    t.boolean "low_floor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "line_id", null: false
    t.bigint "stop_id", null: false
    t.string "direction"
    t.time "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_id"], name: "index_schedules_on_line_id"
    t.index ["stop_id"], name: "index_schedules_on_stop_id"
  end

  create_table "stops", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "on_demand"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "line_stops", "lines"
  add_foreign_key "line_stops", "stops"
  add_foreign_key "schedules", "lines"
  add_foreign_key "schedules", "stops"
end
