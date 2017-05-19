class AddForeignKeysToTables < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :trains, :railway_stations
    add_foreign_key :trains, :routes

    add_foreign_key :railway_stations_routes, :railway_stations
    add_foreign_key :railway_stations_routes, :routes
    add_index :railway_stations_routes, :railway_station_id
    add_index :railway_stations_routes, :route_id

    add_foreign_key :tickets, :trains
    add_foreign_key :tickets, :routes
    add_foreign_key :tickets, :users

    add_timestamps :routes, null: true
  end
end
