class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @user = User.new(user_params)
    @ticket.user = @user

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:ticket).permit(:first_name, :last_name)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :first_name, :last_name, :middle_name, :passport_number, :train_id, :depart_station_id, :arrive_station_id
      )
  end
end