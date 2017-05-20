class FixTickets < ActiveRecord::Migration[5.1]
  def change
    remove_reference :tickets, :route, index: true, foreign_key: true
    add_reference :tickets, :depart_station, index: true, foreign_key: true
    add_reference :tickets, :arrive_station, index: true, foreign_key: true
  end
end
