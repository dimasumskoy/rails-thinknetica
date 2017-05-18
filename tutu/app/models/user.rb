class User < ApplicationRecord
  # User has many tickets
  has_many :tickets
end
