class AddIndexesToRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :station_position, :integer
    add_index :railway_stations_routes, :railway_station_id
    add_index :railway_stations_routes, :route_id
    add_index :railway_stations_routes, :station_position
  end
end
