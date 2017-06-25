class FixTickets < ActiveRecord::Migration[5.1]
  def change
    change_table :tickets do |t|
      t.integer :depart_station, foreign_key: true, index: true
      t.integer :arrive_station, foreign_key: true, index: true
    end
  end
end
