class AddReferencesToTrains < ActiveRecord::Migration[5.1]
  def change
    add_reference :trains, :current_station, foreign_key: true, index: true
    add_reference :trains, :route, foreign_key: true, index: true
  end
end
