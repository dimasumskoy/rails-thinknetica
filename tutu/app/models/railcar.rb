class Railcar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  validates :type, presence: true

  before_validation :set_number

  private

  def set_number
    train_railcars = self.train.railcars
    if train_railcars.size.zero?
      self.number = 1
    else
      self.number = train_railcars.maximum(:number) + 1
    end
  end
end