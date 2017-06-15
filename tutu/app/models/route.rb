class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validate :stations_amount

  before_validation :set_name

  def self.find_route(first_station_id, last_station_id)
    all.select { |route| route.railway_station_ids == [first_station_id, last_station_id] }.first
  end

  def first_station_time
    railway_stations.first.current_departure_time(self).strftime('%H:%M')
  end

  def last_station_time
    railway_stations.last.current_arrival_time(self).strftime('%H:%M')
  end

  def station_id(position_in_route)
    railway_stations[position_in_route.to_i - 1].id
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_amount
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать минимум 2 станции")
    end
  end
end