class ChangeRailcarsAttributes < ActiveRecord::Migration[5.1]
  def change
    remove_column :railcars, :railcar_type
  end
end
