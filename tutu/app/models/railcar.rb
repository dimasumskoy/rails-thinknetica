class Railcar < ApplicationRecord
  validates :kind, presence: true
end