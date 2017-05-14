class Railcar < ApplicationRecord
  validates :railcar_type, presence: true
end