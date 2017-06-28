class RemoveIndexesFromTrains < ActiveRecord::Migration[5.1]
  def change
    change_table :trains do |t|
      t.remove :current_station_id
      t.remove :route_id
    end
  end
end
