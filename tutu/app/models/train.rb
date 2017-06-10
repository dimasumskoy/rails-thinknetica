class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :railcars

  validates :number, presence: true

  before_validation :to_first_station

  def sorted_railcars
    railcars.sorted(self.sorting_from_head)
  end

  def show_seats(railcar_type, seat_type)
    railcars.where(type: railcar_type).sum(seat_type.to_sym)
  end

  private

  def to_first_station
    if route.present?
      self.current_station = route.railway_stations.first
    end
  end
end
