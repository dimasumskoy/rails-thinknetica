class Train < ApplicationRecord
  validates :number, presence: true

  # Train belongs to one station and many routes
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  # Train has many tickets
  has_many :tickets
end
