class Route < ApplicationRecord
  validates :name, presence: true

  # Route has many stations and trains
  # Stations
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  # Trains
  has_many :trains
end