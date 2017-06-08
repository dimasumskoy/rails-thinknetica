class RemoveColumnFromRailwayStationsRoutes < ActiveRecord::Migration[5.1]
  def change
    remove_column :railway_stations_routes, :station_position, :integer
  end
end
