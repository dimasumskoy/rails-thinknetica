class Railcar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    if self.train.railcars.size.zero?
      self.number = 1
    else
      self.number = self.train.railcars.last.number + 1
    end
  end
end