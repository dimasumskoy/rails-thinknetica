class AddReferencesToTrains < ActiveRecord::Migration[5.1]
  def change
    add_reference :trains, :current_station, index: true
    add_reference :trains, :route, index: true
  end
end
