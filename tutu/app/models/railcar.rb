class Railcar < ApplicationRecord
  validates :category, presence: true
end