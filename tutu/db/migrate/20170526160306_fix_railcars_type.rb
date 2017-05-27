class FixRailcarsType < ActiveRecord::Migration[5.1]
  def change
    rename_column :railcars, :railcar_type, :kind
    add_foreign_key :railcars, :kind
    add_index :railcars, :kind
  end
end
