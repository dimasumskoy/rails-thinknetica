class Railcar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true
end