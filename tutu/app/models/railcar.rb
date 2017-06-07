class Railcar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  validates :type, presence: true

  before_validation :set_number

  scope :sort, ->(direct_sorting) do 
    direct_sorting ? order(:number) : order("number DESC")
  end

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