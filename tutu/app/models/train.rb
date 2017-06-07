class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :railcars

  validates :number, presence: true

  def sort_railcars
    direction = self.sorting_from_head
    Railcar.sort(direction)
  end

  def show_seats(railcar_type, seat_type)
    Railcar.where(type: railcar_type).sum(seat_type.to_sym)
  end
end
