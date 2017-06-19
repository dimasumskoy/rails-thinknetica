class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
    stations_time
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to admin_ticket_path(@ticket)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to admin_ticket_path(@ticket)
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def stations_time
    route = @ticket.train.route
    @depart_station_time = route.railway_stations.first.current_departure_time(route).strftime('%H:%M')
    @arrive_station_time = route.railway_stations.last.current_arrival_time(route).strftime('%H:%M')
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
      :first_name, :last_name, :middle_name, :passport_number, :train_id, :depart_station_id, :arrive_station_id, :user_id
      )
  end
end