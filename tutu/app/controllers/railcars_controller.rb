class RailcarsController < ApplicationController
  before_action :set_railcar, only: [:show, :edit, :update, :destroy]

  def index
    @railcars = Railcar.all
  end

  def show
  end

  def new
    @railcar = Railcar.new
  end

  def create
    @railcar = Railcar.new(railcar_params)

    if @railcar.save
      redirect_to @railcar
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @railcar.update(railcar_params)
      redirect_to @railcar
    else
      render :edit
    end
  end

  def destroy
    @railcar.destroy
    redirect_to railcars_path
  end

  private

  def set_railcar
    @railcar = Railcar.find(params[:id])
  end

  def railcar_params
    params.require(:railcar).permit(:railcar_type)
  end
end