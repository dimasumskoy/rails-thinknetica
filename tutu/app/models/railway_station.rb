class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :sorted, ->(route) do
    joins(:railway_stations_routes).where(railway_stations_routes: { route_id: route }).order("railway_stations_routes.station_position")
  end

  def update_position(route, position)
    if route.railway_stations.include?(self)
      route_station(route).update(station_position: position)
    end
  end

  def position_in(route)
    route_station(route).station_position
  end

  private

  def route_station(route)
    self.railway_stations_routes.where(route: route).first
  end
end
