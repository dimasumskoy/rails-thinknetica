class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route

  has_many :tickets
  has_many :railcars

  validates :number, presence: true

  def sort_railcars
    sorted = self.railcars.sort_by { |railcar| railcar.number }
    if sorting_from_head
      sorted
    else
      sorted.reverse
    end
  end
end
