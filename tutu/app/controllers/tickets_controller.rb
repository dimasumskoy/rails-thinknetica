class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :destroy]

  def index
  end

  def new
    @ticket = current_user.tickets.new
  end

  def show
    stations_time
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    @user_ticket.destroy
    redirect_to tickets_path(current_user.tickets)
  end

  private

  def stations_time
    route = @user_ticket.train.route
    @depart_station_time = route.railway_stations.first.current_departure_time(route).strftime('%H:%M')
    @arrive_station_time = route.railway_stations.last.current_arrival_time(route).strftime('%H:%M')
  end

  def set_ticket
    @user_ticket = current_user.tickets.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :first_name, :last_name, :middle_name, :passport_number, :train_id, :depart_station_id, :arrive_station_id
      )
  end
end