class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sorted, ->(route) do 
    joins(:railway_stations_routes).where(railway_stations_routes: { route_id: route }).order("railway_stations_routes.station_position_id")
  end

  def update_position(route, position)
    if route.railway_stations.include?(self)
      self.railway_stations_routes.where(route: route).update(station_position_id: position)
    end
  end
end
