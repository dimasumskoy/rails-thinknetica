class FixRailcarsType < ActiveRecord::Migration[5.1]
  def change
    rename_column :railcars, :railcar_type, :category
    add_foreign_key :railcars, :category
    add_index :railcars, :category
  end
end
