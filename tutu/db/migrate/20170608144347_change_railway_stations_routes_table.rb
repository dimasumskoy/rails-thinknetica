class ChangeRailwayStationsRoutesTable < ActiveRecord::Migration[5.1]
  def change
    change_table :railway_stations_routes do |t|
      t.remove :station_position
      t.integer :station_position
    end
  end
end
