class AddVarietySeatsToRailcar < ActiveRecord::Migration[5.1]
  def change
    add_column :railcars, :number, :integer
    add_column :railcars, :side_top_seats, :integer
    add_column :railcars, :side_bottom_seats, :integer
    add_column :railcars, :sitting_seats, :integer
  end
end
