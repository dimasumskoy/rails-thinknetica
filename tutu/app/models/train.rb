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
    self.railcars.where(type: railcar_type).inject(0) { |sum, railcar| sum + railcar.send(seat_type.to_sym) }
  end
end
