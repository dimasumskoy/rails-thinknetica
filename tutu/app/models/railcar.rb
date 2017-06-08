class Railcar < ApplicationRecord
  belongs_to :train

  validates :number, presence: true, uniqueness: { scope: :train_id }
  validates :type, presence: true

  before_validation :set_number, if: :need_set_number?

  scope :sorted, ->(direct_sorting) { direct_sorting ? order(:number) : order("number DESC") }

  private

  def set_number
    self.number = train.railcars.maximum(:number).to_i + 1
  end

  def need_set_number?
    number.nil? || train_id_changed?
  end
end