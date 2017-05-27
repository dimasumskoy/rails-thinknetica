class AddSeatsToRailcars < ActiveRecord::Migration[5.1]
  def change
    add_column :railcars, :top_seats, :integer
    add_column :railcars, :bottom_seats, :integer
  end
end
