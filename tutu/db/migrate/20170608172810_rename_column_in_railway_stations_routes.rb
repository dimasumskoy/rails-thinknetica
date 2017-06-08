class RenameColumnInRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    rename_column :railway_stations_routes, :station_position_id, :station_position
  end
end
