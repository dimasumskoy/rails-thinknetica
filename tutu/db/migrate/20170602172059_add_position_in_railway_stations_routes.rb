class AddPositionInRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    add_reference :railway_stations_routes, :station_position, foreign_key: true, index: true
  end
end
