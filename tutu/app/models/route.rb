class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validate :stations_amount

  before_validation :set_name

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