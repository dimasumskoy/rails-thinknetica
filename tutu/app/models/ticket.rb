class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :route
  belongs_to :user
end
