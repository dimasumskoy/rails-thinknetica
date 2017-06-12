class SearchesController < ApplicationController
  def show
  end

  def result
    @route = RailwayStation.find_route(get_first_station_id, get_last_station_id)
    if @route.present?
      @route_name = @route.name
      @trains = @route.trains
      @departure_time = @route.railway_stations.first.current_departure_time(@route)
      @arrival_time = @route.railway_stations.last.current_arrival_time(@route)
    else
      render :show
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