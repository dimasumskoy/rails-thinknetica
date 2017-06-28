class AddRailwayStationIdToTrains < ActiveRecord::Migration[5.1]
  def change
    add_reference :trains, :current_station
  end
end
