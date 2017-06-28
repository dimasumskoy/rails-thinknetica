class AddIndexesToRailcars < ActiveRecord::Migration[5.1]
  def change
    add_column :railcars, :type, :string
    add_index :railcars, [:id, :type]
  end
end
