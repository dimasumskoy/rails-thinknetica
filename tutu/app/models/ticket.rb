class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :depart_station, class_name: 'RailwayStation', foreign_key: :depart_station_id
  belongs_to :arrive_station, class_name: 'RailwayStation', foreign_key: :arrive_station_id

  validates :first_name, :last_name, :middle_name, :passport_number, presence: true
end
