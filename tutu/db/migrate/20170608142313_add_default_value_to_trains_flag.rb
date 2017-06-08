class AddDefaultValueToTrainsFlag < ActiveRecord::Migration[5.1]
  def change
    change_table :trains do |t|
      t.remove :sorting_from_head
      t.boolean :sorting_from_head, default: true, null: false
    end
  end
end
