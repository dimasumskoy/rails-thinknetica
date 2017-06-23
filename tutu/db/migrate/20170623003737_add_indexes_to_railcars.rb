class AddIndexesToRailcars < ActiveRecord::Migration[5.1]
  def change
    add_index :railcars, [:id, :type]
  end
end
