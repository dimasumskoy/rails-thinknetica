class AddPositionInRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_reference :railway_stations_routes, :railway_station_position, foreign_key: true, index: true
  end
end
