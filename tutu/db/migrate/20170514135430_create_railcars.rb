class CreateRailcars < ActiveRecord::Migration[5.1]
  def change
    create_table :railcars do |t|
      t.string :railcar_type

      t.timestamps
    end
  end
end
