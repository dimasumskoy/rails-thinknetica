class RailwayStation < ApplicationRecord
  has_many :trains, foreign_key: :current_station_id
  has_many :tickets, foreign_key: :arrive_station_id
  has_many :tickets, foreign_key: :depart_station_id

  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> do
    select('railway_stations.*, railway_stations_routes.station_position').joins(:railway_stations_routes).order("railway_stations_routes.station_position").uniq
  end

  def update_position(route, position)
    if route.railway_stations.include?(self)
      route_station(route).update(station_position: position)
    end
  end

  def position_in(route)
    route_station(route).station_position
  end

  def set_time(route, arrival, departure)
    station = route_station(route)
    arrival_time = "#{arrival[:hour]}:#{arrival[:minute]}"
    departure_time = "#{departure[:hour]}:#{departure[:minute]}"
    station.update(arrival_time: arrival_time, departure_time: departure_time)
  end

  def current_arrival_time(route)
    route_station(route).arrival_time
  end

  def current_departure_time(route)
    route_station(route).departure_time
  end

  def has_time?(route, time_type)
    route_station(route).send(time_type.to_sym).present?
  end

  private

  def route_station(route)
    self.railway_stations_routes.where(route: route).first
  end
end
