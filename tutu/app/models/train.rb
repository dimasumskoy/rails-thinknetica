class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :railcars

  validates :number, presence: true

  def sorted_railcars
    railcars.sort_all(self.sorting_from_head)
  end

  def show_seats(railcar_type, seat_type)
    railcars.where(type: railcar_type).sum(seat_type.to_sym)
  end
end
