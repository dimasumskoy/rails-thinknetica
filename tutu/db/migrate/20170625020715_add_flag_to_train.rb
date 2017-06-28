class AddFlagToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sorting_from_head, :boolean, default: true, null: false
  end
end
