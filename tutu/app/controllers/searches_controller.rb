class SearchesController < ApplicationController
  def show
  end

  def find_route
    @route = RailwayStation.find_route(get_first_station_id, get_last_station_id)
    results
  end

  def results
    if @route
      @route_name = @route.name
      @trains = @route.trains
      render :results
    else
      redirect_to action: 'show'
    end
  end

  private

  def get_first_station_id
    params[:stations][:first_station_id].to_i
  end

  def get_last_station_id
    params[:stations][:last_station_id].to_i
  end
end