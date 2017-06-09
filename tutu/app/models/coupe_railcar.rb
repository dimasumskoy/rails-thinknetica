class CoupeRailcar < Railcar
  validates :top_seats, :bottom_seats, presence: true
end