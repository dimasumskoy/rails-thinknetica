class RailwayStation < ApplicationRecord
  # Station has many trains and belongs to many routes
  # Trains
  has_many :trains, foreign_key: :current_station_id

  # Routes
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  def update_position(route, position)
    if route.railway_stations.include?(self)
      self.railway_stations_routes.where(route: route).update(railway_station_position_id: position)
    else
      puts "The route doesn't contain this station"
    end
  end
end
