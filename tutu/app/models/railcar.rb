class Railcar < ApplicationRecord
  belongs_to :train

  validates :kind, presence: true
end