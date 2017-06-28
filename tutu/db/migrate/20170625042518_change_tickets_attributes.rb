class ChangeTicketsAttributes < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :route_id, :bigint
    add_reference :tickets, :depart_station
    add_reference :tickets, :arrive_station
  end
end
