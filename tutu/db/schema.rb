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

ActiveRecord::Schema.define(version: 20170608172810) do

  create_table "railcars", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "train_id"
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.integer "number"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.integer "sitting_seats"
    t.index ["train_id"], name: "index_railcars_on_train_id"
    t.index ["type"], name: "index_railcars_on_type"
  end

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "route_id"
    t.integer "station_position"
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id"
    t.index ["station_position"], name: "index_railway_stations_routes_on_station_position"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "train_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "depart_station_id"
    t.integer "arrive_station_id"
    t.index ["arrive_station_id"], name: "index_tickets_on_arrive_station_id"
    t.index ["depart_station_id"], name: "index_tickets_on_depart_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_station_id"
    t.integer "route_id"
    t.boolean "sorting_from_head", default: true, null: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
