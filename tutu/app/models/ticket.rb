class Ticket < ApplicationRecord
  belongs_to :train
  belongs_to :user

  belongs_to :depart_station, class_name: 'RailwayStation', foreign_key: :depart_station_id
  belongs_to :arrive_station, class_name: 'RailwayStation', foreign_key: :arrive_station_id

  validates :first_name, :last_name, :middle_name, :passport_number, presence: true

  after_create :purchase_notification
  after_destroy :cancellation_notification

  def route_name
    "#{depart_station.title} - #{arrive_station.title}"
  end

  private

  def purchase_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def cancellation_notification
    TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end
end
