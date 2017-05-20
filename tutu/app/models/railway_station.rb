class RailwayStation < ApplicationRecord
  # Station has many trains and belongs to many routes
  # Trains
  has_many :trains, foreign_key: :current_station_id

  # Routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true
end
