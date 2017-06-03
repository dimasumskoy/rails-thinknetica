class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  validates :name, presence: true

  before_validation :stations_amount

  private

  def stations_amount
    if railway_stations.size < 2
      errors.add(:base, "Маршрут должен содержать минимум 2 станции")
    end
  end
end