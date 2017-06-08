class Railcar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  validates :type, presence: true

  before_validation :set_number, if: :need_set_number?

  scope :sort, ->(direct_sorting) do 
    direct_sorting ? order(:number) : order("number DESC")
  end

  private

  def set_number
    self.number = 1 if train.railcars.empty?
    self.number = train.railcars.maximum(:number).to_i + 1
  end

  def need_set_number?
    number.nil? || train_id_changed?
  end
end