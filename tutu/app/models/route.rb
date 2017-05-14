class Route < ApplicationRecord
  validates :route_name, presence: true
end