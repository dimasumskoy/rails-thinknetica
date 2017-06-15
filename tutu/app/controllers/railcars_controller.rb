class RailcarsController < ApplicationController
  before_action :set_railcar, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @railcars = Railcar.all
  end

  def show
  end

  def new
    @railcar = @train.railcars.build
  end

  def create
    @railcar = @train.railcars.new(railcar_params)

    if @railcar.save
      redirect_to railcar_path(@railcar)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @railcar.update(railcar_params)
      redirect_to railcar_path(@railcar)
    else
      render :edit
    end
  end

  def destroy
    @railcar.destroy
    redirect_to railcars_path
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_railcar
    @railcar = Railcar.find(params[:id])
  end

  def railcar_params
    params.require(:railcar).permit(
      :type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :sitting_seats
      )
  end
end